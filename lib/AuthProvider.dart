import 'dart:convert';
import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'HttpException.dart';

class Auth with ChangeNotifier {
  String _token;

  // DateTime _expiryDate;
  // String _userId;
  // Timer _authTimer;

  bool get isAuth {
    return token != null;
  }

  String get token {
    if (
        // _expiryDate != null &&
        //     _expiryDate.isAfter(DateTime.now()) &&
        _token != null) {
      return _token;
    }
    return null;
  }

  // String get userId {
  //   return _userId;
  // }

  Future<void> _authenticate(
      String email, String password, String urlSegment) async {
    initialToken();
    final url = "https://ghazal-food.herokuapp.com/api/" + urlSegment;
    // final url = "http://192.168.0.106:8000/api/" + urlSegment;
    try {
      var response = await http.post(Uri.parse(url), body: {
        'email': email,
        'password': password,
        'rpassword': password,
      }, headers: {
        "Accept": "application/json",
        // "Authorization": "Bearer " + prefs.get('token'),
      }).catchError((error) {
        print(error.toString());
      }).timeout(Duration(seconds: 30), onTimeout: () {
        return null;
      });

      if (response != null) {
        var body = jsonDecode(response.body);
        print('Response body: $body');

        if (response.statusCode == 200) {
          final responseData = json.decode(response.body);

          if (responseData['error'] != null) {
            throw HttpException(responseData['error']['message']);
          }

          _token = responseData['token'];
          // _userId = responseData['localId'];
          // _expiryDate = DateTime.now().add(
          //   Duration(
          //     seconds: int.parse(
          //       responseData['expiresIn'],
          //     ),
          //   ),
          // );
          // _autoLogout();
          notifyListeners();
          SharedPreferences prefs = await SharedPreferences.getInstance();
          final userData = json.encode(
            {
              'token': _token,
              // 'userId': _userId,
              // 'expiryDate': _expiryDate.toIso8601String(),
            },
          );
          print("token: " + _token);
          prefs.setString('userData', userData);
        }
      }
      if (response == null || response.statusCode != 200) {
        throw("Your credential is invalid");
      }
    } catch (error) {
      print("error " + error.toString());
      var errorMessage = 'Could not authenticate you. Please try again later.';
      if (error.toString().contains('EMAIL_EXISTS')) {
        errorMessage = 'This email address is already in use.';
      } else if (error.toString().contains('INVALID_EMAIL')) {
        errorMessage = 'This is not a valid email address';
      } else if (error.toString().contains('WEAK_PASSWORD')) {
        errorMessage = 'This password is too weak.';
      } else if (error.toString().contains('EMAIL_NOT_FOUND')) {
        errorMessage = 'Could not find a user with that email.';
      } else if (error.toString().contains('INVALID_PASSWORD')) {
        errorMessage = 'Invalid password.';
      }else if (error.toString().contains('Your credential is invalid')) {
        errorMessage = 'Your credential is invalid';
      }
      throw errorMessage;
    }
  }

  Future<void> signup(String email, String password) async {
    return _authenticate(email, password, 'register');
  }

  Future<void> login(String email, String password) async {
    return _authenticate(email, password, 'login');
  }

  Future<bool> tryAutoLogin() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('userData')) {
      return false;
    }
    final extractedUserData =
        json.decode(prefs.getString('userData')) as Map<String, Object>;
    // final expiryDate = DateTime.parse(extractedUserData['expiryDate']);

    // if (expiryDate.isBefore(DateTime.now())) {
    //   return false;
    // }
    _token = extractedUserData['token'];
    // print("Token: "+_token);
    // _userId = extractedUserData['userId'];
    // _expiryDate = expiryDate;
    notifyListeners();
    // _autoLogout();
    return true;
  }

  Future<void> logout() async {
    _token = null;
    // _userId = null;
    // _expiryDate = null;
    // if (_authTimer != null) {
    //   _authTimer.cancel();
    //   _authTimer = null;
    // }
    notifyListeners();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.remove('userData');
    prefs.clear();
  }

// void _autoLogout() {
//   if (_authTimer != null) {
//     _authTimer.cancel();
//   }
//   final timeToExpiry = _expiryDate.difference(DateTime.now()).inSeconds;
//   _authTimer = Timer(Duration(seconds: timeToExpiry), logout);
// }

  void initialToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _token = null;
    prefs.clear();
    notifyListeners();
  }
}
