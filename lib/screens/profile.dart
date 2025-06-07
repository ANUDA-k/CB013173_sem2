import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';
import '../screens/postad.dart';
import '../screens/explore.dart';
import '../screens/login.dart';

class ProfilePage extends StatelessWidget {
  final List<String> randomImages = [
    'https://randomuser.me/api/portraits/men/1.jpg',
    'https://randomuser.me/api/portraits/women/2.jpg',
    'https://randomuser.me/api/portraits/men/3.jpg',
    'https://randomuser.me/api/portraits/women/4.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AuthProvider>(context).user;
    final name = user?.name ?? 'User';

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProfileSection(
              name: name,
              imageUrl: randomImages[Random().nextInt(randomImages.length)],
            ),
            SizedBox(height: 20),
            CustomButton(text: 'Post Ad', onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => PostAdPage()));
            }),
            CustomButton(text: 'View Properties', onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => ExplorePage()));
            }),
            ExpansionTile(
              title: Text('My Details'),
              children: [
                ListTile(title: Text('Name: ${user?.name ?? 'N/A'}')),
                ListTile(title: Text('Email: ${user?.email ?? 'N/A'}')),
              ],
            ),
            ExpansionTile(
              title: Text('Inquiries'),
              children: [
                ListTile(title: Text('Developer: Anuda Ranasinghe')),
                ListTile(title: Text('Contact: 0774852747')),
              ],
            ),
            SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () async {
                await Provider.of<AuthProvider>(context, listen: false).logout();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => LoginPage()),
                  (route) => false,
                );
              },
              child: Text('Sign Out', style: TextStyle(color: Colors.white)),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class ProfileSection extends StatelessWidget {
  final String name;
  final String imageUrl;

  ProfileSection({required this.name, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 40),
      width: double.infinity,
      color: Color.fromARGB(255, 61, 77, 39),
      child: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(imageUrl),
          ),
          SizedBox(height: 10),
          Text(
            "Welcome $name",
            style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  CustomButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(200, 40),
          side: BorderSide(color: Color.fromARGB(255, 82, 129, 37), width: 2),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        ),
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}
