import 'dart:ffi';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';

class CurrentUserProvider extends ChangeNotifier {
  String currentUser = "${FirebaseAuth.instance.currentUser?.email}";
  bool _isLoading = false;
  bool _internetConnected = false;

  bool get isLoading => _isLoading;
  bool get internetConnected => _internetConnected;

  int _newMessages = 0;

  int get newMessages => _newMessages;

  CurrentUserProvider();

  void changeCurrentUser({required String newUser}) {
    currentUser = newUser;
    print(currentUser);
    notifyListeners();
  }

  void changeMessageCount({required messageCount}) {
    _newMessages = messageCount;
    notifyListeners();
  }

  void changeIsLoading() {
    _isLoading = !_isLoading;
    notifyListeners();
  }

  void changeInternetConnection(bool internet) {
    _internetConnected = internet;
    print(
        "Internet connection status changed to: $_internetConnected"); // Debug print
    notifyListeners();
  }
}

Future<bool> checkInternetConnection(BuildContext context) async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.none) {
    // No network connection
    return false;
  }

  final url = "https://www.google.com"; // Use a reliable URL

  try {
    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Cache-Control': 'no-cache',
        'Pragma': 'no-cache',
        'Expires': '0',
      },
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  } catch (e) {
    // Network request failed, likely due to no internet
    return false;
  }
}