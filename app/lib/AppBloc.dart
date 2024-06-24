import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
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
  final url = "https://i.gnovation.tech:3000/listUsers";
  try {
    final client = HttpClient()
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
    final ioClient = IOClient(client);

    final response = await ioClient.get(Uri.parse(url));
    if (response.statusCode == 200) {
      Provider.of<CurrentUserProvider>(context, listen: false).changeInternetConnection(true);
      return Provider.of<CurrentUserProvider>(context, listen: false).internetConnected;
    } else {
      Provider.of<CurrentUserProvider>(context, listen: false).changeInternetConnection(false);
      return Provider.of<CurrentUserProvider>(context, listen: false).internetConnected;
    }
  } catch (e) {
    throw Exception("got this error in checkInternetConnection function $e");
  }
}