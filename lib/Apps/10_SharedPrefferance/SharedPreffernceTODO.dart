import 'package:flutter/material.dart';

class SharedPreffernceTODO extends StatefulWidget {
  const SharedPreffernceTODO({super.key});

  @override
  State<SharedPreffernceTODO> createState() => _SharedPreffernceTODOState();
}

class _SharedPreffernceTODOState extends State<SharedPreffernceTODO> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [Container(child: Text("data"))],
      ),
    );
  }
}
