class RegisterRequestBody {
  String name;
  String email;
  String password;
  String confirmpassword;
  String? adderss;
  String? city;

  RegisterRequestBody({
    required this.name,
    required this.email,
    required this.password,
    required this.confirmpassword,
    this.adderss,
    this.city,
  });
}
