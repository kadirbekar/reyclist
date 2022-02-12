class RegexConstants {
  static RegexConstants? _instance;
  static RegexConstants get instance =>
      _instance ??= RegexConstants._initialize();

  final RegExp emailValidatorRegExp =
      RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  final RegExp phoneValidatorRegExp = RegExp(r'^-?[0-9]+$');
  RegexConstants._initialize();
}
