import 'package:flutter/material.dart';

Navigate(BuildContext context, Widget widget) {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return widget;
    }));
  });
}
