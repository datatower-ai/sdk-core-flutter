import 'package:datatower_ai_core_flutter/src/pigeon/dt_analytics.g.dart';
import 'package:datatower_ai_core_flutter/src/base/dt_api.dart';
import 'package:datatower_ai_core_flutter/util/type_util.dart';

@DTApi()
class DTAnalytics {
  static final DTAnalyticsPigeon _pigeon = DTAnalyticsPigeon();

  /// 调用 track 接口，追踪一个带有属性的事件
  ///
  /// - [eventName] 事件的名称
  /// - [properties] 事件属性
  static Future<void> trackEvent(String eventName,
      [JsonMap properties = const {}]) {
    return _pigeon.trackEvent(eventName, properties);
  }

  /// 设置一般的用户属性
  ///
  /// - [properties] 属性
  static Future<void> userSet(JsonMap properties) {
    return _pigeon.userSet(properties);
  }

  /// 设置只要设置一次的用户属性
  ///
  /// - [properties] 属性
  static Future<void> userSetOnce(JsonMap properties) {
    return _pigeon.userSetOnce(properties);
  }

  /// 设置可累加的用户属性
  ///
  /// - [properties] 属性
  static Future<void> userAdd(JsonMap properties) {
    return _pigeon.userAdd(properties);
  }

  /// 清空用户属性
  ///
  /// - [properties] 属性
  static Future<void> userUnset(List<String> properties) {
    return _pigeon.userUnset(properties);
  }

  /// 删除用户
  static Future<void> userDelete() {
    return _pigeon.userDelete();
  }

  /// 对 JSONArray 类型的用户属性进追加
  ///
  /// - [properties] 属性
  static Future<void> userAppend(JsonMap properties) {
    return _pigeon.userAppend(properties);
  }

  /// 对 JSONArray 类型的用户属性进追加, 并去重
  ///
  /// - [properties] 属性
  static Future<void> userUniqAppend(JsonMap properties) {
    return _pigeon.userUniqAppend(properties);
  }

  /// 获取 DataTower instance id
  static Future<String?> getDataTowerId() {
    return _pigeon.getDataTowerId();
  }

  /// 设置自有用户系统的id
  ///
  /// - [id] 用户系统id
  static Future<void> setAccountId(String? id) {
    return _pigeon.setAccountId(id);
  }

  /// 设置 Firebase 的 app_instance_id
  ///
  /// - [id] Firebase 的 app_instance_id
  static Future<void> setFirebaseAppInstanceId(String? id) {
    return _pigeon.setFirebaseAppInstanceId(id);
  }

  /// 设置 AppsFlyer id
  ///
  /// - [id] appsflyer id
  static Future<void> setAppsFlyerId(String? id) {
    return _pigeon.setAppsFlyerId(id);
  }

  /// 设置 kochava id
  ///
  /// - [id] kochava id
  static Future<void> setKochavaId(String? id) {
    return _pigeon.setKochavaId(id);
  }

  /// 设置 adjust id
  ///
  /// - [id] adjust id
  static Future<void> setAdjustId(String? id) {
    return _pigeon.setAdjustId(id);
  }

  /// 透传 dt_id 至三方归因平台
  ///
  /// - [type] 归因平台 DTThirdPartyShareType.ADJUST
  static Future<void> enableThirdPartySharing(int type) {
    return _pigeon.enableThirdPartySharing(type);
  }
}
