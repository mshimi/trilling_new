class Address {
  String street;
  String city;
  String district;
  String houseNumber;
  int zipCode;
  String? description;
  Address({
    required this.street,
    required this.city,
    required this.district,
    required this.houseNumber,
    required this.zipCode,
    this.description,
  });
}
