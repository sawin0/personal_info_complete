import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const CircleAvatar(
              radius: 100.0,
              backgroundImage: AssetImage('assets/images/sabin.png'),
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              'Sabin Ranabhat',
              style: TextStyle(
                fontSize: 40.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'FLUTTER DEVELOPER',
              style: TextStyle(
                color: Colors.teal.shade100,
                fontSize: 20.0,
                letterSpacing: 2.5,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20.0,
              width: 150.0,
              child: Divider(
                color: Colors.teal.shade100,
              ),
            ),
            Card(
                margin: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  onTap: openPhone,
                  leading: const Icon(
                    Icons.phone,
                    color: Colors.teal,
                  ),
                  title: Text(
                    '+9779846815406',
                    style: TextStyle(
                      color: Colors.teal.shade900,
                      fontSize: 20.0,
                    ),
                  ),
                )),
            Card(
              margin:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: ListTile(
                onTap: openEmail,
                leading: const Icon(
                  Icons.email,
                  color: Colors.teal,
                ),
                title: Text(
                  'binranabhat@gmail.com',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.teal.shade900,
                  ),
                ),
              ),
            ),
            Card(
              margin:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: ListTile(
                onTap: openMap,
                leading: const Icon(
                  Icons.location_city,
                  color: Colors.teal,
                ),
                title: Text(
                  'Pokhara, Nepal',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.teal.shade900,
                  ),
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }

  void openPhone() {
    //TODO: replace phone number
    final Uri phoneLaunchUri = Uri(
      scheme: 'tel',
      path: '9846815406',
    );

    launchUrl(phoneLaunchUri);
  }

  void openEmail() {
    //TODO: replace email, subject and body
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'hello@sawin.com.np',
      query: encodeQueryParameters(<String, String>{
        'subject': 'This is my first email sent programmatically',
        'body': 'Hello there\n Just Testing....\n\n Regards,\nSabin'
      }),
    );

    launchUrl(emailLaunchUri);
  }

  Future<void> openMap() async {
    //TODO: replace this latitude and longitude (28.209555218864093, 83.98560642741373) with your city's latitude and longitude
    String latitude = '28.209555218864093';
    String longitude = '83.98560642741373';
    String googleUrl =
        'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    if (await canLaunchUrlString(googleUrl)) {
      await launchUrlString(googleUrl, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not open the map.';
    }
  }
}

String? encodeQueryParameters(Map<String, String> params) {
  return params.entries
      .map((MapEntry<String, String> e) =>
          '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
      .join('&');
}
