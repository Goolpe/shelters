import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:get/get.dart';
import 'package:shelters/index.dart';
import 'package:timeago/timeago.dart' as timeago;

class AddScreen extends StatefulWidget {

  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {

  final TextEditingController _ageController = TextEditingController();

  bool _gender = false;
  String _currentSelectedPet = 'Cats';

  final List<String> _pets = <String>[
    'Cats',
    'Dogs',
    'Birds',
    'Other',
  ];

  @override
  Widget build(BuildContext context) {    
    final int _currentAge = int.parse(_ageController.text.isEmpty ? '0' : _ageController.text);
    String _currentSelectedDateType = timeago.RuMessages().days(_currentAge).split(' ')[1];

    final List<String> _dateTypes = <String>[
      timeago.RuMessages().days(_currentAge).split(' ')[1],
      timeago.RuMessages().months(_currentAge).split(' ')[1],
      timeago.RuMessages().years(_currentAge).split(' ')[1],
    ];
    
    return SheltersScaffold(
      appBar: SheltersAppBar(
        leading: IconButton(
          icon: const Icon(SheltersIcon.menu),
          onPressed: () => Get.back(),
        ),
        title: 'Add pet',
      ),
      bodyList: [
        Row(
          children: <Widget>[
            Expanded(
              child: SheltersTextfield(
                label: 'Name',
              )
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16)
                ),
                margin: const EdgeInsets.all(8),
                child: ListTile(
                  title: Text(FlutterI18n.translate(context, _gender ? 'Male' : 'Female'), 
                    style: const TextStyle(fontSize: 18)),
                  trailing: CupertinoSwitch(
                    trackColor: Theme.of(context).primaryColor,
                    activeColor: Theme.of(context).primaryColor,
                    value: _gender,
                    onChanged: (bool value) {
                      setState(() => _gender = value);
                    },
                  ),
                ),
              )
            )
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: FormField<String>(
                  builder: (FormFieldState<String> state) {
                    return InputDecorator(
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(
                            Radius.circular(16),
                          ),
                        ),
                        labelText: FlutterI18n.translate(context, 'Genus'),
                        labelStyle: const TextStyle(fontSize: 18),
                        fillColor: Colors.white,
                        filled: true,
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: _currentSelectedPet,
                          isDense: true,
                          onChanged: (String newValue) {
                            setState(() {
                              _currentSelectedPet = newValue;
                              state.didChange(newValue);
                            });
                          },
                          items: _pets.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(FlutterI18n.translate(context, value)),
                            );
                          }).toList(),
                        ),
                      ),
                    );
                  },
                )
              ),
            ),
            Expanded(
              child: SheltersTextfield(
                maxLength: 2,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                    WhitelistingTextInputFormatter(RegExp("^[1-9][0-9]*\$")),
                ],
                label: 'Age',
                controller: _ageController,
                onChanged: (String value){
                  setState(() {
                    _currentSelectedDateType = timeago.RuMessages().days(int.parse(value)).split(' ')[1];
                  });
                },
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: FormField<String>(
                  builder: (FormFieldState<String> state) {
                    return InputDecorator(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(
                            Radius.circular(16)
                          )
                        ),
                        fillColor: Colors.white,
                        filled: true,
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: _currentSelectedDateType,
                          isDense: true,
                          onChanged: (String newValue) {
                            setState(() {
                              _currentSelectedDateType = newValue;
                              state.didChange(newValue);
                            });
                          },
                          items: _dateTypes.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    );
                  },
                ),
              )
            ),
          ],
        ),
        SheltersTextfield(
          label: 'Breed',
        ),
        SheltersTextfield(
          maxLines: 10,
          label: 'Comment',
        ),
        SheltersButton(
          title: 'Done'
        )
      ],
    );
  }
}