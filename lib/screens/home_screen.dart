// ignore_for_file: dead_code

import 'package:flutter/material.dart';
import 'package:aan_app/widgets/colors.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        backgroundColor: color1,
        title: const Text(
          'Hi, Anas',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.person,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pushNamed(context, 'ProfilePage');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Search here...',
                  border: InputBorder.none,
                  icon: Icon(Icons.search),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Icon Grid

            const SizedBox(height: 20),

            // Course Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Courses',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('See All'),
                ),
              ],
            ),
            const SizedBox(height: 10),

            // Course Cards
            Expanded(
              child: GridView.count(
                crossAxisCount: 1,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  _buildCourseCard(
                    'la prise de parole',
                    '2 Videos',
                    Icons.record_voice_over,
                  ),
                  _buildCourseCard(
                    'Gestion de projet',
                    '3 Videos',
                    Icons.workspaces_outline,
                  ),
                  // Add more courses if needed
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.blue,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.video_collection,
              color: Colors.blue,
            ),
            label: 'Courses',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
              color: Colors.blue,
            ),
            label: 'Wishlist',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: Colors.blue,
            ),
            label: 'Account',
          ),
        ],
      ),
    );
  }

  // Helper method for course cards
  Widget _buildCourseCard(
    String title,
    String subtitle,
    IconData icon,
  ) {
    bool isFavorite = false;
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 50, color: Colors.blue),
          const SizedBox(height: 20),
          Text(
            title,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15),
          Text(subtitle,
              style: const TextStyle(fontSize: 14, color: Colors.grey)),
          const SizedBox(height: 20),
          PlayButton(),
          Container(
            alignment: Alignment.bottomRight,
            child: IconButton(
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Colors.red : Colors.grey,
                size: 30,
              ),
              onPressed: () {
                () {
                  isFavorite = !isFavorite; // Toggle favorite state
                };
              },
            ),
          ),
        ],
      ),
    );
  }
}

class PlayButton extends StatelessWidget {
  const PlayButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        Navigator.pushNamed(context, 'CoursePage');
      },
      icon: Icon(Icons.play_arrow, color: Colors.white),
      label: Text('Play Course', style: TextStyle(color: Colors.white)),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: Colors.green,
      ),
    );
  }
}
