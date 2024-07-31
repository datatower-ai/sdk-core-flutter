import 'dart:convert';

import 'package:datatower_ai_core/datatower_ai_core.dart';
import 'package:datatower_ai_core_example/test/dt_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ShowAllApiPage extends StatelessWidget {
  const ShowAllApiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All APIs'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                "Total number of APIs: ${dtApiMethodHolders.fold(0, (pre, element) => pre + element.methods.length)}"),
            const SizedBox(
              height: 10,
            ),
            for (var holder in dtApiMethodHolders) ...[
              const Divider(),
              Row(
                children: [
                  Expanded(
                      child: Text(holder.name,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(fontWeight: FontWeight.bold))),
                  Text(holder.methods.length.toString()),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              for (var method in holder.methods)
                InkWell(
                  onTap: () => showRunApiDialog(context, holder.name, method),
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    child: Text(method),
                  ),
                ),
            ],
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Clipboard.setData(ClipboardData(
                text: dtApiMethodHolders.map((h) {
              return "=====================\n"
                  "${h.name} (num of API: ${h.methods.length})\n"
                  "=====================\n"
                  "${h.methods.join("\n")}";
            }).join("\n\n")));
          },
          child: const Icon(Icons.copy_rounded)),
    );
  }

  void showRunApiDialog(
      BuildContext context, String className, String methodName) {
    final dtApiMethod = dtApiMethods["${className}_$methodName"];
    if (dtApiMethod == null) return;

    showDialog(
        context: context,
        builder: (context) => RunApiDialog(
              className: className,
              methodName: methodName,
              dtApiMethod: dtApiMethod,
            ));
  }
}

class RunApiDialog extends StatefulWidget {
  final String className;
  final String methodName;
  final DtApiMethod dtApiMethod;

  const RunApiDialog(
      {super.key,
      required this.className,
      required this.methodName,
      required this.dtApiMethod});

  @override
  State<StatefulWidget> createState() => _RunApiDialogState();
}

class _RunApiDialogState extends State<RunApiDialog> {
  late final List<dynamic> orderedParam =
      List.filled(widget.dtApiMethod.orderedParam.length, null);
  final Map<String, dynamic> namedParam = {};

  @override
  void initState() {
    super.initState();

    for (var (i, type) in widget.dtApiMethod.orderedParam.indexed) {
      orderedParam[i] =
          getDefaultValue(type, widget.dtApiMethod.orderedParamNames[i]);
    }

    for (var entry in widget.dtApiMethod.namedParam.entries) {
      namedParam[entry.key] = getDefaultValue(entry.value, entry.key);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog.fullscreen(
        child: Scaffold(
      appBar: AppBar(title: Text("${widget.className}\n${widget.methodName}")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: Scrollbar(
                  child: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    for (var (i, name)
                        in widget.dtApiMethod.orderedParamNames.indexed) ...[
                      getWidgetByType(
                        type: widget.dtApiMethod.orderedParam[i],
                        name: name,
                        getValue: () => orderedParam[i],
                        setValue: (v) => orderedParam[i] = v,
                      ),
                      const SizedBox(height: 20),
                    ],
                    for (var entry
                        in widget.dtApiMethod.namedParam.entries) ...[
                      getWidgetByType(
                        type: entry.value,
                        name: entry.key,
                        getValue: () => namedParam[entry.key],
                        setValue: (v) => namedParam[entry.key] = v,
                      ),
                      const SizedBox(height: 20),
                    ],
                  ],
                )),
          ))),
          const SizedBox(
            height: 10,
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Cancel"),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  FilledButton(
                    onPressed: () {
                      debugPrint("=" * 80);
                      debugPrint(
                          "Run for [${widget.className}] ${widget.methodName}");
                      debugPrint("orderedParam: $orderedParam");
                      debugPrint("namedParam: $namedParam");
                      debugPrint("=" * 80);

                      widget.dtApiMethod.run(orderedParam, namedParam);
                      Navigator.pop(context);
                    },
                    child: const Text("Run"),
                  )
                ],
              )),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    ));
  }

  dynamic getDefaultValue(String type, [String? name]) {
    if (type.startsWith("String")) {
      return "StringParam_$name";
    } else if (type.startsWith("AdTypeDart")) {
      return AdTypeDart.BANNER;
    } else if (type.startsWith("AdPlatformDart")) {
      return AdPlatformDart.ADMOB;
    } else if (type.startsWith("int")) {
      return 10;
    } else if (type.startsWith("bool")) {
      return true;
    } else if (type.startsWith("AdMediationDart")) {
      return AdMediationDart.MAX;
    } else if (type.startsWith("Map<String, Object?>")) {
      return {"TestMap": "123abc", "Key2": 222, "name": name};
    } else if (type.startsWith("List<String>")) {
      return ["TestProp", "Sword", "helicopter", name ?? "name"];
    } else if (type.startsWith("double")) {
      return 1.2;
    } else if (type.startsWith("DTLogLevel")) {
      return DTLogLevel.DEBUG;
    } else {
      return null;
    }
  }

  Widget getWidgetByType({
    required String type,
    required String name,
    required dynamic Function() getValue,
    required void Function(dynamic) setValue,
  }) {
    final labelStyle = Theme.of(context)
        .textTheme
        .labelLarge
        ?.copyWith(color: Theme.of(context).colorScheme.primary);

    if (type.startsWith("String")) {
      final controller = TextEditingController(text: getValue().toString());
      return TextField(
        controller: controller,
        decoration: InputDecoration(
            labelText: name,
            labelStyle: labelStyle,
            border: const OutlineInputBorder()),
        onChanged: (str) => setValue(str),
      );
    } else if (type.startsWith("AdTypeDart")) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name, style: labelStyle),
          SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (var adTypeDart in AdTypeDart.values) ...[
                    ChoiceChip(
                      label: Text(adTypeDart.name),
                      selected: adTypeDart == getValue(),
                      onSelected: (selected) => selected
                          ? setState(() => setValue(adTypeDart))
                          : null,
                      selectedColor:
                          Theme.of(context).colorScheme.primaryContainer,
                    ),
                    const SizedBox(
                      width: 5,
                    )
                  ]
                ],
              ))
        ],
      );
    } else if (type.startsWith("AdPlatformDart")) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name, style: labelStyle),
          SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (var adPlatformDart in AdPlatformDart.values) ...[
                    ChoiceChip(
                      label: Text(adPlatformDart.name),
                      selected: adPlatformDart == getValue(),
                      onSelected: (selected) => selected
                          ? setState(() => setValue(adPlatformDart))
                          : null,
                      selectedColor:
                          Theme.of(context).colorScheme.primaryContainer,
                    ),
                    const SizedBox(
                      width: 5,
                    )
                  ]
                ],
              ))
        ],
      );
    } else if (type.startsWith("int")) {
      final controller = TextEditingController(text: getValue().toString());
      return TextField(
        controller: controller,
        decoration: InputDecoration(
            labelText: name,
            labelStyle: labelStyle,
            border: const OutlineInputBorder(),
            helperText: "Integer Number"),
        onChanged: (str) => setValue(int.tryParse(str) ?? 10),
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      );
    } else if (type.startsWith("bool")) {
      return Row(
        children: [
          Checkbox(
              value: getValue(), onChanged: (v) => setState(() => setValue(v))),
          const SizedBox(
            width: 10,
          ),
          Text(name)
        ],
      );
    } else if (type.startsWith("AdMediationDart")) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name, style: labelStyle),
          SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (var adMediationDart in AdMediationDart.values) ...[
                    ChoiceChip(
                      label: Text(adMediationDart.name),
                      selected: adMediationDart == getValue(),
                      onSelected: (selected) => selected
                          ? setState(() => setValue(adMediationDart))
                          : null,
                      selectedColor:
                          Theme.of(context).colorScheme.primaryContainer,
                    ),
                    const SizedBox(
                      width: 5,
                    )
                  ]
                ],
              ))
        ],
      );
    } else if (type.startsWith("Map<String, Object?>") && !type.contains("Function")) {
      final controller = TextEditingController(text: jsonEncode(getValue()));
      return TextField(
        controller: controller,
        decoration: InputDecoration(
            labelText: name,
            labelStyle: labelStyle,
            border: const OutlineInputBorder(),
            helperText: "Json: {\"name\": \"viper\", \"age\": 18}"),
        onChanged: (str) => setValue(jsonDecode(str)),
      );
    } else if (type.startsWith("List<String>")) {
      final controller = TextEditingController(text: jsonEncode(getValue()));
      return TextField(
        controller: controller,
        decoration: InputDecoration(
            labelText: name,
            labelStyle: labelStyle,
            border: const OutlineInputBorder(),
            helperText: "String List: [\"a\", \"b\"]"),
        onChanged: (str) => setValue(jsonDecode(str)),
      );
    } else if (type.startsWith("double")) {
      final controller = TextEditingController(text: getValue().toString());
      return TextField(
        controller: controller,
        decoration: InputDecoration(
            labelText: name,
            labelStyle: labelStyle,
            border: const OutlineInputBorder(),
            helperText: "Double Number, e.g. 1, 2.3, 0.4, .5"),
        onChanged: (str) {
          final d = double.tryParse(str);
          if (d != null) setValue(d);
        },
        keyboardType: const TextInputType.numberWithOptions(signed: true),
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r"^[0-9]*(\.[0-9]*)?$")),
        ],
        buildCounter: (_,
                {required currentLength, required isFocused, maxLength}) =>
            Text(getValue().toString()),
      );
    } else if (type.startsWith("DTLogLevel")) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name, style: labelStyle),
          SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (var logLevel in DTLogLevel.values) ...[
                    ChoiceChip(
                      label: Text(logLevel.name),
                      selected: logLevel == getValue(),
                      onSelected: (selected) => selected
                          ? setState(() => setValue(logLevel))
                          : null,
                      selectedColor:
                      Theme.of(context).colorScheme.primaryContainer,
                    ),
                    const SizedBox(
                      width: 5,
                    )
                  ]
                ],
              ))
        ],
      );
    } else {
      return Text("'$type' is not implemented",
          style: const TextStyle(
              color: Colors.redAccent, fontWeight: FontWeight.bold));
    }
  }
}
