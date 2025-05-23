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
  return if (exception is DtIapFlutterError) {
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
class DtIapFlutterError (
  val code: String,
  override val message: String? = null,
  val details: Any? = null
) : Throwable()
/** Generated interface from Pigeon that represents a handler of messages from Flutter. */
interface DTIapPigeon {
  fun reportPurchaseSuccessAndroid(order: String, sku: String, price: Double, currency: String, properties: Map<String, Any>)
  fun reportPurchaseSuccessIos(order: String, sku: String, price: Double, currency: String, seq: String, entrance: String)

  companion object {
    /** The codec used by DTIapPigeon. */
    val codec: MessageCodec<Any?> by lazy {
      StandardMessageCodec()
    }
    /** Sets up an instance of `DTIapPigeon` to handle messages through the `binaryMessenger`. */
    fun setUp(binaryMessenger: BinaryMessenger, api: DTIapPigeon?, messageChannelSuffix: String = "") {
      val separatedMessageChannelSuffix = if (messageChannelSuffix.isNotEmpty()) ".$messageChannelSuffix" else ""
      run {
        val channel = BasicMessageChannel<Any?>(binaryMessenger, "dev.flutter.pigeon.datatower_ai_core.DTIapPigeon.reportPurchaseSuccessAndroid$separatedMessageChannelSuffix", codec)
        if (api != null) {
          channel.setMessageHandler { message, reply ->
            val args = message as List<Any?>
            val orderArg = args[0] as String
            val skuArg = args[1] as String
            val priceArg = args[2] as Double
            val currencyArg = args[3] as String
            val propertiesArg = args[4] as Map<String, Any>
            val wrapped: List<Any?> = try {
              api.reportPurchaseSuccessAndroid(orderArg, skuArg, priceArg, currencyArg, propertiesArg)
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
        val channel = BasicMessageChannel<Any?>(binaryMessenger, "dev.flutter.pigeon.datatower_ai_core.DTIapPigeon.reportPurchaseSuccessIos$separatedMessageChannelSuffix", codec)
        if (api != null) {
          channel.setMessageHandler { message, reply ->
            val args = message as List<Any?>
            val orderArg = args[0] as String
            val skuArg = args[1] as String
            val priceArg = args[2] as Double
            val currencyArg = args[3] as String
            val seqArg = args[4] as String
            val entranceArg = args[5] as String
            val wrapped: List<Any?> = try {
              api.reportPurchaseSuccessIos(orderArg, skuArg, priceArg, currencyArg, seqArg, entranceArg)
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
