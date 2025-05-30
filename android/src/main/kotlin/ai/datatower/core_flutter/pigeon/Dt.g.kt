// Autogenerated from Pigeon (v18.0.1), do not edit directly.
// See also: https://pub.dev/packages/pigeon
@file:Suppress("UNCHECKED_CAST", "ArrayInDataClass")


import android.util.Log
import io.flutter.plugin.common.BasicMessageChannel
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MessageCodec
import io.flutter.plugin.common.StandardMessageCodec
import java.io.ByteArrayOutputStream
import java.nio.ByteBuffer

private fun wrapResult(result: Any?): List<Any?> {
  return listOf(result)
}

private fun wrapError(exception: Throwable): List<Any?> {
  return if (exception is DtFlutterError) {
    listOf(
      exception.code,
      exception.message,
      exception.details
    )
  } else {
    listOf(
      exception.javaClass.simpleName,
      exception.toString(),
      "Cause: " + exception.cause + ", Stacktrace: " + Log.getStackTraceString(exception)
    )
  }
}

/**
 * Error class for passing custom error details to Flutter via a thrown PlatformException.
 * @property code The error code.
 * @property message The error message.
 * @property details The error details. Must be a datatype supported by the api codec.
 */
class DtFlutterError (
  val code: String,
  override val message: String? = null,
  val details: Any? = null
) : Throwable()

enum class DTLogLevel(val raw: Int) {
  DEBUG(0),
  INFO(1),
  WARN(2),
  ERROR(3);

  companion object {
    fun ofRaw(raw: Int): DTLogLevel? {
      return values().firstOrNull { it.raw == raw }
    }
  }
}

enum class DTPresetEvent(val raw: Int) {
  INSTALL(0),
  SESSION_START(1),
  SESSION_END(2);

  companion object {
    fun ofRaw(raw: Int): DTPresetEvent? {
      return values().firstOrNull { it.raw == raw }
    }
  }
}
/** Generated interface from Pigeon that represents a handler of messages from Flutter. */
interface DTPigeon {
  fun initSDK(appId: String, url: String, channel: String, isDebug: Boolean, logLevel: DTLogLevel, manualEnableUpload: Boolean, commonProperties: Map<String, Any>)
  fun enableUpload()
  fun enableAutoTrack(presetEvent: DTPresetEvent)
  fun disableAutoTrack(presetEvent: DTPresetEvent)

  companion object {
    /** The codec used by DTPigeon. */
    val codec: MessageCodec<Any?> by lazy {
      StandardMessageCodec()
    }
    /** Sets up an instance of `DTPigeon` to handle messages through the `binaryMessenger`. */
    fun setUp(binaryMessenger: BinaryMessenger, api: DTPigeon?, messageChannelSuffix: String = "") {
      val separatedMessageChannelSuffix = if (messageChannelSuffix.isNotEmpty()) ".$messageChannelSuffix" else ""
      run {
        val channel = BasicMessageChannel<Any?>(binaryMessenger, "dev.flutter.pigeon.datatower_ai_core.DTPigeon.initSDK$separatedMessageChannelSuffix", codec)
        if (api != null) {
          channel.setMessageHandler { message, reply ->
            val args = message as List<Any?>
            val appIdArg = args[0] as String
            val urlArg = args[1] as String
            val channelArg = args[2] as String
            val isDebugArg = args[3] as Boolean
            val logLevelArg = DTLogLevel.ofRaw(args[4] as Int)!!
            val manualEnableUploadArg = args[5] as Boolean
            val commonPropertiesArg = args[6] as Map<String, Any>
            val wrapped: List<Any?> = try {
              api.initSDK(appIdArg, urlArg, channelArg, isDebugArg, logLevelArg, manualEnableUploadArg, commonPropertiesArg)
              listOf<Any?>(null)
            } catch (exception: Throwable) {
              wrapError(exception)
            }
            reply.reply(wrapped)
          }
        } else {
          channel.setMessageHandler(null)
        }
      }
      run {
        val channel = BasicMessageChannel<Any?>(binaryMessenger, "dev.flutter.pigeon.datatower_ai_core.DTPigeon.enableUpload$separatedMessageChannelSuffix", codec)
        if (api != null) {
          channel.setMessageHandler { _, reply ->
            val wrapped: List<Any?> = try {
              api.enableUpload()
              listOf<Any?>(null)
            } catch (exception: Throwable) {
              wrapError(exception)
            }
            reply.reply(wrapped)
          }
        } else {
          channel.setMessageHandler(null)
        }
      }
      run {
        val channel = BasicMessageChannel<Any?>(binaryMessenger, "dev.flutter.pigeon.datatower_ai_core.DTPigeon.enableAutoTrack$separatedMessageChannelSuffix", codec)
        if (api != null) {
          channel.setMessageHandler { message, reply ->
            val args = message as List<Any?>
            val presetEventArg = DTPresetEvent.ofRaw(args[0] as Int)!!
            val wrapped: List<Any?> = try {
              api.enableAutoTrack(presetEventArg)
              listOf<Any?>(null)
            } catch (exception: Throwable) {
              wrapError(exception)
            }
            reply.reply(wrapped)
          }
        } else {
          channel.setMessageHandler(null)
        }
      }
      run {
        val channel = BasicMessageChannel<Any?>(binaryMessenger, "dev.flutter.pigeon.datatower_ai_core.DTPigeon.disableAutoTrack$separatedMessageChannelSuffix", codec)
        if (api != null) {
          channel.setMessageHandler { message, reply ->
            val args = message as List<Any?>
            val presetEventArg = DTPresetEvent.ofRaw(args[0] as Int)!!
            val wrapped: List<Any?> = try {
              api.disableAutoTrack(presetEventArg)
              listOf<Any?>(null)
            } catch (exception: Throwable) {
              wrapError(exception)
            }
            reply.reply(wrapped)
          }
        } else {
          channel.setMessageHandler(null)
        }
      }
    }
  }
}
