#import "DTIapBridge.h"
#import <DataTowerAICore/DTIAPReport.h>

@implementation DTIapBridge

- (void)reportPurchaseSuccessAndroidOrder:(NSString *)order sku:(NSString *)sku price:(double)price currency:(NSString *)currency properties:(NSDictionary<NSString *, id> *)properties error:(FlutterError *)error {
    // Android only
}

- (void)reportPurchaseSuccessIosOrder:(NSString *)order sku:(NSString *)sku price:(double)price currency:(NSString *)currency seq:(NSString *)seq entrance:(NSString *)entrance error:(FlutterError *_Nullable *_Nonnull)error {
    [DTIAPReport reportPurchased:order sku:sku price:@(price) currency:currency seq:seq placement:entrance];
}

@end
