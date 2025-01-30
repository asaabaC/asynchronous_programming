// student_list_screen.dart
import 'package:flutter/material.dart';
import 'dart:async';

class StudentListScreen extends StatelessWidget {
  const StudentListScreen({super.key});

  // Simulate fetching the student list after 5 seconds
  Future<List<String>> fetchStudentsList() async {
    await Future.delayed(const Duration(seconds: 5));
    return ['linda', 'liz', 'Esther', 'Charlotte', 'Asaaba'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Student List')),
      body: FutureBuilder<List<String>>(
        future: fetchStudentsList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } 
          else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } 
          else if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const Icon(Icons.person),
                  title: Text(snapshot.data![index]),
                );
              },
            );
          }
          return const Center(child: Text('No data available.'));
        },
      ),
    );
  }
}