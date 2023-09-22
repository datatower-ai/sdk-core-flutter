import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(PigeonOptions(
  dartOut: 'lib/src/pigeon/dt_ias.g.dart',
  dartOptions: DartOptions(),
  kotlinOut:
      'android/src/main/kotlin/com/lovinjoy/datatower_ai_core_flutter/pigeon/DtIas.g.kt',
  kotlinOptions: KotlinOptions(errorClassName: "DtIasFlutterError"),
  objcHeaderOut: 'ios/Classes/pigeon/dt_ias.g.h',
  objcSourceOut: 'ios/Classes/pigeon/dt_ias.g.m',
  objcOptions: ObjcOptions(prefix: 'DT'),
  dartPackageName: 'datatower_ai_core_flutter',
))
@HostApi()
abstract class DTIasPigeon {
  void reportPurchaseSuccess(String originalOrderId, String orderId, String sku,
      double price, String currency, Map<String, Object>? properties);
}
