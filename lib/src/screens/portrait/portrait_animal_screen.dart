import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shelters/index.dart';

class PortraitAnimalScreen extends StatelessWidget {
  PortraitAnimalScreen({
    @required this.id,
    this.scrollController
  });

  final int id;
  final ScrollController scrollController;

  Future<void> share() async {
    await FlutterShare.share(
      title: 'Look',
      text: 'I found a pet, do you like it?',
      linkUrl: 'https://goolpe.github.io/',
      chooserTitle: 'Pet'
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        constraints: BoxConstraints(minWidth: 100, maxWidth: 500),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
        ),
        margin: const EdgeInsets.all(16.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: ListView(
            controller: scrollController,
            padding: EdgeInsets.zero,
            children: _child(context)
          ),
        )
      )
    );
  }

  List<Widget> _child(BuildContext context){
    return [
      // SheltersAnimalImage(id: id),
      Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Wrap(
                spacing: 8,
                children: [
                    Chip(
                      avatar: Icon(MdiIcons.paw),
                      label: Text('Cat')
                    ),
                    Chip(
                      avatar: Icon(MdiIcons.genderMaleFemale),
                      label: Text('Male')
                    ),
                    Chip(
                      avatar: Icon(MdiIcons.certificate),
                      label: Text('Aegean')
                    ),
                    Chip(
                      avatar: Icon(MdiIcons.formatColorFill),
                      label: Text('Orange/Black')
                    ),
                    Chip(
                      avatar: Icon(MdiIcons.eye),
                      label: Text('Green')
                    ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text('Hi, tell me about yourself '*30, style: TextStyle(fontSize: 18),),
            ),
            Divider(),
            ListTile(
              contentPadding: const EdgeInsets.symmetric(vertical: 8),
              trailing: Icon(MdiIcons.mapSearch),
              title: Text('Saint-Petersburg, Nevskiy 467, shelter "Orlenok"', style: TextStyle(fontSize: 18),),
              onTap: () => Provider.of<PanelProvider>(context, listen: false).goToMap(),
            ),
            Container(
              height: 50,
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)
                ),
                color: Color(0xff5f27cd),
                textColor: Colors.white,
                child: Text('Share'),
                onPressed: share,
              ),
            ),
          ],
        ),
      )
    ];
  }
}