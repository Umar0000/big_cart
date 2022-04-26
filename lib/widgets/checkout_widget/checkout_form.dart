import 'package:big_cart/provider/shop_cart_provider/shop_cart_provider.dart';
import 'package:big_cart/widgets/custome_widget/custome_btn.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/check_provider/checkout_provider.dart';
import '../login_widget/widget_email_textField.dart';

class CheckoutForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<CheckOutProvider>(context);
    var provider2 = Provider.of<ShopCartProvider>(context);
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
                controller: provider.name,
                inputType: TextInputType.name,
                iconPath: "images/ic_person.png",
                icon: Icons.person_outline,
                hintText: "Name",
                onchange: (String value) {},
              ),
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
                controller: provider.email,
                inputType: TextInputType.name,
                iconPath: "images/ic_email.png",
                icon: Icons.person_outline,
                hintText: "Email Address",
                onchange: (String value) {},
              ),
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
                controller: provider.phone,
                inputType: TextInputType.name,
                iconPath: "images/ic_call.png",
                icon: Icons.person_outline,
                hintText: "Phone Number",
                onchange: (String value) {},
              ),
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
                controller: provider.address,
                inputType: TextInputType.name,
                iconPath: "images/ic_address.png",
                icon: Icons.person_outline,
                hintText: "Address",
                onchange: (String value) {},
              ),
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
                controller: provider.zipCode,
                inputType: TextInputType.name,
                iconPath: "images/ic_zip.png",
                icon: Icons.person_outline,
                hintText: "Zip Code",
                onchange: (String value) {},
              ),
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
                controller: provider.city,
                inputType: TextInputType.name,
                iconPath: "images/ic_city.png",
                icon: Icons.person_outline,
                hintText: "City",
                onchange: (String value) {},
              ),
              const SizedBox(
                height: 10,
              ),
              CustomeEditText(
                validator: (value) {
                  if (value.isEmpty) {
                    return "Please enter country";
                  }

                  return null;
                },
                controller: provider.country,
                inputType: TextInputType.name,
                iconPath: "images/ic_country.png",
                icon: Icons.person_outline,
                hintText: "Country",
                onchange: (String value) {},
              ),
              const SizedBox(
                height: 50,
              ),
              CustomeButton(
                  title: "Next",
                  onPress: () {
                    // var isValidate = Form.of(context)?.validate();
                    // if (isValidate!) {
                    provider.createOrder(provider2.list, context);
                    // }
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
