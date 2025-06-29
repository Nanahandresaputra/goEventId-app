import 'package:flutter/material.dart';
import 'package:go_event_id/widget/atoms/footer.dart';
import 'package:go_event_id/widget/profile/menu_profile/menu_costumer_care.dart';
import 'package:go_event_id/widget/profile/menu_profile/menu_edit_akun.dart';
import 'package:go_event_id/widget/profile/menu_profile/menu_other.dart';
import 'package:package_info_plus/package_info_plus.dart';

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

  @override
  void initState() {
    super.initState();
    _initPackageInfo();
  }

  Future<void> _initPackageInfo() async {
    final info = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = info;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: const Footer(
          defaultCurrent: 2,
        ),
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              leadingWidth: double.maxFinite,
              toolbarHeight: 120,
              leading: Container(
                width: double.maxFinite,
                padding: const EdgeInsets.all(20),
                child: const Row(
                  children: <Widget>[
                    ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                        child: Image(
                          image: AssetImage('assets/img/emoji-profile.jpg'),
                          fit: BoxFit.contain,
                        )),
                    SizedBox(
                      width: 12,
                    ),
                    Expanded(
                        child: Text(
                      'Nana Handre Saputra',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 20),
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
                child: Text('Versi ${_packageInfo.version}-Dev'),
              )
            ]))
          ],
        ),
      ),
    );
  }
}
