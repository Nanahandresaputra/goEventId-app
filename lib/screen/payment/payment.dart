import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:go_event_id/screen/acara/list_acara.dart';
import 'package:go_event_id/screen/riwayat/detail_transaksi.dart';
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

//  @override
//  void initState() {
//     super.initState();

//     _webViewController = InAppWebViewController();
//   }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
        body: Container(
            padding: const EdgeInsets.only(top: 30),
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
                            image:
                                AssetImage('assets/img/loading-animate.gif'))),
                  ),
                !_isConnect
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          NetworkError(
                            onReload: () async {
                              bool result =
                                  await InternetConnection().hasInternetAccess;

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
                        onUpdateVisitedHistory: (controller, url, isReload) {
                          if (url.toString().contains('/success')) {
                            if (url
                                .toString()
                                .contains('transaction_status=settlement')) {
                              _webViewController?.reload();
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) =>
                              //             const DetailTransaksi()));
                            } else if (url.toString().contains(
                                'transaction_status=pending&action=back')) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const ListAcara()));
                            }
                          } else if (url.toString().contains('/error')) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const ListAcara()));
                          }
                        },
                        onWebViewCreated: (controller) {
                          _webViewController = controller;
                        },
                        onReceivedError: (controller, request, error) async {
                          setState(() {
                            _isConnect = false;
                            _isLoading = false;
                          });
                        },
                        onReceivedServerTrustAuthRequest:
                            (controller, challenge) async {
                          return ServerTrustAuthResponse(
                              action: ServerTrustAuthResponseAction.PROCEED);
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
                        })
              ],
            )),
      ),
    );
  }
}
