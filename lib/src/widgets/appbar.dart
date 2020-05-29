import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:shelters/index.dart';

class SheltersAppBar extends StatelessWidget {
  SheltersAppBar({
    this.title = '',
    this.trailing,
    this.leading
  });

  final String title;
  final Widget trailing;
  final Widget leading;

  @override
  Widget build(BuildContext context) {
    return leading != null
    ? _child(context)
    : WillPopScope(
      onWillPop: () => Provider.of<NavigationProvider>(context, listen: false).openScreen('Menu'),
      child: _child(context)
    );
  }

  Widget _child(BuildContext context){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              leading ?? Padding(
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
            padding: const EdgeInsets.only(right: 16),
            child: trailing ?? SizedBox()
          ) 
        ],
      ),
    );
  }
}