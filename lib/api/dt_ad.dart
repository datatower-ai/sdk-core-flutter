import 'package:datatower_ai_core/src/pigeon/dt_ad.g.dart';
import 'package:datatower_ai_core/src/base/dt_api.dart';
import 'package:datatower_ai_core/util/type_util.dart';

import '../src/util/common_props_helper.dart';

@DTApi()
class DTAdReport {
  static final DTAdPigeon _pigeon = DTAdPigeon();

  /// 上报 广告开始加载
  ///
  /// - [id] 广告最小单元id
  /// - [type] 广告类型
  /// - [platform] 广告平台
  /// - [seq] 系列行为标识
  /// - [properties] 自定义事件属性
  /// - [mediation] 聚合平台，无则传：AdMediationDart.IDLE
  /// - [mediationId] 聚合平台广告 id，无则传：""
  static Future<void> reportLoadBegin(
      String id,
      AdTypeDart type,
      AdPlatformDart platform,
      AdMediationDart mediation,
      String mediationId,
      String seq,
      {JsonMap? properties}) {
    return _pigeon.reportLoadBegin(
        id, type, platform, seq,
        CommonPropertiesHelper.instance.insertDynamicCommonProperties(properties),
        mediation, mediationId
    );
  }

  /// 上报 广告结束加载
  ///
  /// - [id] 广告最小单元id
  /// - [type] 广告类型
  /// - [platform] 广告平台
  /// - [duration] 广告加载时长
  /// - [result] 广告加载结果
  /// - [seq] 系列行为标识
  /// - [errorCode] 失败错误码
  /// - [errorMessage] 失败错误信息
  /// - [properties] 自定义事件属性
  /// - [mediation] 聚合平台，无则传：AdMediationDart.IDLE
  /// - [mediationId] 聚合平台广告 id，无则传：""
  static Future<void> reportLoadEnd(
      String id,
      AdTypeDart type,
      AdPlatformDart platform,
      AdMediationDart mediation,
      String mediationId,
      int duration,
      bool result,
      String seq,
      {int errorCode = 0,
      String errorMessage = "",
      JsonMap? properties}) {
    return _pigeon.reportLoadEnd(id, type, platform, duration, result, seq,
        errorCode, errorMessage, CommonPropertiesHelper.instance.insertDynamicCommonProperties(properties), mediation, mediationId);
  }

  /// 上报 广告展示请求
  ///
  /// - [id] 广告最小单元id
  /// - [type] 广告类型
  /// - [platform] 广告平台
  /// - [location] 广告位
  /// - [seq] 系列行为标识
  /// - [properties] 额外事件属性
  /// - [entrance] 广告入口
  /// - [mediation] 聚合平台，无则传：AdMediationDart.IDLE
  /// - [mediationId] 聚合平台广告 id，无则传：""
  static Future<void> reportToShow(
      String id,
      AdTypeDart type,
      AdPlatformDart platform,
      AdMediationDart mediation,
      String mediationId,
      String location,
      String seq,
      {JsonMap? properties,
      String? entrance}) {
    return _pigeon.reportToShow(id, type, platform, location, seq,
        CommonPropertiesHelper.instance.insertDynamicCommonProperties(properties), entrance ?? "", mediation, mediationId);
  }

  /// 上报 广告展示
  ///
  /// - [id] 广告最小单元id
  /// - [type] 广告类型
  /// - [platform] 广告平台
  /// - [location] 广告位
  /// - [seq] 系列行为标识
  /// - [properties] 额外事件属性
  /// - [entrance] 广告入口
  /// - [mediation] 聚合平台，无则传：AdMediationDart.IDLE
  /// - [mediationId] 聚合平台广告 id，无则传：""
  static Future<void> reportShow(
      String id,
      AdTypeDart type,
      AdPlatformDart platform,
      AdMediationDart mediation,
      String mediationId,
      String location,
      String seq,
      {JsonMap? properties,
      String? entrance}) {
    return _pigeon.reportShow(id, type, platform, location, seq,
        CommonPropertiesHelper.instance.insertDynamicCommonProperties(properties), entrance ?? "", mediation, mediationId);
  }

  /// 上报 广告展示失败
  ///
  /// - [id] 广告最小单元id
  /// - [type] 广告类型
  /// - [platform] 广告平台
  /// - [location] 广告位
  /// - [seq] 系列行为标识
  /// - [properties] 额外事件属性
  /// - [entrance] 广告入口
  /// - [mediation] 聚合平台，无则传：AdMediationDart.IDLE
  /// - [mediationId] 聚合平台广告 id，无则传：""
  static Future<void> reportShowFailed(
      String id,
      AdTypeDart type,
      AdPlatformDart platform,
      AdMediationDart mediation,
      String mediationId,
      String location,
      String seq,
      int errorCode,
      String errorMessage,
      {JsonMap? properties,
      String? entrance}) {
    return _pigeon.reportShowFailed(
        id,
        type,
        platform,
        location,
        seq,
        errorCode,
        errorMessage,
        CommonPropertiesHelper.instance.insertDynamicCommonProperties(properties),
        entrance ?? "",
        mediation,
        mediationId);
  }

  /// 上报 广告关闭
  ///
  /// - [id] 广告最小单元id
  /// - [type] 广告类型
  /// - [platform] 广告平台
  /// - [location] 广告位
  /// - [seq] 系列行为标识
  /// - [properties] 额外事件属性
  /// - [entrance] 广告入口
  /// - [mediation] 聚合平台，无则传：AdMediationDart.IDLE
  /// - [mediationId] 聚合平台广告 id，无则传：""
  static Future<void> reportClose(
      String id,
      AdTypeDart type,
      AdPlatformDart platform,
      AdMediationDart mediation,
      String mediationId,
      String location,
      String seq,
      {JsonMap? properties,
      String? entrance}) {
    return _pigeon.reportClose(id, type, platform, location, seq,
        CommonPropertiesHelper.instance.insertDynamicCommonProperties(properties), entrance ?? "", mediation, mediationId);
  }

  /// 上报 广告点击
  ///
  /// - [id] 广告最小单元id
  /// - [type] 广告类型
  /// - [platform] 广告平台
  /// - [location] 广告位
  /// - [seq] 系列行为标识
  /// - [properties] 额外事件属性
  /// - [entrance] 广告入口
  /// - [mediation] 聚合平台，无则传：AdMediationDart.IDLE
  /// - [mediationId] 聚合平台广告 id，无则传：""
  static Future<void> reportClick(
      String id,
      AdTypeDart type,
      AdPlatformDart platform,
      AdMediationDart mediation,
      String mediationId,
      String location,
      String seq,
      {JsonMap? properties,
      String? entrance}) {
    return _pigeon.reportClick(id, type, platform, location, seq,
        CommonPropertiesHelper.instance.insertDynamicCommonProperties(properties), entrance ?? "", mediation, mediationId);
  }

  /// 上报 激励广告已获得奖励
  ///
  /// - [id] 广告最小单元id
  /// - [type] 广告类型
  /// - [platform] 广告平台
  /// - [location] 广告位
  /// - [seq] 系列行为标识
  /// - [properties] 额外事件属性
  /// - [entrance] 广告入口
  /// - [mediation] 聚合平台，无则传：AdMediationDart.IDLE
  /// - [mediationId] 聚合平台广告 id，无则传：""
  static Future<void> reportRewarded(
      String id,
      AdTypeDart type,
      AdPlatformDart platform,
      AdMediationDart mediation,
      String mediationId,
      String location,
      String seq,
      {JsonMap? properties,
      String? entrance}) {
    return _pigeon.reportRewarded(id, type, platform, location, seq,
        CommonPropertiesHelper.instance.insertDynamicCommonProperties(properties), entrance ?? "", mediation, mediationId);
  }

  /// 上报 自定义转化，通过点击
  ///
  /// - [id] 广告最小单元id
  /// - [type] 广告类型
  /// - [platform] 广告平台
  /// - [location] 广告位
  /// - [seq] 系列行为标识
  /// - [properties] 额外事件属性
  /// - [entrance] 广告入口
  /// - [mediation] 聚合平台，无则传：AdMediationDart.IDLE
  /// - [mediationId] 聚合平台广告 id，无则传：""
  static Future<void> reportConversionByClick(
      String id,
      AdTypeDart type,
      AdPlatformDart platform,
      AdMediationDart mediation,
      String mediationId,
      String location,
      String seq,
      {JsonMap? properties,
      String? entrance}) {
    return _pigeon.reportConversionByClick(id, type, platform, location, seq,
        CommonPropertiesHelper.instance.insertDynamicCommonProperties(properties), entrance ?? "", mediation, mediationId);
  }

  /// 上报 自定义转化，通过跳出app
  ///
  /// - [id] 广告最小单元id
  /// - [type] 广告类型
  /// - [platform] 广告平台
  /// - [location] 广告位
  /// - [seq] 系列行为标识
  /// - [properties] 额外事件属性
  /// - [entrance] 广告入口
  /// - [mediation] 聚合平台，无则传：AdMediationDart.IDLE
  /// - [mediationId] 聚合平台广告 id，无则传：""
  static Future<void> reportConversionByLeftApp(
      String id,
      AdTypeDart type,
      AdPlatformDart platform,
      AdMediationDart mediation,
      String mediationId,
      String location,
      String seq,
      {JsonMap? properties,
      String? entrance}) {
    return _pigeon.reportConversionByLeftApp(id, type, platform, location, seq,
        CommonPropertiesHelper.instance.insertDynamicCommonProperties(properties), entrance ?? "", mediation, mediationId);
  }

  /// 上报 自定义转化事件，通过获得激励
  ///
  /// - [id] 广告最小单元id
  /// - [type] 广告类型
  /// - [platform] 广告平台
  /// - [location] 广告位
  /// - [seq] 系列行为标识
  /// - [properties] 额外事件属性
  /// - [entrance] 广告入口
  /// - [mediation] 聚合平台，无则传：AdMediationDart.IDLE
  /// - [mediationId] 聚合平台广告 id，无则传：""
  static Future<void> reportConversionByRewarded(
      String id,
      AdTypeDart type,
      AdPlatformDart platform,
      AdMediationDart mediation,
      String mediationId,
      String location,
      String seq,
      {JsonMap? properties,
      String? entrance}) {
    return _pigeon.reportConversionByRewarded(id, type, platform, location, seq,
        CommonPropertiesHelper.instance.insertDynamicCommonProperties(properties), entrance ?? "", mediation, mediationId);
  }

  /// 上报 广告展示价值
  ///
  /// - [id] 广告最小单元id
  /// - [type] 广告类型
  /// - [platform] 广告平台
  /// - [location] 广告位
  /// - [seq] 系列行为标识
  /// - [value] 价值
  /// - [currency] 货币
  /// - [precision] 精确度
  /// - [properties] 额外事件属性
  /// - [entrance] 广告入口
  /// - [mediation] 聚合平台，无则传：AdMediationDart.IDLE
  /// - [mediationId] 聚合平台广告 id，无则传：""
  static Future<void> reportPaid(
      String id,
      AdTypeDart type,
      AdPlatformDart platform,
      AdMediationDart mediation,
      String mediationId,
      String location,
      String seq,
      double value,
      String currency,
      String precision,
      {JsonMap? properties,
      String? entrance}) {
    return _pigeon.reportPaid(
        id,
        type,
        platform,
        location,
        seq,
        value,
        currency,
        precision,
        CommonPropertiesHelper.instance.insertDynamicCommonProperties(properties),
        entrance ?? "",
        mediation,
        mediationId);
  }

  /// 上报 广告展示价值
  ///
  /// - [id] 广告最小单元id
  /// - [type] 广告类型
  /// - [platform] 广告平台
  /// - [location] 广告位
  /// - [seq] 系列行为标识
  /// - [mediation] 聚合平台，无则传：AdMediationDart.IDLE
  /// - [mediationId] 聚合平台广告 id，无则传：""
  /// - [value] 价值
  /// - [precision] 精确度
  /// - [country] 国家
  /// - [properties] 额外事件属性
  static Future<void> reportPaidWithCountry(
    String id,
    AdTypeDart type,
    AdPlatformDart platform,
    String location,
    String seq,
    AdMediationDart mediation,
    String mediationId,
    double value,
    String precision,
    String country, {
    JsonMap? properties,
  }) {
    return _pigeon.reportPaidWithCountry(id, type, platform, location, seq,
        mediation, mediationId, value, precision, country, CommonPropertiesHelper.instance.insertDynamicCommonProperties(properties));
  }

  /// 上报 访问广告链接，离开当前app(页面)
  ///
  /// - [id] 广告最小单元id
  /// - [type] 广告类型
  /// - [platform] 广告平台
  /// - [location] 广告位
  /// - [seq] 系列行为标识
  /// - [properties] 额外事件属性
  /// - [entrance] 广告入口
  /// - [mediation] 聚合平台，无则传：AdMediationDart.IDLE
  /// - [mediationId] 聚合平台广告 id，无则传：""
  static Future<void> reportLeftApp(
      String id,
      AdTypeDart type,
      AdPlatformDart platform,
      AdMediationDart mediation,
      String mediationId,
      String location,
      String seq,
      {JsonMap? properties,
      String? entrance}) {
    return _pigeon.reportLeftApp(id, type, platform, location, seq,
        CommonPropertiesHelper.instance.insertDynamicCommonProperties(properties), entrance ?? "", mediation, mediationId);
  }
}
