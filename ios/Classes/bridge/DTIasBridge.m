#import "DTIasBridge.h"
#import <DataTowerAICore/DTIASReport.h>

@implementation DTIasBridge

- (void)reportSubscribeSuccessAndroidOriginalOrderId:(NSString *)originalOrderId orderId:(NSString *)orderId sku:(NSString *)sku price:(double)price currency:(NSString *)currency properties:( NSDictionary<NSString *, id> *)properties error:(FlutterError *_Nullable *_Nonnull)error {
    // Android only
}

- (void)reportSubscribeSuccessIosSeq:(NSString *)iasSeq placement:(NSString *)iasPlacement sku:(NSString *)iasSku orderId:(NSString *)iasOrderId originalOrderId:(NSString *)iasOriginalOrderId price:(NSString *)iasPrice currency:(NSString *)iasCurrency entrance:(NSString *)iasEntrance error:(FlutterError *)error {
    
    [DTIASReport reportSubscribeSuccess:iasSeq  entrance:iasEntrance placement:iasPlacement sku:iasSku orderId:iasOrderId originalOrderId:iasOriginalOrderId price:iasPrice currency:iasCurrency properties:@{}];
}

@end
