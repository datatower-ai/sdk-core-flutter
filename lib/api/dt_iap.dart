import 'dart:io';

import '../src/base/dt_api.dart';
import 'package:datatower_ai_core/src/pigeon/dt_iap.g.dart';

import '../src/util/common_props_helper.dart';
import '../util/type_util.dart';

@DTApi()
class DTIapReport {
  static final DTIapPigeon _pigeon = DTIapPigeon();

  /// 购买成功上报 (Android & iOS 自适应)
  ///
  /// - [order]: 订单id
  /// - [sku]: 商品id
  /// - [price]: 价格， 如 9.99
  /// - [currency]: 货币，如usd
  /// - [seq]: 标识
  /// - [entrance]: 入口
  /// - [properties]: 自定义属性
  static Future<void> reportPurchaseSuccess(
      String order, String sku, double price, String currency,
      String seq,
      {
        String entrance = "",
        JsonMap? properties = const {}
      }
  ) {
    if (Platform.isAndroid) {
      return reportPurchaseSuccessAndroid(order, sku, price, currency, properties: properties);
    } else if (Platform.isIOS) {
      return reportPurchaseSuccessIos(order, sku, price, currency, seq, entrance: entrance);
    } else {
      return Future.error("Calling reportPurchaseSuccess on unsupported platform (${Platform.operatingSystem})!");
    }
  }

  /// 购买成功上报 (Android)
  ///
  /// - [order]: 订单id
  /// - [sku]: 商品id
  /// - [price]: 价格， 如 9.99
  /// - [currency]: 货币，如usd
  /// - [properties]: 自定义属性
  static Future<void> reportPurchaseSuccessAndroid(
      String order, String sku, double price, String currency,
      {
        JsonMap? properties = const {}
      }
  ) {
    if (Platform.isAndroid) {
      return _pigeon.reportPurchaseSuccessAndroid(
          order, sku, price, currency,
          CommonPropertiesHelper.instance.insertDynamicCommonProperties(properties)
      );
    } else {
      return Future.error("Calling Android-specific method (reportPurchaseSuccessAndroid) on other platform is invalid!");
    }
  }

  /// 购买成功上报 (iOS)
  ///
  /// - [order]: 订单id
  /// - [sku]: 商品id
  /// - [price]: 价格， 如 9.99
  /// - [currency]: 货币，如usd
  /// - [seq]: 标识
  /// - [entrance]: 入口
  static Future<void> reportPurchaseSuccessIos(
      String order, String sku, double price, String currency,
      String seq, { String entrance = "" }
  ) {
    if (Platform.isIOS) {
      return _pigeon.reportPurchaseSuccessIos(
          order, sku, price, currency, seq, entrance
      );
    } else {
      return Future.error("Calling iOS-specific method (reportPurchaseSuccessIos) on other platform is invalid!");
    }
  }
}