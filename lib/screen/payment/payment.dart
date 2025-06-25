import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:go_event_id/widget/atoms/custom_elevated_btn.dart';
import 'package:url_launcher/url_launcher.dart';

class Payment extends StatelessWidget {
  const Payment({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey webViewKey = GlobalKey();
    InAppWebViewController _webViewController;

    return MaterialApp(
      home: Scaffold(
        bottomNavigationBar: Container(
          padding: const EdgeInsets.all(14),
          decoration:
              const BoxDecoration(color: Colors.white, boxShadow: <BoxShadow>[
            BoxShadow(color: Colors.black, offset: Offset(0, 6), blurRadius: 10)
          ]),
          child: CustomElevatedBtn(
            onPressed: () {},
            label: 'Kembali Ke Beranda',
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
        floatingActionButton: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back_outlined,
          ),
          style: IconButton.styleFrom(
              backgroundColor: const Color.fromARGB(167, 255, 255, 255)),
        ),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: InAppWebView(
              key: webViewKey,
              initialUrlRequest: URLRequest(
                // url: Uri.parse( "http://192.168.0.115:3000") // local server
                url: WebUri("https://audit-kejar.my.id/"), // online server
              ),
              onWebViewCreated: (controller) {
                _webViewController = controller;
              },
              onPermissionRequest: (controller, permissionRequest) async {
                return PermissionResponse(
                  resources: permissionRequest.resources,
                  action: PermissionResponseAction.GRANT,
                );
              },
              shouldOverrideUrlLoading: (controller, navigationAction) async {
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
        ),
      ),
    );
  }
}
