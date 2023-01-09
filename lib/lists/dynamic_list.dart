import 'package:bloc_app/models/post.dart';
import 'package:bloc_app/services/post_service.dart';
import 'package:flutter/material.dart';

class DynamicList extends StatefulWidget {
  const DynamicList({ Key? key }) : super(key: key);

  @override
  State<DynamicList> createState() => _DynamicListState();
}

class _DynamicListState extends State<DynamicList> {

  late Future<List<Post>> _allPost;

  @override
  void initState() {
    super.initState();
    _allPost = PostsService().getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dynamic List')),
      body: FutureBuilder(
        future: _allPost,
        builder: (context, AsyncSnapshot<List<Post>> snapshot) {

          if (snapshot.hasData) {
            final data = snapshot.data!;

            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: Text( '${data[index].id}', style: const TextStyle( fontSize: 18.0 ),),
                    minLeadingWidth: 20.0,
                    title: Text( data[index].title ),
                    subtitle: Text( data[index].body ),
                  ),
                );
              }
            );
          } else if (snapshot.hasError) {

            print(snapshot.error);
            return Text('${snapshot.error}');

          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}