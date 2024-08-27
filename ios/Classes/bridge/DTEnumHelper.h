//
//  DTEnumHelper.h
//  datatower_ai_core
//
//  Created by Lilin on 2023/9/27.
//

#import <Foundation/Foundation.h>
#import "dt_ad.g.h"
#import <DataTowerAICore/DTAdReport.h>

NS_ASSUME_NONNULL_BEGIN

@interface DTEnumHelper : NSObject

+ (DTAdType)converAdType:(DTAdTypeDart)adTypeDart;

+ (DTAdPlatform)convertPlatformType:(DTAdPlatformDart)platformDart;

+ (DTAdMediation)convertMediationType:(DTAdMediationDart)typeDart;

@end

NS_ASSUME_NONNULL_END
