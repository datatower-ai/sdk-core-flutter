import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(PigeonOptions(
  dartOut: 'lib/src/pigeon/dt_analytics.g.dart',
  dartOptions: DartOptions(),
  kotlinOut:
      'android/src/main/kotlin/ai/datatower/core_flutter/pigeon/DtAnalytics.g.kt',
  kotlinOptions: KotlinOptions(errorClassName: "DtAnalyticsFlutterError"),
  objcHeaderOut: 'ios/Classes/pigeon/dt_analytics.g.h',
  objcSourceOut: 'ios/Classes/pigeon/dt_analytics.g.m',
  objcOptions: ObjcOptions(prefix: 'DT'),
  dartPackageName: 'datatower_ai_core',
))
@HostApi()
abstract class DTAnalyticsPigeon {
  void trackEvent(String eventName, Map<String, Object> properties);

  void userSet(Map<String, Object> properties);

  void userSetOnce(Map<String, Object> properties);

  void userAdd(Map<String, Object> properties);

  void userUnset(List<String> properties);

  void userDelete();

  void userAppend(Map<String, Object> properties);

  void userUniqAppend(Map<String, Object> properties);

  @async
  String? getDataTowerId();

  void setAccountId(String? id);

  void setFirebaseAppInstanceId(String? id);

  void setAppsFlyerId(String? id);

  void setKochavaId(String? id);

  void setAdjustId(String? id);

  void setTenjinId(String? id);

  void enableThirdPartySharing(int type);

  void setStaticCommonProperties(Map<String, Object> properties);

  void clearStaticCommonProperties();
}
