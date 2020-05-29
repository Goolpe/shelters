import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shelters/index.dart';

class SheltersHeader extends StatelessWidget {
  SheltersHeader({
    // this.isTwoLine = true,
    this.title = '',
    this.trailing
  });

  // final bool isTwoLine;
  final String title;
  final Widget trailing;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: GestureDetector(
                  child: SvgPicture.asset(
                    'assets/menu.svg',
                    color: Colors.grey[600],
                    height: 25,
                  ),
                  onTap: () => Provider.of<NavigationProvider>(context, listen: false).openScreen('Menu'),
                ),
              ),
              Text(title, style: TextStyle(fontSize: 18),),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: trailing ?? SizedBox()
          ) 
        ],
      ),
    );
  }
}