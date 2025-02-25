import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MatchProvider extends ChangeNotifier {
  List<Map<String, dynamic>> matches = [
    {
      'name': 'James',
      'age': 20,
      'distance': '1.3 km away',
      'match': '100%',
      'image': 'https://via.placeholder.com/150'
    },
    {
      'name': 'Eddie',
      'age': 23,
      'distance': '2 km away',
      'match': '94%',
      'image': 'https://via.placeholder.com/150'
    },
    {
      'name': 'Brandon',
      'age': 20,
      'distance': '2.5 km away',
      'match': '89%',
      'image': 'https://via.placeholder.com/150'
    },
  ];
}

class MatchesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MatchProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Matches", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [IconButton(icon: Icon(Icons.settings), onPressed: () {})],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildIconLabel(Icons.favorite, "Likes", "32"),
                SizedBox(width: 20),
                _buildIconLabel(Icons.chat, "Connect", "15"),
              ],
            ),
            SizedBox(height: 20),
            Text("Your Matches 47",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.8,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: provider.matches.length,
                itemBuilder: (context, index) {
                  final match = provider.matches[index];
                  return _buildMatchCard(match);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIconLabel(IconData icon, String label, String count) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.grey[200],
          child: Icon(icon, color: Colors.red),
        ),
        SizedBox(height: 5),
        Text("$label $count", style: TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildMatchCard(Map<String, dynamic> match) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue[100],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                child: Image.network(
                  match['image'],
                  height: 100,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 5,
                right: 5,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    match['match'] + " Match",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${match['name']}, ${match['age']}",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 5),
                Text(match['distance'],
                    style: TextStyle(color: Colors.grey[600])),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
