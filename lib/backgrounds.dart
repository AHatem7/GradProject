import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  String backgroundAssets;
  Background(this.backgroundAssets);
  

  @override
  Widget build(BuildContext context) {
    return Container(

        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(backgroundAssets),
              fit: BoxFit.fill),
        ));
  }
}
