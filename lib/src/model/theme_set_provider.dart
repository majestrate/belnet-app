import 'package:belnet_mobile/src/utils/app_appearing.dart';
import 'package:flutter/foundation.dart';

class AppModel extends ChangeNotifier {

  AppPreference appPreference = AppPreference();
  bool _darkTheme = true;      //false
  bool get darkTheme => _darkTheme;


  String _upload ="";
  String get uploads => _upload;

  String _download ="";
  String get downloads => _download;



  set darkTheme(bool value) {
    _darkTheme = value;
    appPreference.setThemePref(value);
    notifyListeners();
  }

  // connection to belnet
  bool _connecting_belnet = false;
  bool get connecting_belnet => _connecting_belnet;

  set connecting_belnet(bool value){
    _connecting_belnet = value;
    appPreference.setConnectingBelnet(value);
    notifyListeners();

  }


  // STatus for button loading
bool _status_bel = false;
  bool get status_belnet => _status_bel;

  set status_belnet(bool value){
    _status_bel = value;
    appPreference.setStatusBelnet(value);
    notifyListeners();
  }




// for download
set uploads(String value){
  _upload = value;
  notifyListeners();

}

set downloads(String value){
  _download = value;
  notifyListeners();
}





List<String> logData=["belnet started", "data"];


void addItem(String itemData){
  logData.add(itemData);
  notifyListeners();
}



List<String> get basketItem {
    return logData;
  }




String _singleUpload ="";
 String get singleUpload => _singleUpload;

 set singleUpload(String value){
  _singleUpload = value;
  notifyListeners();
 }



String _singleDownload = "";
String get singleDownload => _singleDownload;

set singleDownload(String value){
  _singleDownload = value;
  notifyListeners();
}



}

