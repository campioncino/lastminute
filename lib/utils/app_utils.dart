import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppUtils {
  static Future<bool> isOffline() async {
    try {
      ConnectivityResult result = await Connectivity().checkConnectivity();
      return result == ConnectivityResult.none;
    } catch (error) {}
    return false;
  }

  static void serviceUnavailableSnackbar(GlobalKey<ScaffoldState> key) {
    if (!key.currentState.mounted) {
      return;
    }
    final snackBar = new SnackBar(
      content: new Text(
        'Servizio momentaneamente non disponibile. Riprovare',
        style: TextStyle(color: Colors.red),
      ),
    );
    key.currentState.showSnackBar(snackBar);
  }

  static void snackbarOfflineByScaffoldKey(GlobalKey<ScaffoldState> key) {
    if (key.currentState == null || !key.currentState.mounted) {
      return;
    }
    final snackBar = new SnackBar(
      content: new Text(
        'CONNESSIONE INTERNET ASSENTE',
        style: TextStyle(color: Colors.red),
      ),
    );
    key.currentState.showSnackBar(snackBar);
  }

  static void errorSnackBar(GlobalKey<ScaffoldState> key, String message) {
    if (!key.currentState.mounted) {
      return;
    }
    final snackBar = new SnackBar(
      content: new Text(
        message,
        style: TextStyle(color: Colors.red),
      ),
    );
    key.currentState.showSnackBar(snackBar);
  }

  static void successSnackBar(GlobalKey<ScaffoldState> key, String message) {
    if (!key.currentState.mounted) {
      return;
    }
    final snackBar = new SnackBar(
      content: new Text(
        message,
        style: TextStyle(color: Colors.green),
      ),
    );
    key.currentState.showSnackBar(snackBar);
  }

  static void toastError(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        backgroundColor: Colors.red[400].withOpacity(0.6),
        textColor: Colors.white);
  }

  static void toastSuccess(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        backgroundColor: Colors.green[400].withOpacity(0.6),
        textColor: Colors.white);
  }
}
