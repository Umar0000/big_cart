import 'package:flutter/material.dart';

class RegistrationProvider extends ChangeNotifier {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _password = TextEditingController();

  TextEditingController get email => _email;
  TextEditingController get password => _password;
  TextEditingController get phone => _phone;
}
