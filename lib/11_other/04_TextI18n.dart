import 'package:flutter/material.dart';
import './CustomLocalizations.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("首页"),
        leading: const Icon(Icons.menu),
        actions: const [Icon(Icons.settings)],
        elevation: 1,
        centerTitle: true,
      ),
      body: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        // 'Hello',
        // Localizations.of(context, CustomLocalizations).t('greet'),
        CustomLocalizations.of(context).t('greet'),
        style: TextStyle(
          fontSize: 60,
        ),
      ),
    );
  }
}
