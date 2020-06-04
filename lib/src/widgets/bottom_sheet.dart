import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:get/get.dart';

class SheltersDatePicker{
  SheltersDatePicker({
    this.onDone,
    this.onDateTimeChanged,
    this.initialDateTime
  });

  final Function() onDone;
  final Function(DateTime) onDateTimeChanged;
  final DateTime initialDateTime;
}

class SheltersBottomSheet extends StatelessWidget {
  SheltersBottomSheet({
    this.active = false,
    this.title,
    this.value,
    this.actions,
    this.datePicker
  }) : assert(active != null);

  final bool active;
  final String title;
  final String value;
  final List<Widget> actions;
  final SheltersDatePicker datePicker;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(4),
      child: GestureDetector(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(16)
              ),
              margin: const EdgeInsets.all(4),
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 12),
              child: Text(FlutterI18n.translate(context, value ?? ''), 
                style: TextStyle(fontSize: 18, 
                  color: active 
                  ? Theme.of(context).textTheme.button.color
                  : Theme.of(context).textTheme.caption.color)
              )
            ),
            if(active)
              Positioned(
                left: 16,
                child: Text(FlutterI18n.translate(context, title ?? ''),
                  style: TextStyle(color: Theme.of(context).textTheme.caption.color)),
              )
          ],
        ),
        onTap: (){
          FocusScope.of(context).unfocus();
          datePicker != null
          ? showModalBottomSheet(
            context: context,
            builder: (BuildContext context){
              return Container(
                height: MediaQuery.of(context).copyWith().size.height / 2.5,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FlatButton(
                          textColor: Colors.blue,
                          child: Text(FlutterI18n.translate(context, 'Cancel'),
                           style: TextStyle(fontSize: 18)),
                          onPressed: () => Get.back(),
                        ),
                        FlatButton(
                          textColor: Colors.blue,
                          child: Text(FlutterI18n.translate(context, 'Done'),
                            style: TextStyle(fontSize: 18)),
                          onPressed: datePicker.onDone
                        )
                      ],
                    ),
                    Expanded(
                      child: Container(
                        color: const Color(0xfff6f6f6),
                        child: CupertinoDatePicker(
                          minimumDate: DateTime(DateTime.now().year - 100),
                          maximumDate: DateTime.now(),
                          mode: CupertinoDatePickerMode.date,
                          initialDateTime: datePicker.initialDateTime,
                          onDateTimeChanged: datePicker.onDateTimeChanged,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
          )
          : showCupertinoModalPopup(
            context: context,
            builder: (BuildContext context){
              return CupertinoActionSheet(
                actions: actions,
                cancelButton: CupertinoActionSheetAction(
                  child: Text(FlutterI18n.translate(context, 'Cancel')),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              );
            }
          );
        },
      ),
    );
  }
}