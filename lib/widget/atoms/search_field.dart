import 'package:flutter/material.dart';

class SearchInput extends StatelessWidget {
  final TextEditingController textController;
  final String? hintText;
  final Function(String) onChange;
  const SearchInput(
      {required this.textController,
      this.hintText,
      required this.onChange,
      super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textController,
      onChanged: (value) {
        //Do something wi
        onChange(value);
      },
      decoration: InputDecoration(
        // prefixIcon: const Icon(
        //   Icons.search,
        //   color: Color(0xff4338CA),
        // ),
        suffixIcon: IconButton(
          onPressed: () {
            textController.text = '';
            onChange('');
          },
          icon: const Icon(Icons.cancel_outlined, color: Color(0xFF235347)),
        ),
        filled: true,
        fillColor: Colors.white,
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black12, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black12, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
      ),
    );
  }
}
