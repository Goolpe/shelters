import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:provider/provider.dart';

import 'package:shelters/index.dart';

class AddAnimalScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {  
    
    return Consumer<AddAnimalProvider>(
      builder: (context, addPetState, snapshot) {
        return SheltersScaffold(
          appBar: const SheltersAppBar(
            leadingIcon: SheltersIcon.menu,
            title: 'Add pet',
          ),
          padding: const EdgeInsets.symmetric(vertical: 8),
          bodyList: [
            Container(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    child: Stack(
                      children: [
                        Container(
                          margin: const EdgeInsets.all(8),
                          child: Container(
                            height: 120,
                            width: 100,
                            decoration: BoxDecoration(
                              color: Theme.of(context).cardColor,
                              borderRadius: BorderRadius.circular(8)
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: addPetState.images.length > index 
                              ? AssetThumb(
                                asset: addPetState.images[index],
                                width: 100,
                                height: 90,
                              )
                              : const Icon(
                                MdiIcons.plus,
                                color: Colors.grey,
                                size: 30,
                              )
                            ),
                          ),
                        ),
                        if(addPetState.images.length > index)
                        Positioned(
                          top: 0,
                          right: 0,
                          child: GestureDetector(
                            child: CircleAvatar(
                              radius: 16,
                              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                              child: const Icon(MdiIcons.close, color: Colors.red),
                            ),
                            onTap: () =>
                              Provider.of<AddAnimalProvider>(context, listen: false).removeImage(addPetState.images[index]),
                          ),
                        )
                      ]
                    ),
                    onTap: () => Provider.of<AddAnimalProvider>(context, listen: false).chooseImage(context),
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
                        flex: 2,
                        child: SheltersTextfield(
                          label: 'Name',
                          controller: addPetState.nameController,
                          onChanged: (String value){
                            Provider.of<AddAnimalProvider>(context, listen: false).changeName(value);
                          },
                        )
                      ),
                      Expanded(
                        child: SheltersBottomSheet(
                          active: addPetState.gender != 'Gender',
                          value: addPetState.gender,
                          title: 'Gender',
                          actions: addPetState.genders.map((String value){
                            return CupertinoActionSheetAction(
                              child: Text(FlutterI18n.translate(context, value)),
                              onPressed: () =>
                                Provider.of<AddAnimalProvider>(context, listen: false).changeGender(value, context),
                            );
                          }).toList()
                        )
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: SheltersBottomSheet(
                          active: addPetState.genus != 'Genus',
                          value: addPetState.genus,
                          title: 'Genus',
                          actions: addPetState.pets.map((String value){
                            return CupertinoActionSheetAction(
                              child: Text(FlutterI18n.translate(context, value)),
                              onPressed: () =>
                                Provider.of<AddAnimalProvider>(context, listen: false).changeGenus(value, context),
                            );
                          }).toList()
                        )
                      ),
                      Expanded(
                        child: SheltersTextfield(
                          label: 'Color',
                          controller: addPetState.colorController,
                          onChanged: (String value){
                            Provider.of<AddAnimalProvider>(context, listen: false).changeColor(value);
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: SheltersBottomSheet(
                          active: addPetState.birthday != null,
                          value: addPetState.age,
                          title: 'Age',
                          datePicker: SheltersDatePicker(
                            initialDateTime: addPetState.birthday ?? DateTime.now(),
                            onDone: () => 
                              Provider.of<AddAnimalProvider>(context, listen: false).changeDate(context),
                            onDateTimeChanged: (DateTime value) =>
                              Provider.of<AddAnimalProvider>(context, listen: false).changeTempDate(value),
                          ),
                        )
                      ),
                      Expanded(
                        child: SheltersTextfield(
                          maxLength: 3,
                          label: 'Height, cm',
                          keyboardType: TextInputType.number,
                          controller: addPetState.heightController,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp('^[1-9][0-9]*\$'))
                          ],
                          onChanged: (String value){
                            Provider.of<AddAnimalProvider>(context, listen: false).changeHeight(value);
                          },
                        ),
                      ),
                      Expanded(
                        child: SheltersTextfield(
                          maxLength: 2,
                          label: 'Weight, kg',
                          keyboardType: TextInputType.number,
                          controller: addPetState.weightController,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp('^[1-9][0-9]*\$'))
                          ],
                          onChanged: (String value){
                            Provider.of<AddAnimalProvider>(context, listen: false).changeWeight(value);
                          },
                        ),
                      ),
                    ],
                  ),
                  SheltersTextfield(
                    label: 'Breed',
                    controller: addPetState.breedController,
                    maxLength: 50,
                    onChanged: (String value){
                      Provider.of<AddAnimalProvider>(context, listen: false).changeBreed(value);
                    },
                  ),
                  SheltersTextfield(
                    keyboardType: TextInputType.multiline,
                    controller: addPetState.commentController,
                    label: 'Comment',
                    maxLines: 5,
                    maxLength: 500,
                    onChanged: (String value){
                      Provider.of<AddAnimalProvider>(context, listen: false).changeComment(value);
                    },
                  ),
                  SheltersButton(
                    title: 'Done',
                    onPressed: (){
                      Provider.of<AddAnimalProvider>(context, listen: false).createPet();
                    }
                  )
                ],
              ),
            ),
          ],
        );
      }
    );
  }
}
