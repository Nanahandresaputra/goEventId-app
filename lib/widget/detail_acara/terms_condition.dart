import 'package:flutter/material.dart';
import 'package:go_event_id/widget/detail_acara/terms_conditon_data.dart';

class TermsCondition extends StatelessWidget {
  const TermsCondition({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Syarat & Ketentuan Umum GoEventID',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
        ),
        const SizedBox(
          height: 10,
        ),
        for (int index = 0; index < termsConditionEvent.length; index++)
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('${index + 1}.'),
              const SizedBox(
                width: 6,
              ),
              Expanded(child: Text(termsConditionEvent[index]))
            ],
          )
      ],
    );
  }
}
