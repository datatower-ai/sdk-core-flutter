import 'dart:convert';

import 'package:datatower_ai_core/api/dt_analytics.dart';
import 'package:flutter/material.dart';

Map<String, dynamic> _dynamicProperties = {};

class CommonPropertiesPage extends StatefulWidget {
  const CommonPropertiesPage({super.key});

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<CommonPropertiesPage> {
  static String _dcp = "{}";
  static String _scp = "{}";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Common Properties'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ElevatedButton(
                  onPressed: () {
                    DTAnalytics.setDynamicCommonProperties(() => _dynamicProperties);
                  },
                  child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: const Center(child: Text("Set dyn comm props' getter")))),
              const SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () {
                    DTAnalytics.clearDynamicCommonProperties();
                  },
                  child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: const Center(child: Text("Clear dyn comm props' getter")))),
              const SizedBox(height: 20),
              _PropertiesSetter(
                title: "Dynamic common properties",
                initProps: _dcp,
                onSet: (props, formatted) {
                  _dcp = formatted;
                  _dynamicProperties = json.decode(props);
                },
                onClear: (_) {
                  _dcp = "{}";
                  _dynamicProperties = {};
                },
                buttonText: "Update",
              ),
              const SizedBox(height: 20),
              _PropertiesSetter(
                title: "Static common properties",
                initProps: _scp,
                onSet: (props, formatted) {
                  _scp = formatted;
                  DTAnalytics.setStaticCommonProperties(json.decode(props));
                },
                onClear: (_) {
                  _scp = "{}";
                  DTAnalytics.clearStaticCommonProperties();
                },
              )
            ],
          )
        ),
      ),
    );
  }
}

class _PropertiesSetter extends StatefulWidget {
  final String title;
  final String initProps;
  final Function(String, String) onSet;
  final Function(String) onClear;
  final String buttonText;

  const _PropertiesSetter({
    required this.title,
    required this.initProps,
    required this.onSet,
    required this.onClear,
    this.buttonText = "Set",
  });

  @override
  State<StatefulWidget> createState() => _PropertiesSetterState();
}

class _PropertiesSetterState extends State<_PropertiesSetter> {
  static const encoder = JsonEncoder.withIndent("    ");
  
  late String tmpProps = widget.initProps;
  bool expanded = false;
  String? errorMsg;
  bool get hasError => errorMsg != null;
  late final TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: tmpProps);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          InkWell(
            onTap: () => setState(() => expanded = !expanded),
            borderRadius: BorderRadius.circular(10),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Row(
                children: [
                  Expanded(child: Text(widget.title, style: Theme.of(context).textTheme.titleMedium,)),
                  expanded?
                  const Icon(Icons.keyboard_arrow_down_rounded)
                      : const Icon(Icons.keyboard_arrow_right_rounded)
                ],
              )
            ),
          ),
          if (expanded) Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                TextField(
                  controller: controller,
                  onChanged: (str) {
                    tmpProps = str;
                    if (hasError) {
                      setState(() => errorMsg = null);
                    }
                  },
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    errorText: hasError? errorMsg : null,
                    errorMaxLines: 5
                  ),
                  minLines: 5,
                  maxLines: 10,
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Flexible(
                        fit: FlexFit.tight,
                        child: TextButton(
                            onPressed: () {
                              setState(() {
                                tmpProps = "{}";
                                controller.text = tmpProps;
                                widget.onClear(tmpProps);
                              });
                            },
                            child: const Text("clear")
                        )
                    ),
                    const SizedBox(width: 24),
                    Flexible(
                        fit: FlexFit.tight,
                        child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                try {
                                  final formatted = encoder.convert(json.decode(tmpProps));
                                  controller.text = formatted;
                                  widget.onSet(tmpProps, formatted);
                                } on Exception catch (e) {
                                  setState(() => errorMsg = e.toString());
                                }
                              });
                            },
                            child: Text(widget.buttonText)
                        )
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}