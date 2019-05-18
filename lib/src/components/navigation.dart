import 'package:flutter/material.dart';

class NavigationSh extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Find your animal'),
      ),
      body: Center(
        child: Text(
          'Shelters',
          style: Theme.of(context).textTheme.display1,
        ),
      ),
    );
  }
}
