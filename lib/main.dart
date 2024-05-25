// lib/main.dart
import 'package:flutter/material.dart';
import 'dummy_data.dart'; // Import your dummy data here
import 'package:book/book.dart' as lib2; // Import with prefix

void main() {
  runApp(BookListApp());
}

class BookListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Book List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BookListScreen(),
    );
  }
}

class BookListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book List'),
      ),
      body: ListView.builder(
        itemCount: dummyBooks.length,
        itemBuilder: (ctx, index) {
          return ListTile(
            title: Text(dummyBooks[index].title),
            subtitle: Text(dummyBooks[index].author),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => BookDetailScreen(book: dummyBooks[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class BookDetailScreen extends StatelessWidget {
  final lib2.Book book;

  BookDetailScreen({required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Author: ${book.author}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              book.description,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
