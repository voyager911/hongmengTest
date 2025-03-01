export class LocalDataManager {
  private constructor() {
    this.initDefaultShopCartData();
  }
  private static localDataManager: LocalDataManager;

  static instance() {
    if (!LocalDataManager.localDataManager) {
      LocalDataManager.localDataManager = new LocalDataManager();
    }
    return LocalDataManager.localDataManager;
  }

  initDefaultShopCartData() {
   //写死的数据 RDB中获取数据 
  }
}