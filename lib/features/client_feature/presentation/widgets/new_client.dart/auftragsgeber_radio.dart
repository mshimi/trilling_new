import 'package:flutter/material.dart';
import 'package:trilling_web/core/utils/strings.dart';

class AuftragsGebersTypeRadio extends StatefulWidget {
  final double width;
  final String groupValue;
  final Function(String) onChange;
  const AuftragsGebersTypeRadio(
      {super.key,
      required this.width,
      required this.groupValue,
      required this.onChange});

  @override
  State<AuftragsGebersTypeRadio> createState() =>
      _AuftragsGebersTypeRadioState();
}

class _AuftragsGebersTypeRadioState extends State<AuftragsGebersTypeRadio> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Auftragsgeber: ',
          style: Theme.of(context)
              .textTheme
              .caption!
              .copyWith(fontSize: 12, fontWeight: FontWeight.bold),
        ),
        Container(
          width: widget.width / 8,
          child: RadioListTile(
              title: Text(
                'Privat',
                style: Theme.of(context).textTheme.caption!.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              value: 'privat',
              groupValue: widget.groupValue,
              onChanged: (v) {
                widget.onChange(v.toString());
              }),
        ),
        Container(
          width: widget.width / 8,
          child: RadioListTile(
              title: Text(
                'Firma',
                style: Theme.of(context).textTheme.caption!.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              value: 'firma',
              groupValue: widget.groupValue,
              onChanged: (v) {
                widget.onChange(v.toString());
              }),
        ),
      ],
    );
  }
}
