import 'package:flutter/material.dart';

import '../../utils/styles.dart';

class DropDownSearchable extends StatefulWidget {
  @override
  State<DropDownSearchable> createState() => _DropDownSearchableState();
}

class _DropDownSearchableState extends State<DropDownSearchable> {
  final items = ['Pakistan', 'India', 'USA', 'Brazil', 'UAE', 'Saudi Arabia'];
  String? value = "Select Country";
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: DropdownButtonFormField<String>(
            value: value,
            iconSize: 36,
            icon: const Icon(
              Icons.arrow_drop_down,
              color: white,
            ),
            isExpanded: true,
            items: items.map(buildMenuIem).toList(),
            onChanged: (value) => setState(() {
                  this.value = value;
                })));
  }

  DropdownMenuItem<String> buildMenuIem(String itme) {
    return DropdownMenuItem(value: itme, child: Text(itme));
  }
}
