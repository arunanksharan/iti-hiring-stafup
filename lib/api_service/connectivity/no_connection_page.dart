import 'package:flutter/material.dart';

class NoConnectionPage extends StatefulWidget {
  const NoConnectionPage({Key? key}) : super(key: key);
  @override
  NoConnectionPageState createState() => NoConnectionPageState();
}

class NoConnectionPageState extends State<NoConnectionPage> {
  NoConnectionPageState();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Icon(
                Icons.error_outline,
                size: 100,
                color: Colors.deepPurple,
              ),
              const Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'Oops, something went wrong',
                  style: TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.canPop(context);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
                ),
                child: const Text(
                  'Back',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
