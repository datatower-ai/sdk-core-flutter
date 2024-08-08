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

  Map<String, dynamic> insertDynamicCommonProperties(Map<String, dynamic>? properties) {
    final dcp = getDynamicCommonProperties();
    if (dcp.isEmpty) return properties ?? {};

    if (properties == null) return dcp;

    for (final entry in dcp.entries) {
      properties.putIfAbsent(entry.key, () => entry.value);
    }
    return properties;
  }
}