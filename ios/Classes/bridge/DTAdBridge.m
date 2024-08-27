//
//  DTAdBridge.m
//  datatower_ai_core
//
//  Created by Lilin on 2023/9/20.
//

#import "DTAdBridge.h"
#import <DataTowerAICore/DTAdReport.h>
#import "DTEnumHelper.h"

@implementation DTAdBridge


- (void)reportClickId:(nonnull NSString *)id type:(DTAdTypeDart)type platform:(DTAdPlatformDart)platform location:(nonnull NSString *)location seq:(nonnull NSString *)seq properties:(nonnull NSDictionary<NSString *,id> *)properties entrance:(nonnull NSString *)entrance mediation:(DTAdMediationDart)mediation mediationId:(nonnull NSString *)mediationId error:(FlutterError * _Nullable __autoreleasing * _Nonnull)error {
    
    DTAdType dtType = [DTEnumHelper converAdType:type];
    DTAdPlatform dtPlatform = [DTEnumHelper convertPlatformType:platform];
    DTAdMediation dtMediation = [DTEnumHelper convertMediationType:mediation];

    [DTAdReport reportClick:id type:dtType platform:dtPlatform location:location seq:seq mediation:dtMediation mediationId:mediationId properties:properties entrance:entrance];
}

- (void)reportCloseId:(nonnull NSString *)id type:(DTAdTypeDart)type platform:(DTAdPlatformDart)platform location:(nonnull NSString *)location seq:(nonnull NSString *)seq properties:(nonnull NSDictionary<NSString *,id> *)properties entrance:(nonnull NSString *)entrance mediation:(DTAdMediationDart)mediation mediationId:(nonnull NSString *)mediationId error:(FlutterError * _Nullable __autoreleasing * _Nonnull)error {
    DTAdType dtType = [DTEnumHelper converAdType:type];
    DTAdPlatform dtPlatform = [DTEnumHelper convertPlatformType:platform];
    DTAdMediation dtMediation = [DTEnumHelper convertMediationType:mediation];

    [DTAdReport reportClose:id type:dtType platform:dtPlatform location:location seq:seq mediation:dtMediation mediationId:mediationId properties:properties entrance:entrance];
}

- (void)reportConversionByClickId:(nonnull NSString *)id type:(DTAdTypeDart)type platform:(DTAdPlatformDart)platform location:(nonnull NSString *)location seq:(nonnull NSString *)seq properties:(nonnull NSDictionary<NSString *,id> *)properties entrance:(nonnull NSString *)entrance mediation:(DTAdMediationDart)mediation mediationId:(nonnull NSString *)mediationId error:(FlutterError * _Nullable __autoreleasing * _Nonnull)error {
    DTAdType dtType = [DTEnumHelper converAdType:type];
    DTAdPlatform dtPlatform = [DTEnumHelper convertPlatformType:platform];
    DTAdMediation dtMediation = [DTEnumHelper convertMediationType:mediation];

    [DTAdReport reportConversionByClick:id type:dtType platform:dtPlatform location:location seq:seq mediation:dtMediation mediationId:mediationId properties:properties entrance:entrance];
}

- (void)reportConversionByLeftAppId:(nonnull NSString *)id type:(DTAdTypeDart)type platform:(DTAdPlatformDart)platform location:(nonnull NSString *)location seq:(nonnull NSString *)seq properties:(nonnull NSDictionary<NSString *,id> *)properties entrance:(nonnull NSString *)entrance mediation:(DTAdMediationDart)mediation mediationId:(nonnull NSString *)mediationId error:(FlutterError * _Nullable __autoreleasing * _Nonnull)error {
    DTAdType dtType = [DTEnumHelper converAdType:type];
    DTAdPlatform dtPlatform = [DTEnumHelper convertPlatformType:platform];
    DTAdMediation dtMediation = [DTEnumHelper convertMediationType:mediation];

    [DTAdReport reportConversionByLeftApp:id type:dtType platform:dtPlatform location:location seq:seq mediation:dtMediation mediationId:mediationId properties:properties entrance:entrance];
}

- (void)reportConversionByRewardedId:(nonnull NSString *)id type:(DTAdTypeDart)type platform:(DTAdPlatformDart)platform location:(nonnull NSString *)location seq:(nonnull NSString *)seq properties:(nonnull NSDictionary<NSString *,id> *)properties entrance:(nonnull NSString *)entrance mediation:(DTAdMediationDart)mediation mediationId:(nonnull NSString *)mediationId error:(FlutterError * _Nullable __autoreleasing * _Nonnull)error {
    DTAdType dtType = [DTEnumHelper converAdType:type];
    DTAdPlatform dtPlatform = [DTEnumHelper convertPlatformType:platform];
    DTAdMediation dtMediation = [DTEnumHelper convertMediationType:mediation];

    [DTAdReport reportConversionByRewarded:id type:dtType platform:dtPlatform location:location seq:seq mediation:dtMediation mediationId:mediationId properties:properties entrance:entrance];
}

- (void)reportLeftAppId:(nonnull NSString *)id type:(DTAdTypeDart)type platform:(DTAdPlatformDart)platform location:(nonnull NSString *)location seq:(nonnull NSString *)seq properties:(nonnull NSDictionary<NSString *,id> *)properties entrance:(nonnull NSString *)entrance mediation:(DTAdMediationDart)mediation mediationId:(nonnull NSString *)mediationId error:(FlutterError * _Nullable __autoreleasing * _Nonnull)error {
    DTAdType dtType = [DTEnumHelper converAdType:type];
    DTAdPlatform dtPlatform = [DTEnumHelper convertPlatformType:platform];
    DTAdMediation dtMediation = [DTEnumHelper convertMediationType:mediation];

    [DTAdReport reportLeftApp:id type:dtType platform:dtPlatform location:location seq:seq mediation:dtMediation mediationId:mediationId properties:properties entrance:entrance];
}

- (void)reportLoadBeginId:(nonnull NSString *)id type:(DTAdTypeDart)type platform:(DTAdPlatformDart)platform seq:(nonnull NSString *)seq properties:(nonnull NSDictionary<NSString *,id> *)properties mediation:(DTAdMediationDart)mediation mediationId:(nonnull NSString *)mediationId error:(FlutterError * _Nullable __autoreleasing * _Nonnull)error {
    DTAdType dtType = [DTEnumHelper converAdType:type];
    DTAdPlatform dtPlatform = [DTEnumHelper convertPlatformType:platform];
    DTAdMediation dtMediation = [DTEnumHelper convertMediationType:mediation];

    [DTAdReport reportLoadBegin:id type:dtType platform:dtPlatform seq:seq mediation:dtMediation mediationId:mediationId properties:properties];
}

- (void)reportLoadEndId:(nonnull NSString *)id type:(DTAdTypeDart)type platform:(DTAdPlatformDart)platform duration:(nonnull NSNumber *)duration result:(nonnull NSNumber *)result seq:(nonnull NSString *)seq errorCode:(nonnull NSNumber *)errorCode errorMessage:(nonnull NSString *)errorMessage properties:(nonnull NSDictionary<NSString *,id> *)properties mediation:(DTAdMediationDart)mediation mediationId:(nonnull NSString *)mediationId error:(FlutterError * _Nullable __autoreleasing * _Nonnull)error {
    DTAdType dtType = [DTEnumHelper converAdType:type];
    DTAdPlatform dtPlatform = [DTEnumHelper convertPlatformType:platform];
    DTAdMediation dtMediation = [DTEnumHelper convertMediationType:mediation];

    [DTAdReport reportLoadEnd:id type:dtType platform:dtPlatform duration:duration result:[result boolValue] seq:seq mediation:dtMediation mediationId:mediationId errorCode:errorCode.intValue errorMessage:errorMessage properties:properties];
}

- (void)reportPaidId:(nonnull NSString *)id type:(DTAdTypeDart)type platform:(DTAdPlatformDart)platform location:(nonnull NSString *)location seq:(nonnull NSString *)seq value:(NSNumber *)value currency:(nonnull NSString *)currency precision:(nonnull NSString *)precision properties:(nonnull NSDictionary<NSString *,id> *)properties entrance:(nonnull NSString *)entrance mediation:(DTAdMediationDart)mediation mediationId:(nonnull NSString *)mediationId error:(FlutterError * _Nullable __autoreleasing * _Nonnull)error {
    DTAdType dtType = [DTEnumHelper converAdType:type];
    DTAdPlatform dtPlatform = [DTEnumHelper convertPlatformType:platform];
    DTAdMediation dtMediation = [DTEnumHelper convertMediationType:mediation];

    [DTAdReport reportPaid:id type:dtType platform:dtPlatform location:location seq:seq mediation:dtMediation mediationId:mediationId value:[value doubleValue] currency:currency precision:precision properties:properties entrance:entrance];
}

- (void)reportPaidWithCountryId:(nonnull NSString *)id type:(DTAdTypeDart)type platform:(DTAdPlatformDart)platform location:(nonnull NSString *)location seq:(nonnull NSString *)seq mediation:(DTAdMediationDart)mediation mediationId:(nonnull NSString *)mediationId value:( NSNumber *)value precision:(nonnull NSString *)precision country:(nonnull NSString *)country properties:(nonnull NSDictionary<NSString *,id> *)properties error:(FlutterError * _Nullable __autoreleasing * _Nonnull)error {
    DTAdType dtType = [DTEnumHelper converAdType:type];
    DTAdPlatform dtPlatform = [DTEnumHelper convertPlatformType:platform];
    DTAdMediation dtMediation = [DTEnumHelper convertMediationType:mediation];

    [DTAdReport reportPaid:id type:dtType platform:dtPlatform location:location seq:seq mediation:dtMediation mediationId:mediationId value:[value doubleValue] precision:precision country:country properties:properties entrance:@""];
}

- (void)reportRewardedId:(nonnull NSString *)id type:(DTAdTypeDart)type platform:(DTAdPlatformDart)platform location:(nonnull NSString *)location seq:(nonnull NSString *)seq properties:(nonnull NSDictionary<NSString *,id> *)properties entrance:(nonnull NSString *)entrance mediation:(DTAdMediationDart)mediation mediationId:(nonnull NSString *)mediationId error:(FlutterError * _Nullable __autoreleasing * _Nonnull)error {
    DTAdType dtType = [DTEnumHelper converAdType:type];
    DTAdPlatform dtPlatform = [DTEnumHelper convertPlatformType:platform];
    DTAdMediation dtMediation = [DTEnumHelper convertMediationType:mediation];

    [DTAdReport reportRewarded:id type:dtType platform:dtPlatform location:location seq:seq mediation:dtMediation mediationId:mediationId properties:properties entrance:entrance];
}

- (void)reportShowFailedId:(nonnull NSString *)id type:(DTAdTypeDart)type platform:(DTAdPlatformDart)platform location:(nonnull NSString *)location seq:(nonnull NSString *)seq errorCode:(nonnull NSNumber *)errorCode errorMessage:(nonnull NSString *)errorMessage properties:(nonnull NSDictionary<NSString *,id> *)properties entrance:(nonnull NSString *)entrance mediation:(DTAdMediationDart)mediation mediationId:(nonnull NSString *)mediationId error:(FlutterError * _Nullable __autoreleasing * _Nonnull)error {
    DTAdType dtType = [DTEnumHelper converAdType:type];
    DTAdPlatform dtPlatform = [DTEnumHelper convertPlatformType:platform];
    DTAdMediation dtMediation = [DTEnumHelper convertMediationType:mediation];

    [DTAdReport reportAdShowFail:id type:dtType platform:dtPlatform location:location seq:seq mediation:dtMediation mediationId:mediationId errorCode:errorCode.intValue errorMessage:errorMessage properties:properties entrance:entrance];
}

- (void)reportShowId:(nonnull NSString *)id type:(DTAdTypeDart)type platform:(DTAdPlatformDart)platform location:(nonnull NSString *)location seq:(nonnull NSString *)seq properties:(nonnull NSDictionary<NSString *,id> *)properties entrance:(nonnull NSString *)entrance mediation:(DTAdMediationDart)mediation mediationId:(nonnull NSString *)mediationId error:(FlutterError * _Nullable __autoreleasing * _Nonnull)error {
    DTAdType dtType = [DTEnumHelper converAdType:type];
    DTAdPlatform dtPlatform = [DTEnumHelper convertPlatformType:platform];
    DTAdMediation dtMediation = [DTEnumHelper convertMediationType:mediation];

    [DTAdReport reportShow:id type:dtType platform:dtPlatform location:location seq:seq mediation:dtMediation mediationId:mediationId properties:properties entrance:entrance];
}

- (void)reportToShowId:(nonnull NSString *)id type:(DTAdTypeDart)type platform:(DTAdPlatformDart)platform location:(nonnull NSString *)location seq:(nonnull NSString *)seq properties:(nonnull NSDictionary<NSString *,id> *)properties entrance:(nonnull NSString *)entrance mediation:(DTAdMediationDart)mediation mediationId:(nonnull NSString *)mediationId error:(FlutterError * _Nullable __autoreleasing * _Nonnull)error {
    DTAdType dtType = [DTEnumHelper converAdType:type];
    DTAdPlatform dtPlatform = [DTEnumHelper convertPlatformType:platform];
    DTAdMediation dtMediation = [DTEnumHelper convertMediationType:mediation];

    [DTAdReport reportToShow:id type:dtType platform:dtPlatform location:location seq:seq mediation:dtMediation mediationId:mediationId properties:properties entrance:entrance];
}

@end
