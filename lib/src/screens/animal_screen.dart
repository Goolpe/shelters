import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shelters/index.dart';

class AnimalScreen extends StatefulWidget {
  AnimalScreen({
    @required this.tag
  });

  final String tag;

  @override
  _AnimalScreenState createState() => _AnimalScreenState();
}

class _AnimalScreenState extends State<AnimalScreen> {

  @override
  void initState() {
    Future.microtask((){
      Provider.of<CarouselProvider>(context, listen: false).changeIndex(0);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Consumer<CarouselProvider>(
        builder: (context, carouselState, snapshot) {
          return ListView(
            padding: EdgeInsets.zero,
            children: [
              Stack(
                children: [
                  SheltersAnimalImage(
                    tag: widget.tag,
                  ),
                  Positioned(
                    bottom: 0,
                    left: 16,
                    right: 16,
                    child: ShowUp(
                      delay: 400,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(32)
                          ),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 1,
                              blurRadius: 30,
                              offset: Offset(0, 25),
                            ),
                          ]
                        ),
                        height: 140,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 8,
                                margin: EdgeInsets.only(bottom: 6),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: List.generate(carouselState.images.length, (index){
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 2),
                                      child: CircleAvatar(
                                        radius: 4,
                                        backgroundColor: index == carouselState.index 
                                        ? Colors.blue : Colors.grey[300],
                                      ),
                                    );
                                  }),
                                )
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Petrushka', style: Theme.of(context).textTheme.headline5,),
                                  Icon(MdiIcons.genderMale, color: Color(0xffb0b0b0)),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Abyssinian cat'),
                                    Text('2 years old', style: TextStyle(color: Colors.grey[500]),),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Row(
                                  children: [
                                    Icon(MdiIcons.mapMarker, size: 18),
                                    SizedBox(width: 5),
                                    Text('Distance: 3.6 km', style: TextStyle(fontSize: 16, color: Colors.grey[700]),),
                                  ],
                                )
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    ShowUp(
                      delay: 500,
                      child: Column(
                        children: [
                          SheltersMenuItem(
                            id: 0,
                            leading: CircleAvatar(
                              radius: 18,
                              backgroundColor: Theme.of(context).accentColor,
                              child: Icon(MdiIcons.camera, size: 18, color: Colors.white)
                            ),
                            textColor: Colors.black,
                            icon: MdiIcons.faceProfile,
                            title: 'Arthur Khabirov',
                            subtitle: 'active status',
                            onTap: () => Get.to(ProfileScreen())
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                            child: Text('Hello my name is Kira, London is the Capital of Great Britain'),
                          ),
                        ],
                      )
                    ),
                    ShowUp(
                      delay: 700,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xfff6f6f6),
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(32)
                          )
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: SheltersButton(
                                title: 'Pets',
                              ),
                            ),
                            SheltersOutlineButton(
                              icon: MdiIcons.heartOutline,
                            ),
                          ],
                        )
                      )
                    )
                  ],
                ),
              ),
            ],
          );
        }
      )
    );
  }
}