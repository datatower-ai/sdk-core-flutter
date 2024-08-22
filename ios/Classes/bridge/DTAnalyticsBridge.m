//
//  DTAnalyticsBridge.m
//  datatower_ai_core
//
//  Created by Lilin on 2023/9/21.
//

#import "DTAnalyticsBridge.h"
#import <datatower_ai_core/DTAnalytics.h>

@implementation DTAnalyticsBridge

- (void)enableThirdPartySharingType:(nonnull NSNumber *)type error:(FlutterError * _Nullable __autoreleasing * _Nonnull)error {
    
}

- (void)getDataTowerIdWithCompletion:(nonnull void (^)(NSString * _Nullable, FlutterError * _Nullable))completion {
    
    NSString *dtID = [DTAnalytics getDataTowerId];
    completion(dtID, nil);
}

- (void)setAccountIdId:(nullable NSString *)id error:(FlutterError * _Nullable __autoreleasing * _Nonnull)error {
    
    [DTAnalytics setAccountId:id];
}

- (void)setAdjustIdId:(nullable NSString *)id error:(FlutterError * _Nullable __autoreleasing * _Nonnull)error {
    
    [DTAnalytics setAdjustId:id];
}

- (void)setAppsFlyerIdId:(nullable NSString *)id error:(FlutterError * _Nullable __autoreleasing * _Nonnull)error {
    
    [DTAnalytics setAppsFlyerId:id];
}

- (void)setFirebaseAppInstanceIdId:(nullable NSString *)id error:(FlutterError * _Nullable __autoreleasing * _Nonnull)error {
    
    [DTAnalytics setFirebaseAppInstanceId:id];
}

- (void)setKochavaIdId:(nullable NSString *)id error:(FlutterError * _Nullable __autoreleasing * _Nonnull)error {
    
    [DTAnalytics setKochavaId:id];
}

- (void)setTenjinIdId:(nullable NSString *)id error:(FlutterError * _Nullable __autoreleasing * _Nonnull)error {

    [DTAnalytics setTenjinId:id];
}

- (void)trackEventEventName:(nonnull NSString *)eventName properties:(nonnull NSDictionary<NSString *,id> *)properties error:(FlutterError * _Nullable __autoreleasing * _Nonnull)error {
    
    [DTAnalytics trackEventName:eventName properties:properties];
}

- (void)userAddProperties:(nonnull NSDictionary<NSString *,id> *)properties error:(FlutterError * _Nullable __autoreleasing * _Nonnull)error {
    
    [DTAnalytics userAdd:properties];
}

- (void)userAppendProperties:(nonnull NSDictionary<NSString *,id> *)properties error:(FlutterError * _Nullable __autoreleasing * _Nonnull)error {
    
    [DTAnalytics userAppend:properties];
}

- (void)userDeleteWithError:(FlutterError * _Nullable __autoreleasing * _Nonnull)error {
    [DTAnalytics userDelete];
}

- (void)userSetOnceProperties:(nonnull NSDictionary<NSString *,id> *)properties error:(FlutterError * _Nullable __autoreleasing * _Nonnull)error {
    
    [DTAnalytics userSetOnce:properties];
}

- (void)userSetProperties:(nonnull NSDictionary<NSString *,id> *)properties error:(FlutterError * _Nullable __autoreleasing * _Nonnull)error {
    
    [DTAnalytics userSet:properties];
}

- (void)userUniqAppendProperties:(nonnull NSDictionary<NSString *,id> *)properties error:(FlutterError * _Nullable __autoreleasing * _Nonnull)error {
    
    [DTAnalytics userUniqAppend:properties];
}

- (void)userUnsetProperties:(nonnull NSArray<NSString *> *)properties error:(FlutterError * _Nullable __autoreleasing * _Nonnull)error {
    
    for (NSString *unsetProp in properties) {
        [DTAnalytics userUnset:unsetProp];
    }
}

- (void)setStaticCommonPropertiesProperties:(nonnull NSDictionary<NSString *,id> *)properties error:(FlutterError * _Nullable __autoreleasing * _Nonnull)error {

    [DTAnalytics setSuperProperties:properties];
}

- (void)clearStaticCommonPropertiesWithError:(FlutterError * _Nullable __autoreleasing * _Nonnull)error {
    NSDictionary *dictParam = [NSDictionary new];
    [DTAnalytics setSuperProperties:dictParam];
}

@end
