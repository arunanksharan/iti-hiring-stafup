import 'dart:async';
import 'dart:io';

 import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class ConnectivityProvider extends ChangeNotifier {
  bool isConnected = true;
  late StreamSubscription subscription;

  Future<void> initialise(context) async {
    final Connectivity connectivity = Connectivity();

    final List<ConnectivityResult> result =
        await connectivity.checkConnectivity();
    checkStatus(result[0], context);
    subscription = connectivity.onConnectivityChanged.listen((result) {
      checkStatus(result[0], context);
    });
  }

  Future<void> checkStatus(ConnectivityResult result, context) async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isEmpty && result[0].rawAddress.isEmpty) {
        isConnected = false;
        notifyListeners();
      } else {
        isConnected = true;
        notifyListeners();
      }
    } on SocketException catch (_) {
      isConnected = false;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    subscription.cancel();
  }
}
