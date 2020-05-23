import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shelters/index.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<PanelProvider>(
        builder: (context, value, snapshot) {
          return SlidingUpPanel(
            minHeight: 0,
            maxHeight: MediaQuery.of(context).size.height,
            backdropEnabled: true,
            renderPanelSheet: false,
            panelBuilder: (ScrollController sc) => AnimalScreen(id: value.id),
            controller: value.panelController,
            body: ListView(
              children: [
                AppBar(
                  centerTitle: true,
                  elevation: 0,
                  title: Text('Shelters', style: TextStyle(color: Colors.black)),
                  backgroundColor: Colors.transparent,
                ),
                GridView.count(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 3,
                  children: List.generate(100, (index) {
                    return Container(
                      margin: EdgeInsets.all(8),
                      child: SheltersHomeImage(id: index)
                    );
                  }),
                ),
              ],
            )
          );
        }
      )
    );
  }
}