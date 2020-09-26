import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_i18n/flutter_i18n.dart';

class SheltersTextfield extends StatelessWidget {
  const SheltersTextfield({
    this.label,
    this.maxLines,
    this.maxLength,
    this.keyboardType,
    this.inputFormatters,
    this.controller,
    this.onChanged,
  });

  final String label;
  final int maxLines;
  final int maxLength;
  final TextInputType keyboardType;
  final List<TextInputFormatter> inputFormatters;
  final TextEditingController controller;
  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        maxLength: maxLength ?? 30,
        maxLines: maxLines ?? 1,
        buildCounter: (
          BuildContext context, 
          { int currentLength, int maxLength, bool isFocused }
        ) => null,
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          alignLabelWithHint: maxLines == null ? false : maxLines > 1,
          labelText: FlutterI18n.translate(context, label ?? ''),
          labelStyle: TextStyle(fontSize: 18, color: Theme.of(context).textTheme.caption.color),
          fillColor: Theme.of(context).cardColor,
          filled: true,
        ),
        style: const TextStyle(fontSize: 18),
        textCapitalization: TextCapitalization.sentences,
        keyboardType: keyboardType ?? TextInputType.text,
        inputFormatters: inputFormatters
      ),
    );
  }
}
