import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SendMSGmakeCALL extends StatelessWidget {
  const SendMSGmakeCALL({super.key});

  @override
  Widget build(BuildContext context) {
    final _url = Uri.parse('https://www.youtube.com/watch?v=cbLgWlyQXyM');
    final String _ph = "987654321";
    return MaterialApp(
      home: Scaffold(
        body: Container(
          alignment: Alignment.center,
          child: TextButton(
              onPressed: () async {
                // if (await canLaunchUrl(_url)) {
                //   await launchUrl(_url);
                // }
                final _call = 'tel:$_ph';
                final _msg = 'sms:$_ph';
                if (await canLaunch(_msg)) {
                  await launch(_msg);
                }
              },
              child: Text("Open URL")),
        ),
      ),
    );
  }
}
