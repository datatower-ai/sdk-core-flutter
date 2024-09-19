# 3.1.0

* NEW: Supports to disable preset properties through config file.
* NEW: Supports to toggle preset event 
  * DT.enableAutoTrack(DTPresetEvent)
  * DT.disableAutoTrack(DTPresetEvent)
* UPDATE: Cutting out unnecessary event uploading at the initialization stage.

# 3.0.0

> &#x2753; How to migrate?
> 1. Changes package from `datatower_ai_core_flutter` to `datatower_ai_core`.
> 2. Searching and replacing globally inside /lib directory:
> 
> | Searching                            | Replacing                    |
> |:-------------------------------------|:-----------------------------|
> | `package:datatower_ai_core_flutter/` | `package:datatower_ai_core/` |
> | `/datatower_ai_core_flutter.dart`    | `/datatower_ai_core.dart`    |

* Migrated from datatower_ai_core_flutter.
* NEW: dynamic & static common properties.
* NEW: Third-party id added to event properties.
* NEW: Supports to set Tenjin id.