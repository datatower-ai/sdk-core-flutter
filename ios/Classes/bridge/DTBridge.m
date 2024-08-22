//
//  DTBridge.m
//  datatower_ai_core
//
//  Created by Lilin on 2023/9/20.
//

#import "DTBridge.h"
#import <datatower_ai_core/DT.h>

@implementation DTBridge

- (void)initSDKAppId:(NSString *)appId url:(NSString *)url channel:(NSString *)channel isDebug:(BOOL)isDebug logLevel:(DTDTLogLevel)logLevel manualEnableUpload:(BOOL)manualEnableUpload commonProperties:(NSDictionary<NSString *, id> *)commonProperties error:(FlutterError *_Nullable *_Nonnull)error {
    
    DTLoggingLevel iOSLogLevel = [self convertFlutterLogLevel:logLevel];
    [DT initSDK:appId serverUrl:url channel:DTChannelAppStore isDebug:isDebug logLevel:iOSLogLevel commonProperties:commonProperties enableTrack:!manualEnableUpload];
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

- (void)enableUploadWithError:(FlutterError * _Nullable __autoreleasing * _Nonnull)error {
    [DTAnalytics setEnableTracking:enable];
}

@end

