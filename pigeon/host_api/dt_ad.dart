// ignore_for_file: constant_identifier_names
import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(PigeonOptions(
  dartOut: 'lib/src/pigeon/dt_ad.g.dart',
  dartOptions: DartOptions(),
  kotlinOut:
      'android/src/main/kotlin/ai/datatower/core_flutter/pigeon/DtAd.g.kt',
  kotlinOptions: KotlinOptions(errorClassName: "DtAdFlutterError"),
  objcHeaderOut: 'ios/Classes/pigeon/dt_ad.g.h',
  objcSourceOut: 'ios/Classes/pigeon/dt_ad.g.m',
  objcOptions: ObjcOptions(prefix: 'DT'),
  dartPackageName: 'datatower_ai_core',
))

// regex: \(-?[0-9].*\)
// replacement:
enum AdTypeDart {
  IDLE,
  BANNER,
  INTERSTITIAL,
  NATIVE,
  REWARDED,
  REWARDED_INTERSTITIAL,
  APP_OPEN,
  MREC;
}

enum AdMediationDart {
  IDLE,
  MOPUB,
  MAX,
  HISAVANA,
  COMBO,
  TOPON,
  TRADPLUS,
  TOBID,
  ADMOB,
  IRONSOURCE,
}

enum AdPlatformDart {
  UNDISCLOSED,
  IDLE,
  ADMOB,
  MOPUB,
  ADCOLONY,
  APPLOVIN,
  CHARTBOOST,
  FACEBOOK,
  INMOBI,
  IRONSOURCE,
  PANGLE,
  SNAP_AUDIENCE_NETWORK,
  TAPJOY,
  UNITY_ADS,
  VERIZON_MEDIA,
  VUNGLE,
  ADX,
  COMBO,
  BIGO,
  HISAVANA,
  APPLOVIN_EXCHANGE,
  MINTEGRAL,
  LIFTOFF,
  A4G,
  GOOGLE_AD_MANAGER,
  FYBER,
  MAIO,
  CRITEO,
  MYTARGET,
  OGURY,
  APPNEXT,
  KIDOZ,
  SMAATO,
  START_IO,
  VERVE,
  LOVINJOYADS,
  YANDEX,
  REKLAMUP;
}

@HostApi()
abstract class DTAdPigeon {
  void reportLoadBegin(
      String id,
      AdTypeDart type,
      AdPlatformDart platform,
      String seq,
      Map<String, Object> properties,
      AdMediationDart mediation,
      String mediationId);

  void reportLoadEnd(
      String id,
      AdTypeDart type,
      AdPlatformDart platform,
      int duration,
      bool result,
      String seq,
      int errorCode,
      String errorMessage,
      Map<String, Object> properties,
      AdMediationDart mediation,
      String mediationId);

  void reportToShow(
      String id,
      AdTypeDart type,
      AdPlatformDart platform,
      String location,
      String seq,
      Map<String, Object> properties,
      String entrance,
      AdMediationDart mediation,
      String mediationId);

  void reportShow(
      String id,
      AdTypeDart type,
      AdPlatformDart platform,
      String location,
      String seq,
      Map<String, Object> properties,
      String entrance,
      AdMediationDart mediation,
      String mediationId);

  void reportShowFailed(
      String id,
      AdTypeDart type,
      AdPlatformDart platform,
      String location,
      String seq,
      int errorCode,
      String errorMessage,
      Map<String, Object> properties,
      String entrance,
      AdMediationDart mediation,
      String mediationId);

  void reportClose(
      String id,
      AdTypeDart type,
      AdPlatformDart platform,
      String location,
      String seq,
      Map<String, Object> properties,
      String entrance,
      AdMediationDart mediation,
      String mediationId);

  void reportClick(
      String id,
      AdTypeDart type,
      AdPlatformDart platform,
      String location,
      String seq,
      Map<String, Object> properties,
      String entrance,
      AdMediationDart mediation,
      String mediationId);

  void reportRewarded(
      String id,
      AdTypeDart type,
      AdPlatformDart platform,
      String location,
      String seq,
      Map<String, Object> properties,
      String entrance,
      AdMediationDart mediation,
      String mediationId);

  void reportConversionByClick(
      String id,
      AdTypeDart type,
      AdPlatformDart platform,
      String location,
      String seq,
      Map<String, Object> properties,
      String entrance,
      AdMediationDart mediation,
      String mediationId);

  void reportConversionByLeftApp(
      String id,
      AdTypeDart type,
      AdPlatformDart platform,
      String location,
      String seq,
      Map<String, Object> properties,
      String entrance,
      AdMediationDart mediation,
      String mediationId);

  void reportConversionByRewarded(
      String id,
      AdTypeDart type,
      AdPlatformDart platform,
      String location,
      String seq,
      Map<String, Object> properties,
      String entrance,
      AdMediationDart mediation,
      String mediationId);

  void reportPaid(
      String id,
      AdTypeDart type,
      AdPlatformDart platform,
      String location,
      String seq,
      double value,
      String currency,
      String precision,
      Map<String, Object> properties,
      String entrance,
      AdMediationDart mediation,
      String mediationId);

  void reportPaidWithCountry(
    String id,
    AdTypeDart type,
    AdPlatformDart platform,
    String location,
    String seq,
    AdMediationDart mediation,
    String mediationId,
    double value,
    String precision,
    String country,
    Map<String, Object> properties,
  );

  void reportLeftApp(
      String id,
      AdTypeDart type,
      AdPlatformDart platform,
      String location,
      String seq,
      Map<String, Object> properties,
      String entrance,
      AdMediationDart mediation,
      String mediationId);
}
