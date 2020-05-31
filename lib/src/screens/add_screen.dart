import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
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

  List<Asset> images = List<Asset>();

  @override
  Widget build(BuildContext context) {  
    Future<void> loadAssets() async {
    setState(() {
      images = List<Asset>();
    });

    List<Asset> resultList;

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 5,
      );
    } on Exception catch (e) {
      print(e);
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      images = resultList;
      // if (error == null) _error = 'No Error Dectected';
    });
  }
    
    final int _currentAge = int.parse(_ageController.text.isEmpty ? '0' : _ageController.text);
    String _currentSelectedDateType = timeago.RuMessages().days(_currentAge).split(' ')[1];

    final List<String> _dateTypes = <String>[
      timeago.RuMessages().days(_currentAge).split(' ')[1],
      timeago.RuMessages().months(_currentAge).split(' ')[1],
      timeago.RuMessages().years(_currentAge).split(' ')[1],
    ];

    print(images);
    
    return SheltersScaffold(
      appBar: SheltersAppBar(
        leading: IconButton(
          icon: const Icon(SheltersIcon.menu),
          onPressed: () => Get.back(),
        ),
        title: 'Add pet',
      ),
      padding: EdgeInsets.symmetric(vertical: 8),
      bodyList: [
        Container(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            padding: EdgeInsets.symmetric(horizontal: 8),
            itemBuilder: (context, index) {
              return GestureDetector(
                child: Container(
                  margin: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8)
                  ),
                  width: 92,
                  child: Icon(
                    MdiIcons.plus,
                    color: Colors.grey,
                    size: 30,
                  ),
                ),
                onTap: loadAssets,
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
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
          ),
        ),
      ],
    );
  }
}