import 'package:anime_app/core/constant.dart';
import 'package:flutter/material.dart';

class DefaultExceptionPage extends StatelessWidget {
  const DefaultExceptionPage({required this.child, required this.isInternet});
  final Widget child;
  final bool isInternet;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: myDecoration(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              child,
              isInternet
                  ? FloatingActionButton.extended(
                      onPressed: () {
                        showToast(message: 'قم بالاتصال بالانترنت');
                      },
                      label: const Text(
                        'اعادة المحالولة',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'ios-1',
                        ),
                      ),
                      icon: const Icon(
                        Icons.refresh_rounded,
                        color: Color.fromARGB(255, 234, 234, 234),
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
