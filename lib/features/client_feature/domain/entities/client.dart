import 'package:trilling_web/features/client_feature/domain/entities/adresse.dart';

class Client {
  String name;
  String firstName;
  String id;
  Adresse clientAdresse;
  List<Adresse>? deliveryAdresse;
  String createdBy;
  String createdOn;

  Client({required this.firstName, required this.name, required this.id, required this.clientAdresse, required this.createdBy, required this.createdOn, this.deliveryAdresse});
}
