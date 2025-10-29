import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key, this.height});
  final double? height;

  @override
  Widget build(BuildContext context) {
    return  Image(image: AssetImage('assets/images/logo/logo.png')
    ,width: 290,height: height??150,);
  }
}