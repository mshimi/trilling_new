import 'package:flutter/material.dart';
import 'package:trilling_web/core/extentions/mediaquery_extention.dart';

import 'package:trilling_web/core/utils/colors.dart';
import 'package:trilling_web/features/client_feature/domain/entities/adresse.dart';
import 'package:trilling_web/features/client_feature/domain/entities/client.dart';

import 'package:trilling_web/features/client_feature/domain/repositories/client_table_builder.dart';

import 'package:data_tables/data_tables.dart';
import 'package:trilling_web/features/client_feature/presentation/bloc/client_page_bloc/client_page_bloc.dart';

class ClientTable extends StatelessWidget {
  double height;
  final ClientPageBloc clientPageBloc;

  ClientTable({Key? key, required this.height, required this.clientPageBloc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Client> getTableContent() {
      return clientPageBloc.tableContent.isEmpty
          ? clientPageBloc.clients
          : clientPageBloc.tableContent;
    }

    ClientTableBuilder clientTableBuilder =
        ClientTableBuilder(clientList: getTableContent());

    return Container(
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
    );
  }
}
