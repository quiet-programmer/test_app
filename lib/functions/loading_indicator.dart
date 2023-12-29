import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_template/const_value.dart';

platformLoadingIndicator() {
  return Platform.isIOS ? CupertinoActivityIndicator(
    color: frontColor,
  ) : CircularProgressIndicator(
    color: frontColor,
  );
}