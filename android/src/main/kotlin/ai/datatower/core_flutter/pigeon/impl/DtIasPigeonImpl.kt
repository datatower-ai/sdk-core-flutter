package ai.datatower.core_flutter.pigeon.impl

import DTIasPigeon
import ai.datatower.ias.DTIASReport

internal object DtIasPigeonImpl: DTIasPigeon {
    override fun reportSubscribeSuccessAndroid(
        originalOrderId: String,
        orderId: String,
        sku: String,
        price: Double,
        currency: String,
        properties: Map<String, Any>
    ) {
        DTIASReport.reportSubscribeSuccess(
            originalOrderId, orderId, sku, price, currency,
            properties?.toMutableMap()
        )
    }

    override fun reportSubscribeSuccessIos(
        seq: String, placement: String, sku: String, orderId: String, originalOrderId: String,
        price: String, currency: String, entrance: String
    ) {
        // This method is for iOS only
    }
}