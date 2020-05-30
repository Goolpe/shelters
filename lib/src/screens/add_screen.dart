import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:shelters/index.dart';
import 'package:timeago/timeago.dart' as timeago;

class AddScreen extends StatefulWidget {

  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {

  TextEditingController _ageController = TextEditingController();

  bool _gender = false;
  String _currentSelectedPet = 'Cats';

  int _currentAge;
  String _currentSelectedDateType; 

  @override
  void initState() {
    _currentAge = int.parse(_ageController.text.isEmpty ? '0' : _ageController.text);
    _currentSelectedDateType = timeago.RuMessages().days(_currentAge).split(' ')[1];
    super.initState();
  }

  var _pets = [
    "Cats",
    "Dogs",
    "Birds",
    "Other",
  ];

  @override
  Widget build(BuildContext context) {    

    List<String> _dateTypes = [
      timeago.RuMessages().days(_currentAge).split(' ')[1],
      timeago.RuMessages().months(_currentAge).split(' ')[1],
      timeago.RuMessages().years(_currentAge).split(' ')[1],
    ];

    return SheltersScaffold(
      appBar: SheltersAppBar(
        title: 'Add pet',
        trailing: SheltersButton(
          title: 'Done',
        )
      ),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      bodyList: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            children: [
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
                  margin: EdgeInsets.only(left: 16),
                  child: ListTile(
                    title: Text(FlutterI18n.translate(context, _gender ? 'Male' : 'Female'), style: TextStyle(fontSize: 18)),
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
          )
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            children: [
              Expanded(
                child: FormField<String>(
                  builder: (FormFieldState<String> state) {
                    return InputDecorator(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(16),
                          ),
                        ),
                        labelText: FlutterI18n.translate(context, 'Genus'),
                        labelStyle: TextStyle(fontSize: 18),
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
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SheltersTextfield(
                    maxLength: 2,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                        WhitelistingTextInputFormatter(RegExp("^[1-9][0-9]*\$")),
                    ],
                    label: 'Age',
                    controller: _ageController,
                    onChanged: (value){
                      setState(() {
                        _currentSelectedDateType = timeago.RuMessages().days(int.parse(value)).split(' ')[1];
                      });
                    },
                  ),
                )
              ),
              Expanded(
                child: FormField<String>(
                  builder: (FormFieldState<String> state) {
                    return InputDecorator(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: const BorderRadius.all(
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
                )
              ),
            ],
          )
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: SheltersTextfield(
            label: 'Breed',
          )
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: SheltersTextfield(
            maxLines: 10,
            label: 'Comment',
          )
        ),
      ],
    );
  }
}