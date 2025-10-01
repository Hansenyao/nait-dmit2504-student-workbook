import 'package:flutter/material.dart';
import 'package:navigation_intro/routes.dart' as routes;
import 'package:navigation_intro/pages/page_two.dart';

class PageOne extends StatefulWidget {
  const PageOne({super.key});

  @override
  State<PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  var data = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Page One'),
            ElevatedButton(
              onPressed: () async {
                var result = await Navigator.of(
                  context,
                ).pushNamed(routes.pageTwoRoute);
                setState(() {
                  data = result as String;
                });
              },
              child: Text('Route to Page Two'),
            ),
            data.isEmpty ? Text('Awating Data') : Text('Recieved: $data'),
          ],
        ),
      ),
    );
  }
}
