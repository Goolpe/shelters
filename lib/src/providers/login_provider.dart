import 'package:flutter/cupertino.dart';

import 'package:sliding_up_panel/sliding_up_panel.dart';

class LoginProvider extends ChangeNotifier{
  final PanelController _loginController = PanelController();
  PanelController get loginController => _loginController;

  void open(){
    _loginController?.open();
    notifyListeners();
  }

  void close(){
    _loginController?.close();
    notifyListeners();
  }
}
