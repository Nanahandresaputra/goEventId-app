import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_event_id/feature/bloc/auth/auth_bloc.dart';
import 'package:go_event_id/screen/auth/login.dart';
import 'package:go_event_id/widget/atoms/footer.dart';
import 'package:go_event_id/widget/profile/menu_profile/menu_costumer_care.dart';
import 'package:go_event_id/widget/profile/menu_profile/menu_edit_akun.dart';
import 'package:go_event_id/widget/profile/menu_profile/menu_other.dart';
import 'package:go_event_id/widget/utils/loadin_full_screen.dart';
import 'package:go_event_id/widget/utils/panara_dialog.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:panara_dialogs/panara_dialogs.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MenuProfile extends StatefulWidget {
  const MenuProfile({super.key});

  @override
  State<MenuProfile> createState() => _MenuProfileState();
}

class _MenuProfileState extends State<MenuProfile> {
  PackageInfo _packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
    buildSignature: 'Unknown',
    installerStore: 'Unknown',
  );

  String profileNama = '';

  @override
  void initState() {
    super.initState();
    _initPackageInfo();
  }

  Future<void> _initPackageInfo() async {
    final info = await PackageInfo.fromPlatform();
    SharedPreferences getNama = await SharedPreferences.getInstance();

    String nama = getNama.getString('name') ?? '';

    setState(() {
      _packageInfo = info;
      profileNama = nama;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, stateAuth) {
        WidgetsBinding.instance.addPostFrameCallback((_) async {
          if (stateAuth is LogoutError) {
            if (stateAuth.apiExeception!.statusCode == 401) {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Login()));
              final prefs = await SharedPreferences.getInstance();
              prefs.clear();
            } else {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                showModernDialog(
                    context,
                    "Terjadi Kesalahan!",
                    stateAuth.apiExeception!.message!,
                    "Mengerti",
                    PanaraDialogType.error);
              });
            }
          } else if (stateAuth is LogoutSuccess) {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => Login()));
          }
        });
        return Scaffold(
            backgroundColor: Colors.white,
            bottomNavigationBar: const Footer(
              defaultCurrent: 2,
            ),
            body: Stack(
              children: <Widget>[
                CustomScrollView(
                  slivers: <Widget>[
                    SliverAppBar(
                      leadingWidth: double.maxFinite,
                      toolbarHeight: ResponsiveBreakpoints.of(context).isTablet
                          ? 200
                          : 120,
                      leading: Container(
                        width: double.maxFinite,
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          children: <Widget>[
                            ClipRRect(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(100)),
                                child: Image(
                                  height:
                                      ResponsiveBreakpoints.of(context).isTablet
                                          ? 80
                                          : 40,
                                  image: const AssetImage(
                                      'assets/img/emoji-profile.jpg'),
                                  fit: BoxFit.contain,
                                )),
                            const SizedBox(
                              width: 12,
                            ),
                            Expanded(
                                child: Text(
                              profileNama,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize:
                                      ResponsiveBreakpoints.of(context).isTablet
                                          ? 28
                                          : 20),
                            ))
                          ],
                        ),
                      ),
                      flexibleSpace: const FlexibleSpaceBar(
                        background: Image(
                          image: AssetImage('assets/img/profile-bg.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SliverList(
                        delegate: SliverChildListDelegate.fixed(<Widget>[
                      const MenuEditAkun(),
                      const MenuCostumerCare(),
                      const MenuProfileOther(),
                      const SizedBox(
                        height: 50,
                      ),
                      Center(
                        child: Text(
                          'Versi ${_packageInfo.version}-Dev',
                          style: TextStyle(
                              fontSize:
                                  ResponsiveBreakpoints.of(context).isTablet
                                      ? 24
                                      : 16),
                        ),
                      )
                    ]))
                  ],
                ),
                if (stateAuth is LogoutLoading) const LoadinFullScreen()
              ],
            ));
      },
    );
  }
}
