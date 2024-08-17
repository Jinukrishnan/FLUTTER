// import 'package:apps/Apps/10_SharedPrefferance/SharedPreffernceTODO.dart';
// import 'package:apps/Apps/11_Hive/HiveLocalStorage.dart';
// import 'package:apps/Apps/12_HiveTODO/HiveTodo.dart';
// import 'package:apps/Apps/13_Carusel/Carausel.dart';
// import 'package:apps/Apps/14_Timer/Timer.dart';
// import 'package:apps/Apps/1_NEUMOPHISM.dart';
// import 'package:apps/Apps/2_DARK_NEUMORPHISM.dart';
// import 'package:apps/Apps/3_BUTTONSWITHNEUMORPHISM.dart';
// import 'package:apps/Apps/4_INNERSHADOW.dart';
// import 'package:apps/Apps/5_Calculator/5_Calculaor.dart';
// import 'package:apps/Apps/6_multiplicationtable/MultplicatioTable.dart';
// import 'package:apps/Apps/7_ArrayTodo/ArrayTodo.dart';
// import 'package:apps/Apps/8_CustomUI/CustomUI.dart';
// import 'package:apps/Apps/9_SendMSGmakeCALL/SendMSGmakeCALL.dart';
// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
// import 'package:hive_flutter/adapters.dart';

// void main() async {
//   // runApp(Neumorphism());
//   // runApp(Calculator());
//   // runApp(MultiplicationTable());
//   // runApp(ArrayTodo());
//   // runApp(CustomUI());
//   // runApp(SendMSGmakeCALL());
//   // runApp(MaterialApp(home: SharedPreffernceTODO()));

// // ====================================================================
//   // // initial hive
//   // await Hive.initFlutter();
//   // // open the box
//   // var box = await Hive.openBox('mybox');
//   // runApp(MaterialApp(home: HiveLocalStorage()));
//   // =====================================================
//   // // initial hive
//   // await Hive.initFlutter();
//   // // open the box
//   // var box = await Hive.openBox('mybox');
//   // runApp(MaterialApp(
//   //   home: HiveTodo(),
//   //   theme: ThemeData(primarySwatch: Colors.yellow),
//   // ));
//   // ==================================================
//   // runApp(MaterialApp(home: Carausel()));

// }

// Timer
// ---------------------------------------------------------------
// import 'package:apps/Apps/14_Timer/Timer.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   final prefs = await SharedPreferences.getInstance();
//   runApp(
//     MaterialApp(
//       home: App(
//         prefs: prefs,
//       ),
//     ),
//   );
// }

// class App extends StatelessWidget {
//   final SharedPreferences prefs;
//   const App({super.key, required this.prefs});

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 4,
//       initialIndex: 3,
//       child: Scaffold(
//         backgroundColor: Color(0xff222222),
//         appBar: AppBar(
//           backgroundColor: Color(0xff2b2b2e),
//           toolbarHeight: 30,
//           bottom: TabBar(
//             dividerColor: Color(0xff222222),
//             tabs: [
//               Tab(
//                 icon: Icon(
//                   Icons.alarm,
//                   color: Color(0xffbec2c7),
//                 ),
//                 child: Text(
//                   "Alarm",
//                   style: TextStyle(color: Color(0xffbec2c7)),
//                 ),
//               ),
//               Tab(
//                 icon: Icon(Icons.punch_clock, color: Color(0xffbec2c7)),
//                 text: "Clock",
//               ),
//               Tab(
//                 icon: Icon(Icons.hourglass_bottom, color: Color(0xffbec2c7)),
//                 text: "Timer",
//               ),
//               Tab(
//                 icon: Icon(Icons.timer, color: Color(0xffbec2c7)),
//                 text: "Stopwatch",
//               ),
//             ],
//           ),
//         ),
//         body: TabBarView(
//           children: [
//             Text("Alarm"),
//             Text("Clock"),
//             Text("Timer"),
//             StopwatchX(
//               prefs: prefs,
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
// -----------------------------------------------------------------

import 'package:apps/Apps/14_Timer/Timer.dart';
import 'package:apps/Apps/15_COMPASS_APP/Compass.dart';
import 'package:apps/Apps/16_Clock/Clock.dart';
import 'package:flutter/material.dart';

void main() async {
  return runApp(MaterialApp(
    // home: Compass(),
    // home: Clock(),
    home: StopwatchX(),
  ));
}
