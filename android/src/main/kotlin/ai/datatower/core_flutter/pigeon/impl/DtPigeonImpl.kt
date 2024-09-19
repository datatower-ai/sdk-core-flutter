package ai.datatower.core_flutter.pigeon.impl
import DTPigeon
import DTLogLevel
import DTPresetEvent
import ai.datatower.ad.AdType

import android.content.Context
import android.util.Log
import ai.datatower.analytics.DT
import ai.datatower.analytics.utils.PresetEvent
import org.json.JSONObject

internal class DtPigeonImpl(private val context: Context): DTPigeon {
    override fun initSDK(
        appId: String,
        url: String,
        channel: String,
        isDebug: Boolean,
        logLevel: DTLogLevel,
        manualEnableUpload: Boolean,
        commonProperties: Map<String, Any>
    ) {
        DT.initSDK(
            context,
            appId,
            url,
            channel,
            isDebug,
            when (logLevel) {
                DTLogLevel.DEBUG -> Log.DEBUG
                DTLogLevel.INFO -> Log.INFO
                DTLogLevel.WARN -> Log.WARN
                DTLogLevel.ERROR -> Log.ERROR
                else -> Log.DEBUG
            },
            manualEnableUpload,
            JSONObject(commonProperties)
        )
    }

    override fun enableUpload() {
        DT.enableUpload()
    }

    private val presetEvents by lazy { PresetEvent.values().associateBy { it.ordinal } }
    private fun DTPresetEvent.toDtType(): PresetEvent? = presetEvents[this.ordinal]

    override fun enableAutoTrack(presetEvent: DTPresetEvent) {
        presetEvent.toDtType()?.let {
            DT.enableAutoTrack(it)
        } ?: Log.w("DT Flutter", "[enableAutoTrack] Given PresetEvent is not recognizable: $presetEvent")
    }

    override fun disableAutoTrack(presetEvent: DTPresetEvent) {
        presetEvent.toDtType()?.let {
            DT.disableAutoTrack(it)
        } ?: Log.w("DT Flutter", "[disableAutoTrack] Given PresetEvent is not recognizable: $presetEvent")
    }
}