import 'package:flutter/material.dart';

class SharePostScreen extends StatefulWidget {
  const SharePostScreen({super.key});

  @override
  State<SharePostScreen> createState() => _SharePostScreenState();
}

class _SharePostScreenState extends State<SharePostScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: const Text("Share Your Moment"),
        centerTitle: true,
        actions: [TextButton(onPressed: () {}, child: const Text("Post"))],
      ),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          TextFormField(
            controller: _textEditingController,
            maxLength: 248,
            maxLines: 5,
            decoration: const InputDecoration(
              hintText: "Type here...",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: () {},
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
              ),
              alignment: Alignment.center,
              child: const Text(
                "Add Image +",
                style: TextStyle(fontSize: 17),
              ),
            ),
          )
        ],
      ),
    );
  }
}
