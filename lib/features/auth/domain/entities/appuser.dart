class AppUser {
  String id;
  String email;
  String password;
  String name;
  String firstName;
  bool isAdmin;
  bool isDeleted;
  AppUser({
    required this.id,
    required this.email,
    required this.password,
    required this.name,
    required this.firstName,
    this.isAdmin = false,
    this.isDeleted = false,
  });
}
