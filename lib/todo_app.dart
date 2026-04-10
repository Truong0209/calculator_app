import 'package:flutter/material.dart';

class TodoPage extends StatefulWidget {
  @override
  _TodoPageState createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  List<String> todos = [];
  TextEditingController controller = TextEditingController();

  // Thêm công việc
  void addTodo() {
    if (controller.text.trim().isNotEmpty) {
      setState(() {
        todos.add(controller.text.trim());
        controller.clear();
      });
    }
  }

  // Xóa công việc
  void removeTodo(int index) {
    setState(() {
      todos.removeAt(index);
    });
  }

  @override
  void dispose() {
    controller.dispose(); // tránh lỗi bộ nhớ
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("2224802010755_BuiThucTruong"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            // Ô nhập + nút thêm
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      hintText: "Nhập công việc...",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: addTodo,
                  child: Text("Thêm"),
                ),
              ],
            ),

            SizedBox(height: 10),

            // Danh sách công việc
            Expanded(
              child: todos.isEmpty
                  ? Center(child: Text("Chưa có công việc nào"))
                  : ListView.builder(
                      itemCount: todos.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            title: Text(todos[index]),
                            trailing: IconButton(
                              icon: Icon(Icons.delete, color: Colors.red),
                              onPressed: () => removeTodo(index),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}