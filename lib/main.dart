// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import 'package:mad_assignment/explore.dart';
// import 'package:mad_assignment/postad.dart';
// import 'package:mad_assignment/profile.dart';
// import 'package:mad_assignment/login.dart';

// import 'providers/app_state.dart'; // Import your provider class here

// void main() {
//   runApp(
//     ChangeNotifierProvider(
//       create: (_) => AppState(),   // Provide your app state here
//       child: RealEstateApp(),
//     ),
//   );
// }

// class RealEstateApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         brightness: Brightness.light,
//         primarySwatch: Colors.green,
//         scaffoldBackgroundColor: Colors.white,
//         appBarTheme: AppBarTheme(
//           backgroundColor: Colors.white,
//           iconTheme: IconThemeData(color: Colors.green),
//           titleTextStyle: TextStyle(
//               color: Colors.green, fontSize: 20, fontWeight: FontWeight.w600),
//         ),
//         bottomNavigationBarTheme: BottomNavigationBarThemeData(
//           backgroundColor: Colors.white,
//           selectedItemColor: Colors.green,
//           unselectedItemColor: Colors.black54,
//         ),
//       ),
//       darkTheme: ThemeData(
//         brightness: Brightness.dark,
//         primarySwatch: Colors.green,
//         scaffoldBackgroundColor: Colors.black,
//         appBarTheme: AppBarTheme(
//           backgroundColor: Colors.black,
//           iconTheme: IconThemeData(color: Colors.green),
//           titleTextStyle: TextStyle(
//               color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
//         ),
//         bottomNavigationBarTheme: BottomNavigationBarThemeData(
//           backgroundColor: Colors.black,
//           selectedItemColor: Colors.green,
//           unselectedItemColor: Colors.white70,
//         ),
//       ),
//       themeMode: ThemeMode.system,
//       home: LoginPage(),
//     );
//   }
// }

// class RealEstateHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // Use the provider to get the selected index and update it
//     final appState = Provider.of<AppState>(context);

//     final List<Widget> _screens = [
//       RealEstateHomeScreen(),
//       ExplorePage(),
//       PostAdPage(),
//       ProfilePage(),
//     ];

//     void _onItemTapped(int index) {
//       appState.updateIndex(index);
//       print('Navigated to screen: $index');
//     }

//     bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

//     return Scaffold(
//       body: SafeArea(child: _screens[appState.selectedIndex]),
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: appState.selectedIndex,
//         selectedItemColor: isDarkMode ? Colors.green : Colors.black,
//         unselectedItemColor: isDarkMode ? Colors.white70 : Colors.black54,
//         type: BottomNavigationBarType.fixed,
//         onTap: _onItemTapped,
//         items: const [
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
//           BottomNavigationBarItem(icon: Icon(Icons.explore), label: "Explore"),
//           BottomNavigationBarItem(icon: Icon(Icons.add), label: "PostAd"),
//           BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
//         ],
//       ),
//     );
//   }
// }

// class RealEstateHomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     double screenHeight = MediaQuery.of(context).size.height;

//     return Scaffold(
//      appBar: AppBar(
//   backgroundColor: Colors.white,
//   elevation: 0,
//   title: Text(
//     "Real Estate",
//     style: TextStyle(
//       fontSize: 20,
//       fontWeight: FontWeight.w600,
//       color: Colors.green,
//     ),
//   ),
//   centerTitle: false,
//   actions: [
//     IconButton(
//       icon: Icon(Icons.search, color: Colors.black),
//       onPressed: () {},
//     ),
//     // Settings Dropdown Menu
//     PopupMenuButton<String>(
//       icon: Icon(Icons.settings, color: Colors.black), // Settings Icon
//       onSelected: (value) {
//         if (value == 'login') {
//           // Navigating to Login Page
//           Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
//         } else if (value == 'register') {
         
//         }
//       },
//       itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
//         PopupMenuItem<String>(
//           value: 'login',
//           child: Text('Login'),
//         ),
//         PopupMenuItem<String>(
//           value: 'register',
//           child: Text('Register'),
//         ),
//       ],
//     ),
//   ],
// ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             HeaderSection(),
//             SizedBox(height: 20),
//             CategorySection(),
//             SizedBox(height: screenHeight * 0.02),
//             SectionHeader(title: "Featured Property"),
//             SizedBox(height: screenHeight * 0.01),
//             SwipablePlaceholdersSection(),
//             SizedBox(height: screenHeight * 0.02),
//             SectionHeader(title: "Nearby Property"),
//             SizedBox(height: screenHeight * 0.01),
//             PropertyListSection(
//               orientation: MediaQuery.of(context).orientation,
//               isFeatured: false,
//             ),
//             // Full-width Image Below Nearby Property
//             SizedBox(height: 20), 
//             Container(
//               width: double.infinity,
//               height: 200, 
//               child: Image.asset(
//                 "assets/home7.png", 
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



// class HeaderSection extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 300,
//       width: double.infinity,
//       child: Stack(
//         children: [
//           Image.asset("assets/home2.jpg", width: double.infinity, height: 300, fit: BoxFit.cover),
//           Container(
//             height: 300,
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 begin: Alignment.topCenter,
//                 end: Alignment.bottomCenter,
//                 colors: [
//                   Colors.black.withOpacity(0.6),
//                   Colors.transparent,
//                 ],
//               ),
//             ),
//           ),
//           Positioned(
//             bottom: 80,
//             left: 20,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text("Find your dream property", 
//                     style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
//                 SizedBox(height: 8),
//                 Text("From 20000+ properties on Sri Lanka's no.1\nproperty portal", 
//                     style: TextStyle(color: Colors.white70, fontSize: 14)),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class CategorySection extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 0),
//       child: SingleChildScrollView(
//         scrollDirection: Axis.horizontal,
//         child: Row(
//           children: [
//             CategoryButton(icon: Icons.home, label: "House"),
//             CategoryButton(icon: Icons.apartment, label: "Apartment"),
//             CategoryButton(icon: Icons.villa, label: "Villa"),
//             CategoryButton(icon: Icons.cabin, label: "Bungalow"),
//             CategoryButton(icon: Icons.park, label: "Empty Land"),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class CategoryButton extends StatelessWidget {
//   final IconData icon;
//   final String label;

//   const CategoryButton({required this.icon, required this.label});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.symmetric(horizontal: 10.0),
//       child: Column(
//         children: [
//           // Rounded Icon Button
//           Container(
//             width: 60, 
//             height: 60,
//             decoration: BoxDecoration(
//               color: Colors.green, 
//               shape: BoxShape.circle, 
//             ),
//             child: Icon(
//               icon,
//               color: Colors.white, 
//               size: 30, 
//             ),
//           ),
//           SizedBox(height: 8), // Spacing between the icon and label
//           Text(
//             label,
//             style: TextStyle(fontSize: 13),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class SwipablePlaceholdersSection extends StatelessWidget {
//   final List<String> imagePaths = [
//     "assets/home1.jpg", 
//     "assets/hplace1.jpg",
//     "assets/hplace2.jpg",
//     "assets/hplace3.jpg",
//     "assets/hplace4.jpg"
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 300,
//       child: PageView.builder(
//         itemCount: imagePaths.length, // Use the length of imagePaths list
//         controller: PageController(viewportFraction: 0.8),
//         itemBuilder: (context, index) {
//           return Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 10.0),
//             child: Container(
//               decoration: BoxDecoration(
//                 color: Colors.grey[300],
//                 borderRadius: BorderRadius.circular(10),
//                 border: Border.all(color: Colors.grey),
//               ),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(10), // Ensure image is rounded
//                 child: Image.asset(
//                   imagePaths[index], // Use the image path from the list
//                   fit: BoxFit.cover, // Adjust to fill the space
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// class PropertyListSection extends StatelessWidget {
//   final Orientation orientation;
//   final bool isFeatured;

//   const PropertyListSection({required this.orientation, required this.isFeatured});

//   // Create a list of property data
//   final List<Map<String, dynamic>> properties = const [
//     {
//       "title": "Luxury Villa",
//       "subtitle": "Beachfront Villa",
//       "location": "Galle, Sri Lanka",
//       "price": "LKR 45,000,000",
//       "imagePath": "assets/hpcard1.jpg",
//       "rating": 4.8
//     },
//     {
//       "title": "Lxury house",
//       "subtitle": "High-Rise Living Space",
//       "location": "Colombo 03, Sri Lanka",
//       "price": "LKR 25,000,000",
//       "imagePath": "assets/hpcard2.jpg",
//       "rating": 4.5
//     },
//     {
//       "title": "Mountain Bungalow",
//       "subtitle": "Serene Hill Country Retreat",
//       "location": "Nuwara Eliya, Sri Lanka",
//       "price": "LKR 35,000,000",
//       "imagePath": "assets/hpcard3.jpg",
//       "rating": 4.7
//     },
//     {
//       "title": "Beach House",
//       "subtitle": "Oceanfront Paradise",
//       "location": "Mirissa, Sri Lanka",
//       "price": "LKR 55,000,000",
//       "imagePath": "assets/hpcard4.jpg",
//       "rating": 4.9
//     }
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 300,
//       child: orientation == Orientation.portrait
//           ? ListView.builder(
//               scrollDirection: Axis.horizontal,
//               itemCount: properties.length,
//               itemBuilder: (context, index) {
//                 final property = properties[index];
//                 return PropertyCard(
//                   title: property["title"],
//                   subtitle: property["subtitle"],
//                   location: property["location"],
//                   price: property["price"],
//                   imagePath: property["imagePath"],
//                   rating: property["rating"],
//                 );
//               },
//             )
//           : GridView.builder(
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 crossAxisSpacing: 10.0,
//                 mainAxisSpacing: 10.0,
//               ),
//               itemCount: properties.length,
//               itemBuilder: (context, index) {
//                 final property = properties[index];
//                 return PropertyCard(
//                   title: property["title"],
//                   subtitle: property["subtitle"],
//                   location: property["location"],
//                   price: property["price"],
//                   imagePath: property["imagePath"],
//                   rating: property["rating"],
//                 );
//               },
//             ),
//     );
//   }
// }

// class PropertyCard extends StatelessWidget {
//   final String title;
//   final String subtitle;
//   final String location;
//   final String price;
//   final String imagePath;
//   final double rating;

//   const PropertyCard({
//     required this.title,
//     required this.subtitle,
//     required this.location,
//     required this.price,
//     required this.imagePath,
//     required this.rating,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Semantics(
//       label: 'Property: $title, $subtitle, located at $location',
//       child: Container(
//         width: MediaQuery.of(context).size.width * 0.7,
//         margin: EdgeInsets.only(right: 10),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(10),
//           border: Border.all(color: Colors.grey[200]!),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.all(Radius.circular(10)),
//                 child: Image.asset(imagePath, height: 160, width: double.infinity, fit: BoxFit.cover),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 10.0),
//               child: Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 10.0),
//               child: Text(subtitle, style: TextStyle(fontSize: 13, color: Colors.grey[600])),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 10.0),
//               child: Text(location, style: TextStyle(fontSize: 13, color: Colors.grey[600])),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(price, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//                   Row(
//                     children: [
//                       Icon(Icons.star, size: 18, color: Colors.yellow),
//                       SizedBox(width: 4),
//                       Text(rating.toString(), style: TextStyle(fontSize: 13)),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



// class SectionHeader extends StatelessWidget {
//   final String title;

//   const SectionHeader({required this.title});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 16.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//           Text("See All", style: TextStyle(fontSize: 14, color: Colors.blue)),
//         ],
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// // import 'providers/app_state.dart';
// import 'providers/auth_provider.dart'; // Import AuthProvider
// import 'screens/login.dart';
// import 'screens/home.dart';

// void main() {
//   runApp(
//     MultiProvider(
//       providers: [
//         // ChangeNotifierProvider(create: (_) => AppState()),
//         ChangeNotifierProvider(create: (_) => AuthProvider()), // ✅ ADD THIS
//       ],
//       child: MyApp(),
//     ),
//   );
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final authProvider = Provider.of<AuthProvider>(context);

//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Real Estate App',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: authProvider.isAuthenticated ? HomeScreen() : LoginPage(),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'providers/auth_provider.dart'; // AuthProvider
// import 'package:mad_assignment/screens/login.dart';
// import 'package:mad_assignment/screens/home.dart';

// void main() {
//   runApp(
//     ChangeNotifierProvider(
//       create: (_) => AuthProvider()..loadUserData(), // ✅ Load session on app start
//       child: const MyApp(),
//     ),
//   );
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final authProvider = Provider.of<AuthProvider>(context);

//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Real Estate App',
//       theme: ThemeData(
//         primarySwatch: Colors.green,
//       ),
//       home: authProvider.isAuthenticated ? const HomeScreen() : const LoginPage(),
//     );
//   }
// }




import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/auth_provider.dart';
import 'screens/login.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => AuthProvider()..loadUserData(),
      
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lankan Real Estate',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.white,
          brightness: Brightness.light,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 1,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        cardColor: Colors.white,
        cardTheme: CardTheme(
          color: Colors.white,
          surfaceTintColor: Colors.transparent,
          elevation: 2,
          margin: EdgeInsets.all(8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.grey[100],
          hintStyle: TextStyle(color: Colors.grey.shade600),
          prefixIconColor: Colors.grey,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green,
          brightness: Brightness.dark,
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: const Color(0xFF2C2C2C),
          hintStyle: const TextStyle(color: Colors.white38),
          prefixIconColor: Colors.greenAccent,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
      ),
      themeMode: ThemeMode.system,
      home: LoginPage(),
    );
  }
}

