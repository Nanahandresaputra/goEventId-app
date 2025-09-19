import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_event_id/feature/bloc/auth/auth_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MenuProfileOther extends StatelessWidget {
  const MenuProfileOther({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Lainnya',
            style: TextStyle(
                fontSize: ResponsiveBreakpoints.of(context).isTablet ? 28 : 20,
                fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 18,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.info,
                    color: const Color(0xFF4E4F54),
                    size: ResponsiveBreakpoints.of(context).isTablet ? 36 : 26,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Tentang GoEventID',
                    style: TextStyle(
                        fontSize: ResponsiveBreakpoints.of(context).isTablet
                            ? 24
                            : 18),
                  )
                ],
              ),
              Icon(
                Icons.keyboard_arrow_right_outlined,
                color: const Color(0xFF4E4F54),
                size: ResponsiveBreakpoints.of(context).isTablet ? 43 : 35,
              )
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          InkWell(
            onTap: () async {
              context.read<AuthBloc>().add(LogoutEvent());

              final prefs = await SharedPreferences.getInstance();
              prefs.clear();

              await Future.delayed(const Duration(seconds: 1));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.logout,
                      color: const Color(0xFF4E4F54),
                      size:
                          ResponsiveBreakpoints.of(context).isTablet ? 36 : 26,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Keluar',
                      style: TextStyle(
                          fontSize: ResponsiveBreakpoints.of(context).isTablet
                              ? 24
                              : 18),
                    )
                  ],
                ),
                Icon(
                  Icons.keyboard_arrow_right_outlined,
                  color: const Color(0xFF4E4F54),
                  size: ResponsiveBreakpoints.of(context).isTablet ? 43 : 35,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
