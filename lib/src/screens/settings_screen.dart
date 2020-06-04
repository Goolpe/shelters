import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shelters/index.dart';

class SettingsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Future.microtask((){
      Provider.of<SettingsProvider>(context, listen: false).init(context);
    });

    return Consumer<SettingsProvider>(
      builder: (BuildContext context, SettingsProvider settingsState, Widget snapshot) {
        return SheltersScaffold(
          appBar: SheltersAppBar(
            leadingIcon: SheltersIcon.menu,
            title: 'Settings'
          ),
          padding: EdgeInsets.zero,
          bodyList: <Widget>[
            Consumer<ThemeProvider>(
              builder: (context, themeState, snapshot) {
                return ListTile(
                  title: Text(FlutterI18n.translate(context, 'Dark Theme')),
                  trailing: CupertinoSwitch(
                    trackColor: Theme.of(context).primaryColor,
                    activeColor: Theme.of(context).primaryColor,
                    value: themeState.darkTheme,
                    onChanged: (bool val) => 
                      Provider.of<ThemeProvider>(context, listen: false).changeTheme(context),
                  ),
                  onTap: () => 
                  Provider.of<ThemeProvider>(context, listen: false).changeTheme(context),
                );
              }
            ),
            // ListTile(
            //   title: Text(FlutterI18n.translate(context, 'Notifications')),
            //   trailing: CupertinoSwitch(
            //     trackColor: Theme.of(context).primaryColor,
            //     activeColor: Theme.of(context).primaryColor,
            //     value: true,
            //     onChanged: (bool val){},
            //   ),
            // ),
            ListTile(
              title: Text(FlutterI18n.translate(context, 'Language')),
              trailing: Text(settingsState.currentLang.language ?? '', style: TextStyle(fontSize: 16)),
              onTap: (){
                showCupertinoModalPopup(
                  context: context,
                  builder: (BuildContext context){
                    return CupertinoActionSheet(
                      actions: settingsState.languages.map((SheltersLocale value){
                        return CupertinoActionSheetAction(
                          child: Text(FlutterI18n.translate(context, value.language)),
                          onPressed: () =>
                            Provider.of<SettingsProvider>(context, listen: false).changeLanguage(value, context)
                        );
                      }).toList(),
                      cancelButton: CupertinoActionSheetAction(
                        child: Text(FlutterI18n.translate(context, 'Cancel')),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      )
                    );
                  }
                );
              },
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