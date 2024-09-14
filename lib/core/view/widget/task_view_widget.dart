import 'package:flutter/material.dart';

import '../../model/task.dart';


class TaskViewWidget extends StatelessWidget {
   TaskViewWidget({
    super.key,
    required this.future,
  });


  final Future<List<Todos>?>? future;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          itemCount: snapshot.data?.length,
          itemBuilder: (context, index) => Container(
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10)),
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              padding: const EdgeInsets.all(10),
              // height: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    snapshot.data![index].todo!,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  Container(
                    height: 25,
                    width: 90,
                    color: snapshot.data![index].completed! == true
                        ? Colors.green[400]
                        : Colors.amber,
                    child: Center(
                      child: Text(
                        snapshot.data![index].completed! == true
                            ? 'Completed'
                            : 'UnCompleted',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              )),
        );
      },
    );
  }
}
