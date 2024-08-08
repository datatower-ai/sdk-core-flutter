import 'package:datatower_ai_core/src/pigeon/dt_analytics_util.g.dart';
import 'package:datatower_ai_core/src/base/dt_api.dart';
import 'package:datatower_ai_core/util/type_util.dart';

import '../src/util/common_props_helper.dart';

@DTApi()
class DTAnalyticsUtil {
  static final DTAnalyticsUtilPigeon _pigeon = DTAnalyticsUtilPigeon();

  /// 初始化事件的计时器，计时单位为毫秒。
  ///
  /// - [eventName] 事件的名称
  static Future<void> trackTimerStart(String eventName) {
    return _pigeon.trackTimerStart(eventName);
  }

  /// 暂停事件计时器，计时单位为毫秒。
  ///
  /// - [eventName] 事件的名称
  static Future<void> trackTimerPause(String eventName) {
    return _pigeon.trackTimerPause(eventName);
  }

  /// 恢复事件计时器，计时单位为毫秒。
  ///
  /// - [eventName] 事件的名称
  static Future<void> trackTimerResume(String eventName) {
    return _pigeon.trackTimerResume(eventName);
  }

  /// 停止事件计时器
  ///
  /// - [eventName] 事件的名称
  /// - [properties] 事件的属性
  static Future<void> trackTimerEnd(String eventName, {JsonMap? properties}) {
    return _pigeon.trackTimerEnd(eventName, CommonPropertiesHelper.instance.insertDynamicCommonProperties(properties));
  }
}
