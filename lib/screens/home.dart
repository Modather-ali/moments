import 'package:flutter/material.dart';
import 'package:moments/main.dart';

import 'share_post.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            setState(() {
              sharedPreferences.clear();
            });
          },
          icon: const Icon(Icons.logout),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          ElevatedButton.icon(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const SharePostScreen()));
            },
            label: const Text("Share Your Moment Now"),
            icon: const Icon(Icons.add_reaction_rounded),
          ),
          Card(
            child: Column(
              children: [
                Row(
                  children: const [
                    CircleAvatar(
                      radius: 15,
                      child: Icon(Icons.person),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Username",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "The following line ensures that the Material Icons font is included with your application, so that you can use the icons in the material Icons class.",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Image.asset("assets/2663517.jpg")
              ],
            ),
          )
        ],
      ),
    );
  }
}
