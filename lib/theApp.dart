import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class getApplication extends StatefulWidget {
  const getApplication({super.key});

  @override
  State<getApplication> createState() => _getApplicationState();
}

class _getApplicationState extends State<getApplication> {
  final TextEditingController taskController = TextEditingController();
  List<String> tasks = [];
  List<bool> taskStatus = [];

  @override
  Widget build(BuildContext context) {
    final getWidth = MediaQuery.of(context).size.width;
    final getHeight = MediaQuery.of(context).size.height;
    final now = DateTime.now();

    return Scaffold(
      backgroundColor: Color(0xFFFFF9C4),
      body: SafeArea(
        child: Container(
          height: getHeight,
          child: Column(
            children: [
              // ************************* Task Bar ************************

              Container(
                padding: EdgeInsets.only(top: 15),
                child: Center(
                  child: Column(
                    children: [
                      Container(
                        width: getWidth * 0.8,
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: "What are you gonna do?",
                            labelStyle: TextStyle(
                              color: Colors.grey[600],
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          controller: taskController,
                          keyboardType: TextInputType.text,
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 15)),
                      TextButton(
                        onPressed: addTask,
                        child: Text(
                          "Add Task",
                          style: TextStyle(fontSize: 20),
                        ),
                        style: TextButton.styleFrom(
                          backgroundColor: Color(0xFF66BB6A),
                          foregroundColor: Colors.white,
                          minimumSize: Size(getWidth * 0.3, 50),
                          elevation: 8,
                          shadowColor: Colors.black,
                          fixedSize: Size.fromWidth(getWidth * 0.4),
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 30)),
                    ],
                  ),
                ),
              ),
              // ************************* List Bar ************************
              Expanded(
                child: ListView.builder(
                  itemCount: tasks.length,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                      elevation: 4,
                      color: taskStatus[index]
                          ? Color(0xFFE8F5E9)
                          : Color(0xFFF3E5F5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Checkbox(
                              activeColor: Colors.green,
                              value: taskStatus[index],
                              onChanged: (bool? value) {
                                setState(() {
                                  taskStatus[index] = value!;
                                });
                              },
                            ),
                            Expanded(
                              child: Text(
                                "${index + 1} - ${tasks[index]}",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyle(
                                  color: Color(0xFF4E342E),
                                  decoration: taskStatus[index]
                                      ? TextDecoration.lineThrough
                                      : TextDecoration.none,
                                ),
                              ),
                            ),
                            Row(children: [
                              Text(
                                "${now.day}/${now.month}/${now.year}\n ${now.hour}:${now.minute}",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 10),
                              ),
                              IconButton(
                                color: Color(0xFFEF5350),
                                onPressed: () {
                                  setState(() {
                                    tasks.removeAt(index);
                                    taskStatus.removeAt(index);
                                  });
                                },
                                icon: FaIcon(FontAwesomeIcons.trashCan),
                              ),
                            ]),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void addTask() {
    String text = taskController.text.trim();
    if (text.isNotEmpty) {
      setState(() {
        tasks.add(text);
        taskStatus.add(false);
        taskController.clear();
      });
    }
  }
}
