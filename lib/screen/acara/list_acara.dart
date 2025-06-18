import 'package:flutter/material.dart';
import 'package:go_event_id/widget/atoms/input_field.dart';

class ListAcara extends StatelessWidget {
  const ListAcara({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          flexibleSpace: Row(
            children: <Widget>[
              InputField(
                prefixIcon: const Icon(Icons.search),
                label: 'Cari Acara',
              )
            ],
          ),
        ),
      ),
    );
  }
}
