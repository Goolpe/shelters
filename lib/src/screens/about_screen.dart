import 'package:flutter/material.dart';
import 'package:shelters/index.dart';

class AboutAppScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {   
    return SheltersScaffold(
      appBar: SheltersAppBar(
        title: 'About App',
      ),
      body: Container(
        alignment: Alignment.center,
      ),
    );
  }
}