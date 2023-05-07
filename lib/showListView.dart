import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:inventaire/choisirLocal.dart';

class ShowListView extends StatefulWidget {
  @override
  _ShowListViewState createState() => _ShowListViewState();
}

class _ShowListViewState extends State<ShowListView> {
  TextEditingController _textEditingController = TextEditingController();
  List<String> _items = [];

  Future<List<String>> _getItems() async {
    // Send a GET request to fetch the items from the database
    final response = await http.post(Uri.parse('http://10.0.2.2:80/inventaire/showListView.php'));

    if (response.statusCode == 200) {
      // If the request is successful, parse the response and return the items
      return response.body.split('\n');
    } else {
      // If the request is unsuccessful, throw an exception
      throw Exception('Failed to load items');
    }
  }

  Future<void> _saveItem(String item) async {
    var headers = {
      'Content-Type': 'application/x-www-form-urlencoded'
    };
    var request = http.Request('POST', Uri.parse('http://localhost/inventaire/saveListView.php/'));
    request.bodyFields = {
      'item': item
    };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    }
    else {
      print(response.reasonPhrase);
    }

  }

  void _addItem(String item) {
    setState(() {
      _items.add(item);
    });
  }

  void _showAddItemDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Item'),
          content: TextField(
            controller: _textEditingController,
            decoration: InputDecoration(hintText: 'Item Name'),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                _saveItem(_textEditingController.text);
                _addItem(_textEditingController.text);
                _textEditingController.clear();
                Navigator.of(context).pop();
              },
              child: Text('Add'),
            ),
            TextButton(
              onPressed: () {
                _textEditingController.clear();
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _getItems().then((value) => setState(() {
      _items = value;
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My App Title'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChoisirLocal()),
                );
              },
              title: Text(_items[index]),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddItemDialog,
        child: const Icon(Icons.add),
      ),
    );
  }
}
