import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled32/controller/post_controller.dart';
import 'package:untitled32/modle/post_modle.dart';
import 'package:untitled32/view/widget/input_widget.dart';
import 'package:untitled32/view/widget/loading_widget.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

TextEditingController bodyTextEditingController = TextEditingController();
TextEditingController titleTextEditingController = TextEditingController();

class _AddPostScreenState extends State<AddPostScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white24,
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Center(
          child: Text(
            "Add post screen",
            style: TextStyle(height: 15.0, color: Colors.black),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InputWidget(
              TEController: titleTextEditingController,
              obscureText: false,
              prefixIcon: Icon(Icons.title),
              label: "title"),
          SizedBox(height: 15),
          InputWidget(
              TEController: bodyTextEditingController,
              obscureText: false,
              prefixIcon: Icon(Icons.contacts),
              label: "body"),
          SizedBox(height: 15),
          Consumer<PostController>(
            builder: (context, pc, child) {
              if (pc.isLodding) {
                return LoadingWidget();
              } else {
                return MaterialButton(
                    onPressed: () {
                      Provider.of<PostController>(context, listen: false)
                          .creatPoost(
                              postM: PostModle(
                        body: bodyTextEditingController.text,
                        title: titleTextEditingController.text,
                        userId: 1,
                      ));
                      Navigator.pop(context);
                    },
                    child: Text("save"));
              }
            },
          )
        ],
      ),
    );
  }
}
