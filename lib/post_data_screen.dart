import 'package:flutter/material.dart';
import 'package:practice_post_api/services/services.dart';

NetworkingServices networkingServicesHelper = NetworkingServices();

class PostDataScreen extends StatefulWidget {
  @override
  _PostDataScreenState createState() => _PostDataScreenState();
}

class _PostDataScreenState extends State<PostDataScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _imageUrlController = TextEditingController();

  void _postData() {
    // Perform data posting here
    String name = _nameController.text;
    String email = _emailController.text;
    String imageUrl = _imageUrlController.text;

    // Add your logic to post the data
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Data'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _imageUrlController,
              decoration: InputDecoration(labelText: 'Image URL'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                networkingServicesHelper.addUserData(_emailController.text,
                    _nameController.text, _imageUrlController.text);
                //
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
