#import "DTIasBridge.h"
#import <DataTowerAICore/DTIASReport.h>

@implementation DTIasBridge

- (void)reportSubscribeSuccessAndroidOriginalOrderId:(NSString *)originalOrderId orderId:(NSString *)orderId sku:(NSString *)sku price:(double)price currency:(NSString *)currency properties:(nullable NSDictionary<NSString *, id> *)properties error:(FlutterError *_Nullable *_Nonnull)error {
    // Android only
}

- (void)reportSubscribeSuccessIosSeq:(NSString *)seq placement:(NSString *)placement sku:(NSString *)sku orderId:(NSString *)orderId originalOrderId:(NSString *)originalOrderId price:(NSString *)price currency:(NSString *)currency entrance:(NSString *)entrance error:(FlutterError *_Nullable *_Nonnull)error {
    [DTIASReport reportSubscribeSuccess:iasSeq  entrance:iasEntrance placement:iasPlacement sku:iasSku orderId:iasOrderId originalOrderId:iasOriginalOrderId price:iasPrice currency:iasCurrency properties:@{}];
}

@end