import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NewLists extends StatefulWidget {
  const NewLists({Key? key}) : super(key: key);

  @override
  State<NewLists> createState() => _NewListsState();
}

class _NewListsState extends State<NewLists> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, index) {
      return ListTile(
        title: Text('News List $index'),
        contentPadding: const EdgeInsets.all(16),
        onTap: () {
          log('onTap');
          context.push('/list/details');
        },
      );
    });
  }
}
