import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final Function()? onpressed;
  final bool isLoading;
  const CustomElevatedButton({
    Key? key,
    required this.text,
    required this.onpressed,
    required this.isLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      constraints: BoxConstraints(maxWidth: 500),
      alignment: Alignment.center,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: Colors.blueGrey,
            minimumSize: Size(200, 40),
            maximumSize: Size(450, 40)),
        onPressed: onpressed,
        child: isLoading
            ? const CircularProgressIndicator(
                color: Colors.white,
              )
            : Text(
                text,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
              ),
      ),
    );
  }
}
