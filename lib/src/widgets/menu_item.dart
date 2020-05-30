import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:provider/provider.dart';
import 'package:shelters/index.dart';

class MenuItem extends StatelessWidget {
  MenuItem({
    this.icon,
    this.title,
  });

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationProvider>(
      builder: (context, navState, snapshot) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 14),
          child: GestureDetector(
            child: Row(
              children: [
                if(icon != null)
                  Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: Icon(icon, 
                      color: navState.activeTitle == title 
                      ? Colors.white 
                      : Color(0xff83b1af)
                    ),
                  ),
                Text(FlutterI18n.translate(context, title ?? ''), 
                  style: TextStyle(
                    fontSize: 18, 
                    color: navState.activeTitle == title 
                    ? Colors.white 
                    : Color(0xff83b1af)
                  )
                )
              ],
            ),
            onTap: () => Provider.of<NavigationProvider>(context, listen: false).openScreen(title),
          ),
        );
      }
    );
  }
}