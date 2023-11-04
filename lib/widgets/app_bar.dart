import 'package:flutter/material.dart';

import '../domain/constants/constants.dart';


AppBar getAppBarHeight(String text){
  return AppBar(
    centerTitle: true,
    title: Text(text),
  );
}
