import 'package:dio/dio.dart';
import 'package:todo/core/model/task.dart';

class TaskVM {
  Dio dio = Dio();
  Future<List<Todos>?> getAllTask() async {
    try {
      Response<dynamic> res = await dio.get('https://dummyjson.com/todos');

      Map<String, dynamic> tasks = res.data;
      List<Todos>? todos =
          tasks['todos'].map<Todos>((t) => Todos.fromJson(t)).toList();

      return todos;
    } catch (e) {
      print('$e');
    }
    return null;
  }

  Future<List<Todos>?> getCompletedTask() async {
    try {
      List<Todos>? todos = await getAllTask();
      return todos!.where((e) => e.completed == true).toList();
    } catch (e) {
      print('$e');
    }
    return null;
  }

  Future<List<Todos>?> getUnCompletedTask() async {
    try {
     List<Todos>? todos = await getAllTask();
      return todos!.where((e) => e.completed == false).toList();
    } catch (e) {
      print('$e');
    }
    return null;
  }

  Future<Todos?> searchTask(int id) async {
    try {
     List<Todos>? todos = await getAllTask();
      return todos!.firstWhere((e)=>e.id==id);
    } catch (e) {
      print('$e');
    }
    return null;
  }
}
