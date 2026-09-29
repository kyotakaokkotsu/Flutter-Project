import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyTextfieldCal extends StatelessWidget {
  // list variabel parameter yang digunakan
  // untuk diisikan ketika dipanggil

  final String myHint;
  final TextEditingController txtController;
  final List<TextInputFormatter>? inputFormatters;

  const MyTextfieldCal({
    super.key,
    required this.myHint,
    required this.txtController,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: txtController,

      inputFormatters: inputFormatters,

      decoration: InputDecoration(
        hintText: myHint,
        border: OutlineInputBorder(
        ),
      ),
    );
  }
}