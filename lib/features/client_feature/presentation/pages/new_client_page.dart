import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trilling_web/features/client_feature/domain/entities/adresse.dart';
import 'package:trilling_web/features/client_feature/domain/entities/client.dart';
import 'package:trilling_web/features/client_feature/presentation/bloc/new_client_bloc/new_client_bloc.dart';
import 'package:trilling_web/injection.dart';

class NewClientPage extends StatelessWidget {
  const NewClientPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Client client = Client(
        firstName: 'firstName',
        name: 'name',
        id: 'id',
        clientAdresse: Adresse(
            city: '',
            street: '',
            zipCode: 44556,
            district: '',
            houseNumber: '12'),
        createdBy: 'createdBy',
        createdOn: 'createdOn');
    return BlocProvider(
      create: (context) => sl.get<NewClientBloc>(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: Text('Herstellen neuen Kunde'),
        ),
        body: BlocBuilder<NewClientBloc, NewClientState>(
          builder: (context, state) {
            return TextFormField(
              onChanged: (value) {
                BlocProvider.of<NewClientBloc>(context)
                    .add(InputValueChanged(email: value));
              },
              maxLines: 1,
              validator: (value) {
                
              },
              decoration: InputDecoration(
                labelText: 'Name',
              ),
              toolbarOptions: ToolbarOptions(),
            );
          },
        ),
      ),
    );
  }
}
