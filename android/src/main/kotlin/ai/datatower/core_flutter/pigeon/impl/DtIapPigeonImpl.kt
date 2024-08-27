package ai.datatower.core_flutter.pigeon.impl

import DTIapPigeon
import ai.datatower.iap.DTIAPReport

internal object DtIapPigeonImpl: DTIapPigeon {
    override fun reportPurchaseSuccessAndroid(
        order: String,
        sku: String,
        price: Double,
        currency: String,
        properties: Map<String, Any>
    ) {
        DTIAPReport.reportPurchaseSuccess(order, sku, price, currency, properties?.toMutableMap())
    }

    override fun reportPurchaseSuccessIos(
        order: String, sku: String, price: Double, currency: String, seq: String, entrance: String
    ) {
        // This method is for iOS only.
    }
}