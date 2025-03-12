import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: UserListScreen(),
    );
  }
}

class UserListScreen extends StatelessWidget {
  final List<User> users = [
    User("Barry Lyon", "Chief Technology Officer", "(202) 555-0193", "https://picsum.photos/200"),
    User("Hortense Tinker", "Network Engineer", "(202) 555-0127", "https://picsum.photos/201"),
    User("Arlene Sharman", "Certified Personal Trainer", "(202) 555-0190", "https://picsum.photos/202"),
    User("Angelica Geary", "Designer", "(202) 555-0442", "https://picsum.photos/203"),
    User("Carl Hambledon", "Java Developer", "(202) 555-0639", "https://picsum.photos/204"),
    User("Lowell Christophers", "Frontend Developer", "(202) 555-0354", "https://picsum.photos/205"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("User List")),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return UserCard(user: users[index]);
        },
      ),
    );
  }
}

class User {
  final String name;
  final String jobTitle;
  final String phone;
  final String imageUrl;

  User(this.name, this.jobTitle, this.phone, this.imageUrl);
}

class UserCard extends StatelessWidget {
  final User user;

  UserCard({required this.user});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      elevation: 3,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                user.imageUrl,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.name,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(user.jobTitle, style: TextStyle(color: Colors.grey[700])),
                  Text(user.phone, style: TextStyle(color: Colors.grey[600])),
                  SizedBox(height: 5),
                  Row(
                    children: List.generate(5, (index) {
                      return Icon(Icons.star, color: index < 4 ? Colors.blue : Colors.grey, size: 18);
                    }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
