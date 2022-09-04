import 'package:data_tables/data_tables.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trilling_web/core/extentions/mediaquery_extention.dart';
import 'package:trilling_web/features/order_feature/presentation/bloc/orders_bloc/orders_bloc.dart';
import 'package:trilling_web/injection.dart';
import 'package:trilling_web/features/order_feature/domain/entities/order.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl.get<OrdersBloc>()..add(GetFutureOrdersEvent()),
      child: BlocConsumer<OrdersBloc, OrdersState>(
        listener: (context, state) {},
        builder: (context, state) {
          double height = context.getHeight();
          double width = context.getWidth();

          OrdersBloc ordersBloc = BlocProvider.of<OrdersBloc>(context);
          List<Order> orders = ordersBloc.orders;

          print(orders.length);

          return ListView(
            children: [
              SizedBox(
                height: height * 0.8,
                child: NativeDataTable.builder(
                    columns: [DataColumn(label: Text(''))],
                    itemCount: orders.length,
                    itemBuilder: (index) => DataRow(
                        cells: [DataCell(Text(orders[index].client.name))])),
              )
            ],
          );
        },
      ),
    );
  }
}
