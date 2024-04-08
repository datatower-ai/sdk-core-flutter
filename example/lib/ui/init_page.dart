import 'dart:io';

import 'package:datatower_ai_core/api/dt.dart';
import 'package:datatower_ai_core/datatower_ai_core.dart';
import 'package:datatower_ai_core_example/bean/sdk_info.dart';
import 'package:flutter/material.dart';

class InitPage extends StatefulWidget {
  const InitPage({super.key});

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<InitPage> {
  String appId = "dt_c015a9ff8759e7d4";
  String url = "https://test.roiquery.com";
  bool _isDebug = true;
  DTLogLevel _logLevel = DTLogLevel.DEBUG;
  bool manualEnableUpload = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: FractionallySizedBox(
              widthFactor: 0.6,
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "DT SDK Flutter\n(Demo)",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Theme.of(context).colorScheme.primary),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: TextEditingController()..text = appId,
                    decoration: const InputDecoration(
                        label: Text("App id"), border: OutlineInputBorder()),
                    onChanged: (str) => appId = str,
                    maxLines: null,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: TextEditingController()..text = url,
                    decoration: const InputDecoration(
                        label: Text("Server url"),
                        border: OutlineInputBorder()),
                    onChanged: (str) => url = str,
                    maxLines: null,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(children: [
                    Switch(
                        value: _isDebug,
                        onChanged: (_) => setState(() => _isDebug = !_isDebug)
                    ),
                    const SizedBox(width: 15,),
                    Expanded(child: Text("Is debug", style: Theme.of(context).textTheme.bodyLarge,)),
                  ]),
                  const SizedBox(
                    height: 10,
                  ),
                  if (_isDebug) ...[
                    const SizedBox(
                      height: 5,
                    ),
                    DropdownMenu<DTLogLevel>(
                      dropdownMenuEntries: const [
                        DropdownMenuEntry(
                            value: DTLogLevel.DEBUG, label: "Debug"),
                        DropdownMenuEntry(
                            value: DTLogLevel.INFO, label: "Info"),
                        DropdownMenuEntry(
                            value: DTLogLevel.WARN, label: "Warn"),
                        DropdownMenuEntry(
                            value: DTLogLevel.ERROR, label: "Error"),
                      ],
                      initialSelection: _logLevel,
                      onSelected: (ll) => _logLevel = ll ?? DTLogLevel.DEBUG,
                      width: MediaQuery.of(context).size.width * 0.6,
                      label: const Text("Log Level"),
                      helperText: "Only takes effect once per cold-start.",
                    ),
                  ],
                  const SizedBox(
                    height: 10,
                  ),
                  Row(children: [
                    Switch(
                      value: manualEnableUpload,
                      onChanged: (_) => setState(() => manualEnableUpload = !manualEnableUpload)
                    ),
                    const SizedBox(width: 15,),
                    Expanded(child: Text("Manually enable upload", style: Theme.of(context).textTheme.bodyLarge, maxLines: 2,)),
                  ]),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (appId.isNotEmpty && url.isNotEmpty) {
                          sdkInfo = SdkInfo(appId, url);
                          var channel = "1";
                          if (Platform.isIOS) {
                            channel = "2";
                          }
                          DT.initSDK(appId, url,
                              channel: channel,
                              isDebug: _isDebug,
                              logLevel: _logLevel,
                              manualEnableUpload: manualEnableUpload,
                          );
                          Navigator.of(context).pushNamed("/home");
                        }
                      },
                      child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: const Center(child: Text("Initialize")))),
                ],
              ))),
    );
  }
}
