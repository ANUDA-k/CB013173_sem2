import 'dart:math';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:battery_plus/battery_plus.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';
import '../screens/postad.dart';
import '../screens/explore.dart';
import '../screens/login.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final Battery _battery = Battery();
  String _batteryStatus = '';
  File? _capturedImage;

  Future<void> _getBatteryStatus() async {
    final level = await _battery.batteryLevel;
    final state = await _battery.batteryState;
    setState(() {
      _batteryStatus = 'Battery: $level%, State: ${state.name}';
    });
  }

  Future<void> _openCamera() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _capturedImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AuthProvider>(context).user;
    final name = user?.name ?? 'User';
    final randomImages = [
      'https://randomuser.me/api/portraits/men/1.jpg',
      'https://randomuser.me/api/portraits/women/2.jpg',
      'https://randomuser.me/api/portraits/men/3.jpg',
      'https://randomuser.me/api/portraits/women/4.jpg',
    ];

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProfileSection(
              name: name,
              imageUrl: randomImages[Random().nextInt(randomImages.length)],
              onCameraTap: _openCamera,
            ),
            if (_capturedImage != null)
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.file(_capturedImage!, height: 200),
              ),
            SizedBox(height: 20),
            CustomButton(
              text: 'Post Ad',
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => PostAdScreen()));
              },
            ),
            CustomButton(
              text: 'View Properties',
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => ExplorePage()));
              },
            ),
            CustomButton(
              text: 'Show Battery Status',
              onPressed: _getBatteryStatus,
            ),
            if (_batteryStatus.isNotEmpty)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  _batteryStatus,
                  style: TextStyle(fontSize: 16, color: Colors.green),
                ),
              ),
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
  final VoidCallback onCameraTap;

  ProfileSection({
    required this.name,
    required this.imageUrl,
    required this.onCameraTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 40),
      width: double.infinity,
      color: Color.fromARGB(255, 61, 77, 39),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(imageUrl),
              ),
              IconButton(
                icon: Icon(Icons.camera_alt, color: Colors.white),
                onPressed: onCameraTap,
              ),
            ],
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
