
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled32/controller/post_controller.dart';
import 'package:untitled32/view/page/add_post_screen.dart';
import 'package:untitled32/view/widget/item_widget.dart';
import 'package:untitled32/view/widget/loading_widget.dart';

import '../widget/error_widget.dart';


class ListPost extends StatefulWidget {
  const ListPost({super.key});

  @override
  State<ListPost> createState() => _PostScreenState();
}

class _PostScreenState extends State<ListPost> {
  @override
  void initState() {
    super.initState();
    Provider.of<PostController>(context, listen: false).getAllpost();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(
          child: Text(
            "API",
            style: TextStyle(height: 15.0, color: Colors.black),
          ),
        ),
      ),
      body: Consumer<PostController>(
        builder: (context, pc, child) {
          if(pc.showError){
            return ErrorWidget1(onTap: () {
              pc.getAllpost();
            },);
          }
          else if (pc.isLodding) {
            return LoadingWidget();
          } else {
            return ListView.builder(
              itemCount: pc.data.length,
              itemBuilder: (context, index) {
                return ItemWidget(
                  postModle: pc.data[index],
                  index: index,
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddPostScreen(),
            ));
      }),
    );
  }
}
