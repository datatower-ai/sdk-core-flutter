import 'dart:convert';

import 'package:datatower_ai_core/api/dt_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TrackEventPage extends StatefulWidget {
  const TrackEventPage({super.key});

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<TrackEventPage> {
  String eventName = "default_event_name";
  String properties =
      "{\"textProp\":\"Hello world!\",\"integerProp\":123456,\"fpProp\":123.456,\"boolProp\":true}";
  int repeat = 1;
  int interval = 0;

  int repeated = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Track Event Customized'),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: TextEditingController()..text = eventName,
                  decoration: const InputDecoration(
                      label: Text("Event name"), border: OutlineInputBorder()),
                  onChanged: (str) => eventName = str,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: TextEditingController()..text = properties,
                  decoration: const InputDecoration(
                      label: Text("Properties"), border: OutlineInputBorder()),
                  onChanged: (str) => properties = str,
                  maxLines: null,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Flexible(
                        child: TextField(
                            decoration: const InputDecoration(
                                label: Text("Repeats"),
                                border: OutlineInputBorder()),
                            onChanged: (str) => setState(
                                () => repeat = int.tryParse(str) ?? repeat),
                            maxLines: null,
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ])),
                    const SizedBox(
                      width: 10,
                    ),
                    Flexible(
                        child: TextField(
                            decoration: const InputDecoration(
                                label: Text("Interval (ms)"),
                                border: OutlineInputBorder()),
                            onChanged: (str) => setState(
                                () => interval = int.tryParse(str) ?? interval),
                            maxLines: null,
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ])),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                _RunButton(
                    interval: interval,
                    repeats: repeat,
                    eventName: () => eventName,
                    properties: () => properties)
              ],
            )),
      ),
    );
  }
}

class _RunButton extends StatefulWidget {
  final int interval;
  final int repeats;
  final String Function() eventName;
  final String Function() properties;

  const _RunButton(
      {super.key,
      required this.interval,
      required this.repeats,
      required this.eventName,
      required this.properties});

  @override
  State<StatefulWidget> createState() => _RunButtonState();
}

class _RunButtonState extends State<_RunButton> {
  int repeated = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
            "Times of repeat: $repeated / ${widget.repeats > 1 ? widget.repeats : 1}"),
        const SizedBox(
          height: 5,
        ),
        ElevatedButton(
            onPressed: () {
              setState(() {
                repeated = 0;
              });
              if (widget.eventName.call().isNotEmpty) {
                final repeats = widget.repeats > 1 ? widget.repeats : 1;
                for (var i = 1; i <= repeats; ++i) {
                  Future.delayed(
                      Duration(milliseconds: widget.interval * (i - 1)), () {
                    DTAnalytics.trackEvent(
                        widget.eventName.call(),
                        widget.properties.call().isEmpty
                            ? null
                            : jsonDecode(widget.properties.call()));
                    setState(() {
                      repeated = i;
                    });
                  });
                }
              }
            },
            child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: const Center(child: Text("RUN"))))
      ],
    );
  }
}
