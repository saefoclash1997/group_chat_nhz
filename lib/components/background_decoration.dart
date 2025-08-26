import 'package:flutter/material.dart';
import '../constants.dart';

class BackGroundDecoration extends StatelessWidget {
  const BackGroundDecoration({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          Positioned(
            right: 0.0,
            child: Container(
              width: MediaQuery.of(context).size.width/2,
              height: MediaQuery.of(context).size.width/2,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black54,
                    blurRadius: 3,
                    spreadRadius: 3
                  )
                ],
                  gradient: kDarkGradiant,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(360)
                  )
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width*3/4,
            height: MediaQuery.of(context).size.width*3/4,
            decoration: BoxDecoration(
                boxShadow: [
                BoxShadow(
                color: Colors.black54,
                blurRadius: 6,
                spreadRadius: 4
            ),],
                gradient: kLightGradiant,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(360),

                )
            ),
          ),
          Positioned(
            left: 46.0,
            bottom: 130.0,
            child: Container(
              width: 86,
              height: 86,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black54,
                        blurRadius: 3,
                        spreadRadius: 3,

                    ),

                  ],
                  gradient: kDarkGradiant,
                  borderRadius: BorderRadius.circular(360)

              ),
            ),
          ),
          Positioned(
            right: 56.0,
            bottom: 260.0,
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black54,
                        blurRadius: 6,
                        spreadRadius: 4
                    ),],
                  gradient: kLightGradiant,
                  borderRadius: BorderRadius.circular(360)

              ),
            ),
          ),

        ],
      ),
    );
  }
}
