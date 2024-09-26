import 'package:cofeeshope/models/cofee.dart';
import 'package:flutter/material.dart';

class CofeeTile extends StatelessWidget {
  final Cofee cofee;
  void Function()? onPressed;
  final Widget icon;
  CofeeTile(
      {super.key,
      required this.cofee,
      required this.onPressed,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.symmetric(vertical: 25, horizontal: 10),
      decoration: BoxDecoration(
          color: Colors.grey[200], borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        title: Text(cofee.name),
        subtitle: Text(cofee.price),
        leading: Image.asset(cofee.imagePath),
        trailing: IconButton(onPressed: onPressed, icon: icon),
      ),
    );
  }
}
