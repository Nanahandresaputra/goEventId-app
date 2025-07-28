import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_event_id/feature/bloc/auth/auth_bloc.dart';
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
          const Text(
            'Lainnya',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 18,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.info,
                    color: Color(0xFF4E4F54),
                    size: 26,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Tentang GoEventID',
                    style: TextStyle(fontSize: 18),
                  )
                ],
              ),
              Icon(
                Icons.keyboard_arrow_right_outlined,
                color: Color(0xFF4E4F54),
                size: 35,
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
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.logout,
                      color: Color(0xFF4E4F54),
                      size: 26,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Keluar',
                      style: TextStyle(fontSize: 18),
                    )
                  ],
                ),
                Icon(
                  Icons.keyboard_arrow_right_outlined,
                  color: Color(0xFF4E4F54),
                  size: 35,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
