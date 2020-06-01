import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shelters/index.dart';


class AddPetScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {  
  //   Future<void> loadAssets() async {
  //   setState(() {
  //     images = List<Asset>();
  //   });

  //   List<Asset> resultList;

  //   try {
  //     resultList = await MultiImagePicker.pickImages(
  //       maxImages: 5,
  //     );
  //   } on Exception catch (e) {
  //     print(e);
  //   }

  //   // If the widget was removed from the tree while the asynchronous platform
  //   // message was in flight, we want to discard the reply rather than calling
  //   // setState to update our non-existent appearance.
  //   if (!mounted) return;

  //   setState(() {
  //     images = resultList;
  //     // if (error == null) _error = 'No Error Dectected';
  //   });
  // }
    
    return Consumer<AddPetProvider>(
      builder: (context, addPetState, snapshot) {
        return SheltersScaffold(
          appBar: SheltersAppBar(
            leadingIcon: SheltersIcon.menu,
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
                    // onTap: loadAssets,
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
                            Provider.of<AddPetProvider>(context, listen: false).changeName(value);
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
                                Provider.of<AddPetProvider>(context, listen: false).changeGender(value),
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
                                Provider.of<AddPetProvider>(context, listen: false).changeGenus(value),
                            );
                          }).toList()
                        )
                      ),
                      Expanded(
                        child: SheltersBottomSheet(
                          active: addPetState.birthday != null,
                          value: addPetState.age,
                          title: 'Age',
                          datePicker: SheltersDatePicker(
                            initialDateTime: addPetState.birthday ?? DateTime.now(),
                            onDone: () => 
                              Provider.of<AddPetProvider>(context, listen: false).changeDate(),
                            onDateTimeChanged: (DateTime value) =>
                              Provider.of<AddPetProvider>(context, listen: false).changeTempDate(value),
                          ),
                        )
                      ),
                    ],
                  ),
                  SheltersTextfield(
                    label: 'Breed',
                    controller: addPetState.breedController,
                    maxLength: 50,
                    onChanged: (String value){
                      Provider.of<AddPetProvider>(context, listen: false).changeBreed(value);
                    },
                  ),
                  SheltersTextfield(
                    keyboardType: TextInputType.multiline,
                    controller: addPetState.commentController,
                    label: 'Comment',
                    maxLines: 5,
                    maxLength: 500,
                    onChanged: (String value){
                      Provider.of<AddPetProvider>(context, listen: false).changeComment(value);
                    },
                  ),
                  SheltersButton(
                    title: 'Done',
                    onPressed: (){
                      Provider.of<AddPetProvider>(context, listen: false).createPet();
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