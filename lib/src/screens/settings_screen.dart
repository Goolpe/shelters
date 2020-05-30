import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shelters/index.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<SettingsProvider>(context, listen: false).init(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsProvider>(
      builder: (context, settingsState, snapshot) {
        return SheltersScaffold(
          appBar: SheltersAppBar(
            title: 'Settings'
          ),
          bodyList: [
            ListTile(
              title: Text(FlutterI18n.translate(context, 'Dark Theme'), style: TextStyle(fontSize: 18)),
              trailing: CupertinoSwitch(
                trackColor: Theme.of(context).primaryColor,
                activeColor: Theme.of(context).primaryColor,
                value: true,
                onChanged: (bool val){},
              ),
            ),
            ListTile(
              title: Text(FlutterI18n.translate(context, 'Notifications'), style: TextStyle(fontSize: 18)),
              trailing: CupertinoSwitch(
                trackColor: Theme.of(context).primaryColor,
                activeColor: Theme.of(context).primaryColor,
                value: true,
                onChanged: (bool val){},
              ),
            ),
            ListTile(
              title: Text(FlutterI18n.translate(context, 'Language'), style: TextStyle(fontSize: 18)),
              trailing: Container(
                width: 120,
                padding: EdgeInsets.all(16),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<SheltersLocale>(
                    value: settingsState.currentLang,
                    isDense: true,
                    onChanged: (SheltersLocale newValue) {
                      Provider.of<SettingsProvider>(context, listen: false).changeLanguage(newValue, context);
                    },
                    items: settingsState.languages.map((SheltersLocale value) {
                      return DropdownMenuItem<SheltersLocale>(
                        value: value,
                        child: Text(value.language),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
            ListTile(
              title: Text(FlutterI18n.translate(context, 'About App'), style: TextStyle(fontSize: 18)),
              onTap: () => Get.to(AboutAppScreen(), transition: Transition.cupertino),
            ),
            ListTile(
              title: Text(FlutterI18n.translate(context, 'Comments & Suggestions'), style: TextStyle(fontSize: 18)),
              onTap: () => Get.to(ReviewScreen(), transition: Transition.cupertino),
            ),
          ],
        );
      }
    );
  }
}