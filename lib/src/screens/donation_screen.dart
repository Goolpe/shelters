import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shelters/index.dart';

class DonationScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SheltersScaffold(
      appBar: SheltersAppBar(
        leading: IconButton(
          icon: const Icon(SheltersIcon.menu),
          onPressed: () => Get.back(),
        ),
        title: 'Donation'
      ),
      bodyList: <Widget>[
      ],
    );
  }
}