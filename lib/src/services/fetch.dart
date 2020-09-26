import 'package:flutter/services.dart' show rootBundle;

Future<String> fetchJson(String data) async{
  try{
    return await rootBundle.loadString('assets/data/$data.json');
  } catch(err){
    rethrow;
  }
}
