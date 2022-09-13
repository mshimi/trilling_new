import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:trilling_web/core/utils/colors.dart';

import '../../../../core/presentation/widgets/app_textformfield.dart';

class MultiChoiceItems extends StatefulWidget {
  final double width;

  final String titel;
  final List<String> allItems;
  final List<String> selectedItems;
  const MultiChoiceItems({
    super.key,
    required this.width,
    required this.titel,
    required this.allItems,
    required this.selectedItems,
  });

  @override
  State<MultiChoiceItems> createState() => _MultiChoiceItemsState();
}

class _MultiChoiceItemsState extends State<MultiChoiceItems> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          alignment: Alignment.topLeft,
          width: widget.width * 0.09,
          child: Text(
            widget.titel,
            style: Theme.of(context)
                .textTheme
                .caption!
                .copyWith(fontSize: 12, fontWeight: FontWeight.bold),
          ),
        ),
        Flexible(
          child: Container(
            width: widget.width * 0.6,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                border: Border.all(color: blueColor1),
                borderRadius: BorderRadius.circular(8)),
            child: Wrap(
              runAlignment: WrapAlignment.spaceEvenly,
              spacing: 5,
              runSpacing: 10,
              children: widget.allItems
                  .map((e) => InkWell(
                        onTap: () {
                          setState(() {
                            widget.selectedItems.contains(e)
                                ? widget.selectedItems.remove(e)
                                : widget.selectedItems.add(e);
                          });
                        },
                        child: Chip(
                          backgroundColor: widget.selectedItems.contains(e)
                              ? blueColor1
                              : Colors.grey.withOpacity(0.6),
                          label: Text(e),
                          labelStyle: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                              color: widget.selectedItems.contains(e)
                                  ? Colors.white
                                  : Colors.black),
                        ),
                      ))
                  .toList(),
            ),
          ),
        )
      ],
    );
  }
}
