import 'package:flutter/material.dart';

class PostAdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Yellow Label - Full width
            Container(
              width: double.infinity,
              color: const Color.fromARGB(255, 143, 96, 16),
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Please fill in all the details carefully before submitting your ad.",
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 16.0),

            // FORM INSIDE A CARD WITH PADDING
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Form Title
                      Text("Create a New Ad", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                      SizedBox(height: 16.0),

                      // Title Field
                      TextField(
                        decoration: InputDecoration(
                          labelText: "Ad Title",
                          hintText: "Enter the title of your property ad",
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.title),
                        ),
                      ),
                      SizedBox(height: 12.0),

                      // Description Field
                      TextField(
                        maxLines: 4,
                        decoration: InputDecoration(
                          labelText: "Description",
                          hintText: "Provide details about your property",
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.description),
                        ),
                      ),
                      SizedBox(height: 12.0),

                      // Price Field
                      TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "Price (LKR)",
                          hintText: "Enter the price of the property",
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.money),
                        ),
                      ),
                      SizedBox(height: 12.0),

                      // Location Field
                      TextField(
                        decoration: InputDecoration(
                          labelText: "Location",
                          hintText: "Enter the property location",
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.location_on),
                        ),
                      ),
                      SizedBox(height: 12.0),

                      // Category Dropdown
                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          labelText: "Category",
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.category),
                        ),
                        items: [
                          DropdownMenuItem(value: "House", child: Text("House")),
                          DropdownMenuItem(value: "Apartment", child: Text("Apartment")),
                          DropdownMenuItem(value: "Villa", child: Text("Villa")),
                          DropdownMenuItem(value: "Land", child: Text("Land")),
                        ],
                        onChanged: (value) {},
                      ),
                      SizedBox(height: 12.0),

                      // Image Upload Placeholder
                      GestureDetector(
                        onTap: () {
                          print("Upload Image");
                        },
                        child: Container(
                          height: screenHeight * 0.3,
                          width: screenWidth * 0.9,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.add_a_photo, size: 50, color: Colors.grey),
                                SizedBox(height: 8.0),
                                Text("Upload Property Images", style: TextStyle(color: Colors.grey)),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 16.0),

                      // Submit Button
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (context, animation, secondaryAnimation) => NextPage(),
                                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                  var begin = Offset(1.0, 0.0);
                                  var end = Offset.zero;
                                  var curve = Curves.easeInOut;
                                  var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                                  var offsetAnimation = animation.drive(tween);
                                  return SlideTransition(position: offsetAnimation, child: child);
                                },
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text("Submit Ad", style: TextStyle(fontSize: 18)),
                              SizedBox(width: 10),
                              Icon(Icons.send),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Dummy Next Page
class NextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Next Page"), backgroundColor: Colors.green),
      body: Center(
        child: Text("Ad Submitted Successfully!", style: TextStyle(fontSize: 24)),
      ),
    );
  }
}


//this is the new code
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:provider/provider.dart';
// import '../models/property_model.dart';
// import '../providers/property_provider.dart';

// class PostAdPage extends StatefulWidget {
//   const PostAdPage({super.key});

//   @override
//   State<PostAdPage> createState() => _PostAdPageState();
// }

// class _PostAdPageState extends State<PostAdPage> {
//   final _formKey = GlobalKey<FormState>();

//   final TextEditingController _titleController = TextEditingController();
//   final TextEditingController _descriptionController = TextEditingController();
//   final TextEditingController _priceController = TextEditingController();
//   final TextEditingController _locationController = TextEditingController();
//   String _selectedCategory = "House";

//   final ImagePicker _picker = ImagePicker();
//   List<XFile> _pickedImages = [];

//   void _pickImages() async {
//     final List<XFile>? selectedImages = await _picker.pickMultiImage();
//     if (selectedImages != null && selectedImages.isNotEmpty) {
//       setState(() {
//         _pickedImages = selectedImages;
//       });
//     }
//   }

//   void _submitAd() {
//     if (_formKey.currentState!.validate()) {
//       final property = PropertyModel(
//         title: _titleController.text,
//         description: _descriptionController.text,
//         price: _priceController.text, // ✅ FIXED: now correctly passes String
//         location: _locationController.text,
//         category: _selectedCategory,
//         imagePaths: _pickedImages.map((xfile) => xfile.path).toList(),
//       );

//       Provider.of<PropertyProvider>(context, listen: false).addLocalProperty(property);

//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (_) => const SuccessPage()),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 158, 147, 147),
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         title: const Text("Real Estate", style: TextStyle(color: Colors.green, fontWeight: FontWeight.w600)),
//         actions: const [
//           Icon(Icons.search, color: Colors.black),
//           SizedBox(width: 10),
//           Icon(Icons.settings, color: Colors.black),
//           SizedBox(width: 10),
//         ],
//       ),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.all(16),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               children: [
//                 Container(
//                   width: double.infinity,
//                   padding: const EdgeInsets.all(12),
//                   color: const Color.fromARGB(255, 143, 96, 16),
//                   child: const Text(
//                     "Please fill in all the details carefully before submitting your ad.",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 Card(
//                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//                   elevation: 5,
//                   child: Padding(
//                     padding: const EdgeInsets.all(16),
//                     child: Column(
//                       children: [
//                         const Text("Create a New Ad", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
//                         const SizedBox(height: 16),
//                         TextFormField(
//                           controller: _titleController,
//                           decoration: const InputDecoration(
//                             labelText: "Ad Title",
//                             border: OutlineInputBorder(),
//                             prefixIcon: Icon(Icons.title),
//                           ),
//                           validator: (value) => value!.isEmpty ? "Title is required" : null,
//                         ),
//                         const SizedBox(height: 12),
//                         TextFormField(
//                           controller: _descriptionController,
//                           maxLines: 3,
//                           decoration: const InputDecoration(
//                             labelText: "Description",
//                             border: OutlineInputBorder(),
//                             prefixIcon: Icon(Icons.description),
//                           ),
//                           validator: (value) => value!.isEmpty ? "Description is required" : null,
//                         ),
//                         const SizedBox(height: 12),
//                         TextFormField(
//                           controller: _priceController,
//                           keyboardType: TextInputType.number,
//                           decoration: const InputDecoration(
//                             labelText: "Price (LKR)",
//                             border: OutlineInputBorder(),
//                             prefixIcon: Icon(Icons.money),
//                           ),
//                           validator: (value) {
//                             if (value == null || value.isEmpty) return "Price is required";
//                             if (double.tryParse(value) == null) return "Enter a valid number";
//                             return null;
//                           },
//                         ),
//                         const SizedBox(height: 12),
//                         TextFormField(
//                           controller: _locationController,
//                           decoration: const InputDecoration(
//                             labelText: "Location",
//                             border: OutlineInputBorder(),
//                             prefixIcon: Icon(Icons.location_on),
//                           ),
//                           validator: (value) => value!.isEmpty ? "Location is required" : null,
//                         ),
//                         const SizedBox(height: 12),
//                         DropdownButtonFormField<String>(
//                           value: _selectedCategory,
//                           decoration: const InputDecoration(
//                             labelText: "Category",
//                             border: OutlineInputBorder(),
//                             prefixIcon: Icon(Icons.category),
//                           ),
//                           items: ["House", "Apartment", "Villa", "Land"]
//                               .map((e) => DropdownMenuItem(value: e, child: Text(e)))
//                               .toList(),
//                           onChanged: (value) {
//                             if (value != null) setState(() => _selectedCategory = value);
//                           },
//                         ),
//                         const SizedBox(height: 12),
//                         GestureDetector(
//                           onTap: _pickImages,
//                           child: Container(
//                             height: 200,
//                             decoration: BoxDecoration(
//                               border: Border.all(color: Colors.grey),
//                               borderRadius: BorderRadius.circular(8),
//                             ),
//                             child: _pickedImages.isEmpty
//                                 ? const Center(
//                                     child: Column(
//                                       mainAxisAlignment: MainAxisAlignment.center,
//                                       children: [
//                                         Icon(Icons.add_a_photo, size: 50, color: Colors.grey),
//                                         SizedBox(height: 8),
//                                         Text("Upload Property Images", style: TextStyle(color: Colors.grey)),
//                                       ],
//                                     ),
//                                   )
//                                 : ListView.builder(
//                                     scrollDirection: Axis.horizontal,
//                                     itemCount: _pickedImages.length,
//                                     itemBuilder: (context, index) {
//                                       return Padding(
//                                         padding: const EdgeInsets.all(8.0),
//                                         child: Image.file(
//                                           File(_pickedImages[index].path),
//                                           width: 100,
//                                           fit: BoxFit.cover,
//                                         ),
//                                       );
//                                     },
//                                   ),
//                           ),
//                         ),
//                         const SizedBox(height: 16),
//                         ElevatedButton.icon(
//                           onPressed: _submitAd,
//                           icon: const Icon(Icons.send),
//                           label: const Text("Submit Ad"),
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.green,
//                             padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
//                             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class SuccessPage extends StatelessWidget {
//   const SuccessPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Success"), backgroundColor: Colors.green),
//       body: const Center(
//         child: Text("Ad Submitted Successfully!", style: TextStyle(fontSize: 24)),
//       ),
//     );
//   }
// }

