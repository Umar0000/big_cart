import 'package:flutter/material.dart';

class CheckOutProvider extends ChangeNotifier {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _address = TextEditingController();
  final TextEditingController _zipCode = TextEditingController();
  final TextEditingController _city = TextEditingController();
  final TextEditingController _country = TextEditingController();
  String _dropdownvalue = "Paistan";
  List<String>? _countrynameList;
  get dropDown => _dropdownvalue;

  TextEditingController get name => _name;

  TextEditingController get email => _email;

  TextEditingController get phone => _phone;

  TextEditingController get address => _address;

  TextEditingController get zipCode => _zipCode;

  TextEditingController get city => _city;

  TextEditingController get country => _country;

  void setDropDonw(Object? newValue) {
    _dropdownvalue = newValue! as String;
    notifyListeners();
  }

  List<String>? get countyName => _countrynameList;
}
