import 'package:flutter/material.dart';

import '../../../Animation/fade_animation.dart';

class HeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Stack(
        children: <Widget>[
          Positioned(
            child: FadeAnimation(
                1,
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/regis.png'),
                    ),
                  ),
                )),
          ),
          Positioned(
            child: FadeAnimation(
              1.5,
              Center(
                child: Text(
                  "Register",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange,
                    fontFamily: 'Open Sans',
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
