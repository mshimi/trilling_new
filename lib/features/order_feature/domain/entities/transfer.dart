class Transfer {
  String driver;
  DateTime transferDate;
  DateTime timeFrom;
  DateTime timeTo;
  String? note;
  Transfer({
    required this.driver,
    required this.transferDate,
    required this.timeFrom,
    required this.timeTo,
    this.note
  });
}
