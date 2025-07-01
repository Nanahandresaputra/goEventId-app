import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:go_event_id/feature/bloc/pemesanan/pemesanan_bloc.dart';
import 'package:go_event_id/screen/acara/list_acara.dart';
import 'package:go_event_id/screen/riwayat/detail_transaksi.dart';
import 'package:go_event_id/screen/riwayat/riwayat_transaksi.dart';
import 'package:go_event_id/widget/atoms/custom_elevated_btn.dart';
import 'package:go_event_id/widget/execption_message/network_error.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class Payment extends StatefulWidget {
  final String? snapMidtransUrl;
  const Payment({super.key, required this.snapMidtransUrl});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  final GlobalKey webViewKey = GlobalKey();
  InAppWebViewController? _webViewController;

  bool _isLoading = true;
  bool _isConnect = true;
  bool _showUpdateStatusBtn = false;

//  @override
//  void initState() {
//     super.initState();

//   }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocBuilder<PemesananBloc, PemesananState>(
        builder: (context, state) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (state is UpdatePemesananSuccess) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RiwayatTransaksi()));
            }
          });

          return Scaffold(
            floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
            // bottomNavigationBar:
            //     state is PemesananSuccess && _showUpdateStatusBtn
            //         ? Container(
            //             padding: const EdgeInsets.only(
            //                 left: 14, right: 14, bottom: 40, top: 40),
            //             decoration: const BoxDecoration(
            //                 color: Colors.white,
            //                 boxShadow: <BoxShadow>[
            //                   BoxShadow(
            //                       color: Colors.black,
            //                       offset: Offset(0, 6),
            //                       blurRadius: 10)
            //                 ]),
            //             child: CustomElevatedBtn(
            //               isLoading: state is PemesananLoading,
            //               onPressed: () async {
            //                 context.read<PemesananBloc>().add(
            //                         UpdatePemesananEvent(updatePemesananBody: {
            //                       "kode_pemesanan":
            //                           state.pemesnanModel.data.kodePemesanan
            //                     }));
            //                 await Future.delayed(const Duration(seconds: 1));
            //               },
            //               label: 'Lihat Riwayat Pemesanan',
            //             ),
            //           )
            //         : const SizedBox(),
            body: Container(
                padding: const EdgeInsets.only(top: 50),
                color: _isLoading || !_isConnect
                    ? Colors.white
                    : const Color(0xFF235347),
                height: MediaQuery.of(context).size.height,
                child: Stack(
                  children: <Widget>[
                    if (_isLoading)
                      const Center(
                        child: SizedBox(
                            width: 200,
                            height: 200,
                            child: Image(
                                image: AssetImage(
                                    'assets/img/loading-animate.gif'))),
                      ),
                    !_isConnect && !_isLoading
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              NetworkError(
                                onReload: () async {
                                  bool result = await InternetConnection()
                                      .hasInternetAccess;

                                  setState(() {
                                    _isConnect = result;
                                    _isLoading = true;
                                  });
                                },
                              )
                            ],
                          )
                        : InAppWebView(
                            key: webViewKey,
                            initialUrlRequest: URLRequest(
                              url: WebUri(widget.snapMidtransUrl ??
                                  'http://example.com/error'),
                            ),
                            onProgressChanged: (controller, progress) async {
                              bool result =
                                  await InternetConnection().hasInternetAccess;
                              if (progress >= 100) {
                                setState(() {
                                  _isLoading = false;
                                  _isConnect = result;
                                });
                              }
                            },
                            initialSettings:
                                InAppWebViewSettings(clearCache: true),
                            onLoadStart: (controller, resource) async {
                              bool result =
                                  await InternetConnection().hasInternetAccess;

                              setState(() {
                                _isConnect = result;
                                _isLoading = true;
                              });
                            },
                            onUpdateVisitedHistory:
                                (controller, url, isReload) async {
                              if (url.toString().contains('/success')) {
                                if (url.toString().contains(
                                    'transaction_status=settlement')) {
                                  if (_webViewController != null) {
                                    _webViewController!.loadUrl(
                                        urlRequest: URLRequest(
                                            url: WebUri(widget
                                                    .snapMidtransUrl ??
                                                'http://example.com/error')));
                                  }

                                  setState(() {
                                    _showUpdateStatusBtn = true;
                                  });

                                  // if (state is PemesananSuccess) {
                                  // context.read<PemesananBloc>().add(
                                  //         UpdatePemesananEvent(
                                  //             updatePemesananBody: {
                                  //           "kode_pemesanan": state
                                  //               .pemesnanModel
                                  //               .data
                                  //               .kodePemesanan
                                  //         }));
                                  // await Future.delayed(
                                  //     const Duration(seconds: 1));
                                  // }
                                } else if (url.toString().contains(
                                    'transaction_status=pending&action=back')) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const ListAcara()));
                                }
                              } else if (url.toString().contains('/error')) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ListAcara()));
                              }
                            },
                            onWebViewCreated: (controller) {
                              _webViewController = controller;
                            },
                            onReceivedError:
                                (controller, request, error) async {
                              print(
                                  'webiew error ---> ${error.type} ${error.description} ${request.url}');
                              if (request.url
                                  .toString()
                                  .contains('transaction_status=settlement')) {
                                if (_webViewController != null) {
                                  _webViewController!.loadUrl(
                                      urlRequest: URLRequest(
                                          url: WebUri(widget.snapMidtransUrl ??
                                              'http://example.com/error')));
                                }
                              } else {
                                setState(() {
                                  _isConnect = false;
                                  _isLoading = false;
                                });
                              }
                            },
                            onReceivedServerTrustAuthRequest:
                                (controller, challenge) async {
                              return ServerTrustAuthResponse(
                                  action:
                                      ServerTrustAuthResponseAction.PROCEED);
                            },
                            onPermissionRequest:
                                (controller, permissionRequest) async {
                              return PermissionResponse(
                                resources: permissionRequest.resources,
                                action: PermissionResponseAction.GRANT,
                              );
                            },
                            shouldOverrideUrlLoading:
                                (controller, navigationAction) async {
                              var uri = navigationAction.request.url!;
                              if (![
                                "http",
                                "https",
                                "file",
                                "chrome",
                                "data",
                                "javascript",
                                "about"
                              ].contains(uri.scheme)) {
                                if (await canLaunchUrl(uri)) {
                                  await launchUrl(uri);
                                  return NavigationActionPolicy.CANCEL;
                                }
                              }
                              return NavigationActionPolicy.ALLOW;
                            }),
                    if (state is PemesananSuccess && _showUpdateStatusBtn)
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          width: double.maxFinite,
                          padding: const EdgeInsets.only(
                              left: 14, right: 14, bottom: 40, top: 40),
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                    color: Colors.black,
                                    offset: Offset(0, 6),
                                    blurRadius: 10)
                              ]),
                          child: CustomElevatedBtn(
                            isLoading: state is UpdatePemesananLoading,
                            onPressed: () async {
                              context.read<PemesananBloc>().add(
                                      UpdatePemesananEvent(
                                          updatePemesananBody: {
                                        "kode_pemesanan": state
                                            .pemesnanModel.data.kodePemesanan
                                      }));
                              await Future.delayed(const Duration(seconds: 1));
                            },
                            label: 'Lihat Riwayat Pemesanan',
                          ),
                        ),
                      ),
                  ],
                )),
          );
        },
      ),
    );
  }
}
