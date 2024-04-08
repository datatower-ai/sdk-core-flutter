import 'package:datatower_ai_core/src/pigeon/dt_analytics.g.dart';
import 'package:datatower_ai_core/src/base/dt_api.dart';
import 'package:datatower_ai_core/src/util/common_props_helper.dart';
import 'package:datatower_ai_core/util/type_util.dart';

@DTApi()
class DTAnalytics {
  static final DTAnalyticsPigeon _pigeon = DTAnalyticsPigeon();

  /// 调用 track 接口，追踪一个带有属性的事件
  ///
  /// - [eventName] 事件的名称
  /// - [properties] 事件属性
  static Future<void> trackEvent(String eventName,
      [JsonMap properties = const {}]
  ) {
    final dcp = CommonPropertiesHelper.instance.getDynamicCommonProperties();
    for (final entry in dcp.entries) {
      properties.putIfAbsent(entry.key, () => entry.value);
    }
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
  /// - [id] 用户系统id，如果传 null 或空字符串则等同于登出。
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
  /// - [type] 归因平台：
  ///     - ADJUST: 1
  static Future<void> enableThirdPartySharing(int type) {
    return _pigeon.enableThirdPartySharing(type);
  }

  /// 设置访客 id
  ///
  /// - [id] 访客 id
  static Future<void> setDistinctId(String? id) {
    return _pigeon.setDistinctId(id);
  }

  /// 获取先前设置的访客 id
  static Future<String?> getDistinctId() {
    return _pigeon.getDistinctId();
  }

  /// 设置动态通用属性
  ///
  /// - [getter] 动态回调，用于获取通用熟悉
  static Future<void> setDynamicCommonProperties(JsonMap Function() getter) {
    CommonPropertiesHelper.instance.setDynamicCommonPropertiesGetter(getter);
    return Future.value(null);
  }

  /// 清除动态通用属性
  static Future<void> clearDynamicCommonProperties() {
    CommonPropertiesHelper.instance.clearDynamicCommonProperties();
    return Future.value(null);
  }

  /// 设置静态通用属性（持久化存储）
  ///
  /// - [properties] 通用属性
  static Future<void> setStaticCommonProperties(JsonMap properties) {
    return _pigeon.setStaticCommonProperties(properties);
  }

  /// 清除静态通用属性
  static Future<void> clearStaticCommonProperties() {
    return _pigeon.clearStaticCommonProperties();
  }
}
