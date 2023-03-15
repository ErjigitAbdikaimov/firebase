import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingService {
  void showLoading(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Center(
              child: CupertinoActivityIndicator(radius: 20),
            ),
            content: Text('kuto tur....'),
          );
        });
  }
}
