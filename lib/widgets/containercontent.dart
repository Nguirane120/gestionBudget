import 'package:flutter/material.dart';
import 'package:gestionbudget/consts.dart';

class Containercontent extends StatelessWidget {
  const Containercontent(
      {required this.textContainer,
      required this.widthContainer,
      required this.someContaine,
      this.heightContainer});

  final String textContainer;
  final double widthContainer;
  final double? heightContainer;
  final double someContaine;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
          )
        ],
        color: Colors.white,
      ),
      padding: EdgeInsets.all(10),
      width: widthContainer,
      height: heightContainer,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.all(15.0),
            alignment: Alignment.center,
            width: 100,
            color: AppColor.primarycolor,
            child: Text(
              textContainer,
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              "${someContaine} CFA".toString(),
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
