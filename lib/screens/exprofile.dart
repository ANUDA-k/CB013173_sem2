import 'package:flutter/material.dart';
import '../models/property.dart';

class PropertyProfilePage extends StatelessWidget {
  final Property property;

  const PropertyProfilePage({super.key, required this.property});

  @override
  Widget build(BuildContext context) {
    final imageUrl = property.images.isNotEmpty
        ? property.images[0].startsWith('http')
            ? property.images[0]
            : 'http://10.0.2.2:8000/${property.images[0]}'
        : null;

    return Scaffold(
      appBar: AppBar(
        title: Text(property.topic),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (imageUrl != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 250,
                ),
              ),
            const SizedBox(height: 16),
            Text(
              property.topic,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text('Posted by: ${property.email}', style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            Text(
              'Rs.${property.price}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green),
            ),
            const SizedBox(height: 16),
            Text(property.description, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 16),
            Row(
              children: [
                const Icon(Icons.king_bed, size: 24, color: Colors.grey),
                const SizedBox(width: 8),
                Text('${property.rooms} bedrooms'),
                const SizedBox(width: 16),
                const Icon(Icons.bathtub, size: 24, color: Colors.grey),
                const SizedBox(width: 8),
                Text('${property.bathrooms} bathrooms'),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Add logic to contact agent
              },
              child: const Text('Contact Agent'),
            ),
            const SizedBox(height: 32),
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.asset(
                'assets/map.jpg',
                fit: BoxFit.cover,
                width: double.infinity,
                height: 250,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
