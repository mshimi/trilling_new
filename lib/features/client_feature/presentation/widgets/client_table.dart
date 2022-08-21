import 'package:flutter/material.dart';

import 'package:trilling_web/core/utils/colors.dart';
import 'package:trilling_web/features/client_feature/domain/entities/client.dart';

import 'package:trilling_web/features/client_feature/domain/repositories/client_table_builder.dart';

import 'package:data_tables/data_tables.dart';

import '../bloc/clients_page_bloc/clients_page_bloc.dart';

class ClientTable extends StatelessWidget {
  double height;
  final ClientsPageBloc clientPageBloc;

  ClientTable({Key? key, required this.height, required this.clientPageBloc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    // this was a try to not get data from Firebase with every Search but not working 
    List<Client> getTableContent() {
      return clientPageBloc.tableContent.isEmpty
          ? clientPageBloc.clients
          : clientPageBloc.tableContent;
    }

    ClientTableBuilder clientTableBuilder =
        ClientTableBuilder(clientList: getTableContent(), context: context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SizedBox(
        // width: context.getWidth(),
        height: height,
        child: NativeDataTable(
            noItems: const Center(
              child: CircularProgressIndicator(color: blueColor1),
            ),
            handleNext: () {},
            handlePrevious: () {},
            onRefresh: () async {},
            showSelect: false,
            showSort: false,
            rowsPerPage: 20,
            columns: clientTableBuilder.buildColumns(),
            rows: clientTableBuilder.buildTableRow()),
      ),
    );
  }
}
