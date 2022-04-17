import 'package:big_cart/widgets/custome_widget/custome_btn.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/check_provider/checkout_provider.dart';
import '../login_widget/widget_email_textField.dart';

class CheckoutForm extends StatelessWidget {
  const CheckoutForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(child: Builder(builder: (context) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomeEditText(
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Please Enter Name";
                    }

                    return null;
                  },
                  controller: Provider.of<CheckOutProvider>(context).name,
                  inputType: TextInputType.name,
                  iconPath: "images/ic_person.png",
                  icon: Icons.person_outline,
                  hintText: "Name"),
              const SizedBox(
                height: 10,
              ),
              CustomeEditText(
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Please Enter Email";
                    } else if (!value.contains("@")) {
                      return "@ Missing Invalid Email Please Enter Valid Email";
                    } else if (!value.contains(".com")) {
                      return " Invalid Email Please Enter Valid Email";
                    }
                    return null;
                  },
                  controller: Provider.of<CheckOutProvider>(context).name,
                  inputType: TextInputType.name,
                  iconPath: "images/ic_email.png",
                  icon: Icons.person_outline,
                  hintText: "Email Address"),
              const SizedBox(
                height: 10,
              ),
              CustomeEditText(
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Please Enter Phone";
                    } else if (!value.startsWith("03")) {
                      return "Invalid Phone Number Please start with 03";
                    } else if (value.length < 11) {
                      return "Invalid Phone Number please enter at-least 11 digit of number";
                    }
                    return null;
                  },
                  controller: Provider.of<CheckOutProvider>(context).name,
                  inputType: TextInputType.name,
                  iconPath: "images/ic_call.png",
                  icon: Icons.person_outline,
                  hintText: "Phone Number"),
              const SizedBox(
                height: 10,
              ),
              CustomeEditText(
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Please Enter Address";
                    }
                    return null;
                  },
                  controller: Provider.of<CheckOutProvider>(context).name,
                  inputType: TextInputType.name,
                  iconPath: "images/ic_address.png",
                  icon: Icons.person_outline,
                  hintText: "Address"),
              const SizedBox(
                height: 10,
              ),
              CustomeEditText(
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Please Enter zip code";
                    }
                    return null;
                  },
                  controller: Provider.of<CheckOutProvider>(context).name,
                  inputType: TextInputType.name,
                  iconPath: "images/ic_zip.png",
                  icon: Icons.person_outline,
                  hintText: "Zip Code"),
              const SizedBox(
                height: 10,
              ),
              CustomeEditText(
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Please Enter City";
                    }

                    return null;
                  },
                  controller: Provider.of<CheckOutProvider>(context).city,
                  inputType: TextInputType.name,
                  iconPath: "images/ic_city.png",
                  icon: Icons.person_outline,
                  hintText: "City"),
              const SizedBox(
                height: 10,
              ),
              CustomeEditText(
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Please Enter Phone";
                    } else if (!value.startsWith("03")) {
                      return "Invalid Phone Number Please start with 03";
                    } else if (value.length < 11) {
                      return "Invalid Phone Number please enter at-least 11 digit of number";
                    }
                    return null;
                  },
                  controller: Provider.of<CheckOutProvider>(context).name,
                  inputType: TextInputType.name,
                  iconPath: "images/ic_call.png",
                  icon: Icons.person_outline,
                  hintText: "Country"),
              const SizedBox(
                height: 50,
              ),
              CustomeButton(
                  title: "Next",
                  onPress: () {
                    var isValidate = Form.of(context)?.validate();
                    if (isValidate!) {}
                  }),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      );
    }));
  }
}
