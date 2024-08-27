import 'dart:io';

import '../src/base/dt_api.dart';
import 'package:datatower_ai_core/src/pigeon/dt_ias.g.dart';

import '../src/util/common_props_helper.dart';
import '../util/type_util.dart';

@DTApi()
class DTIasReport {
  static final DTIasPigeon _pigeon = DTIasPigeon();

  /// 订阅成功上报 (Android & iOS 自适应)
  ///
  /// - [originalOrderId]: 订单id
  /// - [orderId]: 订单id
  /// - [sku]: 商品id
  /// - [price]: 价格， 如 9.99
  /// - [currency]: 货币，如usd
  /// - [seq]: 标识
  /// - [placement]: 位置
  /// - [entrance]: 入口
  /// - [properties]: 自定义属性
  static Future<void> reportSubscribeSuccess(
      String originalOrderId, String orderId, String sku, double price,
      String currency, String seq, String placement,
      {
        String entrance = "",
        JsonMap? properties = const {}
      }
      ) {
    if (Platform.isAndroid) {
      return reportSubscribeSuccessAndroid(originalOrderId, orderId, sku, price, currency, properties: properties);
    } else if (Platform.isIOS) {
      return reportSubscribeSuccessIos(seq, placement, sku, orderId, originalOrderId, price.toString(), currency, entrance: entrance);
    } else {
      return Future.error("Calling reportSubscribeSuccess on unsupported platform (${Platform.operatingSystem})!");
    }
  }

  /// 订阅成功上报 (Android)
  ///
  /// - [originalOrderId]: 订单id
  /// - [orderId]: 订单id
  /// - [sku]: 商品id
  /// - [price]: 价格， 如 9.99
  /// - [currency]: 货币，如usd
  /// - [properties]: 自定义属性
  static Future<void> reportSubscribeSuccessAndroid(
      String originalOrderId, String orderId, String sku, double price,
      String currency,
      { JsonMap? properties = const {} }
  ) {
    if (Platform.isAndroid) {
      return _pigeon.reportSubscribeSuccessAndroid(
          originalOrderId, orderId, sku, price, currency,
          CommonPropertiesHelper.instance.insertDynamicCommonProperties(properties)
      );
    } else {
      return Future.error("Calling Android-specific method (reportSubscribeSuccessAndroid) on other platform is invalid!");
    }
  }

  /// 订阅成功上报 (iOS)
  ///
  /// - [seq]: 标识
  /// - [placement]: 位置
  /// - [sku]: 商品id
  /// - [orderId]: 订单id
  /// - [originalOrderId]: 订单id
  /// - [price]: 价格， 如 9.99
  /// - [currency]: 货币，如 usd
  /// - [entrance]: 入口
  static Future<void> reportSubscribeSuccessIos(
      String seq, String placement, String sku, String orderId,
      String originalOrderId, String price, String currency,
      { String entrance = "" }
  ) {
    if (Platform.isIOS) {
      return _pigeon.reportSubscribeSuccessIos(
          seq, placement, sku, orderId, originalOrderId, price, currency, entrance
      );
    } else {
      return Future.error("Calling iOS-specific method (reportSubscribeSuccessIos) on other platform is invalid!");
    }
  }
}