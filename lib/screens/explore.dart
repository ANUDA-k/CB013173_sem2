// import 'package:flutter/material.dart';
// import 'package:mad_assignment/exprofile.dart';
// import 'package:provider/provider.dart';
// import '../providers/auth_provider.dart';

// class ExplorePage extends StatelessWidget {
//   final List<Map<String, dynamic>> properties = [
//     {
//       'title': 'Seaside Road, Burnmouth - Garden',
//       'agent': 'By Kate',
//       'price': 'LKR425,000,000',
//       'bedrooms': 5,
//       'bathrooms': 2,
//       'image': 'assets/ex1.jpg',
//       'description': 'A beautiful property with a garden in Brighton.'
//     },
//     {
//       'title': 'Nuwara Eliya - Cottage by the Hills',
//       'agent': 'By Country Homes',
//       'price': 'LKR180,000,000',
//       'bedrooms': 2,
//       'bathrooms': 1,
//       'image': 'assets/ex2.jpg',
//       'description': 'A charming cottage with breathtaking views of tea plantations.'
//     },
//     {
//       'title': 'Kandy - Lake view Bungalow',
//       'agent': 'By Central Property Developers',
//       'price': 'LKR 90,000,000',
//       'bedrooms': 2,
//       'bathrooms': 1,
//       'image': 'assets/ex3.jpg',
//       'description': 'A peaceful bungalow overlooking the scenic Kandy Lake.'
//     },
//     {
//       'title': 'Negambo - Modern Seaside House',
//       'agent': 'By Coastal Realty',
//       'price': 'LKR 130,000,000',
//       'bedrooms': 2,
//       'bathrooms': 1,
//       'image': 'assets/ex4.jpg',
//       'description': 'A contemorary house just minutes from the beach in Negambo.'
//     },
//     {
//       'title': 'Mirissa - Oceanfront Villa',
//       'agent': 'By Seaside Realty',
//       'price': 'LKR 200,000,000',
//       'bedrooms': 2,
//       'bathrooms': 1,
//       'image': 'assets/ex5.jpg',
//       'description': 'A stunning oceanfront villa with an infinity pool in Mirissa.'
//     },
//     {
//       'title': 'Dambulla - Luxury Estate',
//       'agent': 'By Nature Retreats',
//       'price': 'LKR 150,000,000',
//       'bedrooms': 2,
//       'bathrooms': 1,
//       'image': 'assets/ex6.jpg',
//       'description': 'A sprawling estate near the Sigigrya rock fortress.'
//     },
//     {
//       'title': 'Haputale - Mountain View Home',
//       'agent': 'By Highlands Realty',
//       'price': 'LKR 88,000,000',
//       'bedrooms': 2,
//       'bathrooms': 1,
//       'image': 'assets/ex7.jpg',
//       'description': 'A peaceful home with panoramic mountain view in Haputale.'
//     },
//     {
//       'title': 'Battaramulla - Modern Family House',
//       'agent': 'By Urban Homes',
//       'price': 'LKR 65,000,000',
//       'bedrooms': 2,
//       'bathrooms': 1,
//       'image': 'assets/ex8.jpg',
//       'description': 'A spacious home in a prime residential area of Colombo.'
//     },
//     {
//       'title': 'Trincomalee - Beachfront Paradise',
//       'agent': 'By Tropical Realty',
//       'price': 'LKR 220,000,000',
//       'bedrooms': 2,
//       'bathrooms': 1,
//       'image': 'assets/ex9.jpg',
//       'description': 'A luxurious beachfront villa with direct access to pristine white sand beaches in Trincomalee.'
//     },
//     {
//       'title': 'Anuradhapura - Heritage Bungalow',
//       'agent': 'By Ancient Homes',
//       'price': 'LKR 110,000,000',
//       'bedrooms': 2,
//       'bathrooms': 1,
//       'image': 'assets/home7.png',
//       'description': 'A beautifully restored heritage bungalow surrounded by lush green, near the ancient ruins of Anuradhapura.'
//     },
//     {
//       'title': 'Jaffna - Modern city Residence',
//       'agent': 'By Northern Star Properties',
//       'price': 'LKR 80,000,000',
//       'bedrooms': 2,
//       'bathrooms': 1,
//       'image': 'assets/home5.png',
//       'description': 'A contemporary city house in the heart of Jaffna, perfect for a growing family or an investment opportunity.'
//     },
//   ];

//   @override
//   Widget build(BuildContext context) {
//     final authProvider = Provider.of<AuthProvider>(context);

//     return OrientationBuilder(
//       builder: (context, orientation) {
//         return Scaffold(
//           appBar: AppBar(
//             backgroundColor: const Color.fromARGB(255, 254, 254, 254),
//             elevation: 0,
//             title: Text(
//               "Real Estate",
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.w600,
//                 color: Colors.green,
//               ),
//             ),
//             centerTitle: false,
//             actions: [
//               IconButton(
//                 icon: Icon(Icons.search, color: Colors.black),
//                 onPressed: () {
//                   // You can add search functionality here
//                 },
//               ),
//               IconButton(
//                 icon: Icon(Icons.settings, color: Colors.black),
//                 onPressed: () {
//                   // You can add settings functionality here
//                 },
//               ),
//               if (authProvider.isAuthenticated)
//                 IconButton(
//                   icon: Icon(Icons.logout, color: Colors.black),
//                   onPressed: () => authProvider.logout(),
//                   tooltip: 'Logout',
//                 ),
//             ],
//           ),
//           body: SingleChildScrollView(
//             physics: BouncingScrollPhysics(),
//             child: Column(
//               children: [
//                 HeaderSection(),
//                 orientation == Orientation.portrait
//                     ? _buildListView(context)
//                     : _buildGridView(context),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }

//   Widget _buildListView(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     return ListView.builder(
//       physics: NeverScrollableScrollPhysics(),
//       shrinkWrap: true,
//       itemCount: properties.length,
//       itemBuilder: (context, index) {
//         return GestureDetector(
//           onTap: () {
//             Navigator.push(
//               context,
//               PageRouteBuilder(
//                 pageBuilder: (context, animation, secondaryAnimation) {
//                   return PropertyProfilePage(property: properties[index]);
//                 },
//                 transitionsBuilder:
//                     (context, animation, secondaryAnimation, child) {
//                   const begin = Offset(1.0, 0.0); // Slide from the right
//                   const end = Offset.zero;
//                   const curve = Curves.easeInOut;

//                   var tween =
//                       Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
//                   var offsetAnimation = animation.drive(tween);

//                   return SlideTransition(position: offsetAnimation, child: child);
//                 },
//               ),
//             );
//           },
//           child: Card(
//             elevation: 4,
//             margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//             child: Container(
//               height: screenWidth < 360 ? 80 : 100,
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.circular(12.0),
//                       child: properties[index]['image'] != null
//                           ? Image.asset(
//                               properties[index]['image'],
//                               fit: BoxFit.cover,
//                               width: 80,
//                               height: 80,
//                               errorBuilder: (context, error, stackTrace) {
//                                 return Icon(Icons.image_not_supported,
//                                     size: 80, color: Colors.grey);
//                               },
//                             )
//                           : Icon(Icons.image_not_supported,
//                               size: 80, color: Colors.grey),
//                     ),
//                   ),
//                   Expanded(
//                     child: Padding(
//                       padding:
//                           const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(
//                             properties[index]['title'],
//                             style: TextStyle(
//                                 fontSize: screenWidth < 360 ? 10 : 12,
//                                 fontWeight: FontWeight.bold),
//                             maxLines: 1,
//                             overflow: TextOverflow.ellipsis,
//                           ),
//                           SizedBox(height: 4),
//                           Text(properties[index]['agent'],
//                               style: TextStyle(fontSize: 10)),
//                           SizedBox(height: 4),
//                           Text(properties[index]['price'],
//                               style: TextStyle(
//                                   fontSize: 12,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.green)),
//                           SizedBox(height: 4),
//                           Row(
//                             children: [
//                               Icon(Icons.king_bed, size: 12, color: Colors.grey),
//                               SizedBox(width: 4),
//                               Text('${properties[index]['bedrooms']}',
//                                   style: TextStyle(fontSize: 10)),
//                               SizedBox(width: 16),
//                               Icon(Icons.bathtub, size: 12, color: Colors.grey),
//                               SizedBox(width: 4),
//                               Text('${properties[index]['bathrooms']}',
//                                   style: TextStyle(fontSize: 10)),
//                             ],
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }

//   Widget _buildGridView(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     return GridView.builder(
//       physics: NeverScrollableScrollPhysics(),
//       shrinkWrap: true,
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: screenWidth < 600 ? 1 : 2,
//         childAspectRatio: screenWidth < 600 ? 3 / 2 : 4 / 3,
//       ),
//       itemCount: properties.length,
//       itemBuilder: (context, index) {
//         return GestureDetector(
//           onTap: () {
//             Navigator.push(
//               context,
//               PageRouteBuilder(
//                 pageBuilder: (context, animation, secondaryAnimation) {
//                   return PropertyProfilePage(property: properties[index]);
//                 },
//                 transitionsBuilder:
//                     (context, animation, secondaryAnimation, child) {
//                   const begin = Offset(1.0, 0.0); // Slide from the right
//                   const end = Offset.zero;
//                   const curve = Curves.easeInOut;

//                   var tween =
//                       Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
//                   var offsetAnimation = animation.drive(tween);

//                   return SlideTransition(position: offsetAnimation, child: child);
//                 },
//               ),
//             );
//           },
//           child: Card(
//             elevation: 4,
//             margin: EdgeInsets.all(8),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Expanded(
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(12.0),
//                     child: properties[index]['image'] != null
//                         ? Image.asset(
//                             properties[index]['image'],
//                             fit: BoxFit.cover,
//                             width: double.infinity,
//                             errorBuilder: (context, error, stackTrace) {
//                               return Center(
//                                   child: Icon(Icons.image_not_supported,
//                                       size: 40, color: Colors.grey));
//                             },
//                           )
//                         : Center(
//                             child: Icon(Icons.image_not_supported,
//                                 size: 40, color: Colors.grey)),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(4.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         properties[index]['title'],
//                         style: TextStyle(
//                             fontSize: screenWidth < 600 ? 12 : 14,
//                             fontWeight: FontWeight.bold),
//                         maxLines: 1,
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                       Text(properties[index]['agent'],
//                           style: TextStyle(fontSize: 10)),
//                       Text(properties[index]['price'],
//                           style: TextStyle(
//                               fontSize: 12,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.green)),
//                       Row(
//                         children: [
//                           Icon(Icons.king_bed, size: 12, color: Colors.grey),
//                           SizedBox(width: 4),
//                           Text('${properties[index]['bedrooms']}',
//                               style: TextStyle(fontSize: 10)),
//                           SizedBox(width: 16),
//                           Icon(Icons.bathtub, size: 12, color: Colors.grey),
//                           SizedBox(width: 4),
//                           Text('${properties[index]['bathrooms']}',
//                               style: TextStyle(fontSize: 10)),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

// class HeaderSection extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Text(
//         'Properties to Explore',
//         style: TextStyle(
//           fontSize: screenWidth < 360 ? 18 : 24,
//           fontWeight: FontWeight.bold,
//           color: Colors.green[700],
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// // import 'package:provider/provider.dart';
// // import '../providers/app_state.dart';
// // import '../widgets/property_card.dart';

// class ExplorePage extends StatelessWidget {
//   const ExplorePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // final provider = Provider.of<AppState>(context);

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Explore Properties"),
//       ),
//       // body: Padding(
//       //   padding: const EdgeInsets.all(16.0),
//       //   child: provider.properties.isEmpty
//       //       ? const Center(
//       //           child: Text("No properties available."),
//       //         )
//       //       : ListView.builder(
//       //           itemCount: provider.properties.length,
//       //           itemBuilder: (context, index) {
//       //             return PropertyCard(
//       //               property: provider.properties[index],
//       //               onTap: () {
//       //                 // TODO: Navigate to detail page or handle tap
//       //                 debugPrint("Tapped on: ${provider.properties[index].topic}");
//       //               },
//       //             );
//       //           },
//       //         ),
//       // ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import '../models/property.dart';
// import '../services/api_service.dart';
// import 'exprofile.dart'; // Import the profile screen

// class ExplorePage extends StatelessWidget {
//   const ExplorePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<List<Property>>(
//       future: ApiService.fetchProperties(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Center(child: CircularProgressIndicator());
//         } else if (snapshot.hasError) {
//           return const Center(child: Text('Error loading properties'));
//         } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//           return const Center(child: Text('No properties available'));
//         }

//         final properties = snapshot.data!;
//         properties.sort((a, b) => b.id.compareTo(a.id)); // Newest first

//         return ListView.builder(
//           itemCount: properties.length,
//           itemBuilder: (context, index) {
//             final property = properties[index];
//             final imageUrl = property.images.isNotEmpty
//                 ? property.images[0].startsWith('http')
//                     ? property.images[0]
//                     : 'http://10.0.2.2:8000/${property.images[0]}'
//                 : null;

//             return Card(
//               margin: const EdgeInsets.all(8),
//               child: ListTile(
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => PropertyProfilePage(property: property),
//                     ),
//                   );
//                 },
//                 leading: imageUrl != null
//                     ? Image.network(imageUrl, width: 60, fit: BoxFit.cover)
//                     : const Icon(Icons.home, size: 40),
//                 title: Text(property.topic),
//                 subtitle: Text(
//                   '${property.rooms} rooms • ${property.bathrooms} baths • Rs.${property.price}',
//                 ),
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
// }

//just added
import 'package:flutter/material.dart';
import '../models/property.dart';
import '../services/api_service.dart';
import 'exprofile.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    final isLandscape = orientation == Orientation.landscape;

    final double cardHeight = isLandscape ? 180 : 120;
    final double imageWidth = isLandscape ? 140 : 100;
    final double fontSizeTitle = isLandscape ? 18 : 16;
    final double fontSizeSubtitle = isLandscape ? 16 : 14;

    return Scaffold(
      body: FutureBuilder<List<Property>>(
        future: ApiService.fetchProperties(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error loading properties'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No properties available'));
          }

          final properties = snapshot.data!;
          properties.sort((a, b) => b.id.compareTo(a.id)); // Newest first

          return SingleChildScrollView(
            child: Column(
              children: [
                // Scrollable Top Image
                Stack(
                  children: [
                    Image.asset(
                      'assets/home6.png',
                      width: double.infinity,
                      height: isLandscape ? 240 : 200,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      left: 16,
                      bottom: 16,
                      child: Text(
                        "From 20000+ properties on Sri Lanka's no.1\nproperty portal",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: isLandscape ? 18 : 16,
                          fontWeight: FontWeight.bold,
                          shadows: const [
                            Shadow(
                              offset: Offset(1, 1),
                              blurRadius: 3,
                              color: Colors.black45,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                // Property Cards List
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: properties.length,
                  itemBuilder: (context, index) {
                    final property = properties[index];
                    final imageUrl = property.images.isNotEmpty
                        ? property.images[0].startsWith('http')
                            ? property.images[0]
                            : 'http://10.0.2.2:8000/${property.images[0]}'
                        : null;

                    return Card(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      child: SizedBox(
                        height: cardHeight,
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(10),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    PropertyProfilePage(property: property),
                              ),
                            );
                          },
                          leading: imageUrl != null
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                    imageUrl,
                                    width: imageWidth,
                                    height: cardHeight,
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : const Icon(Icons.home, size: 60),
                          title: Text(
                            property.topic,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: fontSizeTitle,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            '${property.rooms} rooms • ${property.bathrooms} baths\nRs. ${property.price}',
                            style: TextStyle(fontSize: fontSizeSubtitle),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}





//the new code
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../models/property.dart';
// import '../providers/property_provider.dart';
// import '../services/api_service.dart';
// import 'exprofile.dart';

// class ExplorePage extends StatelessWidget {
//   const ExplorePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final localProperties = Provider.of<PropertyProvider>(context).localProperties;

//     return FutureBuilder<List<Property>>(
//       future: ApiService.fetchProperties(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Center(child: CircularProgressIndicator());
//         } else if (snapshot.hasError) {
//           return const Center(child: Text('Error loading properties'));
//         }

//         final remoteProperties = snapshot.data ?? [];
//         remoteProperties.sort((a, b) => b.id.compareTo(a.id)); // Newest first

//         final allCards = <Widget>[];

//         // 🏠 Local properties from form
//         for (var property in localProperties.reversed) {
//           final double priceValue = double.tryParse(property.price) ?? 0.0;

//           allCards.add(
//             Card(
//               margin: const EdgeInsets.all(8),
//               child: ListTile(
//                 onTap: () {
//                   showDialog(
//                     context: context,
//                     builder: (_) => AlertDialog(
//                       title: Text(property.title),
//                       content: Column(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           if (property.imagePaths.isNotEmpty)
//                             Image.file(File(property.imagePaths.first), height: 150, fit: BoxFit.cover),
//                           Text("LKR ${priceValue.toStringAsFixed(2)}"),
//                           Text(property.location),
//                           Text(property.description),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//                 leading: property.imagePaths.isNotEmpty
//                     ? Image.file(File(property.imagePaths.first), width: 60, fit: BoxFit.cover)
//                     : const Icon(Icons.photo_library, size: 40),
//                 title: Text(property.title),
//                 subtitle: Text(
//                   '${property.category} • LKR ${priceValue.toStringAsFixed(0)}',
//                 ),
//               ),
//             ),
//           );
//         }

//         // 🌐 Remote properties from API
//         for (var property in remoteProperties) {
//           final imageUrl = property.images.isNotEmpty
//               ? property.images[0].startsWith('http')
//                   ? property.images[0]
//                   : 'http://10.0.2.2:8000/${property.images[0]}'
//               : null;

//           allCards.add(
//             Card(
//               margin: const EdgeInsets.all(8),
//               child: ListTile(
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => PropertyProfilePage(property: property),
//                     ),
//                   );
//                 },
//                 leading: imageUrl != null
//                     ? Image.network(imageUrl, width: 60, fit: BoxFit.cover)
//                     : const Icon(Icons.home, size: 40),
//                 title: Text(property.topic),
//                 subtitle: Text(
//                   '${property.rooms} rooms • ${property.bathrooms} baths • Rs.${property.price}',
//                 ),
//               ),
//             ),
//           );
//         }

//         return ListView(children: allCards);
//       },
//     );
//   }
// }

