// class MyWidget extends StatefulWidget {
//   const MyWidget({super.key});

//   @override
//   State<MyWidget> createState() => _MyWidgetState();
// }

// class _MyWidgetState extends State<MyWidget>
//     with SingleTickerProviderStateMixin {
//       double width = 200;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: AnimatedContainer(
//         duration: Duration(seconds: 1),
//         width: width,
//         height: width,
//         color: Colors.green,
//       ),
//       floatingActionButton: ElevatedButton(
//         onPressed: () {
//           setState(() {
//             width += 50;
//           });
//         },
//         child: Icon(
//           Icons.switch_access_shortcut,
//         ),
//       ),
//     );
//   }
// }