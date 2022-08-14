import 'package:flutter/material.dart';
import 'package:trilling_web/features/client_feature/export.dart';

class ClientPage extends StatelessWidget {
  const ClientPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = context.getHeight();
    double width = context.getWidth();

    return BlocBuilder<ClientPageBloc, ClientPageState>(
      builder: (context, state) {
       ClientPageBloc clientPageBloc = BlocProvider.of<ClientPageBloc>(context);
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
              ClientTableHeader(width: width, height: height, clientPageBloc: clientPageBloc,),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: ClientTable(
                  height: height * 0.80,
                  clientPageBloc: clientPageBloc,
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    GoRouter.of(context).go('/neuerKunde');
                  },
                  child: Text('Kunde hinzufügen')),
            ],
          ),
        );
      },
    );
  }
}
