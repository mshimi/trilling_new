import 'package:flutter/material.dart';
import 'package:trilling_web/features/client_feature/export.dart';
import 'package:trilling_web/features/client_feature/presentation/bloc/clients_page_bloc/clients_page_bloc.dart';
import 'package:trilling_web/features/client_feature/presentation/bloc/clients_page_bloc/clients_page_state.dart';

class ClientsPage extends StatelessWidget {
  const ClientsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = context.getHeight();
    double width = context.getWidth();

    return BlocBuilder<ClientsPageBloc, ClientPageState>(
      builder: (context, state) {
        ClientsPageBloc clientPageBloc =
            BlocProvider.of<ClientsPageBloc>(context);
        return Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            // mainAxisSize: MainAxisSize.max,
            // mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              ClientTableHeader(
                width: width,
                height: height * 0.05,
                clientPageBloc: clientPageBloc,
              ),
              ClientTable(
                height: height * 0.80,
                clientPageBloc: clientPageBloc,
              ),
              ElevatedButton(
                onPressed: () {
                  GoRouter.of(context).go('');
                },
                child: const Text('Kunde hinzufügen'),
              ),
            ],
          ),
        );
      },
    );
  }
}
