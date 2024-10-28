import 'package:flutter/material.dart';

class CoursePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Course Content'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Course Title
            const Text(
              'Course Title: Prise de parole',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            // Course Description
            const Text(
              'This course will teach you the fundamentals public speaking.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),

            // Video Player Placeholder
            Container(
              height: 200,
              color: Colors.grey[300],
              child: Center(
                child: Text(
                  'Video Player Placeholder',
                  style: TextStyle(fontSize: 18, color: Colors.grey[700]),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Topics List
            const Text(
              'Topics Covered:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: [
                  _buildTopicTile('1. Introduction to course'),
                  _buildTopicTile('2. '),
                  _buildTopicTile('3. '),
                  _buildTopicTile('4. '),
                  _buildTopicTile('5. '),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopicTile(String title) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          title,
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
