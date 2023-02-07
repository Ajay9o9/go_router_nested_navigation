import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Details extends StatefulWidget {
  const Details({Key? key}) : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body: Center(
        child: Column(
          children: [
            const Text('Lorem ipsum et dolor sit amet '
                'Lorem ipsum et dolor sit amet Lorem ipsum et dolor sit amet '
                'Lorem ipsum et dolor sit amet Lorem ipsum et dolor sit amet '
                'Lorem ipsum et dolor sit amet Lorem ipsum et dolor sit amet '
                'Lorem ipsum et dolor sit amet Lorem ipsum et dolor sit amet '),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () {
                GoRouter router = GoRouter.of(context);
                router.push('/list/comments');
              },
              child: const Text('Go to comments!'),
            ),
          ],
        ),
      ),
    );
  }
}
