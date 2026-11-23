import 'package:flutter/material.dart';
import 'package:to_do_app/form_screen.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:to_do_app/models/Task.dart';

class TaskScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  String selectedStatus = "Due";
  List<Task> tasks = [
    Task(
      title: "Task 1",
      description: "yayaya",
      dueDate: DateTime.now().add(Duration(days: 1)),
    ),
    Task(
      title: "Task 2",
      description: "yayaya",
      dueDate: DateTime.now().add(Duration(days: 2)),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("toDoApp"),
        leading: Padding(
          padding: EdgeInsetsGeometry.fromLTRB(16, 8, 0, 8),
          child: SizedBox(
            width: 25,
            height: 25,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(200),
              child: Image.asset("assets/img.png"),
            ),
          ),
        ),
      ),
      body: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  statusTab("Due 1"),
                  statusTab("Backlog"),
                  statusTab("To Do 1"),
                  statusTab("On Progress"),
                  statusTab("Done"),
                ],
              ),
            ),

            SizedBox(height: 16),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("3 Tugas", style: TextStyle(fontWeight: FontWeight(600))),
                Text(
                  "1 Selesai",
                  style: TextStyle(fontWeight: FontWeight(600)),
                ),
              ],
            ),

            // checkBox 1
            SizedBox(height: 16),
            ListView.builder(
              itemCount: tasks.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Slidable(
                  startActionPane: ActionPane(
                    motion: ScrollMotion(),
                    children: [
                      SlidableAction(
                        onPressed: (context) {},
                        backgroundColor: Colors.red,
                        icon: Icons.delete,
                        label: "Hapus",
                      ),
                    ],
                  ),
                  endActionPane: ActionPane(
                    motion: ScrollMotion(),
                    children: [
                      SlidableAction(
                        onPressed: (context) {},
                        backgroundColor: Colors.green,
                        icon: Icons.check,
                        label: "Selesai",
                      ),
                    ],
                  ),
                  child: CheckboxListTile(
                    tileColor: Colors.blue.shade50,
                    value: false,
                    onChanged: (value) {},
                    title: Text(tasks[index].title),
                    subtitle: tasks[index].dueDate != null ? Text("${tasks[index].dueDate}") : Text("No Deadline"),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(10),
                    ),
                  ),
                );
              },
            ),
            
            // checkBox 2
            SizedBox(height: 16),
            
          ],
        ),
      ),
      floatingActionButton: Builder(
        builder: (context) {
          return FilledButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FormScreen()),
              );
            },
            child: Text("Tambah"),
          );
        },
      ),
    );
  }

  Widget statusTab(String title) {
    String status = title.replaceAll(RegExp(r' \d+$'), '');

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedStatus = status;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: selectedStatus == status
                  ? Colors.black
                  : Colors.transparent,
              width: 3,
            ),
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            fontWeight: selectedStatus == status
                ? FontWeight.bold
                : FontWeight.normal,
            color: selectedStatus == status ? Colors.black : Colors.grey,
          ),
        ),
      ),
    );
  }
}
