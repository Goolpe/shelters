import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shelters/index.dart';
import 'package:timeago/timeago.dart' as timeago;

class AnimalScreen extends StatefulWidget {
  AnimalScreen({
    @required this.tag,
    @required this.data
  }) : assert(data != null);

  final String tag;
  final Animal data;

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
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.zero,
            children: [
              Stack(
                children: [
                  SheltersAnimalImage(
                    tag: widget.tag,
                    images: widget.data.images
                  ),
                  Positioned(
                    bottom: 24,
                    left: 16,
                    right: 16,
                    child: ShowUp(
                      delay: 300,
                      child: Text(widget.data.name, 
                        style: TextStyle(
                          color: Colors.white, 
                          fontSize: 32
                        )
                      )
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                     ShowUp(
                      delay: 400,
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Wrap(
                          spacing: 10.0,
                          children: [
                            _sheltersChip(
                              avatar: MdiIcons.paw,
                              label: widget.data.genus
                            ),
                            _sheltersChip(
                              avatar: widget.data.gender == 'Female' 
                              ? MdiIcons.genderFemale : MdiIcons.genderMale,
                              label: widget.data.gender
                            ),
                            _sheltersChip(
                              avatar: MdiIcons.cakeVariant,
                              label: timeago.format(widget.data.age)
                            ),
                            _sheltersChip(
                              avatar: MdiIcons.ruler,
                              label: '${widget.data.height} cm'
                            ),
                            _sheltersChip(
                              avatar: MdiIcons.weight,
                              label: '${widget.data.weight} kg'
                            ),
                            _sheltersChip(
                              avatar: MdiIcons.tagHeart,
                              label: widget.data.breed
                            ),
                          ],
                        )
                      )
                    ),
                    ShowUp(
                      delay: 500,
                      child: SheltersMenuItem(
                        id: 0,
                        contentPadding: EdgeInsets.symmetric(horizontal: 8),
                        leading: CircleAvatar(
                          radius: 18,
                          backgroundColor: Theme.of(context).accentColor,
                          child: Icon(MdiIcons.camera, size: 18, color: Colors.white)
                        ),
                        textColor: Colors.black,
                        icon: MdiIcons.faceProfile,
                        title: 'Arthur Khabirov',
                        subtitle: 'owner',
                        onTap: () => Get.to(ProfileScreen())
                      ),
                    ),
                    // if(widget.data.comment != null && widget.data.comment.isNotEmpty)
                      ShowUp(
                      delay: 600,
                      child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text('lol '*10),
                        ),
                      ),
                    ShowUp(
                      delay: 600,
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

  Widget _sheltersChip({
    IconData avatar,
    String label
  }){
      return label == null || label.isEmpty
      ? SizedBox()
      : Chip(
        labelPadding: EdgeInsets.all(2),
        avatar: Icon(avatar, color: Colors.grey[800],),
        label: Text(label)
      );
  }
}