import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(PigeonOptions(
  dartOut: 'lib/src/pigeon/dt_iap.g.dart',
  dartOptions: DartOptions(),
  kotlinOut:
      'android/src/main/kotlin/ai/datatower/core_flutter/pigeon/DtIap.g.kt',
  kotlinOptions: KotlinOptions(errorClassName: "DtIapFlutterError"),
  objcHeaderOut: 'ios/Classes/pigeon/dt_iap.g.h',
  objcSourceOut: 'ios/Classes/pigeon/dt_iap.g.m',
  objcOptions: ObjcOptions(prefix: 'DT'),
  dartPackageName: 'datatower_ai_core',
))
@HostApi()
abstract class DTIapPigeon {
  void reportPurchaseSuccessAndroid(String order, String sku, double price,
      String currency, Map<String, Object> properties);

  void reportPurchaseSuccessIos(String order, String sku, double price, 
      String currency, String seq, String entrance);
}
