// Autogenerated from Pigeon (v18.0.1), do not edit directly.
// See also: https://pub.dev/packages/pigeon
// ignore_for_file: public_member_api_docs, non_constant_identifier_names, avoid_as, unused_import, unnecessary_parenthesis, prefer_null_aware_operators, omit_local_variable_types, unused_shown_name, unnecessary_import, no_leading_underscores_for_local_identifiers

import 'dart:async';
import 'dart:typed_data' show Float64List, Int32List, Int64List, Uint8List;

import 'package:flutter/foundation.dart' show ReadBuffer, WriteBuffer;
import 'package:flutter/services.dart';

PlatformException _createConnectionError(String channelName) {
  return PlatformException(
    code: 'channel-error',
    message: 'Unable to establish connection on channel: "$channelName".',
  );
}

enum AdTypeDart {
  IDLE,
  BANNER,
  INTERSTITIAL,
  NATIVE,
  REWARDED,
  REWARDED_INTERSTITIAL,
  APP_OPEN,
  MREC,
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
  REKLAMUP,
}

class DTAdPigeon {
  /// Constructor for [DTAdPigeon].  The [binaryMessenger] named argument is
  /// available for dependency injection.  If it is left null, the default
  /// BinaryMessenger will be used which routes to the host platform.
  DTAdPigeon({BinaryMessenger? binaryMessenger, String messageChannelSuffix = ''})
      : __pigeon_binaryMessenger = binaryMessenger,
        __pigeon_messageChannelSuffix = messageChannelSuffix.isNotEmpty ? '.$messageChannelSuffix' : '';
  final BinaryMessenger? __pigeon_binaryMessenger;

  static const MessageCodec<Object?> pigeonChannelCodec = StandardMessageCodec();

  final String __pigeon_messageChannelSuffix;

  Future<void> reportLoadBegin(String id, AdTypeDart type, AdPlatformDart platform, String seq, Map<String?, Object?> properties, AdMediationDart mediation, String mediationId) async {
    final String __pigeon_channelName = 'dev.flutter.pigeon.datatower_ai_core.DTAdPigeon.reportLoadBegin$__pigeon_messageChannelSuffix';
    final BasicMessageChannel<Object?> __pigeon_channel = BasicMessageChannel<Object?>(
      __pigeon_channelName,
      pigeonChannelCodec,
      binaryMessenger: __pigeon_binaryMessenger,
    );
    final List<Object?>? __pigeon_replyList =
        await __pigeon_channel.send(<Object?>[id, type.index, platform.index, seq, properties, mediation.index, mediationId]) as List<Object?>?;
    if (__pigeon_replyList == null) {
      throw _createConnectionError(__pigeon_channelName);
    } else if (__pigeon_replyList.length > 1) {
      throw PlatformException(
        code: __pigeon_replyList[0]! as String,
        message: __pigeon_replyList[1] as String?,
        details: __pigeon_replyList[2],
      );
    } else {
      return;
    }
  }

  Future<void> reportLoadEnd(String id, AdTypeDart type, AdPlatformDart platform, int duration, bool result, String seq, int errorCode, String errorMessage, Map<String?, Object?> properties, AdMediationDart mediation, String mediationId) async {
    final String __pigeon_channelName = 'dev.flutter.pigeon.datatower_ai_core.DTAdPigeon.reportLoadEnd$__pigeon_messageChannelSuffix';
    final BasicMessageChannel<Object?> __pigeon_channel = BasicMessageChannel<Object?>(
      __pigeon_channelName,
      pigeonChannelCodec,
      binaryMessenger: __pigeon_binaryMessenger,
    );
    final List<Object?>? __pigeon_replyList =
        await __pigeon_channel.send(<Object?>[id, type.index, platform.index, duration, result, seq, errorCode, errorMessage, properties, mediation.index, mediationId]) as List<Object?>?;
    if (__pigeon_replyList == null) {
      throw _createConnectionError(__pigeon_channelName);
    } else if (__pigeon_replyList.length > 1) {
      throw PlatformException(
        code: __pigeon_replyList[0]! as String,
        message: __pigeon_replyList[1] as String?,
        details: __pigeon_replyList[2],
      );
    } else {
      return;
    }
  }

  Future<void> reportToShow(String id, AdTypeDart type, AdPlatformDart platform, String location, String seq, Map<String?, Object?> properties, String entrance, AdMediationDart mediation, String mediationId) async {
    final String __pigeon_channelName = 'dev.flutter.pigeon.datatower_ai_core.DTAdPigeon.reportToShow$__pigeon_messageChannelSuffix';
    final BasicMessageChannel<Object?> __pigeon_channel = BasicMessageChannel<Object?>(
      __pigeon_channelName,
      pigeonChannelCodec,
      binaryMessenger: __pigeon_binaryMessenger,
    );
    final List<Object?>? __pigeon_replyList =
        await __pigeon_channel.send(<Object?>[id, type.index, platform.index, location, seq, properties, entrance, mediation.index, mediationId]) as List<Object?>?;
    if (__pigeon_replyList == null) {
      throw _createConnectionError(__pigeon_channelName);
    } else if (__pigeon_replyList.length > 1) {
      throw PlatformException(
        code: __pigeon_replyList[0]! as String,
        message: __pigeon_replyList[1] as String?,
        details: __pigeon_replyList[2],
      );
    } else {
      return;
    }
  }

  Future<void> reportShow(String id, AdTypeDart type, AdPlatformDart platform, String location, String seq, Map<String?, Object?> properties, String entrance, AdMediationDart mediation, String mediationId) async {
    final String __pigeon_channelName = 'dev.flutter.pigeon.datatower_ai_core.DTAdPigeon.reportShow$__pigeon_messageChannelSuffix';
    final BasicMessageChannel<Object?> __pigeon_channel = BasicMessageChannel<Object?>(
      __pigeon_channelName,
      pigeonChannelCodec,
      binaryMessenger: __pigeon_binaryMessenger,
    );
    final List<Object?>? __pigeon_replyList =
        await __pigeon_channel.send(<Object?>[id, type.index, platform.index, location, seq, properties, entrance, mediation.index, mediationId]) as List<Object?>?;
    if (__pigeon_replyList == null) {
      throw _createConnectionError(__pigeon_channelName);
    } else if (__pigeon_replyList.length > 1) {
      throw PlatformException(
        code: __pigeon_replyList[0]! as String,
        message: __pigeon_replyList[1] as String?,
        details: __pigeon_replyList[2],
      );
    } else {
      return;
    }
  }

  Future<void> reportShowFailed(String id, AdTypeDart type, AdPlatformDart platform, String location, String seq, int errorCode, String errorMessage, Map<String?, Object?> properties, String entrance, AdMediationDart mediation, String mediationId) async {
    final String __pigeon_channelName = 'dev.flutter.pigeon.datatower_ai_core.DTAdPigeon.reportShowFailed$__pigeon_messageChannelSuffix';
    final BasicMessageChannel<Object?> __pigeon_channel = BasicMessageChannel<Object?>(
      __pigeon_channelName,
      pigeonChannelCodec,
      binaryMessenger: __pigeon_binaryMessenger,
    );
    final List<Object?>? __pigeon_replyList =
        await __pigeon_channel.send(<Object?>[id, type.index, platform.index, location, seq, errorCode, errorMessage, properties, entrance, mediation.index, mediationId]) as List<Object?>?;
    if (__pigeon_replyList == null) {
      throw _createConnectionError(__pigeon_channelName);
    } else if (__pigeon_replyList.length > 1) {
      throw PlatformException(
        code: __pigeon_replyList[0]! as String,
        message: __pigeon_replyList[1] as String?,
        details: __pigeon_replyList[2],
      );
    } else {
      return;
    }
  }

  Future<void> reportClose(String id, AdTypeDart type, AdPlatformDart platform, String location, String seq, Map<String?, Object?> properties, String entrance, AdMediationDart mediation, String mediationId) async {
    final String __pigeon_channelName = 'dev.flutter.pigeon.datatower_ai_core.DTAdPigeon.reportClose$__pigeon_messageChannelSuffix';
    final BasicMessageChannel<Object?> __pigeon_channel = BasicMessageChannel<Object?>(
      __pigeon_channelName,
      pigeonChannelCodec,
      binaryMessenger: __pigeon_binaryMessenger,
    );
    final List<Object?>? __pigeon_replyList =
        await __pigeon_channel.send(<Object?>[id, type.index, platform.index, location, seq, properties, entrance, mediation.index, mediationId]) as List<Object?>?;
    if (__pigeon_replyList == null) {
      throw _createConnectionError(__pigeon_channelName);
    } else if (__pigeon_replyList.length > 1) {
      throw PlatformException(
        code: __pigeon_replyList[0]! as String,
        message: __pigeon_replyList[1] as String?,
        details: __pigeon_replyList[2],
      );
    } else {
      return;
    }
  }

  Future<void> reportClick(String id, AdTypeDart type, AdPlatformDart platform, String location, String seq, Map<String?, Object?> properties, String entrance, AdMediationDart mediation, String mediationId) async {
    final String __pigeon_channelName = 'dev.flutter.pigeon.datatower_ai_core.DTAdPigeon.reportClick$__pigeon_messageChannelSuffix';
    final BasicMessageChannel<Object?> __pigeon_channel = BasicMessageChannel<Object?>(
      __pigeon_channelName,
      pigeonChannelCodec,
      binaryMessenger: __pigeon_binaryMessenger,
    );
    final List<Object?>? __pigeon_replyList =
        await __pigeon_channel.send(<Object?>[id, type.index, platform.index, location, seq, properties, entrance, mediation.index, mediationId]) as List<Object?>?;
    if (__pigeon_replyList == null) {
      throw _createConnectionError(__pigeon_channelName);
    } else if (__pigeon_replyList.length > 1) {
      throw PlatformException(
        code: __pigeon_replyList[0]! as String,
        message: __pigeon_replyList[1] as String?,
        details: __pigeon_replyList[2],
      );
    } else {
      return;
    }
  }

  Future<void> reportRewarded(String id, AdTypeDart type, AdPlatformDart platform, String location, String seq, Map<String?, Object?> properties, String entrance, AdMediationDart mediation, String mediationId) async {
    final String __pigeon_channelName = 'dev.flutter.pigeon.datatower_ai_core.DTAdPigeon.reportRewarded$__pigeon_messageChannelSuffix';
    final BasicMessageChannel<Object?> __pigeon_channel = BasicMessageChannel<Object?>(
      __pigeon_channelName,
      pigeonChannelCodec,
      binaryMessenger: __pigeon_binaryMessenger,
    );
    final List<Object?>? __pigeon_replyList =
        await __pigeon_channel.send(<Object?>[id, type.index, platform.index, location, seq, properties, entrance, mediation.index, mediationId]) as List<Object?>?;
    if (__pigeon_replyList == null) {
      throw _createConnectionError(__pigeon_channelName);
    } else if (__pigeon_replyList.length > 1) {
      throw PlatformException(
        code: __pigeon_replyList[0]! as String,
        message: __pigeon_replyList[1] as String?,
        details: __pigeon_replyList[2],
      );
    } else {
      return;
    }
  }

  Future<void> reportConversionByClick(String id, AdTypeDart type, AdPlatformDart platform, String location, String seq, Map<String?, Object?> properties, String entrance, AdMediationDart mediation, String mediationId) async {
    final String __pigeon_channelName = 'dev.flutter.pigeon.datatower_ai_core.DTAdPigeon.reportConversionByClick$__pigeon_messageChannelSuffix';
    final BasicMessageChannel<Object?> __pigeon_channel = BasicMessageChannel<Object?>(
      __pigeon_channelName,
      pigeonChannelCodec,
      binaryMessenger: __pigeon_binaryMessenger,
    );
    final List<Object?>? __pigeon_replyList =
        await __pigeon_channel.send(<Object?>[id, type.index, platform.index, location, seq, properties, entrance, mediation.index, mediationId]) as List<Object?>?;
    if (__pigeon_replyList == null) {
      throw _createConnectionError(__pigeon_channelName);
    } else if (__pigeon_replyList.length > 1) {
      throw PlatformException(
        code: __pigeon_replyList[0]! as String,
        message: __pigeon_replyList[1] as String?,
        details: __pigeon_replyList[2],
      );
    } else {
      return;
    }
  }

  Future<void> reportConversionByLeftApp(String id, AdTypeDart type, AdPlatformDart platform, String location, String seq, Map<String?, Object?> properties, String entrance, AdMediationDart mediation, String mediationId) async {
    final String __pigeon_channelName = 'dev.flutter.pigeon.datatower_ai_core.DTAdPigeon.reportConversionByLeftApp$__pigeon_messageChannelSuffix';
    final BasicMessageChannel<Object?> __pigeon_channel = BasicMessageChannel<Object?>(
      __pigeon_channelName,
      pigeonChannelCodec,
      binaryMessenger: __pigeon_binaryMessenger,
    );
    final List<Object?>? __pigeon_replyList =
        await __pigeon_channel.send(<Object?>[id, type.index, platform.index, location, seq, properties, entrance, mediation.index, mediationId]) as List<Object?>?;
    if (__pigeon_replyList == null) {
      throw _createConnectionError(__pigeon_channelName);
    } else if (__pigeon_replyList.length > 1) {
      throw PlatformException(
        code: __pigeon_replyList[0]! as String,
        message: __pigeon_replyList[1] as String?,
        details: __pigeon_replyList[2],
      );
    } else {
      return;
    }
  }

  Future<void> reportConversionByRewarded(String id, AdTypeDart type, AdPlatformDart platform, String location, String seq, Map<String?, Object?> properties, String entrance, AdMediationDart mediation, String mediationId) async {
    final String __pigeon_channelName = 'dev.flutter.pigeon.datatower_ai_core.DTAdPigeon.reportConversionByRewarded$__pigeon_messageChannelSuffix';
    final BasicMessageChannel<Object?> __pigeon_channel = BasicMessageChannel<Object?>(
      __pigeon_channelName,
      pigeonChannelCodec,
      binaryMessenger: __pigeon_binaryMessenger,
    );
    final List<Object?>? __pigeon_replyList =
        await __pigeon_channel.send(<Object?>[id, type.index, platform.index, location, seq, properties, entrance, mediation.index, mediationId]) as List<Object?>?;
    if (__pigeon_replyList == null) {
      throw _createConnectionError(__pigeon_channelName);
    } else if (__pigeon_replyList.length > 1) {
      throw PlatformException(
        code: __pigeon_replyList[0]! as String,
        message: __pigeon_replyList[1] as String?,
        details: __pigeon_replyList[2],
      );
    } else {
      return;
    }
  }

  Future<void> reportPaid(String id, AdTypeDart type, AdPlatformDart platform, String location, String seq, double value, String currency, String precision, Map<String?, Object?> properties, String entrance, AdMediationDart mediation, String mediationId) async {
    final String __pigeon_channelName = 'dev.flutter.pigeon.datatower_ai_core.DTAdPigeon.reportPaid$__pigeon_messageChannelSuffix';
    final BasicMessageChannel<Object?> __pigeon_channel = BasicMessageChannel<Object?>(
      __pigeon_channelName,
      pigeonChannelCodec,
      binaryMessenger: __pigeon_binaryMessenger,
    );
    final List<Object?>? __pigeon_replyList =
        await __pigeon_channel.send(<Object?>[id, type.index, platform.index, location, seq, value, currency, precision, properties, entrance, mediation.index, mediationId]) as List<Object?>?;
    if (__pigeon_replyList == null) {
      throw _createConnectionError(__pigeon_channelName);
    } else if (__pigeon_replyList.length > 1) {
      throw PlatformException(
        code: __pigeon_replyList[0]! as String,
        message: __pigeon_replyList[1] as String?,
        details: __pigeon_replyList[2],
      );
    } else {
      return;
    }
  }

  Future<void> reportPaidWithCountry(String id, AdTypeDart type, AdPlatformDart platform, String location, String seq, AdMediationDart mediation, String mediationId, double value, String precision, String country, Map<String?, Object?> properties) async {
    final String __pigeon_channelName = 'dev.flutter.pigeon.datatower_ai_core.DTAdPigeon.reportPaidWithCountry$__pigeon_messageChannelSuffix';
    final BasicMessageChannel<Object?> __pigeon_channel = BasicMessageChannel<Object?>(
      __pigeon_channelName,
      pigeonChannelCodec,
      binaryMessenger: __pigeon_binaryMessenger,
    );
    final List<Object?>? __pigeon_replyList =
        await __pigeon_channel.send(<Object?>[id, type.index, platform.index, location, seq, mediation.index, mediationId, value, precision, country, properties]) as List<Object?>?;
    if (__pigeon_replyList == null) {
      throw _createConnectionError(__pigeon_channelName);
    } else if (__pigeon_replyList.length > 1) {
      throw PlatformException(
        code: __pigeon_replyList[0]! as String,
        message: __pigeon_replyList[1] as String?,
        details: __pigeon_replyList[2],
      );
    } else {
      return;
    }
  }

  Future<void> reportLeftApp(String id, AdTypeDart type, AdPlatformDart platform, String location, String seq, Map<String?, Object?> properties, String entrance, AdMediationDart mediation, String mediationId) async {
    final String __pigeon_channelName = 'dev.flutter.pigeon.datatower_ai_core.DTAdPigeon.reportLeftApp$__pigeon_messageChannelSuffix';
    final BasicMessageChannel<Object?> __pigeon_channel = BasicMessageChannel<Object?>(
      __pigeon_channelName,
      pigeonChannelCodec,
      binaryMessenger: __pigeon_binaryMessenger,
    );
    final List<Object?>? __pigeon_replyList =
        await __pigeon_channel.send(<Object?>[id, type.index, platform.index, location, seq, properties, entrance, mediation.index, mediationId]) as List<Object?>?;
    if (__pigeon_replyList == null) {
      throw _createConnectionError(__pigeon_channelName);
    } else if (__pigeon_replyList.length > 1) {
      throw PlatformException(
        code: __pigeon_replyList[0]! as String,
        message: __pigeon_replyList[1] as String?,
        details: __pigeon_replyList[2],
      );
    } else {
      return;
    }
  }
}
