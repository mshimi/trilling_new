import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:trilling_web/core/extentions/mediaquery_extention.dart';
import 'package:trilling_web/features/product_feature/presentation/bloc/products_bloc.dart';

class SearchOptionCheckBox extends StatefulWidget {
  ProductState productState;
  bool value;
  String titel;
  Function(bool?)? onChanged;

  SearchOptionCheckBox(
      {Key? key, required this.productState, required this.value, required this.onChanged, required this.titel})
      : super(key: key);

  @override
  State<SearchOptionCheckBox> createState() => _SearchOptionCheckBoxState();
}

class _SearchOptionCheckBoxState extends State<SearchOptionCheckBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.getWidth() * 0.10,
      child: Row(
        children: [
          Checkbox(
            onChanged: widget.onChanged,
            value: widget.value,
          ),
          SizedBox(
            width: 8,
          ),
          Text(
            widget.titel,
            style: TextStyle(fontSize: 10),
          )
        ],
      ),
    );
  }
}
