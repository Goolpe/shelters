import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:shelters/index.dart';

class AnimalScreen extends StatefulWidget {
  AnimalScreen({
    this.index
  });

  final int index;

  @override
  _AnimalScreenState createState() => _AnimalScreenState();
}

class _AnimalScreenState extends State<AnimalScreen> {

  final _carouselController = CarouselController();

  final List<String> _images = [
    'https://news.cgtn.com/news/77416a4e3145544d326b544d354d444d3355444f31457a6333566d54/img/37d598e5a04344da81c76621ba273915/37d598e5a04344da81c76621ba273915.jpg',
    'https://www.interfax.ru/ftproot/textphotos/2019/05/17/700gc.jpg'
  ];

  int _index = 0;

  @override
  Widget build(BuildContext context) {

    return SheltersScaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Stack(
            children: [
              Column(
                children: [
                  Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Hero(
                        tag: 'animal_image_${widget.index}',
                        child: Container(
                          height: 400,
                          child: CarouselSlider(
                            options: CarouselOptions(
                              viewportFraction: 1,
                              height: 400.0,
                              onPageChanged: (int i, CarouselPageChangedReason _){
                                setState(() => _index = i);
                              }
                            ),
                            carouselController: _carouselController,
                            items: _images.map((i) {
                              return Stack(
                                children: [
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height,
                                    child: CachedNetworkImage(
                                      imageUrl: i,
                                      fit: BoxFit.cover
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.topCenter,
                                        colors: [
                                          Colors.transparent,
                                          Colors.black45,
                                        ]
                                      ),
                                    ),
                                  )
                                ],
                              );
                            }).toList(),
                          ),
                        )
                      ),
                      Positioned.fill(
                        top: 40,
                        left: 16,
                        right: 16,
                        child: ShowUp(
                          delay: 100,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                child: Icon(MdiIcons.arrowLeft, size: 30, color: Colors.white,),
                                onTap: () => Get.back(),
                              ),
                              GestureDetector(
                                child: Icon(MdiIcons.share, size: 30, color: Colors.white),
                                onTap: () => Get.back(),
                              )
                            ],
                          )
                        ),
                      )
                    ],
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
                      borderRadius: BorderRadius.circular(32),
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
                              children: List.generate(_images.length, (index){
                                return Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 2),
                                  child: CircleAvatar(
                                    radius: 4,
                                    backgroundColor: index == _index ? Colors.blue : Colors.grey[300],
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
            child: Container(
              padding: EdgeInsets.all(24),
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
              padding: EdgeInsets.all(24),
              child: Row(
                children: [
                  Expanded(
                    child: ButtonTheme(
                      height: 50,
                      child: FlatButton(
                        color: Color(0xff306060),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)
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
                      borderSide: BorderSide(color: Color(0xff306060)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)
                      ),
                      child: Icon(MdiIcons.heartOutline, color: Color(0xff306060)),
                      onPressed: (){},
                    ),
                  ),
                ],
              )
            )
          )
        ],
      )
    );
  }
}