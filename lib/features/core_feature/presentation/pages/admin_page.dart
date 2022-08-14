import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:trilling_web/features/client_feature/export.dart';
import 'package:trilling_web/features/core_feature/domain/entities/core_data.dart';
import 'package:trilling_web/features/core_feature/presentation/bloc/core_bloc.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CoreBloc coreBloc = BlocProvider.of<CoreBloc>(context);
    CoreData coreData = coreBloc.coreData;
    double height = context.getHeight();
    double width = context.getWidth();

    return Container(
        padding: EdgeInsets.all(8),
        height: height * 1.7,
        child: ListView(
          children: [
            Container(
                height: height * 0.7,
                foregroundDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all())),
          ],
        ));
  }
}
