import 'package:flutter/material.dart';
import 'package:qr/app_constants.dart';

import 'qr_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController _textController;
  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
                controller: _textController,
                decoration: InputDecoration(
                  prefixIcon: IconButton(
                    onPressed: () async {
                      final String? result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const QrScreen(),
                        ),
                      );
                      setState(() {
                        _textController.text = result ?? "";
                      });
                    },
                    icon: const Icon(
                      Icons.qr_code,
                      color: AppColors.mainColor,
                    ),
                  ),
                )),
            const SizedBox(height: 20),
            const TextField(),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: const Text("GO"),
            ),
          ],
        ),
      )),
    );
  }
}
