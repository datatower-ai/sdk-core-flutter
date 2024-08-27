//
//  DTUtilBridge.m
//  datatower_ai_core
//
//  Created by Lilin on 2023/9/21.
//

#import "DTUtilBridge.h"
#import <DataTowerAICore/DTAnalyticsUtils.h>

@implementation DTUtilBridge

- (void)trackTimerEndEventName:(nonnull NSString *)eventName properties:(nullable NSDictionary<NSString *,id> *)properties error:(FlutterError * _Nullable __autoreleasing * _Nonnull)error {
    
    [DTAnalyticsUtils trackTimerEnd:eventName properties:properties];
}

- (void)trackTimerPauseEventName:(nonnull NSString *)eventName error:(FlutterError * _Nullable __autoreleasing * _Nonnull)error {
    
    [DTAnalyticsUtils trackTimerPause:eventName];
}

- (void)trackTimerResumeEventName:(nonnull NSString *)eventName error:(FlutterError * _Nullable __autoreleasing * _Nonnull)error {
    
    [DTAnalyticsUtils trackTimerResume:eventName];
}

- (void)trackTimerStartEventName:(nonnull NSString *)eventName error:(FlutterError * _Nullable __autoreleasing * _Nonnull)error {
    
    [DTAnalyticsUtils trackTimerStart:eventName];
}

@end
