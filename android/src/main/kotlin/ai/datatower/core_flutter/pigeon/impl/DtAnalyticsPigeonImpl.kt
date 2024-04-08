package ai.datatower.core_flutter.pigeon.impl

import DTAnalyticsPigeon
import ai.datatower.analytics.DTAnalytics
import ai.datatower.analytics.OnDataTowerIdListener
import org.json.JSONObject

internal object DtAnalyticsPigeonImpl: DTAnalyticsPigeon {
    override fun trackEvent(eventName: String, properties: Map<String, Any>) {
        DTAnalytics.track(eventName, properties)
    }

    override fun userSet(properties: Map<String, Any>) {
        DTAnalytics.userSet(JSONObject(properties))
    }

    override fun userSetOnce(properties: Map<String, Any>) {
        DTAnalytics.userSetOnce(JSONObject(properties))
    }

    override fun userAdd(properties: Map<String, Any>) {
        DTAnalytics.userAdd(JSONObject(properties))
    }

    override fun userUnset(properties: List<String>) {
        DTAnalytics.userUnset(*properties.toTypedArray())
    }

    override fun userDelete() {
        DTAnalytics.userDelete()
    }

    override fun userAppend(properties: Map<String, Any>) {
        DTAnalytics.userAppend(JSONObject(properties))
    }

    override fun userUniqAppend(properties: Map<String, Any>) {
        DTAnalytics.userUniqAppend(JSONObject(properties))
    }

    override fun getDataTowerId(callback: (Result<String?>) -> Unit) {
        DTAnalytics.getDataTowerId(object : OnDataTowerIdListener{
            override fun onDataTowerIdCompleted(dataTowerId: String) {
                callback(Result.success(dataTowerId))
            }
        })
    }

    override fun setAccountId(id: String?) {
        DTAnalytics.setAccountId(id)
    }

    override fun setFirebaseAppInstanceId(id: String?) {
        DTAnalytics.setFirebaseAppInstanceId(id)
    }

    override fun setAppsFlyerId(id: String?) {
        DTAnalytics.setAppsFlyerId(id)
    }

    override fun setKochavaId(id: String?) {
        DTAnalytics.setKochavaId(id)
    }

    override fun setAdjustId(id: String?) {
        DTAnalytics.setAdjustId(id)
    }

    override fun enableThirdPartySharing(type: Long) {
        DTAnalytics.enableThirdPartySharing(type.toInt())
    }

    override fun setDistinctId(id: String?) {
        DTAnalytics.distinctId = id
    }

    override fun getDistinctId(callback: (Result<String?>) -> Unit) {
        callback.invoke(Result.success(DTAnalytics.distinctId))
    }

    override fun setStaticCommonProperties(properties: Map<String, Any>) {
        DTAnalytics.setStaticCommonProperties(properties)
    }

    override fun clearStaticCommonProperties() {
        DTAnalytics.clearStaticCommonProperties()
    }
}