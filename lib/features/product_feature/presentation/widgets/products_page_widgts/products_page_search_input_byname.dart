import 'package:flutter/material.dart';
import 'package:trilling_web/core/extentions/mediaquery_extention.dart';
import 'package:trilling_web/core/presentation/widgets/app_textformfield.dart';

class SearchInputByProductName extends StatefulWidget {
  const SearchInputByProductName({Key? key}) : super(key: key);

  @override
  State<SearchInputByProductName> createState() =>
      _SearchInputByProductNameState();
}

class _SearchInputByProductNameState extends State<SearchInputByProductName> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          AppTextFormField(
              width: context.getWidth(), labelText: 'Product Name'),
        ],
      ),
    );
  }
}
