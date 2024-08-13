import 'package:datatower_ai_core_example/ui/component/clickable_text.dart';
import 'package:flutter/material.dart';

class ClickSetText extends StatefulWidget {
  final String title;
  final String? Function(String? value) onConfirm;
  final void Function() onClear;

  const ClickSetText({
    super.key,
    required this.title,
    required this.onConfirm,
    required this.onClear,
  });

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<ClickSetText> {
  String? lastConfirmed;
  String? inputted;

  @override
  Widget build(BuildContext context) {
    return ClickableText(
        title: widget.title,
        initText: lastConfirmed ?? "Click to set",
        onClick: () {
          return showDialog<String?>(
              context: context,
              barrierDismissible: false,
              builder: (context) => AlertDialog(
                    title: Text(widget.title),
                    content: TextField(
                      controller: TextEditingController()
                        ..text = lastConfirmed ?? "",
                      onChanged: (str) => inputted = str,
                      autofocus: true,
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          inputted = null;
                          Navigator.pop(context, lastConfirmed);
                        },
                        child: const Text("Cancel"),
                      ),
                      TextButton(
                        onPressed: () {
                          inputted = null;
                          Navigator.pop(context, () {
                            widget.onClear();
                            return "";
                          });
                        },
                        child: const Text("Clear"),
                      ),
                      TextButton(
                        onPressed: () {
                          lastConfirmed = inputted;
                          Navigator.pop(
                              context, widget.onConfirm(lastConfirmed));
                        },
                        child: const Text("Set"),
                      )
                    ],
                  ));
        });
  }
}
