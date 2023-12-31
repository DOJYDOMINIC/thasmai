import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';

enum ConnectivityStatus {
  WiFi,
  Cellular,
  Offline,
}

class ConnectivityProvider with ChangeNotifier {
  ConnectivityStatus _status = ConnectivityStatus.Offline;

  ConnectivityStatus get status => _status;

  ConnectivityProvider() {
    Connectivity().onConnectivityChanged.listen((result) {
      _updateStatus(result);
    });
  }

  Future<void> _updateStatus(ConnectivityResult result) async {
    switch (result) {
      case ConnectivityResult.wifi:
        _status = ConnectivityStatus.WiFi;
        break;
      case ConnectivityResult.mobile:
        _status = ConnectivityStatus.Cellular;
        break;
      case ConnectivityResult.none:
        _status = ConnectivityStatus.Offline;
        break;
    }

    notifyListeners();
  }
}