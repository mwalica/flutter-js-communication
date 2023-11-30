import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_javascript/views/first_screen.dart';
import 'package:webview_javascript/views/second_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..loadRequest(
        Uri.parse('https://srv62844.seohost.com.pl'),
      )
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..addJavaScriptChannel('messageHandler',
          onMessageReceived: (JavaScriptMessage msg) {
        print('msg: ${msg.message}');
        switch (msg.message) {
          case 'first':
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (ctx) => const FirstScreen(),
              ),
            );
            break;
          case 'second':
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (ctx) => const SecondScreen(),
              ),
            );
            break;
          default:
            throw ("error");
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: WebViewWidget(
            controller: controller,
          ),
        ),
      ),
    );
  }
}
