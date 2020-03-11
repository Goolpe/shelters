import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shelters/shelf.dart';

class ProfileScreen extends StatelessWidget {
  final MaskTextInputFormatter maskFormatter = MaskTextInputFormatter(
    mask: '+# (###) ###-##-##', filter: { "#": RegExp(r'[0-9]') }
  );
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Consumer<AuthModel>(
        builder: (context, state, _){
          return ListView(
            children: <Widget>[
              Container(
                color: Theme.of(context).backgroundColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('ACCOUNT', style: Theme.of(context).textTheme.subtitle),
                              SizedBox(height: 10),
                              Text('Edit and manage your account details', style: Theme.of(context).textTheme.subtitle),
                            ]
                          ),
                          Stack(
                            children: <Widget>[
                              CircleAvatar(
                                radius: 30,
                                backgroundImage: CachedNetworkImageProvider(state.user.photoUrl),
                                backgroundColor: Colors.grey[200],
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: CircleAvatar(
                                  radius: 12,
                                  backgroundColor: Colors.white,
                                  child: Icon(
                                    MdiIcons.camera, color: Colors.black,
                                    size: 14,
                                  )
                                ),
                              ),
                              Positioned.fill(
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(28),
                                    onTap: (){},
                                  ),
                                ),
                              )
                            ]
                          ),
                        ]
                      )
                    ),
                    CustomListTile(
                      title: 'Name',
                      trailing: TextFormField(
                        onEditingComplete: () => FocusScope.of(context).nextFocus(),
                        textInputAction: TextInputAction.go,
                        textCapitalization: TextCapitalization.sentences,
                        decoration: InputDecoration.collapsed(hintText: ''),
                        initialValue: state.user.displayName,
                        style: Theme.of(context).textTheme.body1,
                        onChanged: (String value){
                          Provider.of<AuthModel>(context, listen: false).updateName(value);
                        },
                        inputFormatters:[
                          LengthLimitingTextInputFormatter(20),
                        ]
                      ),
                    ),
                    CustomListTile(
                      title: 'Email',
                      trailing: TextFormField(
                        onEditingComplete: () => FocusScope.of(context).nextFocus(),
                        textInputAction: TextInputAction.go,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration.collapsed(hintText: ''),
                        initialValue: 'admin@mail.com',
                        style: Theme.of(context).textTheme.body1,
                        onChanged: (String value){

                        },
                        inputFormatters:[
                          LengthLimitingTextInputFormatter(20),
                        ]
                      ),
                    ),
                    CustomListTile(
                      title: 'Phone',
                      trailing: TextFormField(
                        onEditingComplete: () => FocusScope.of(context).nextFocus(),
                        textInputAction: TextInputAction.go,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration.collapsed(hintText: ''),
                        initialValue: state.user.phoneNumber,
                        style: Theme.of(context).textTheme.body1,
                        onChanged: (String value){
                          
                        },
                        inputFormatters:[
                          maskFormatter
                        ]
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                color: Theme.of(context).backgroundColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      child: Column(
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Text('HELP & FEEDBACK', style: Theme.of(context).textTheme.subtitle),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.only(top: 10),
                            child: Text('We welcome your feedback!', style: Theme.of(context).textTheme.subtitle),
                          ),
                        ]
                      )
                    ),
                    CustomListTile(
                      icon: MdiIcons.emailOutline,
                      title: 'Contact Us',
                      trailing: Align(
                        alignment: Alignment.centerRight,
                        child: Icon(MdiIcons.chevronRight, color: Theme.of(context).textTheme.body1.color),
                      ),
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Scaffold())),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              CustomListTile(
                showDivider: false,
                icon: MdiIcons.brightness6,
                title: 'Theme',
                trailing: Align(
                  alignment: Alignment.centerRight,
                  child: Consumer<ThemeModel>(
                    builder: (context, state, _){
                      return CupertinoSwitch(
                        value: state.themeData == darkTheme,
                        onChanged: (bool value) {
                          Provider.of<ThemeModel>(context,listen: false).changeData();
                        },
                      );
                    }
                  )
                ),
              ),
              SizedBox(height: 10),
              CustomListTile(
                showDivider: false,
                titleColor: Colors.red,
                title: 'Log Out',
                onTap: () => _exitCheck(context),
              ),
            ],
          );
        }
      )
    );
  }

  void _exitCheck(context){
    showDialog(
      context: context,
      child: AlertDialog(
        title: Text('Log Out'),
        contentPadding: EdgeInsets.only(top: 20),
        content: Container(
          height: 50,
          color: Colors.red,
          alignment: Alignment.center,
          child: Text('Are you sure?', style: TextStyle(color: Colors.white),),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('No'),
            onPressed: (){
              Navigator.pop(context);
            },
          ),
          FlatButton(
            child: Text('Yes'),
            textColor: Colors.red,
            onPressed: () async{
              Navigator.pop(context);
              await Provider.of<AuthModel>(context, listen: false).logout();
              Provider.of<NavigationModel>(context, listen: false)..change(0);
            },
          )
        ],
      )
    );
    
                  
  }
}