import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:trilling_web/features/order_feature/domain/entities/transfer.dart';

class TransferModel extends Equatable {
  String driver;
  DateTime transferDate;
  DateTime timeFrom;
  DateTime timeTo;
  String? note;
  TransferModel({
    required this.driver,
    required this.transferDate,
    required this.timeFrom,
    required this.timeTo,
    this.note,
  });

  TransferModel copyWith({
    String? driver,
    DateTime? transferDate,
    DateTime? timeFrom,
    DateTime? timeTo,
    String? note,
  }) {
    return TransferModel(
      driver: driver ?? this.driver,
      transferDate: transferDate ?? this.transferDate,
      timeFrom: timeFrom ?? this.timeFrom,
      timeTo: timeTo ?? this.timeTo,
      note: note ?? this.note,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'driver': driver,
      'transferDate': transferDate.millisecondsSinceEpoch,
      'timeFrom': timeFrom.millisecondsSinceEpoch,
      'timeTo': timeTo.millisecondsSinceEpoch,
      'note': note,
    };
  }

  factory TransferModel.fromMap(Map<String, dynamic> map) {
    return TransferModel(
      driver: map['driver'] ?? '',
      transferDate: DateTime.fromMillisecondsSinceEpoch(map['transferDate']),
      timeFrom: DateTime.fromMillisecondsSinceEpoch(map['timeFrom']),
      timeTo: DateTime.fromMillisecondsSinceEpoch(map['timeTo']),
      note: map['note'],
    );
  }

  String toJson() => json.encode(toMap());

  factory TransferModel.fromJson(String source) =>
      TransferModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'TransferModel(driver: $driver, transferDate: $transferDate, timeFrom: $timeFrom, timeTo: $timeTo, note: $note)';
  }

  @override
  List<Object> get props {
    return [
      driver,
      transferDate,
      timeFrom,
      timeTo,
      note!,
    ];
  }

  factory TransferModel.fromDomain(Transfer transfer) {
    return TransferModel(
        driver: transfer.driver,
        transferDate: transfer.transferDate,
        timeFrom: transfer.timeFrom,
        timeTo: transfer.timeTo, note: transfer.note);
  }

  Transfer toDomain() {
    return Transfer(
        driver: driver,
        transferDate: transferDate,
        timeFrom: timeFrom,
        timeTo: timeTo, note: note);
  }
}
