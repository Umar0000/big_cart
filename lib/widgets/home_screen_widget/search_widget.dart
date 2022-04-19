import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hint;

  const SearchWidget({Key? key, required this.controller, required this.hint})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color(0xffF4F5F9),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                enabledBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                hintText: hint,
                prefixIcon: const Icon(Icons.search_outlined),
              ),
            ),
          ),
          Container(
              margin: const EdgeInsets.only(right: 20),
              child: Image.asset("images/ic_filter.png"))
        ],
      ),
    );
  }
}
