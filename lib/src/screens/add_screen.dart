import 'package:flutter/cupertino.dart';
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
        body: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            children: [
              SheltersHeader(
                title: 'Add pet',
              ),
              Expanded(
                child: Container(
                  color: Color(0xfff6f6f6),
                  child: ListView(
                    padding: EdgeInsets.all(16),
                    shrinkWrap: true,
                    children: [
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
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 80,
                                    child: Text(_gender ? 'Male' : 'Female', style: TextStyle(fontSize: 18))
                                  ),
                                  SizedBox(width: 10,),
                                  CupertinoSwitch(
                                    trackColor: Color(0xff416c6d),
                                    activeColor: Color(0xff416c6d),
                                    value: _gender,
                                    onChanged: (bool value) {
                                      setState(() => _gender = value);
                                    },
                                  ),
                                ],
                              ),
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
                            SizedBox(width: 10,),
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
                                      Radius.circular(16),
                                    ),
                                  ),
                                  labelText: 'Age',
                                  labelStyle: TextStyle(fontSize: 18),
                                  fillColor: Colors.white,
                                  filled: true,
                                ),
                              ),
                            ),
                            SizedBox(width: 10,),
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
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: ButtonTheme(
                          height: 50,
                          child: FlatButton(
                            color: Color(0xff306060),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)
                            ),
                            child: Text('Add', style: TextStyle(color: Colors.white),),
                            onPressed: (){},
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          )
        ),
      ),
    );
  }
}