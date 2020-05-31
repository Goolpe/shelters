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
      builder: (BuildContext context, SettingsProvider settingsState, Widget snapshot) {
        return SheltersScaffold(
          appBar: SheltersAppBar(
            leading: IconButton(
              icon: const Icon(SheltersIcon.menu),
              onPressed: () => Get.back(),
            ),
            title: 'Settings'
          ),
          bodyList: <Widget>[
            ListTile(
              title: Text(FlutterI18n.translate(context, 'Dark Theme')),
              trailing: CupertinoSwitch(
                trackColor: Theme.of(context).primaryColor,
                activeColor: Theme.of(context).primaryColor,
                value: true,
                onChanged: (bool val){},
              ),
            ),
            ListTile(
              title: Text(FlutterI18n.translate(context, 'Notifications')),
              trailing: CupertinoSwitch(
                trackColor: Theme.of(context).primaryColor,
                activeColor: Theme.of(context).primaryColor,
                value: true,
                onChanged: (bool val){},
              ),
            ),
            ListTile(
              title: Text(FlutterI18n.translate(context, 'Language')),
              trailing: Container(
                width: 90,
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
              title: Text(FlutterI18n.translate(context, 'About App')),
              onTap: () => Get.to<Widget>(AboutAppScreen(), transition: Transition.cupertino),
            ),
            ListTile(
              title: Text(FlutterI18n.translate(context, 'Comments & Suggestions')),
              onTap: () => Get.to<Widget>(ReviewScreen(), transition: Transition.cupertino),
            ),
          ],
        );
      }
    );
  }
}