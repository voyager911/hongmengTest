import { relationalStore } from "@kit.ArkData";
import RdbConstants from "../constants/RdbConstants";
import { Logger } from "../utils/Logger";

/***
 * 对关系型数据库封装 table sql columns的处理
 */
export default class Rdb {
  private rdbStore: relationalStore.RdbStore | null = null
  private tableName: string;
  private sqlCreateTable: string;
  private columns: Array<string>;

  constructor(tableName: string, sqlCreateTable: string, columns: Array<string>) {
    this.tableName = tableName;
    this.sqlCreateTable = sqlCreateTable;
    this.columns = columns;
  }

  //增删改查 + 获取rdb
  //获取rdb store
  getRdbStore(callback: Function = () => {}) {
    if (!callback || typeof callback === 'undefined' || callback === undefined) {
      Logger.info(RdbConstants.RDB_TAG, 'getRdbStore() has no callback!');
      return;
    }
    if (this.rdbStore !== null) {
      Logger.info(RdbConstants.RDB_TAG, 'The rdbStore exists.');
      callback();
      return
    }
    //应用上下文，使用Stage模型的Context
    let context: Context = getContext(this) as Context;
    relationalStore.getRdbStore(context, RdbConstants.STORE_CONFIG, (err, rdb) => {
      if (err) {
        Logger.error(RdbConstants.RDB_TAG, `gerRdbStore() failed, err: ${err}`);
        return;
      }
      this.rdbStore = rdb;
      //获取到RdbStore后，需使用executeSql接口初始化数据库表结构和相关数据
      this.rdbStore.executeSql(this.sqlCreateTable);
      Logger.info(RdbConstants.RDB_TAG, 'getRdbStore() finished.');
      callback();
    });
  }

  //   type ValuesBucket = Record<string, ValueType>;
  // type ValueType = null | number | string | boolean | Uint8Array | Asset | Assets | Float32Array | bigint;
  insertData(data: relationalStore.ValuesBucket, callback: Function = () => {
  }) {
    if (!callback || typeof callback === 'undefined' || callback === undefined) {
      Logger.info(RdbConstants.RDB_TAG, 'insertData() has no callback!');
      return;
    }
    // 用于记录插入是否成功的flag
    let resFlag: boolean = false;
    // 存储键值对的类型，表示要插入到表中的数据行
    const valueBucket: relationalStore.ValuesBucket = data;
    if (this.rdbStore) {
      this.rdbStore.insert(this.tableName, valueBucket, (err, ret) => {
        if (err) {
          Logger.error(RdbConstants.RDB_TAG, `insertData() failed, err: ${err}`);
          callback(resFlag);
          return;
        }
        Logger.info(RdbConstants.RDB_TAG, `insertData() finished: ${ret}`);
        callback(!resFlag);
      });
    }
  }
}