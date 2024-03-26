import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> names = ['Andrew', 'Tara', 'Bernard'];
  
  void addName(String newName) {
    setState(() {
      names.add(newName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DAFTAR NAMA MAHASISWA PRADITA UNIVERSITY'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: names.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Card(
              elevation: 4.0,
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/black_suit.png'),
                  radius: 30.0,
                ),
                title: Text(
                  names[index],
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    setState(() {
                      names.removeAt(index);
                    });
                  },
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              String newName = '';
              return AlertDialog(
                title: Text('Add New Name'),
                content: TextField(
                  onChanged: (value) {
                    newName = value;
                  },
                  decoration: InputDecoration(
                    hintText: 'Enter a name',
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      if (newName.isNotEmpty) {
                        addName(newName);
                        Navigator.of(context).pop();
                      }
                    },
                    child: Text('Add'),
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
