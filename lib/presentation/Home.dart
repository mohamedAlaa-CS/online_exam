import 'package:flutter/material.dart';
import 'package:online_exam/core/cache/shared_preferences.dart';
import 'package:online_exam/core/helper/constant.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? token;

  @override
  void initState() {
    super.initState();
    _getToken();
  }

  Future<void> _getToken() async {
    String savedToken =
        SharedPreferencesHelper.getString(key: Constant.keyToken);

    setState(() {
      token = savedToken.isNotEmpty ? savedToken : null;
    });
  }

  Future<void> _clearCache() async {
    await SharedPreferencesHelper.removeData(key: Constant.keyToken);

    setState(() {
      token = null;
    });

    print("Cache......................");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            token != null
                ? Text("Token: $token")
                : const Text("No Token In Cache!"),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _clearCache,
              child: const Text("Clear Cache"),
            ),
          ],
        ),
      ),
    );
  }
}
