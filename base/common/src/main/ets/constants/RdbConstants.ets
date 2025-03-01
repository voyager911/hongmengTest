import { relationalStore } from "@kit.ArkData";

export interface ITable {
  tableName: string;
  sqlCreate: string;
  columns: string[];
}


export default class RdbConstants {
  /**
   * Rdb database config.
   */
  static readonly STORE_CONFIG: relationalStore.StoreConfig = {
    name: 'database.db',
    securityLevel: relationalStore.SecurityLevel.S1 //复习鸿蒙安全问题
  };
  //根据你的业务 架构师写这个代码 演示了一张表
  static readonly ShoppingCart_TABLE: ITable = {
    tableName: "ShoppingCartTable",
    sqlCreate: 'CREATE TABLE IF NOT EXISTS shoppingCartTable(id TEXT PRIMARY KEY, name TEXT, img TEXT, commodityId TEXT, ' +
      'description TEXT, price REAL, count INTEGER, selected INTEGER, update_time TEXT, create_time TEXT, uid TEXT, ' +
      'color TEXT, version TEXT, gen TEXT, type TEXT)',
    columns: ['id', 'name', 'img', 'commodityId', 'description', 'price', 'count', 'selected', 'update_time',
      'create_time', 'uid',
      'color', 'version', 'gen', 'type']
  }

  /**
   * Log tag.
   */
  static readonly RDB_TAG = '[Debug.Rdb]';
  static readonly CART_TAG = '[Debug.ShoppingCartTable]';
  static readonly INDEX_TAG = '[Debug.Index]';
  static readonly ORDER_TAG = '[Debug.orderTable]';
  /**
   * Component size.
   */
  static readonly FULL_WIDTH = '100%';
  static readonly FULL_HEIGHT = '100%';
  static readonly DIALOG_HEIGHT = '55%';
  static readonly TABS_HEIGHT = '45%';
  static readonly MINIMUM_SIZE = 0;
  static readonly FULL_SIZE = 1;
  static readonly PROMPT_BOTTOM = '70vp';
  /**
   * Component location.
   */
  static readonly EDIT_POSITION_X = '80%';
  static readonly EDIT_POSITION_Y = '90%';
  static readonly DELETE_POSITION_X = '50%';
  static readonly DELETE_POSITION_Y = '90%';

  static readonly TOAST_CART_1 = '购物车数据插入';
  static readonly TOAST_CART_2 = '购物车数据更新';
  static readonly TOAST_CART_3 = '购物车数据删除';
  static readonly TOAST_CART_4 = '购物车数据查询';
  static readonly TOAST_ORDER_1 = '订单数据插入';
  static readonly TOAST_ORDER_2 = '订单数据更新';
  static readonly TOAST_ORDER_3 = '订单数据删除';
  static readonly TOAST_ORDER_4 = '订单数据查询';
}