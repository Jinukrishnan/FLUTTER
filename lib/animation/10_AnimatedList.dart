import 'package:flutter/material.dart';

// class AnimaltedListWidget extends StatefulWidget {
//   const AnimaltedListWidget({super.key});

//   @override
//   State<AnimaltedListWidget> createState() => _AnimatedIconWidgetState();
// }

// class _AnimatedIconWidgetState extends State<AnimaltedListWidget> {
//   TextEditingController _controller = TextEditingController();
//   List<String> _items = [];
//   final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

//   void _addItem() {
//     _items.add(_controller.text);
//     _listKey.currentState?.insertItem(0, duration: Duration(milliseconds: 300));
//   }

//   @override
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Container(
//       width: MediaQuery.of(context).size.width,
//       height: MediaQuery.of(context).size.height,
//       padding: EdgeInsets.all(30),
//       child: Column(
//         children: [
//           Row(
//             children: [
//               Expanded(
//                   child: TextField(
//                 controller: _controller,
//                 decoration: InputDecoration(border: OutlineInputBorder()),
//               )),
//               SizedBox(
//                 width: 20,
//               ),
//               ElevatedButton(onPressed: _addItem, child: Text("Add"))
//             ],
//           ),

//           // animated list
//           AnimatedList(
//               key: _listKey,
//               initialItemCount: _items.length,
//               itemBuilder: (context, index, animation) {
//                 return SizeTransition(
//                   sizeFactor: animation,
//                   child: ListTile(
//                     title: Text(_items[index]),
//                     trailing: IconButton(
//                         onPressed: () {},
//                         icon: Icon(
//                           Icons.delete,
//                           color: Colors.red,
//                         )),
//                   ),
//                 );
//               })
//         ],
//       ),
//     ));
//   }
// }
class AnimatedListWidget extends StatefulWidget {
  @override
  _AnimatedListWidgetState createState() => _AnimatedListWidgetState();
}

class _AnimatedListWidgetState extends State<AnimatedListWidget> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  final List<int> _items = [];
  int _counter = 0;

  void _addItem() {
    setState(() {
      _items.insert(0, _counter++);
      _listKey.currentState
          ?.insertItem(0, duration: Duration(milliseconds: 300));
    });
  }

  void _removeItem(int index) {
    setState(() {
      final int removedItem = _items.removeAt(index);
      _listKey.currentState?.removeItem(
        index,
        (context, animation) {
          return SizeTransition(
            sizeFactor: animation,
            axisAlignment: 0.0,
            child: ListTile(
              title: Text('Item $removedItem'),
            ),
          );
        },
        duration: Duration(milliseconds: 300),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated List Demo'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: _addItem,
          ),
        ],
      ),
      body: AnimatedList(
        key: _listKey,
        initialItemCount: _items.length,
        itemBuilder: (context, index, animation) {
          return SizeTransition(
            sizeFactor: animation,
            child: ListTile(
              title: Text('Item ${_items[index]}'),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () => _removeItem(index),
              ),
            ),
          );
        },
      ),
    );
  }
}
