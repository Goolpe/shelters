import 'package:flutter/material.dart';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'package:shelters/index.dart';

class AnimalScreen extends StatelessWidget {
  const AnimalScreen({
    @required this.tag,
    @required this.data
  }) : assert(data != null);

  final String tag;
  final Animal data;

  @override
  Widget build(BuildContext context) {
    Future.microtask((){
      Provider.of<CarouselProvider>(context, listen: false).changeIndex(0);
    });

    return Scaffold(
      body: Consumer<CarouselProvider>(
        builder: (context, carouselState, snapshot) {
          return ListView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.zero,
            children: [
              Stack(
                children: [
                  SheltersAnimalImage(
                    tag: tag,
                    images: data.images
                  ),
                  Positioned(
                    bottom: 24,
                    left: 16,
                    right: 16,
                    child: ShowUp(
                      delay: 300,
                      child: Text(data.name, 
                        style: const TextStyle(
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
                              avatar: data.gender == 'Female' 
                              ? MdiIcons.genderFemale : MdiIcons.genderMale,
                              label: data.gender
                            ),
                            _sheltersChip(
                              avatar: MdiIcons.cakeVariant,
                              label: timeago.format(data.age)
                            ),
                            _sheltersChip(
                              avatar: MdiIcons.ruler,
                              label: '${data.height} cm'
                            ),
                            _sheltersChip(
                              avatar: MdiIcons.weight,
                              label: '${data.weight} kg'
                            ),
                            _sheltersChip(
                              avatar: MdiIcons.tagHeart,
                              label: data.breed
                            ),
                          ],
                        )
                      )
                    ),
                    const ShowUp(
                      delay: 600,
                      child: ListTile(
                        title: Text('Saint-Petersburg'),
                        trailing: Icon(MdiIcons.mapMarker)
                      ),
                    ),
                    ShowUp(
                      delay: 500,
                      child: SheltersMenuItem(
                        id: 0,
                        contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                        leading: CircleAvatar(
                          radius: 18,
                          backgroundColor: Theme.of(context).accentColor,
                          child: const Icon(MdiIcons.camera, size: 18, color: Colors.white)
                        ),
                        textColor: Theme.of(context).textTheme.button.color,
                        icon: MdiIcons.faceProfile,
                        title: 'Ржевка',
                        subtitle: 'Shelter',
                        onTap: (){}
                      ),
                    ),
                    if(data.comment != null && data.comment.isNotEmpty)
                      ShowUp(
                      delay: 600,
                      child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(data.comment),
                        ),
                      ),
                    ShowUp(
                      delay: 600,
                      child: Row(
                        children: const [
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
    @required IconData avatar,
    @required String label
  })
  {
      return label == null || label.isEmpty
      ? const SizedBox.shrink()
      : Builder(
        builder: (context) {
          return Chip(
            backgroundColor: Theme.of(context).backgroundColor,
            labelPadding: const EdgeInsets.all(2),
            avatar: Icon(avatar),
            label: Text(label ?? '')
          );
        }
      );
  }
}
