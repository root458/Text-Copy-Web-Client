import 'package:copy_client/components/text_item.dart';
import 'package:copy_client/firebase_functions/firebase_functions.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Data
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    Database _database = Database();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        title: const Text(
          'Copy your text',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: StreamBuilder<List>(
          stream: _database.copiedTexts,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              final _copiedTexts = snapshot.data;

              return ListView.builder(
                reverse: true,
                itemCount: _copiedTexts?.length,
                padding: EdgeInsets.fromLTRB(_width * 0.05, _height * 0.03,
                    _width * 0.25, _height * 0.03),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: TextItem(
                      width: _width,
                      copiedText: _copiedTexts![index],
                    ),
                  );
                },
              );
            } else {
              return const Center(
                child: Text('No copied text yet'),
              );
            }
          }),
    );
  }
}
