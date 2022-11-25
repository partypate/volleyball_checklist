import 'package:flutter/material.dart';
import 'package:volleyball_checklist/model/list_item.dart';
import 'package:volleyball_checklist/data/list_items.dart';
import 'package:volleyball_checklist/widget/list_item_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Volleyball Checklist',
      theme: ThemeData(
        // This is the theme of your application.
        primarySwatch: Colors.blue,
        backgroundColor: Colors.blueGrey,
      ),
      home: const MyHomePage(title: 'Volleyball Checklist'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final listKey = GlobalKey<AnimatedListState>();
  final List<ListItem> items = List.from(listItems);

  @override
  Widget build(BuildContext context) {
    void removeItem(int index) {
      final removeItem = items[index];
      items.removeAt(index);
      listKey.currentState!.removeItem(
        index,
        (context, animation) => ListItemWidget(
          item: removeItem,
          animation: animation,
          onClicked: () {},
        ),
      );
    }

    void removeAllItems() {
      for (var i = 0; i < items.length;) {
        removeItem(i);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.lightBlue,
        child: AnimatedList(
          key: listKey,
          initialItemCount: items.length,
          itemBuilder: (context, index, animation) => ListItemWidget(
            item: items[index],
            animation: animation,
            onClicked: () => removeItem(index),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.restore),
        onPressed: () {
          removeAllItems();
        },
      ),
    );
  }
}
