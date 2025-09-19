import 'package:flutter/material.dart';
import 'package:go_event_id/widget/detail_acara/terms_conditon_data.dart';
import 'package:responsive_framework/responsive_framework.dart';

class TermsCondition extends StatelessWidget {
  const TermsCondition({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Syarat & Ketentuan Umum GoEventID',
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: ResponsiveBreakpoints.of(context).isTablet ? 20 : 16),
        ),
        const SizedBox(
          height: 10,
        ),
        for (int index = 0; index < termsConditionEvent.length; index++)
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '${index + 1}.',
                style: TextStyle(
                    fontSize:
                        ResponsiveBreakpoints.of(context).isTablet ? 20 : 14),
              ),
              const SizedBox(
                width: 6,
              ),
              Expanded(
                  child: Text(
                termsConditionEvent[index],
                style: TextStyle(
                    fontSize:
                        ResponsiveBreakpoints.of(context).isTablet ? 20 : 14),
              ))
            ],
          )
      ],
    );
  }
}
