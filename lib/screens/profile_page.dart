import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool showPosts = true; // Toggle between Posts and Orders
  List<Map<String, dynamic>> demoPosts = [];

  @override
  void initState() {
    super.initState();

    // Add demo posts
    demoPosts = [
      {
        'id': 'post1',
        'title': 'Beef Wellington',
        'price': 49.99,
        'image': 'assets/images/post_demo.png',
      },
      {
        'id': 'post2',
        'title': 'Seared Scallops',
        'price': 39.99,
        'image': 'assets/images/post2.png',
      },
    ];
  }

  void deletePost(String id) {
    setState(() {
      demoPosts.removeWhere((post) => post['id'] == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Profile Picture
              const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/profile.png'),
              ),
              const SizedBox(height: 16),

              // Name
              const Text(
                'Gordon Ramsay',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              // Location
              const SizedBox(height: 8),
              const Text(
                'Los Angeles, CA',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),

              // Bio
              const SizedBox(height: 8),
              const Text(
                'World renowned chef, restaurateur, and TV personality.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),

              // Toggle Buttons for Posts and Orders
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        showPosts = true;
                      });
                    },
                    child: Column(
                      children: [
                        Icon(
                          Icons.image,
                          size: 36,
                          color: showPosts ? Colors.orange : Colors.grey,
                        ),
                        Text(
                          'Posts',
                          style: TextStyle(
                            color: showPosts ? Colors.orange : Colors.grey,
                            fontWeight:
                                showPosts ? FontWeight.bold : FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 48),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        showPosts = false;
                      });
                    },
                    child: Column(
                      children: [
                        Icon(
                          Icons.shopping_cart,
                          size: 36,
                          color: !showPosts ? Colors.orange : Colors.grey,
                        ),
                        Text(
                          'Orders',
                          style: TextStyle(
                            color: !showPosts ? Colors.orange : Colors.grey,
                            fontWeight: !showPosts
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // Display Posts or Orders
              if (showPosts)
                Column(
                  children: [
                    // Add Post Button
                    ElevatedButton.icon(
                      onPressed: null,
                      icon: const Icon(Icons.add),
                      label: const Text('Add Post'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 12,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // List of Posts
                    demoPosts.isEmpty
                        ? const Center(child: Text('No posts yet.'))
                        : ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: demoPosts.length,
                            itemBuilder: (context, index) {
                              final post = demoPosts[index];
                              return Card(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: ListTile(
                                  leading: Image.asset(
                                    post['image'],
                                    fit: BoxFit.cover,
                                    width: 60,
                                    height: 60,
                                  ),
                                  title: Text(post['title']),
                                  subtitle: Text(
                                      '\$${post['price'].toStringAsFixed(2)}'),
                                  trailing: IconButton(
                                    icon: const Icon(Icons.delete,
                                        color: Colors.red),
                                    onPressed: () {
                                      deletePost(post['id']);
                                    },
                                  ),
                                ),
                              );
                            },
                          ),
                  ],
                )
              else
                const Center(child: Text('No orders yet.')),
            ],
          ),
        ),
      ),
    );
  }
}