import 'package:flutter/material.dart';
import 'package:volleyball_checklist/model/list_item.dart';

class ListItemWidget extends StatelessWidget {
  final ListItem item;
  final Animation<double> animation;
  final VoidCallback? onClicked;

  const ListItemWidget({
    required this.item,
    required this.animation,
    required this.onClicked,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SizeTransition(
        sizeFactor: animation,
        child: buildItem(),
      );

  Widget buildItem() => Container(
        margin: EdgeInsets.fromLTRB(10, 2, 10, 2),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
            border: Border.symmetric()),
        child: ListTile(
          contentPadding: EdgeInsets.fromLTRB(16, 2, 16, 2),
          trailing: IconButton(
            icon: Icon(
              Icons.delete,
              color: Colors.grey,
              size: 24,
            ),
            onPressed: onClicked,
          ),
          title: Text(
            item.title,
          ),
        ),
      );
}
