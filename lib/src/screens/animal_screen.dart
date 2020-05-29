import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shelters/index.dart';

class AnimalScreen extends StatelessWidget {
  AnimalScreen({
    @required this.tag
  });

  final String tag;

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
                  Column(
                    children: [
                      SheltersAnimalImage(
                        tag: tag,
                      ),
                      const SizedBox(
                        height: 70
                      )
                    ],
                  ),
                  Positioned(
                    bottom: 0,
                    left: 24,
                    right: 24,
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
                                    AutoSizeText('Distance: 3.6 km', style: TextStyle(fontSize: 16, color: Colors.grey[700]),),
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
              ShowUp(
                delay: 500,
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 16),
                                child: CircleAvatar(
                                  radius: 20,
                                  backgroundColor: Colors.black,
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Kira Kolodinova', style: Theme.of(context).textTheme.headline6,),
                                  SizedBox(height: 5),
                                  Text('Owner', style: TextStyle(color: Colors.grey[700]),)
                                ],
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 6),
                            child: Text('May 22, 2020', style: TextStyle(color: Colors.grey[800])),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: Text('Hello my name is Kira, London is the Capital of Great Britain'),
                      ),
                    ],
                  ),
                )
              ),
              ShowUp(
                delay: 700,
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xfff6f6f6),
                    borderRadius: BorderRadius.vertical(top: Radius.circular(32))
                  ),
                  padding: const EdgeInsets.all(24),
                  child: Row(
                    children: [
                      Expanded(
                        child: ButtonTheme(
                          height: 50,
                          child: FlatButton(
                            color: Theme.of(context).accentColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(16)
                              )
                            ),
                            child: Text('Adoption', style: TextStyle(color: Colors.white),),
                            onPressed: (){},
                          ),
                        ),
                      ),
                      SizedBox(width: 24),
                      ButtonTheme(
                        height: 50,
                        minWidth: 50,
                        child: OutlineButton(
                          borderSide: BorderSide(color: Theme.of(context).accentColor),
                          shape: RoundedRectangleBorder(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(16)
                            )
                          ),
                          color: Theme.of(context).accentColor,
                          child: Icon(MdiIcons.heartOutline),
                          onPressed: (){},
                        ),
                      ),
                    ],
                  )
                )
              )
            ],
          );
        }
      )
    );
  }
}