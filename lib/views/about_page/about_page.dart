import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class About_page extends StatelessWidget {
  const About_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(
            child: Padding(
                child: Text("About"), padding: EdgeInsets.only(right: 40))),
      ),
      body: SingleChildScrollView(
        child: Container(
            width: 400,
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Sneak Store',
                  style: Theme.of(context).textTheme.headline5,
                ),
                SizedBox(height: 8),
                Image.asset(
                  'assets/icons/sneak_pic.png',
                  width: 100,
                  height: 100,
                ),
               
                SizedBox(height: 16),
                
                Text(
                  'Contact Us:',
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(height: 10),
                ListTile(
                  leading: Icon(Icons.location_on),
                  title: Text('Kochi'),
                  subtitle: Text('Kunnampuram,eddapally '),
                ),
                ListTile(
                  leading: Icon(Icons.phone),
                  title: Text('9074311420'),
                ),
                ListTile(
                  leading: Icon(Icons.email),
                  title: Text('SneakerStore80@gmail.com'),
                ),
                Text(
                  'Follow Us:',
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(height: 8),
                ListTile(
                  leading: Icon(Icons.link),
                  title: Text('Facebook'),
                  onTap: () => launchUrl(Uri.parse('https://business.facebook.com/home/accounts?business_id=687266296671900')),
                ),
                ListTile(
                  leading: Icon(Icons.link),
                  title: Text('Twitter'),
                  onTap: () => launchUrl(Uri.parse('https://twitter.com/SneakStore80')),
                ),
                ListTile(
                  leading: Icon(Icons.link),
                  title: Text('Instagram'),
                  onTap: () => launchUrl(Uri.parse('https://www.instagram.com/sneakstore80/')),
                ),
              ],
            )),
      ),
      backgroundColor: Colors.white,
    );
  }
}