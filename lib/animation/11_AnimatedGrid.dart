import 'package:flutter/material.dart';

class AnimatedGridExample extends StatefulWidget {
  const AnimatedGridExample({super.key});

  @override
  _AnimatedGridExampleState createState() => _AnimatedGridExampleState();
}

class _AnimatedGridExampleState extends State<AnimatedGridExample> {
  final GlobalKey<AnimatedGridState> _gridKey = GlobalKey<AnimatedGridState>();
  final List<int> _items = [];

  void _insertItem(int index) {
    _items.insert(index, _items.length);
    _gridKey.currentState!.insertItem(index);
  }

  void _removeItem(int index) {
    _items.removeAt(index);
    _gridKey.currentState!.removeItem(
      index,
      (context, animation) => ScaleTransition(
        scale: CurvedAnimation(parent: animation, curve: Curves.easeInQuad),
        child: Card(
          child: Center(
            child: Text('Removed Item'),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Grid Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: AnimatedGrid(
          key: _gridKey,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemBuilder: (context, index, animation) {
            return FadeTransition(
              opacity: animation,
              child: Card(
                child: ListTile(
                  title: Text('Item ${_items[index]}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => _removeItem(index),
                  ),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _insertItem(_items.length),
        child: const Icon(Icons.add),
      ),
    );
  }
}
