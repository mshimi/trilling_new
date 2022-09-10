import 'package:flutter/material.dart';


class TopItem extends StatelessWidget {
  final String topfName;
  final int count;
  const TopItem({super.key, required this.topfName, required this.count});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          border: Border.symmetric(horizontal: BorderSide())),
      child: Row(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                topfName,
                style: Theme.of(context).textTheme.caption,
              ),
            ),
          ),
          Container(
            width: 1,
            color: Colors.black,
          ),
          Expanded(
              child: Container(
            alignment: Alignment.center,
            child: Text('$count'),
          ))
        ],
      ),
    );
  }
}
