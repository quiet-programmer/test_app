import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:my_template/app/auth/login_screen.dart';
import 'package:my_template/const_value.dart';
import 'package:my_template/functions/navigate_to.dart';
import 'package:my_template/models/user_model.dart';
import 'package:provider/provider.dart';

class PostRequest {
  late final Function(bool) setIsLoadingCallback;

  static Future makePostRequest({
    String? requestEnd,
    String? bearer,
    bool? isJson = false,
    dynamic jsonParam,
    Map<String, String?>? params,
    BuildContext? context,
    Box<UserModel>? storeData,
  }) async {
    var url = Uri.decodeFull('$authApiUrl/$requestEnd');

    try {
      if (isJson == true) {
        var res = await http.post(
          Uri.parse(url),
          body: jsonParam,
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $bearer',
          },
        );

        var status = json.decode(res.body)['status'] ??
            json.decode(res.body)['statusCode'];
        var errorMsg = json.decode(res.body)['message'];

        if (status != 200 && status != 201 && status != 202) {
          logger.i(errorMsg);
          Fluttertoast.showToast(
            msg: '$errorMsg',
            gravity: ToastGravity.CENTER,
          );
        }

        if (status == 401) {
          storeData?.delete(tokenKey);
          storeData?.delete(balanceAmountKey);
          logger.i(errorMsg);
          Fluttertoast.showToast(
            msg: '$errorMsg',
            gravity: ToastGravity.CENTER,
          );
          navigateEndTo(context!, destination: LoginScreen());
        }

        return json.decode(res.body);
      }

      var res = await http.post(
        Uri.parse(url),
        body: params,
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $bearer',
        },
      );

      var status = json.decode(res.body)['status'] ??
          json.decode(res.body)['statusCode'];
      var errorMsg = json.decode(res.body)['message'];

      if (status != 200 && status != 201 && status != 202) {
        logger.i(errorMsg);
        Fluttertoast.showToast(
          msg: '$errorMsg',
          gravity: ToastGravity.CENTER,
        );
      }

      if (status == 401) {
        Fluttertoast.showToast(
          msg: 'Your session has expired',
          gravity: ToastGravity.CENTER,
        );
        storeData?.delete(tokenKey);
        storeData?.delete(balanceAmountKey);
        navigateEndTo(context!, destination: LoginScreen());
      }

      return json.decode(res.body);
    } on FormatException catch (e) {
      if (e.toString().contains('Unexpected character')) {
        storeData!.delete(userKey);
        storeData.delete(tokenKey);
        storeData.delete(balanceAmountKey);
        navigateEndTo(context!, destination: LoginScreen());
        Fluttertoast.showToast(
          msg: 'Your Session has expired.',
          gravity: ToastGravity.CENTER,
        );
      }
    } catch (e) {
      logger.e(e);
    }
  }
}