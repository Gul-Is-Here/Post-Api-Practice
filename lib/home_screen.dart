import 'package:flutter/material.dart';
import 'package:practice_post_api/model/model.dart';
import 'package:practice_post_api/post_data_screen.dart';
import 'package:practice_post_api/services/services.dart';

NetworkingServices networkingServicesHelper = NetworkingServices();

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Posts'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return PostDataScreen();
                    },
                  ),
                );
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<Post>(
              future: networkingServicesHelper.getPostData(),
              builder: (context, AsyncSnapshot<Post> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: Colors.purple,
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Error fetching data'),
                  );
                } else if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.data.length,
                    itemBuilder: (context, index) {
                      var postData = snapshot.data;
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                            postData!.data[index].avatar!,
                          ),
                        ),
                        title: Text(postData.data[index].firstName!),
                        subtitle: Text(postData.data[index].email!),
                        onTap: () {
                          // Add onTap functionality if needed
                        },
                      );
                    },
                  );
                } else {
                  return Center(
                    child: Text('No data available'),
                  );
                }
              },
            ),
          ),
          // ElevatedButton(
          //     onPressed: () {
          //       setState(() {
          //         networkingServicesHelper.postData();
          //       });
          //     },
          //     child: Text("Post"))
        ],
      ),
    );
  }
}
