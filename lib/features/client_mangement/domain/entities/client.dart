
import 'package:trilling_web/features/client_mangement/domain/entities/address.dart';
import 'package:trilling_web/features/client_mangement/domain/entities/balance.dart';
import 'package:trilling_web/features/order/domain/entities/order.dart';

class Client {
  String id;
  String name;
  String firstName;
  Address adress;
  List<Order> orders;
  Balance balance;
  String? email;
  String? Telephone;

  Client({
    required this.id,
    required this.name,
    required this.firstName,
    required this.adress,
    required this.orders,
    required this.balance,
    this.email,
    this.Telephone,
  });
}
