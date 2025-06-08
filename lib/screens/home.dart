// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../providers/app_state.dart';



// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final user = Provider.of<AppState>(context).user;

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Home'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.logout),
//             onPressed: () =>
//                 Provider.of<AppState>(context, listen: false).logout(),
//           )
//         ],
//       ),
//       body: Center(
//         child: Text('Welcome, ${user['name'] ?? 'User'}'),
//       ),
//     );
//   }
// }

//old
// home.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';
import '../services/local_storage_service.dart';
import 'package:mad_assignment/screens/explore.dart';
import 'package:mad_assignment/screens/postad.dart';
import 'package:mad_assignment/screens/profile.dart';
import 'package:mad_assignment/screens/login.dart';
import 'package:mad_assignment/screens/register_screen.dart'; // Make sure this exists

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomeContent(),
    ExplorePage(),
    PostAdScreen(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<BottomNavigationBarItem> _navItems = [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explore'),
    BottomNavigationBarItem(icon: Icon(Icons.add_box), label: 'Post Ad'),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderSection(),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: _navItems,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}

class HeaderSection extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Text(
        "Real Estate",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Colors.green,
        ),
      ),
      centerTitle: false,
      actions: [
        IconButton(
          icon: Icon(Icons.search, color: Colors.black),
          onPressed: () {},
        ),
        PopupMenuButton<String>(
          icon: Icon(Icons.settings, color: Colors.black),
          onSelected: (value) {
            if (value == 'login') {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => LoginPage()));
            } else if (value == 'register_screen') {
               Navigator.push(
                  context, MaterialPageRoute(builder: (context) => RegisterPage()));
              // Add navigation to RegisterPage if available
            }
          },
          itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
            PopupMenuItem<String>(value: 'login', child: Text('Login')),
            PopupMenuItem<String>(value: 'register_screen', child: Text('register')),
          ],
        ),
      ],
    );
  }
}

class HomeContent extends StatefulWidget {
  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  @override
  void initState() {
    super.initState();
    showUserEmailSnackBar();
  }

  void showUserEmailSnackBar() async {
    final email = await LocalStorageService.getEmail();
    if (email != null && mounted) {
      Future.delayed(Duration.zero, () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Logged in as: $email'),
            duration: Duration(seconds: 3),
          ),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AuthProvider>(context).user;
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (user != null)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Welcome, ${user.name}!',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
              Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  'assets/home1.jpg',
                  width: size.width,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                left: 16,
                bottom: 16,
                child: Text(
                  'Find Your Dream Home',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        blurRadius: 6,
                        color: Colors.black.withOpacity(0.7),
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: 20),
          CategorySection(),
          SwipablePlaceholdersSection(),
          NearbyPropertySection(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Image.asset('assets/home7.png', width: size.width),
          ),
        ],
      ),
    );
  }
}

class CategorySection extends StatelessWidget {
  final List<Map<String, dynamic>> categories = [
    {'icon': Icons.apartment, 'label': 'Apartments'},
    {'icon': Icons.house, 'label': 'Houses'},
    {'icon': Icons.villa, 'label': 'Villas'},
    {'icon': Icons.business, 'label': 'Offices'},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: EdgeInsets.symmetric(vertical: 10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.blue[50],
                  child: Icon(categories[index]['icon'], color: Colors.blue),
                ),
                SizedBox(height: 8),
                Text(categories[index]['label']),
              ],
            ),
          );
        },
      ),
    );
  }
}

class SwipablePlaceholdersSection extends StatelessWidget {
  final List<String> imagePaths = [
    "assets/home1.jpg",
    "assets/hplace1.jpg",
    "assets/hplace2.jpg",
    "assets/hplace3.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: PageView.builder(
        itemCount: imagePaths.length,
        controller: PageController(viewportFraction: 0.85),
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6,
                    offset: Offset(0, 3),
                  )
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  imagePaths[index],
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class NearbyPropertySection extends StatelessWidget {
  final List<Map<String, dynamic>> properties = [
    {
      'image': 'assets/home2.jpg',
      'title': 'Luxury Villa in LA',
      'price': '\$3,500/mo',
    },
    {
      'image': 'assets/home4.jpg',
      'title': 'Modern Apartment in NY',
      'price': '\$2,200/mo',
    },
    {
      'image': 'assets/ex2.jpg',
      'title': 'Cozy House in TX',
      'price': '\$1,800/mo',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Nearby Properties",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          orientation == Orientation.portrait
              ? SizedBox(
                  height: 180,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: properties.length,
                    itemBuilder: (context, index) {
                      final property = properties[index];
                      return Container(
                        width: 250,
                        margin: EdgeInsets.only(right: 12),
                        child: Card(
                          clipBehavior: Clip.antiAlias,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                property['image'],
                                width: double.infinity,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(property['title'],
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    SizedBox(height: 4),
                                    Text(property['price']),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                )
              : GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: properties.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 3 / 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    final property = properties[index];
                    return Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            property['image'],
                            width: double.infinity,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(property['title'],
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                SizedBox(height: 4),
                                Text(property['price']),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
        ],
      ),
    );
  }
}
