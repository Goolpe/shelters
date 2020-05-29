import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
      builder: (context, value, snapshot) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 14),
          child: GestureDetector(
            child: Row(
              children: [
                if(icon != null)
                  Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: Icon(icon, color: value.title == title ? Colors.white : Color(0xff83b1af)),
                  ),
                Text(title, style: TextStyle(fontSize: 18, color: value.title == title ? Colors.white : Color(0xff83b1af)))
              ],
            ),
            onTap: () => Provider.of<NavigationProvider>(context, listen: false).openScreen(title),
          ),
        );
      }
    );
  }
}