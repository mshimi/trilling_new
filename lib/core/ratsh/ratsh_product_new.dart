// class ProductCapicitiesInput extends StatefulWidget {
//   final String titel;
//   final List<ProductCapicity> productCapicites;

//   final List<Packung> packungen;

//   ProductCapicitiesInput(
//       {super.key,
//       required this.titel,
//       required this.packungen,
//       required this.productCapicites});

//   @override
//   State<ProductCapicitiesInput> createState() => _ProductCapicitiesInputState();
// }

// class _ProductCapicitiesInputState extends State<ProductCapicitiesInput> {
//   Packung? currentPackung;

//   @override
//   Widget build(BuildContext context) {
//     final TextEditingController _minPaxController = TextEditingController();
//     final TextEditingController _maxPaxController = TextEditingController();
//     List<DropdownMenuItem<Packung>> packungs = widget.packungen.map((e) {
//       PackungModel packungModel = PackungModel.fromDomain(e);

//       return DropdownMenuItem(
//         value: e,
//         child:
//             Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//           Text(
//             packungModel.packungValueToSymbole(),
//             style: const TextStyle(fontWeight: FontWeight.bold),
//           ),
//           Text(' ${e.name}')
//         ]),
//       );
//     }).toList();

//     currentPackung ??= widget.packungen[1];

//     return Row(children: [
//       Container(
//         alignment: Alignment.topLeft,
//         width: context.getWidth() * 0.09,
//         child: Text(
//           widget.titel,
//           style: Theme.of(context)
//               .textTheme
//               .caption!
//               .copyWith(fontSize: 12, fontWeight: FontWeight.bold),
//         ),
//       ),
//       Flexible(
//         child: Container(
//           padding: const EdgeInsets.all(8),
//           decoration: BoxDecoration(
//               border: Border.all(color: blueColor1),
//               borderRadius: BorderRadius.circular(8)),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Row(
//                 children: [
//                   Expanded(flex: 2, child: TextFormField(controller: _minPaxController,)),
//                   const SizedBox(
//                     width: 8,
//                   ),
//                   Expanded(flex: 2, child: TextFormField()),
//                   const SizedBox(
//                     width: 8,
//                   ),
//                   Expanded(
//                     flex: 1,
//                     child: DropdownButton(
//                       items: packungs,
//                       onChanged: (v) {
//                         setState(() {
//                           currentPackung = v as Packung;
//                         });
//                       },
//                       value: currentPackung,
//                     ),
//                   ),
//                   const SizedBox(
//                     width: 8,
//                   ),
//                   Expanded(
//                       child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       IconButton(
//                           onPressed: () {
//                             setState(() {
//                               ProductCapicity productCapicity = ProductCapicity(
//                                   minPax: int.parse(_minPaxController.text),
//                                   maxPax: int.parse(_maxPaxController.text),
//                                   packung: currentPackung!);
//                               widget.productCapicites.add(productCapicity);
//                               print(widget.productCapicites.length);
//                             });
//                           },
//                           icon: const Icon(Icons.add)),
//                       const SizedBox(
//                         width: 10,
//                       ),
//                       IconButton(
//                           onPressed: () {}, icon: const Icon(Icons.cancel))
//                     ],
//                   ))
//                 ],
//               ),
//               SizedBox(height: 8),
//               Flexible(
//                 child: Column(
//                   children: [
//                     Container(
//                       decoration: BoxDecoration(
//                         border: Border.all(color: blueColor4),
//                       ),
//                       child: Row(
//                         children: [
//                           Expanded(
//                             child: Container(
//                                 padding: EdgeInsets.all(8),
//                                 color: blueColor1,
//                                 alignment: Alignment.center,
//                                 child: Text('min. Pax')),
//                           ),
//                           Expanded(
//                             child: Container(
//                                 padding: EdgeInsets.all(8),
//                                 color: blueColor1,
//                                 alignment: Alignment.center,
//                                 child: Text('max. Pax')),
//                           ),
//                           Expanded(
//                             child: Container(
//                                 padding: EdgeInsets.all(8),
//                                 color: blueColor1,
//                                 alignment: Alignment.center,
//                                 child: Text('Topf')),
//                           ),
//                           Expanded(
//                             child: Container(
//                                 padding: EdgeInsets.all(8),
//                                 color: blueColor1,
//                                 alignment: Alignment.center,
//                                 child: Text('Wert')),
//                           ),
//                           Expanded(
//                             child: Container(
//                                 padding: EdgeInsets.all(8),
//                                 color: blueColor1,
//                                 alignment: Alignment.center,
//                                 child: Text('Löschen')),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Flexible(
//                         child: ListView.separated(
//                             itemBuilder: (ontext, index) {
//                               ProductCapicity capicity =
//                                   widget.productCapicites[index];
//                               return Row(
//                                 children: [
//                                   Expanded(
//                                     child: Container(
//                                         padding: EdgeInsets.all(8),
//                                         color: blueColor1,
//                                         alignment: Alignment.center,
//                                         child: Text('${capicity.minPax}')),
//                                   ),
//                                   Expanded(
//                                     child: Container(
//                                         padding: EdgeInsets.all(8),
//                                         color: blueColor1,
//                                         alignment: Alignment.center,
//                                         child: Text('${capicity.maxPax}')),
//                                   ),
//                                   Expanded(
//                                     child: Container(
//                                         padding: EdgeInsets.all(8),
//                                         color: blueColor1,
//                                         alignment: Alignment.center,
//                                         child:
//                                             Text('${capicity.packung.name}')),
//                                   ),
//                                   Expanded(
//                                     child: Container(
//                                         padding: EdgeInsets.all(8),
//                                         color: blueColor1,
//                                         alignment: Alignment.center,
//                                         child:
//                                             Text('${capicity.packung.value}')),
//                                   ),
//                                   Expanded(
//                                     child: Container(
//                                         padding: EdgeInsets.all(8),
//                                         color: blueColor1,
//                                         alignment: Alignment.center,
//                                         child: IconButton(
//                                           icon: Icon(Icons.delete),
//                                           onPressed: () {
//                                             setState(() {
//                                               widget.productCapicites
//                                                   .removeAt(index);
//                                             });
//                                           },
//                                         )),
//                                   ),
//                                 ],
//                               );
//                             },
//                             separatorBuilder: (context, index) =>
//                                 const SizedBox(
//                                   height: 1,
//                                 ),
//                             itemCount: widget.productCapicites.length)),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     ]);
//   }
// }
