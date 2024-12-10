// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// DtApiMethodsGenerator
// **************************************************************************

import 'package:datatower_ai_core/api/dt_ias.dart';
import 'package:datatower_ai_core/api/dt_iap.dart';
import 'package:datatower_ai_core/api/dt_ad.dart';
import 'package:datatower_ai_core/api/dt_analytics_util.dart';
import 'package:datatower_ai_core/api/dt.dart';
import 'package:datatower_ai_core/api/dt_analytics.dart';

const List<DtApiMethodHolder> dtApiMethodHolders = [
  dtApiMethods4DTIasReport,
  dtApiMethods4DTIapReport,
  dtApiMethods4DTAdReport,
  dtApiMethods4DTAnalyticsUtil,
  dtApiMethods4DT,
  dtApiMethods4DTAnalytics
];

const DtApiMethodHolder dtApiMethods4DTIasReport =
    DtApiMethodHolder("DTIasReport", [
  "reportSubscribeSuccess",
  "reportSubscribeSuccessAndroid",
  "reportSubscribeSuccessIos"
]);

const DtApiMethodHolder dtApiMethods4DTIapReport =
    DtApiMethodHolder("DTIapReport", [
  "reportPurchaseSuccess",
  "reportPurchaseSuccessAndroid",
  "reportPurchaseSuccessIos"
]);

const DtApiMethodHolder dtApiMethods4DTAdReport =
    DtApiMethodHolder("DTAdReport", [
  "reportLoadBegin",
  "reportLoadEnd",
  "reportToShow",
  "reportShow",
  "reportShowFailed",
  "reportClose",
  "reportClick",
  "reportRewarded",
  "reportConversionByClick",
  "reportConversionByLeftApp",
  "reportConversionByRewarded",
  "reportPaid",
  "reportPaidWithCountry",
  "reportLeftApp"
]);

const DtApiMethodHolder dtApiMethods4DTAnalyticsUtil = DtApiMethodHolder(
    "DTAnalyticsUtil", [
  "trackTimerStart",
  "trackTimerPause",
  "trackTimerResume",
  "trackTimerEnd"
]);

const DtApiMethodHolder dtApiMethods4DT = DtApiMethodHolder(
    "DT", ["initSDK", "enableUpload", "enableAutoTrack", "disableAutoTrack"]);

const DtApiMethodHolder dtApiMethods4DTAnalytics =
    DtApiMethodHolder("DTAnalytics", [
  "trackEvent",
  "userSet",
  "userSetOnce",
  "userAdd",
  "userUnset",
  "userDelete",
  "userAppend",
  "userUniqAppend",
  "getDataTowerId",
  "setAccountId",
  "setFirebaseAppInstanceId",
  "setAppsFlyerId",
  "setKochavaId",
  "setAdjustId",
  "setTenjinId",
  "enableThirdPartySharing",
  "setDynamicCommonProperties",
  "clearDynamicCommonProperties",
  "setStaticCommonProperties",
  "clearStaticCommonProperties"
]);

class DtApiMethodHolder {
  final String name;
  final Iterable<String> methods;

  const DtApiMethodHolder(this.name, this.methods);
}

class DtApiMethod {
  final String name;
  final List<String> orderedParamNames;
  final List<String> orderedParam;
  final Map<String, String> namedParam;
  final void Function(List<dynamic> ordered, Map<String, dynamic> named) run;

  const DtApiMethod({
    required this.name,
    required this.orderedParamNames,
    required this.orderedParam,
    required this.namedParam,
    required this.run,
  });
}

final Map<String, DtApiMethod> dtApiMethods = {
  "DTIasReport_reportSubscribeSuccess": DtApiMethod(
      name: "DTIasReport",
      orderedParamNames: [
        "originalOrderId",
        "orderId",
        "sku",
        "price",
        "currency",
        "seq",
        "placement"
      ],
      orderedParam: [
        "String",
        "String",
        "String",
        "double",
        "String",
        "String",
        "String"
      ],
      namedParam: {"entrance": "String", "properties": "Map<String, Object?>?"},
      run: (ordered, named) {
        DTIasReport.reportSubscribeSuccess(ordered[0], ordered[1], ordered[2],
            ordered[3], ordered[4], ordered[5], ordered[6],
            entrance: named["entrance"], properties: named["properties"]);
      }),
  "DTIasReport_reportSubscribeSuccessAndroid": DtApiMethod(
      name: "DTIasReport",
      orderedParamNames: [
        "originalOrderId",
        "orderId",
        "sku",
        "price",
        "currency"
      ],
      orderedParam: ["String", "String", "String", "double", "String"],
      namedParam: {"properties": "Map<String, Object?>?"},
      run: (ordered, named) {
        DTIasReport.reportSubscribeSuccessAndroid(
            ordered[0], ordered[1], ordered[2], ordered[3], ordered[4],
            properties: named["properties"]);
      }),
  "DTIasReport_reportSubscribeSuccessIos": DtApiMethod(
      name: "DTIasReport",
      orderedParamNames: [
        "seq",
        "placement",
        "sku",
        "orderId",
        "originalOrderId",
        "price",
        "currency"
      ],
      orderedParam: [
        "String",
        "String",
        "String",
        "String",
        "String",
        "String",
        "String"
      ],
      namedParam: {"entrance": "String"},
      run: (ordered, named) {
        DTIasReport.reportSubscribeSuccessIos(ordered[0], ordered[1],
            ordered[2], ordered[3], ordered[4], ordered[5], ordered[6],
            entrance: named["entrance"]);
      }),
  "DTIapReport_reportPurchaseSuccess": DtApiMethod(
      name: "DTIapReport",
      orderedParamNames: ["order", "sku", "price", "currency", "seq"],
      orderedParam: ["String", "String", "double", "String", "String"],
      namedParam: {"entrance": "String", "properties": "Map<String, Object?>?"},
      run: (ordered, named) {
        DTIapReport.reportPurchaseSuccess(
            ordered[0], ordered[1], ordered[2], ordered[3], ordered[4],
            entrance: named["entrance"], properties: named["properties"]);
      }),
  "DTIapReport_reportPurchaseSuccessAndroid": DtApiMethod(
      name: "DTIapReport",
      orderedParamNames: ["order", "sku", "price", "currency"],
      orderedParam: ["String", "String", "double", "String"],
      namedParam: {"properties": "Map<String, Object?>?"},
      run: (ordered, named) {
        DTIapReport.reportPurchaseSuccessAndroid(
            ordered[0], ordered[1], ordered[2], ordered[3],
            properties: named["properties"]);
      }),
  "DTIapReport_reportPurchaseSuccessIos": DtApiMethod(
      name: "DTIapReport",
      orderedParamNames: ["order", "sku", "price", "currency", "seq"],
      orderedParam: ["String", "String", "double", "String", "String"],
      namedParam: {"entrance": "String"},
      run: (ordered, named) {
        DTIapReport.reportPurchaseSuccessIos(
            ordered[0], ordered[1], ordered[2], ordered[3], ordered[4],
            entrance: named["entrance"]);
      }),
  "DTAdReport_reportLoadBegin": DtApiMethod(
      name: "DTAdReport",
      orderedParamNames: [
        "id",
        "type",
        "platform",
        "mediation",
        "mediationId",
        "seq"
      ],
      orderedParam: [
        "String",
        "AdTypeDart",
        "AdPlatformDart",
        "AdMediationDart",
        "String",
        "String"
      ],
      namedParam: {"properties": "Map<String, Object?>?"},
      run: (ordered, named) {
        DTAdReport.reportLoadBegin(ordered[0], ordered[1], ordered[2],
            ordered[3], ordered[4], ordered[5],
            properties: named["properties"]);
      }),
  "DTAdReport_reportLoadEnd": DtApiMethod(
      name: "DTAdReport",
      orderedParamNames: [
        "id",
        "type",
        "platform",
        "mediation",
        "mediationId",
        "duration",
        "result",
        "seq"
      ],
      orderedParam: [
        "String",
        "AdTypeDart",
        "AdPlatformDart",
        "AdMediationDart",
        "String",
        "int",
        "bool",
        "String"
      ],
      namedParam: {
        "errorCode": "int",
        "errorMessage": "String",
        "properties": "Map<String, Object?>?"
      },
      run: (ordered, named) {
        DTAdReport.reportLoadEnd(ordered[0], ordered[1], ordered[2], ordered[3],
            ordered[4], ordered[5], ordered[6], ordered[7],
            errorCode: named["errorCode"],
            errorMessage: named["errorMessage"],
            properties: named["properties"]);
      }),
  "DTAdReport_reportToShow": DtApiMethod(
      name: "DTAdReport",
      orderedParamNames: [
        "id",
        "type",
        "platform",
        "mediation",
        "mediationId",
        "location",
        "seq"
      ],
      orderedParam: [
        "String",
        "AdTypeDart",
        "AdPlatformDart",
        "AdMediationDart",
        "String",
        "String",
        "String"
      ],
      namedParam: {
        "properties": "Map<String, Object?>?",
        "entrance": "String?"
      },
      run: (ordered, named) {
        DTAdReport.reportToShow(ordered[0], ordered[1], ordered[2], ordered[3],
            ordered[4], ordered[5], ordered[6],
            properties: named["properties"], entrance: named["entrance"]);
      }),
  "DTAdReport_reportShow": DtApiMethod(
      name: "DTAdReport",
      orderedParamNames: [
        "id",
        "type",
        "platform",
        "mediation",
        "mediationId",
        "location",
        "seq"
      ],
      orderedParam: [
        "String",
        "AdTypeDart",
        "AdPlatformDart",
        "AdMediationDart",
        "String",
        "String",
        "String"
      ],
      namedParam: {
        "properties": "Map<String, Object?>?",
        "entrance": "String?"
      },
      run: (ordered, named) {
        DTAdReport.reportShow(ordered[0], ordered[1], ordered[2], ordered[3],
            ordered[4], ordered[5], ordered[6],
            properties: named["properties"], entrance: named["entrance"]);
      }),
  "DTAdReport_reportShowFailed": DtApiMethod(
      name: "DTAdReport",
      orderedParamNames: [
        "id",
        "type",
        "platform",
        "mediation",
        "mediationId",
        "location",
        "seq",
        "errorCode",
        "errorMessage"
      ],
      orderedParam: [
        "String",
        "AdTypeDart",
        "AdPlatformDart",
        "AdMediationDart",
        "String",
        "String",
        "String",
        "int",
        "String"
      ],
      namedParam: {
        "properties": "Map<String, Object?>?",
        "entrance": "String?"
      },
      run: (ordered, named) {
        DTAdReport.reportShowFailed(
            ordered[0],
            ordered[1],
            ordered[2],
            ordered[3],
            ordered[4],
            ordered[5],
            ordered[6],
            ordered[7],
            ordered[8],
            properties: named["properties"],
            entrance: named["entrance"]);
      }),
  "DTAdReport_reportClose": DtApiMethod(
      name: "DTAdReport",
      orderedParamNames: [
        "id",
        "type",
        "platform",
        "mediation",
        "mediationId",
        "location",
        "seq"
      ],
      orderedParam: [
        "String",
        "AdTypeDart",
        "AdPlatformDart",
        "AdMediationDart",
        "String",
        "String",
        "String"
      ],
      namedParam: {
        "properties": "Map<String, Object?>?",
        "entrance": "String?"
      },
      run: (ordered, named) {
        DTAdReport.reportClose(ordered[0], ordered[1], ordered[2], ordered[3],
            ordered[4], ordered[5], ordered[6],
            properties: named["properties"], entrance: named["entrance"]);
      }),
  "DTAdReport_reportClick": DtApiMethod(
      name: "DTAdReport",
      orderedParamNames: [
        "id",
        "type",
        "platform",
        "mediation",
        "mediationId",
        "location",
        "seq"
      ],
      orderedParam: [
        "String",
        "AdTypeDart",
        "AdPlatformDart",
        "AdMediationDart",
        "String",
        "String",
        "String"
      ],
      namedParam: {
        "properties": "Map<String, Object?>?",
        "entrance": "String?"
      },
      run: (ordered, named) {
        DTAdReport.reportClick(ordered[0], ordered[1], ordered[2], ordered[3],
            ordered[4], ordered[5], ordered[6],
            properties: named["properties"], entrance: named["entrance"]);
      }),
  "DTAdReport_reportRewarded": DtApiMethod(
      name: "DTAdReport",
      orderedParamNames: [
        "id",
        "type",
        "platform",
        "mediation",
        "mediationId",
        "location",
        "seq"
      ],
      orderedParam: [
        "String",
        "AdTypeDart",
        "AdPlatformDart",
        "AdMediationDart",
        "String",
        "String",
        "String"
      ],
      namedParam: {
        "properties": "Map<String, Object?>?",
        "entrance": "String?"
      },
      run: (ordered, named) {
        DTAdReport.reportRewarded(ordered[0], ordered[1], ordered[2],
            ordered[3], ordered[4], ordered[5], ordered[6],
            properties: named["properties"], entrance: named["entrance"]);
      }),
  "DTAdReport_reportConversionByClick": DtApiMethod(
      name: "DTAdReport",
      orderedParamNames: [
        "id",
        "type",
        "platform",
        "mediation",
        "mediationId",
        "location",
        "seq"
      ],
      orderedParam: [
        "String",
        "AdTypeDart",
        "AdPlatformDart",
        "AdMediationDart",
        "String",
        "String",
        "String"
      ],
      namedParam: {
        "properties": "Map<String, Object?>?",
        "entrance": "String?"
      },
      run: (ordered, named) {
        DTAdReport.reportConversionByClick(ordered[0], ordered[1], ordered[2],
            ordered[3], ordered[4], ordered[5], ordered[6],
            properties: named["properties"], entrance: named["entrance"]);
      }),
  "DTAdReport_reportConversionByLeftApp": DtApiMethod(
      name: "DTAdReport",
      orderedParamNames: [
        "id",
        "type",
        "platform",
        "mediation",
        "mediationId",
        "location",
        "seq"
      ],
      orderedParam: [
        "String",
        "AdTypeDart",
        "AdPlatformDart",
        "AdMediationDart",
        "String",
        "String",
        "String"
      ],
      namedParam: {
        "properties": "Map<String, Object?>?",
        "entrance": "String?"
      },
      run: (ordered, named) {
        DTAdReport.reportConversionByLeftApp(ordered[0], ordered[1], ordered[2],
            ordered[3], ordered[4], ordered[5], ordered[6],
            properties: named["properties"], entrance: named["entrance"]);
      }),
  "DTAdReport_reportConversionByRewarded": DtApiMethod(
      name: "DTAdReport",
      orderedParamNames: [
        "id",
        "type",
        "platform",
        "mediation",
        "mediationId",
        "location",
        "seq"
      ],
      orderedParam: [
        "String",
        "AdTypeDart",
        "AdPlatformDart",
        "AdMediationDart",
        "String",
        "String",
        "String"
      ],
      namedParam: {
        "properties": "Map<String, Object?>?",
        "entrance": "String?"
      },
      run: (ordered, named) {
        DTAdReport.reportConversionByRewarded(ordered[0], ordered[1],
            ordered[2], ordered[3], ordered[4], ordered[5], ordered[6],
            properties: named["properties"], entrance: named["entrance"]);
      }),
  "DTAdReport_reportPaid": DtApiMethod(
      name: "DTAdReport",
      orderedParamNames: [
        "id",
        "type",
        "platform",
        "mediation",
        "mediationId",
        "location",
        "seq",
        "value",
        "currency",
        "precision"
      ],
      orderedParam: [
        "String",
        "AdTypeDart",
        "AdPlatformDart",
        "AdMediationDart",
        "String",
        "String",
        "String",
        "double",
        "String",
        "String"
      ],
      namedParam: {
        "properties": "Map<String, Object?>?",
        "entrance": "String?"
      },
      run: (ordered, named) {
        DTAdReport.reportPaid(
            ordered[0],
            ordered[1],
            ordered[2],
            ordered[3],
            ordered[4],
            ordered[5],
            ordered[6],
            ordered[7],
            ordered[8],
            ordered[9],
            properties: named["properties"],
            entrance: named["entrance"]);
      }),
  "DTAdReport_reportPaidWithCountry": DtApiMethod(
      name: "DTAdReport",
      orderedParamNames: [
        "id",
        "type",
        "platform",
        "location",
        "seq",
        "mediation",
        "mediationId",
        "value",
        "precision",
        "country"
      ],
      orderedParam: [
        "String",
        "AdTypeDart",
        "AdPlatformDart",
        "String",
        "String",
        "AdMediationDart",
        "String",
        "double",
        "String",
        "String"
      ],
      namedParam: {"properties": "Map<String, Object?>?"},
      run: (ordered, named) {
        DTAdReport.reportPaidWithCountry(
            ordered[0],
            ordered[1],
            ordered[2],
            ordered[3],
            ordered[4],
            ordered[5],
            ordered[6],
            ordered[7],
            ordered[8],
            ordered[9],
            properties: named["properties"]);
      }),
  "DTAdReport_reportLeftApp": DtApiMethod(
      name: "DTAdReport",
      orderedParamNames: [
        "id",
        "type",
        "platform",
        "mediation",
        "mediationId",
        "location",
        "seq"
      ],
      orderedParam: [
        "String",
        "AdTypeDart",
        "AdPlatformDart",
        "AdMediationDart",
        "String",
        "String",
        "String"
      ],
      namedParam: {
        "properties": "Map<String, Object?>?",
        "entrance": "String?"
      },
      run: (ordered, named) {
        DTAdReport.reportLeftApp(ordered[0], ordered[1], ordered[2], ordered[3],
            ordered[4], ordered[5], ordered[6],
            properties: named["properties"], entrance: named["entrance"]);
      }),
  "DTAnalyticsUtil_trackTimerStart": DtApiMethod(
      name: "DTAnalyticsUtil",
      orderedParamNames: ["eventName"],
      orderedParam: ["String"],
      namedParam: {},
      run: (ordered, named) {
        DTAnalyticsUtil.trackTimerStart(
          ordered[0],
        );
      }),
  "DTAnalyticsUtil_trackTimerPause": DtApiMethod(
      name: "DTAnalyticsUtil",
      orderedParamNames: ["eventName"],
      orderedParam: ["String"],
      namedParam: {},
      run: (ordered, named) {
        DTAnalyticsUtil.trackTimerPause(
          ordered[0],
        );
      }),
  "DTAnalyticsUtil_trackTimerResume": DtApiMethod(
      name: "DTAnalyticsUtil",
      orderedParamNames: ["eventName"],
      orderedParam: ["String"],
      namedParam: {},
      run: (ordered, named) {
        DTAnalyticsUtil.trackTimerResume(
          ordered[0],
        );
      }),
  "DTAnalyticsUtil_trackTimerEnd": DtApiMethod(
      name: "DTAnalyticsUtil",
      orderedParamNames: ["eventName"],
      orderedParam: ["String"],
      namedParam: {"properties": "Map<String, Object?>?"},
      run: (ordered, named) {
        DTAnalyticsUtil.trackTimerEnd(ordered[0],
            properties: named["properties"]);
      }),
  "DT_initSDK": DtApiMethod(
      name: "DT",
      orderedParamNames: ["appId", "url"],
      orderedParam: ["String", "String"],
      namedParam: {
        "channel": "String",
        "isDebug": "bool",
        "logLevel": "DTLogLevel",
        "manualEnableUpload": "bool"
      },
      run: (ordered, named) {
        DT.initSDK(ordered[0], ordered[1],
            channel: named["channel"],
            isDebug: named["isDebug"],
            logLevel: named["logLevel"],
            manualEnableUpload: named["manualEnableUpload"]);
      }),
  "DT_enableUpload": DtApiMethod(
      name: "DT",
      orderedParamNames: [],
      orderedParam: [],
      namedParam: {},
      run: (ordered, named) {
        DT.enableUpload();
      }),
  "DT_enableAutoTrack": DtApiMethod(
      name: "DT",
      orderedParamNames: ["presetEvent"],
      orderedParam: ["DTPresetEvent"],
      namedParam: {},
      run: (ordered, named) {
        DT.enableAutoTrack(
          ordered[0],
        );
      }),
  "DT_disableAutoTrack": DtApiMethod(
      name: "DT",
      orderedParamNames: ["presetEvent"],
      orderedParam: ["DTPresetEvent"],
      namedParam: {},
      run: (ordered, named) {
        DT.disableAutoTrack(
          ordered[0],
        );
      }),
  "DTAnalytics_trackEvent": DtApiMethod(
      name: "DTAnalytics",
      orderedParamNames: ["eventName", "properties"],
      orderedParam: ["String", "Map<String, Object?>"],
      namedParam: {},
      run: (ordered, named) {
        DTAnalytics.trackEvent(
          ordered[0],
          ordered[1],
        );
      }),
  "DTAnalytics_userSet": DtApiMethod(
      name: "DTAnalytics",
      orderedParamNames: ["properties"],
      orderedParam: ["Map<String, Object?>"],
      namedParam: {},
      run: (ordered, named) {
        DTAnalytics.userSet(
          ordered[0],
        );
      }),
  "DTAnalytics_userSetOnce": DtApiMethod(
      name: "DTAnalytics",
      orderedParamNames: ["properties"],
      orderedParam: ["Map<String, Object?>"],
      namedParam: {},
      run: (ordered, named) {
        DTAnalytics.userSetOnce(
          ordered[0],
        );
      }),
  "DTAnalytics_userAdd": DtApiMethod(
      name: "DTAnalytics",
      orderedParamNames: ["properties"],
      orderedParam: ["Map<String, Object?>"],
      namedParam: {},
      run: (ordered, named) {
        DTAnalytics.userAdd(
          ordered[0],
        );
      }),
  "DTAnalytics_userUnset": DtApiMethod(
      name: "DTAnalytics",
      orderedParamNames: ["properties"],
      orderedParam: ["List<String>"],
      namedParam: {},
      run: (ordered, named) {
        DTAnalytics.userUnset(
          ordered[0],
        );
      }),
  "DTAnalytics_userDelete": DtApiMethod(
      name: "DTAnalytics",
      orderedParamNames: [],
      orderedParam: [],
      namedParam: {},
      run: (ordered, named) {
        DTAnalytics.userDelete();
      }),
  "DTAnalytics_userAppend": DtApiMethod(
      name: "DTAnalytics",
      orderedParamNames: ["properties"],
      orderedParam: ["Map<String, Object?>"],
      namedParam: {},
      run: (ordered, named) {
        DTAnalytics.userAppend(
          ordered[0],
        );
      }),
  "DTAnalytics_userUniqAppend": DtApiMethod(
      name: "DTAnalytics",
      orderedParamNames: ["properties"],
      orderedParam: ["Map<String, Object?>"],
      namedParam: {},
      run: (ordered, named) {
        DTAnalytics.userUniqAppend(
          ordered[0],
        );
      }),
  "DTAnalytics_getDataTowerId": DtApiMethod(
      name: "DTAnalytics",
      orderedParamNames: [],
      orderedParam: [],
      namedParam: {},
      run: (ordered, named) {
        DTAnalytics.getDataTowerId();
      }),
  "DTAnalytics_setAccountId": DtApiMethod(
      name: "DTAnalytics",
      orderedParamNames: ["id"],
      orderedParam: ["String?"],
      namedParam: {},
      run: (ordered, named) {
        DTAnalytics.setAccountId(
          ordered[0],
        );
      }),
  "DTAnalytics_setFirebaseAppInstanceId": DtApiMethod(
      name: "DTAnalytics",
      orderedParamNames: ["id"],
      orderedParam: ["String?"],
      namedParam: {},
      run: (ordered, named) {
        DTAnalytics.setFirebaseAppInstanceId(
          ordered[0],
        );
      }),
  "DTAnalytics_setAppsFlyerId": DtApiMethod(
      name: "DTAnalytics",
      orderedParamNames: ["id"],
      orderedParam: ["String?"],
      namedParam: {},
      run: (ordered, named) {
        DTAnalytics.setAppsFlyerId(
          ordered[0],
        );
      }),
  "DTAnalytics_setKochavaId": DtApiMethod(
      name: "DTAnalytics",
      orderedParamNames: ["id"],
      orderedParam: ["String?"],
      namedParam: {},
      run: (ordered, named) {
        DTAnalytics.setKochavaId(
          ordered[0],
        );
      }),
  "DTAnalytics_setAdjustId": DtApiMethod(
      name: "DTAnalytics",
      orderedParamNames: ["id"],
      orderedParam: ["String?"],
      namedParam: {},
      run: (ordered, named) {
        DTAnalytics.setAdjustId(
          ordered[0],
        );
      }),
  "DTAnalytics_setTenjinId": DtApiMethod(
      name: "DTAnalytics",
      orderedParamNames: ["id"],
      orderedParam: ["String?"],
      namedParam: {},
      run: (ordered, named) {
        DTAnalytics.setTenjinId(
          ordered[0],
        );
      }),
  "DTAnalytics_enableThirdPartySharing": DtApiMethod(
      name: "DTAnalytics",
      orderedParamNames: ["type"],
      orderedParam: ["int"],
      namedParam: {},
      run: (ordered, named) {
        DTAnalytics.enableThirdPartySharing(
          ordered[0],
        );
      }),
  "DTAnalytics_setDynamicCommonProperties": DtApiMethod(
      name: "DTAnalytics",
      orderedParamNames: ["getter"],
      orderedParam: ["Map<String, Object?> Function()"],
      namedParam: {},
      run: (ordered, named) {
        DTAnalytics.setDynamicCommonProperties(
          ordered[0],
        );
      }),
  "DTAnalytics_clearDynamicCommonProperties": DtApiMethod(
      name: "DTAnalytics",
      orderedParamNames: [],
      orderedParam: [],
      namedParam: {},
      run: (ordered, named) {
        DTAnalytics.clearDynamicCommonProperties();
      }),
  "DTAnalytics_setStaticCommonProperties": DtApiMethod(
      name: "DTAnalytics",
      orderedParamNames: ["properties"],
      orderedParam: ["Map<String, Object?>"],
      namedParam: {},
      run: (ordered, named) {
        DTAnalytics.setStaticCommonProperties(
          ordered[0],
        );
      }),
  "DTAnalytics_clearStaticCommonProperties": DtApiMethod(
      name: "DTAnalytics",
      orderedParamNames: [],
      orderedParam: [],
      namedParam: {},
      run: (ordered, named) {
        DTAnalytics.clearStaticCommonProperties();
      })
};
