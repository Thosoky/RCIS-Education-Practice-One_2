import 'dart:io';
import 'dart:convert';

// const String filePath = "toDo.json";  //== не работает
const String filePath = "C:\\toDo.json";
const JsonDecoder decoder = JsonDecoder();

class toDos {
  String? title;
  String? textTask;
  int? id;

  toDos({this.title, this.textTask, this.id});

  @override
  String toString() {
    return "{title:$title,textTask:$textTask,id:$id}";
  }
}

void main() {
  List<toDos>? elements;
  var jsonString = File(filePath).readAsStringSync(); //читаем файл
  final Map<String, dynamic> jsonmap = decoder.convert(jsonString);
  var value = jsonmap["todos"];
  if (value != null) {
    elements = <toDos>[];
    value.forEach((item) => elements?.add(toDos(
        title: item["title"], textTask: item["textTask"], id: item["id"])));
  }
  elements?.forEach((element) => print(element));
}
