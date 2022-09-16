import 'package:trilling_web/features/client_feature/export.dart';

class Packung extends Equatable {
  String name;
  double value;
  Packung({
    required this.name,
    required this.value,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [name, value];
}
