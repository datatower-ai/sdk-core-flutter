class CommonPropertiesHelper {
  CommonPropertiesHelper._();
  static CommonPropertiesHelper? _instance;
  static CommonPropertiesHelper get instance => _instance ??= CommonPropertiesHelper._();

  Map<String, dynamic> Function()? dynamicCommonPropertiesGetter;

  void setDynamicCommonPropertiesGetter(Map<String, dynamic> Function() getter) {
    dynamicCommonPropertiesGetter = getter;
  }

  void clearDynamicCommonProperties() {
    dynamicCommonPropertiesGetter = null;
  }

  Map<String, dynamic> getDynamicCommonProperties() {
    return dynamicCommonPropertiesGetter?.call() ?? {};
  }
}