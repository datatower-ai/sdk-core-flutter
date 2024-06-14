//
//  DTBridge.m
//  datatower_ai_core
//
//  Created by Lilin on 2023/9/20.
//

#import "DTBridge.h"
#import <DataTowerAICore/DT.h>

@implementation DTBridge

- (void)initSDKAppId:(nonnull NSString *)appId url:(nonnull NSString *)url channel:(nonnull NSString *)channel isDebug:(nonnull NSNumber *)isDebug logLevel:(DTDTLogLevel)logLevel commonProperties:(nonnull NSDictionary<NSString *,id> *)commonProperties error:(FlutterError * _Nullable __autoreleasing * _Nonnull)error {
    
    DTLoggingLevel iOSLogLevel = [self convertFlutterLogLevel:logLevel];
    [DT initSDK:appId serverUrl:url channel:DTChannelAppStore isDebug:[isDebug boolValue] logLevel:iOSLogLevel commonProperties:commonProperties enableTrack:YES];
}

- (DTLoggingLevel)convertFlutterLogLevel:(DTDTLogLevel)fltLogLevel {
    DTLoggingLevel ret = DTLoggingLevelError;
    if ( fltLogLevel <= DTDTLogLevelDEBUG ) {
        ret = DTLoggingLevelDebug;
    } else if ( fltLogLevel <= DTDTLogLevelINFO ) {
        ret = DTLoggingLevelInfo;
    } 
    return ret;
}

@end

