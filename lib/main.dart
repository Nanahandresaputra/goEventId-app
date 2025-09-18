import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_event_id/feature/bloc/acara/acara_bloc.dart';
import 'package:go_event_id/feature/bloc/auth/auth_bloc.dart';
import 'package:go_event_id/feature/bloc/pemesanan/pemesanan_bloc.dart';
import 'package:go_event_id/feature/bloc/riwayat/riwayat_bloc.dart';
import 'package:go_event_id/feature/bloc/tiket_acara/tiket_acara_bloc.dart';
import 'package:go_event_id/screen/auth/login.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:toastification/toastification.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  runApp(MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(create: (context) => AuthBloc()),
        BlocProvider<AcaraBloc>(create: (context) => AcaraBloc()),
        BlocProvider<TiketAcaraBloc>(create: (context) => TiketAcaraBloc()),
        BlocProvider<PemesananBloc>(create: (context) => PemesananBloc()),
        BlocProvider<RiwayatBloc>(create: (context) => RiwayatBloc()),
      ],
      child: MaterialApp(
        builder: (context, child) {
          return ResponsiveBreakpoints(
            breakpoints: const [
              Breakpoint(start: 361, end: 450, name: MOBILE),
              Breakpoint(start: 451, end: 800, name: TABLET),
              Breakpoint(start: 801, end: 1920, name: DESKTOP),
              Breakpoint(start: 1921, end: double.infinity, name: '4K'),
            ],
            child: child!,
          );
        },
        home: ToastificationWrapper(
          child: Login(),
        ),
      )));
}
