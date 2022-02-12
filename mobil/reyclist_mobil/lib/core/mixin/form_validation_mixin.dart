import 'package:reyclist_mobil/core/constants/regex_constants.dart';

mixin FormValidationMixin {
  String? checkPassword(String? value) {
    if (value?.isEmpty ?? false) return null;
    if (value!.length < 8) {
      return 'Şifreniz en az 8 karakter olmalıdır';
    }
    return null;
  }

  String? checkEmail(String? value) {
    if (RegexConstants.instance.emailValidatorRegExp.hasMatch(value ?? '')) {
      return null;
    } else {
      return 'E-postanız yada doğru doldurulmalıdır.';
    }
  }

  String? checkNull(String? value) {
    if (value?.isNotEmpty ?? false) {
      return null;
    } else {
      return 'Boş bırakılmaz.';
    }
  }

  String? checkPhoneNumber(String? value) {
    if (value?.isEmpty ?? false) return null;
    if (value!.length == 11 ||
        RegexConstants.instance.phoneValidatorRegExp.hasMatch(value)) {
      return null;
    } else {
      return 'Telefonunuz 11 haneli ve 0-9 arasında olmalıdır';
    }
  }
}
