import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:my_template/app/auth/login_screen.dart';
import 'package:my_template/const_value.dart';
import 'package:my_template/functions/navigate_to.dart';
import 'package:my_template/models/user_model.dart';

class GetRequest {
  static Future makeGetRequest({
    String? requestEnd,
    Map<String, dynamic>? queryParams,
    String? bearer,
    BuildContext? context,
    Box<UserModel>? storeData,
  }) async {
    try {
      final Uri url = Uri.parse('$apiUrl/$requestEnd');

      final Uri finalUri = url.replace(queryParameters: queryParams);
      var res = await http.get(
        finalUri,
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $bearer',
        },
      );

      var status = json.decode(res.body)['status'] ??
          json.decode(res.body)['statusCode'];
      if (status == 401 || status == 500 || res.statusCode == 401 || res.statusCode == 500) {
        storeData?.delete(tokenKey);
        storeData?.delete(balanceAmountKey);
        Fluttertoast.showToast(
          msg: 'Your Session has expired.',
          gravity: ToastGravity.CENTER,
        );
        navigateEndTo(context!, destination: LoginScreen());
      }
      return json.decode(res.body);
    } on FormatException catch (e) {
      storeData?.delete(tokenKey);
      storeData?.delete(userKey);
      storeData?.delete(balanceAmountKey);
      logger.i(e.toString());
      if (e.toString().contains('Unexpected character')) {
        navigateEndTo(context!, destination: LoginScreen());
        Fluttertoast.showToast(
          msg: 'Your Session has expired.',
          gravity: ToastGravity.CENTER,
        );
      }
    } catch (e) {
      logger.e(e);
      if (e.toString().contains('Connection timed out')) {
        Fluttertoast.showToast(
          msg: 'Connection timed out',
          gravity: ToastGravity.CENTER,
        );
      } else if (e.toString().contains('Connection closed')) {
        Fluttertoast.showToast(
          msg: 'Connection closed!!!',
          gravity: ToastGravity.CENTER,
        );
      } else if (e.toString().contains('Connection reset by peer')) {
        Fluttertoast.showToast(
          msg: 'Connection reset by peer',
          gravity: ToastGravity.CENTER,
        );
      } else {
        Fluttertoast.showToast(
          msg: 'Something went wrong',
          gravity: ToastGravity.CENTER,
        );
      }
    }
  }
}