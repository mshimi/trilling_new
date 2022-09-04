import 'package:data_tables/data_tables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trilling_web/core/extentions/datetime_extention.dart';
import 'package:trilling_web/core/extentions/mediaquery_extention.dart';
import 'package:trilling_web/features/client_feature/presentation/bloc/client_page_bloc/client_page_bloc.dart';
import 'package:trilling_web/features/client_feature/presentation/widgets/client_page_contact_infomation.dart';
import 'package:trilling_web/features/client_feature/presentation/widgets/client_page_delivery_adresse_table.dart';
import 'package:trilling_web/features/order_feature/domain/entities/order.dart';

import 'package:trilling_web/injection.dart';

import '../../../../core/utils/colors.dart';
import '../../../core_feature/presentation/bloc/corebloc/core_bloc.dart';
import '../../domain/entities/client.dart';

class ClientPage extends StatelessWidget {
  Client? client;

  final String clientId;
  ClientPage({Key? key, this.client, required this.clientId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = context.getWidth();
    double height = context.getHeight();
    CoreBloc coreBloc = BlocProvider.of<CoreBloc>(context);

    print(client);

    return BlocProvider(
      create: (context) =>
          sl.get<ClientPageBloc>()..add(GetClientByIdEvent(clientId: clientId)),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Kunde: $clientId '),
          backgroundColor: blueColor1,
        ),
        body: BlocConsumer<ClientPageBloc, ClientPageState>(
          listener: (context, state) {},
          builder: (context, state) {
            ClientPageBloc clientPageBloc =
                BlocProvider.of<ClientPageBloc>(context);
            // if (clientPageBloc.client == null && client == null) {
            //   print('(clientPageBloc.client == null && client == null)');
            //   clientPageBloc.add(GetClientByIdEvent(clientId: clientId));
            //   return const Center(
            //     child: CircularProgressIndicator(),
            //   );
            // } else if (client == null) {
            //   print('(client == null)');
            //   clientPageBloc.add(GetClientOrderEvent(clientId: clientId));
            // }
            bool isEnabled = clientPageBloc.isEnabled;
            client = clientPageBloc.client;

            // clientPageBloc.client = client;

            if (client == null) {
              clientPageBloc.add(GetClientByIdEvent(clientId: clientId));
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView(children: [
                Container(
                  margin: const EdgeInsets.all(12),
                  width: width,
                  height: height * 0.55,
                  child: Row(
                    children: [
                      ClientPageContactInfomation(
                        onEdit: () {
                          clientPageBloc.isEnabled = !clientPageBloc.isEnabled;
                          clientPageBloc.city = client!.clientAdresse.city;
                          clientPageBloc.add(
                              EnableEditingClientInformationEvent(
                                  isEnabled: clientPageBloc.isEnabled));
                        },
                        onCancel: () {
                          clientPageBloc.isEnabled = !clientPageBloc.isEnabled;
                          clientPageBloc.add(
                              EnableEditingClientInformationEvent(
                                  isEnabled: clientPageBloc.isEnabled));
                        },
                        onSave: () {
                          clientPageBloc.add(UpdateClientInformationEvent(
                              oldClientData: client!));
                          client = null;
                        },
                        client: client!,
                        height: height,
                        isEnabled: isEnabled,
                        width: width,
                        cityController: clientPageBloc.cityCodeController,
                        emailController: clientPageBloc.emailController,
                        firstNameController: clientPageBloc.firstNameController,
                        housNumberController:
                            clientPageBloc.housNumberController,
                        nameController: clientPageBloc.nameController,
                        streetController: clientPageBloc.streetController,
                        telephoneController: clientPageBloc.telephoneController,
                        zipCodeController: clientPageBloc.zipCodeController,
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      ClientPageDeliveryAdresse(
                        client: client!,
                        width: width,
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: blueColor1),
                      borderRadius: BorderRadius.circular(8)),
                  margin: const EdgeInsets.all(12),
                  width: width,
                  height: height * 0.70,
                  child: NativeDataTable.builder(
                      header: Text(
                        'Bestellungen',
                        style: Theme.of(context)
                            .textTheme
                            .headline1!
                            .copyWith(color: blueColor1),
                      ),
                      columns: const [
                        DataColumn(label: Text('Index')),
                        DataColumn(label: Text('Bestellungsdatum')),
                        DataColumn(label: Text('Price')),
                        DataColumn(label: Text('LieferDatum')),
                        DataColumn(label: Text('bringen')),
                        DataColumn(label: Text('bezahlt')),
                        DataColumn(label: Text('Bestellungsdatum'))
                      ],
                      itemCount: clientPageBloc.orders.length,
                      itemBuilder: (index) {
                        Order order = clientPageBloc.orders[index];

                        return DataRow(cells: [
                          DataCell(Text(index.toString())),
                          DataCell(Text(order.bookingDate.getStringDate())),
                          DataCell(Text(order.totalPrice.toString())),
                          DataCell(Text(order.eventDate.getStringDate())),
                          DataCell(Text(index.toString())),
                          DataCell(Text(index.toString())),
                          DataCell(Text(index.toString())),
                        ]);
                      }),
                ),
              ]);
            }
          },
        ),
      ),
    );
  }

  Widget isMob(BoxConstraints constraints, List<Widget> children) {
    if (constraints.maxWidth < 600) {
      return Column(
        children: children,
      );
    } else {
      return Row(
        children: children,
      );
    }
  }
}
