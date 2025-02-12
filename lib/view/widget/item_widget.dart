import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled32/modle/post_modle.dart';
import 'package:untitled32/view/page/update_post_screen.dart';

import '../../controller/post_controller.dart';

class ItemWidget extends StatelessWidget {
  PostModle postModle;
  int index;

  ItemWidget({required this.index, required this.postModle});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      margin: EdgeInsets.all(20),
      color: index.isEven? Colors.blue:Colors.brown,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("#${postModle.id}"),
          Text("#${postModle.title}"),
          Text("#${postModle.body}"),
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    Provider.of<PostController>(context, listen: false)
                        .deleatPoost(id: postModle.id!, index: index);
                  },
                  icon: Icon(Icons.delete)),
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UpdatePostScreen(
                            index: index,
                            postModle: postModle,
                          ),
                        ));
                  },
                  icon: Icon(Icons.edit))
            ],
          )
        ],
      ),
    );
  }
}
