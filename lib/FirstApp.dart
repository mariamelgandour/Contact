import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Contact Details' ,

          ),

          backgroundColor: Colors.grey,
        ),
        body: const ProfileList(),
      ),
    );
  }
}

class ProfileList extends StatelessWidget {
  const ProfileList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> profiles = [
      {
        'name': 'Barry Lyon',
        'role': 'Chief Technology Officer',
        'phone': '(202) 555-0193',
        'image': 'images/img1.png',
        'rating': 5
      },
      {
        'name': 'Hortense Tinker',
        'role': 'Network Engineer',
        'phone': '(202) 555-0127',
        'image': 'images/img2.png',
        'rating': 4
      },
      {
        'name': 'Arlene Sharman',
        'role': 'Certified Personal Trainer',
        'phone': '(202) 555-0190',
        'image': 'images/img3.png',
        'rating': 3
      },
      {
        'name': 'Angelica Geary',
        'role': 'Designer',
        'phone': '(202) 555-0442',
        'image': 'images/img4.png',
        'rating': 4
      },
      {
        'name': 'Carl Hambledon',
        'role': 'Java Developer',
        'phone': '(202) 555-0639',
        'image': 'images/img5.png',
        'rating': 5
      },
      {
        'name': 'Lowell Christophers',
        'role': 'Frontend Developer',
        'phone': '(202) 555-0354',
        'image': 'images/img6.png',
        'rating': 4
      },
    ];

    return ListView.builder(
      itemCount: profiles.length,
      itemBuilder: (context, index) {
        final profile = profiles[index];
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade400),
            color: Colors.white,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child:Image.asset(
                  width: 120,
                  height: 130,
                  profile['image']!,
                  fit: BoxFit.fill,

                )
              ),
              const SizedBox(width: 10),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      profile['name']!,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(profile['role']!, style: const TextStyle(fontSize: 16)),
                    Text(profile['phone']!, style: const TextStyle(fontSize: 14, color: Colors.grey)),
                    const SizedBox(height: 5),
                    Row(
                      children: List.generate(5, (starIndex) {
                        return Icon(
                          starIndex < profile['rating'] ? Icons.star : Icons.star_border,
                          color: Colors.teal,
                        );
                      }),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
