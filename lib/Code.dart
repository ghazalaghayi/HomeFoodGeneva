import 'dart:convert';
import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'HttpException.dart';

class Code with ChangeNotifier {
  String _code;

  String get code {
    if (_code != null) {
      return _code;
    }
    return null;
  }

  Future<void> getCode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    initialCode();
    final url = "https://ghazal-food.herokuapp.com/api/trackingCodeAuth";
    if (prefs.getString('userData') != null) {
      var extractedUserData =
          json.decode(prefs.getString('userData')) as Map<String, Object>;
      try {
        var response = await http.get(Uri.parse(url), headers: {
          "Accept": "application/json",
          "Authorization": "Bearer " + extractedUserData['token'],
        }).catchError((error) {
          print(error.toString());
        }).timeout(Duration(seconds: 30), onTimeout: () {
          _code = "-1";
          notifyListeners();
          return null;
        });

        if (response != null) {
          var body = jsonDecode(response.body);
          print('Response body: $body');

          if (response.statusCode == 200) {
            // final responseData = json.decode(response.body);

            // if (responseData['error'] != null) {
            //   throw HttpException(responseData['error']['message']);
            // }

            _code = response.body.toString();
            print("Code: " + _code);
            notifyListeners();
          }
        }
        if (response == null || response.statusCode != 200) {
          print("error1 ");
          throw ("error");
        }
      } catch (error) {
        print("error2 " + error.toString());
        var e = 'Error';
        if (error.toString().contains('error')) {
          e = 'Unknown error';
        }
        throw e;
      }
    }
  }

  void initialCode() async {
    _code = null;
    notifyListeners();
  }
}
