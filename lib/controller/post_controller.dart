import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:untitled32/modle/post_modle.dart';
import 'package:http/http.dart' as http;
import '../constans_value.dart';

class PostController extends ChangeNotifier {
  List<PostModle> data = [];
  bool isLodding = false;
  bool showError = false;

  getAllpost() async {
    isLodding = true;
    notifyListeners();
    final res = await http.get(Uri.parse("${ConstansValue.baseUri}posts"));
    isLodding = false;
    notifyListeners();

    if (res.statusCode == 200) {
      var jsonBody = jsonDecode(res.body);
      for (Map i in jsonBody) {
        data.add(PostModle.fromJson(json: i));
      }
    } else {
      showError = true;
    }
    notifyListeners();
  }

  creatPoost({required PostModle postM}) async {
    isLodding = true;
    notifyListeners();
    final resp = await http.post(
      Uri.parse("${ConstansValue.baseUri}posts"),
      headers: {
        'Content-type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(postM.toJson()),
    );
    isLodding = false;
    notifyListeners();
    if (resp.statusCode == 201) {
      var responsebody = jsonDecode(resp.body);
      PostModle postM = PostModle.fromJson(json: responsebody);
      data.insert(0, postM);
      // data.add(PostModle.fromJson(json: jsonDecode(resp.body)));
    }else {
      showError = true;
    }
    notifyListeners();
  }

  updatPoost({required PostModle postM, required int index}) async {
    isLodding = true;
    notifyListeners();
    final resp = await http.put(
      Uri.parse("${ConstansValue.baseUri}posts${postM.id}"),
      headers: {
        'Content-type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(postM.toJson()),
    );
    isLodding = false;
    notifyListeners();
    if (resp.statusCode == 200) {
      data[index] = PostModle.fromJson(json: jsonDecode(resp.body));
    }else {
      showError = true;
    }
    notifyListeners();
  }

  deleatPoost({required int id, required int index}) async {
    isLodding = true;
    notifyListeners();
    final resp = await http.delete(
      Uri.parse("${ConstansValue.baseUri}posts/${id}"),
    );
    isLodding = false;
    notifyListeners();
    if (resp.statusCode == 200) {
      data.removeAt(index);
    }else {
      showError = true;
    }
    notifyListeners();
  }
}
