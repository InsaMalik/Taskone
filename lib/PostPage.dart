import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PostsPage extends StatefulWidget {
  @override
  _PostsPageState createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  List<dynamic> _posts = [];
  List<dynamic> _filteredPosts = [];
  bool _loading = true;
  String _searchQuery = "";
  String _selectedUserId = "All";

  @override
  void initState() {
    super.initState();
    fetchPosts();
  }

  Future<void> fetchPosts() async {
    final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        _posts = data;
        _filteredPosts = data;
        _loading = false;
      });
    } else {
      setState(() {
        _loading = false;
      });
      throw Exception("Failed to load posts");
    }
  }

  void _filterPosts() {
    List<dynamic> results = _posts.where((post) {
      final titleLower = post["title"].toLowerCase();
      final bodyLower = post["body"].toLowerCase();
      final searchLower = _searchQuery.toLowerCase();

      final matchesSearch = titleLower.contains(searchLower) || bodyLower.contains(searchLower);
      final matchesUserId = _selectedUserId == "All" || post["userId"].toString() == _selectedUserId;

      return matchesSearch && matchesUserId;
    }).toList();

    setState(() {
      _filteredPosts = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _loading
            ? Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  // Search bar
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Search by title or body...",
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      onChanged: (value) {
                        _searchQuery = value;
                        _filterPosts();
                      },
                    ),
                  ),
        
                  // UserId filter dropdown
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: DropdownButtonFormField<String>(
                      value: _selectedUserId,
                      items: ["All", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
                          .map((id) => DropdownMenuItem(value: id, child: Text("User $id")))
                          .toList(),
                      onChanged: (value) {
                        _selectedUserId = value!;
                        _filterPosts();
                      },
                      decoration: InputDecoration(
                        labelText: "Filter by User ID",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
        
                  SizedBox(height: 10),
        
                  // Posts list
                  Expanded(
                    child: ListView.builder(
                      itemCount: _filteredPosts.length,
                      itemBuilder: (context, index) {
                        final post = _filteredPosts[index];
                        return Card(
                          margin: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                          child: ListTile(
                            title: Text(post["title"], style: TextStyle(fontWeight: FontWeight.bold)),
                            subtitle: Text(post["body"]),
                            trailing: Text("User ${post["userId"]}"),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
