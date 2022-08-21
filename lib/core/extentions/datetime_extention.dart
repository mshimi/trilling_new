extension DateTimeStringValue on DateTime {
  String getStringDate() {
    String day = this.day.toString();
    String year = this.year.toString();
    String month = this.month.toString();
    return '$day/$month/$year';
  }

  String getStringTime() {
    int hour = this.hour;
    int minute = this.minute;

    return 'hour: minute';
  }
}
