// import 'package:flutter/material.dart';

// class PropertyCard extends StatelessWidget {
//   final Map<String, dynamic> property;
//   final VoidCallback onTap;
//   final bool isGrid;

//   const PropertyCard({
//     required this.property,
//     required this.onTap,
//     this.isGrid = false,
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;

//     if (isGrid) {
//       return GestureDetector(
//         onTap: onTap,
//         child: Card(
//           elevation: 4,
//           margin: const EdgeInsets.all(8),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Expanded(
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(12.0),
//                   child: Image.asset(
//                     property['image'],
//                     fit: BoxFit.cover,
//                     width: double.infinity,
//                     errorBuilder: (context, error, stackTrace) =>
//                         const Center(child: Icon(Icons.image_not_supported, size: 40, color: Colors.grey)),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(4.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(property['title'],
//                         style: TextStyle(
//                           fontSize: screenWidth < 600 ? 12 : 14,
//                           fontWeight: FontWeight.bold,
//                         ),
//                         maxLines: 1,
//                         overflow: TextOverflow.ellipsis),
//                     Text(property['agent'], style: const TextStyle(fontSize: 10)),
//                     Text(property['price'],
//                         style: const TextStyle(
//                           fontSize: 12,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.green,
//                         )),
//                     Row(
//                       children: [
//                         const Icon(Icons.king_bed, size: 12, color: Colors.grey),
//                         const SizedBox(width: 4),
//                         Text('${property['bedrooms']}', style: const TextStyle(fontSize: 10)),
//                         const SizedBox(width: 16),
//                         const Icon(Icons.bathtub, size: 12, color: Colors.grey),
//                         const SizedBox(width: 4),
//                         Text('${property['bathrooms']}', style: const TextStyle(fontSize: 10)),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       );
//     }

//     // List view card
//     return GestureDetector(
//       onTap: onTap,
//       child: Card(
//         elevation: 4,
//         margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//         child: Container(
//           height: screenWidth < 360 ? 80 : 100,
//           child: Row(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(12.0),
//                   child: Image.asset(
//                     property['image'],
//                     fit: BoxFit.cover,
//                     width: 80,
//                     height: 80,
//                     errorBuilder: (context, error, stackTrace) =>
//                         const Icon(Icons.image_not_supported, size: 80, color: Colors.grey),
//                   ),
//                 ),
//               ),
//               Expanded(
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(property['title'],
//                           style: TextStyle(
//                             fontSize: screenWidth < 360 ? 10 : 12,
//                             fontWeight: FontWeight.bold,
//                           ),
//                           maxLines: 1,
//                           overflow: TextOverflow.ellipsis),
//                       const SizedBox(height: 4),
//                       Text(property['agent'], style: const TextStyle(fontSize: 10)),
//                       const SizedBox(height: 4),
//                       Text(property['price'],
//                           style: const TextStyle(
//                             fontSize: 12,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.green,
//                           )),
//                       const SizedBox(height: 4),
//                       Row(
//                         children: [
//                           const Icon(Icons.king_bed, size: 12, color: Colors.grey),
//                           const SizedBox(width: 4),
//                           Text('${property['bedrooms']}', style: const TextStyle(fontSize: 10)),
//                           const SizedBox(width: 16),
//                           const Icon(Icons.bathtub, size: 12, color: Colors.grey),
//                           const SizedBox(width: 4),
//                           Text('${property['bathrooms']}', style: const TextStyle(fontSize: 10)),
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import '../models/property.dart';  // import your Property model

// class PropertyCard extends StatelessWidget {
//   final Property property;
//   final VoidCallback onTap;
//   final bool isGrid;

//   const PropertyCard({
//     required this.property,
//     required this.onTap,
//     this.isGrid = false,
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;

//     if (isGrid) {
//       return GestureDetector(
//         onTap: onTap,
//         child: Card(
//           elevation: 4,
//           margin: const EdgeInsets.all(8),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Expanded(
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(12.0),
//                   child: Image.asset(
//                     property.image,
//                     fit: BoxFit.cover,
//                     width: double.infinity,
//                     errorBuilder: (context, error, stackTrace) =>
//                         const Center(child: Icon(Icons.image_not_supported, size: 40, color: Colors.grey)),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(4.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(property.title,
//                         style: TextStyle(
//                           fontSize: screenWidth < 600 ? 12 : 14,
//                           fontWeight: FontWeight.bold,
//                         ),
//                         maxLines: 1,
//                         overflow: TextOverflow.ellipsis),
//                     Text(property.agent, style: const TextStyle(fontSize: 10)),
//                     Text(property.price,
//                         style: const TextStyle(
//                           fontSize: 12,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.green,
//                         )),
//                     Row(
//                       children: [
//                         const Icon(Icons.king_bed, size: 12, color: Colors.grey),
//                         const SizedBox(width: 4),
//                         Text('${property.rooms}', style: const TextStyle(fontSize: 10)),
//                         const SizedBox(width: 16),
//                         const Icon(Icons.bathtub, size: 12, color: Colors.grey),
//                         const SizedBox(width: 4),
//                         Text('${property.bathrooms}', style: const TextStyle(fontSize: 10)),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       );
//     }

//     // List view card
//     return GestureDetector(
//       onTap: onTap,
//       child: Card(
//         elevation: 4,
//         margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//         child: Container(
//           height: screenWidth < 360 ? 80 : 100,
//           child: Row(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(12.0),
//                   child: Image.asset(
//                     property.image,
//                     fit: BoxFit.cover,
//                     width: 80,
//                     height: 80,
//                     errorBuilder: (context, error, stackTrace) =>
//                         const Icon(Icons.image_not_supported, size: 80, color: Colors.grey),
//                   ),
//                 ),
//               ),
//               Expanded(
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(property.title,
//                           style: TextStyle(
//                             fontSize: screenWidth < 360 ? 10 : 12,
//                             fontWeight: FontWeight.bold,
//                           ),
//                           maxLines: 1,
//                           overflow: TextOverflow.ellipsis),
//                       const SizedBox(height: 4),
//                       Text(property.agent, style: const TextStyle(fontSize: 10)),
//                       const SizedBox(height: 4),
//                       Text(property.price,
//                           style: const TextStyle(
//                             fontSize: 12,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.green,
//                           )),
//                       const SizedBox(height: 4),
//                       Row(
//                         children: [
//                           const Icon(Icons.king_bed, size: 12, color: Colors.grey),
//                           const SizedBox(width: 4),
//                           Text('${property.bedrooms}', style: const TextStyle(fontSize: 10)),
//                           const SizedBox(width: 16),
//                           const Icon(Icons.bathtub, size: 12, color: Colors.grey),
//                           const SizedBox(width: 4),
//                           Text('${property.bathrooms}', style: const TextStyle(fontSize: 10)),
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

