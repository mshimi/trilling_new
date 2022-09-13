import 'package:flutter/material.dart';
import 'package:trilling_web/core/extentions/mediaquery_extention.dart';
import 'package:trilling_web/core/utils/colors.dart';
import 'package:trilling_web/features/product_feature/data/models/packung_model.dart';
import 'package:trilling_web/features/product_feature/domain/entities/packung.dart';
import 'package:trilling_web/features/product_feature/domain/entities/product_capicity.dart';

class ProductCapicitiesInput extends StatelessWidget {
  final String titel;
  Packung? currentPackung;
  late final TextEditingController _minPaxController;
  late final TextEditingController _maxPaxController;
  final List<ProductCapicity> productCapicites;

  final List<Packung> packungen;

  ProductCapicitiesInput(
      {super.key,
      required this.titel,
      required this.packungen,
      required this.productCapicites});

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<Packung>> packungs = packungen.map((e) {
      PackungModel packungModel = PackungModel.fromDomain(e);

      _minPaxController = TextEditingController();
      _maxPaxController = TextEditingController();

      return DropdownMenuItem(
        value: e,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            packungModel.packungValueToSymbole(),
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(' ${e.name}')
        ]),
      );
    }).toList();

    currentPackung ??= packungen[1];

    return Row(children: [
      Container(
        alignment: Alignment.topLeft,
        width: context.getWidth() * 0.09,
        child: Text(
          titel,
          style: Theme.of(context)
              .textTheme
              .caption!
              .copyWith(fontSize: 12, fontWeight: FontWeight.bold),
        ),
      ),
      Flexible(
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              border: Border.all(color: blueColor1),
              borderRadius: BorderRadius.circular(8)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Expanded(flex: 2, child: TextFormField()),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(flex: 2, child: TextFormField()),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    flex: 1,
                    child: DropdownButton(
                      items: packungs,
                      onChanged: (v) {
                        currentPackung = v as Packung;
                        print(currentPackung!.name);
                      },
                      value: currentPackung,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
                      const SizedBox(
                        width: 10,
                      ),
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.cancel))
                    ],
                  ))
                ],
              ),
              Flexible(
                  child: ListView.separated(
                      itemBuilder: (ontext, index) {
                        return Row();
                      },
                      separatorBuilder: (context, index) => const SizedBox(
                            height: 1,
                          ),
                      itemCount: productCapicites.length)),
            ],
          ),
        ),
      ),
    ]);
  }
}
