import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shelters/index.dart';

class AddScreen extends StatefulWidget {

  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  bool _gender = false;
  String _currentSelectedPet = 'Cat';
  String _currentSelectedDateType = 'Months';

  var _pets = [
    "Cat",
    "Dog",
    "Bird",
    "Other",
  ];

  var _dateTypes = [
    "Days",
    "Months",
    "Years",
  ];

  @override
  Widget build(BuildContext context) {    
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SheltersScaffold(
        appBar: SheltersAppBar(
          title: 'Add pet',
          trailing: ButtonTheme(
            height: 40,
            child: FlatButton(
              color: Theme.of(context).primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: const BorderRadius.all(
                  Radius.circular(16)
                )
              ),
              child: Text('Create', style: TextStyle(color: Colors.white),),
              onPressed: (){},
            ),
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        bodyList: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(16),
                        ),
                      ),
                      labelText: 'Name',
                      labelStyle: TextStyle(fontSize: 18),
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: SheltersSwitchListTile(
                      title: _gender ? 'Male' : 'Female',
                      value: _gender,
                      onChanged: (bool value) {
                        setState(() => _gender = value);
                      },
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
                  flex: 2,
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
                          labelText: 'Type',
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
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  flex: 1,
                  child: TextField(
                    maxLength: 2,
                    maxLines: 1,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                        WhitelistingTextInputFormatter.digitsOnly
                    ],
                    buildCounter: (BuildContext context, { int currentLength, int maxLength, bool isFocused }) => null,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(16)
                        )
                      ),
                      labelText: 'Age',
                      labelStyle: TextStyle(fontSize: 18),
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  flex: 2,
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
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(16),
                  ),
                ),
                labelText: 'Breed',
                labelStyle: TextStyle(fontSize: 18),
                fillColor: Colors.white,
                filled: true,
              ),
            )
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: TextField(
              maxLines: 10,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(16),
                  ),
                ),
                alignLabelWithHint: true,
                labelText: 'Comment',
                labelStyle: TextStyle(fontSize: 18),
                fillColor: Colors.white,
                filled: true,
              ),
            )
          ),
        ],
      )
    );
  }
}