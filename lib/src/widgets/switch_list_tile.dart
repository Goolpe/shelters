import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SheltersSwitchListTile extends StatelessWidget {
  SheltersSwitchListTile({
    this.title = '',
    @required this.value,
    @required this.onChanged
  });

  final String title;
  final bool value;
  final Function(bool) onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(fontSize: 18),),
          CupertinoSwitch(
            trackColor: Theme.of(context).primaryColor,
            activeColor: Theme.of(context).primaryColor,
            value: value,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}