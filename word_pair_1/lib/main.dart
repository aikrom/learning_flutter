import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Word Pairs 1",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Word Pairs 1"),
        ),
        body: Center(
          child: RandomWords(),
        ),
      ),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];

  Widget _buildRow(WordPair pair) {
    return ListTile(
      title: Text(pair.asSnakeCase),
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(itemBuilder: (BuildContext _context, i) {
      if (i.isOdd) {
        return Divider();
      }

      final int index = i ~/ 2;

      if (index >= _suggestions.length) {
        _suggestions.addAll(generateWordPairs().take(10));
      }

      return _buildRow(_suggestions[index]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return _buildSuggestions();
  }
}
