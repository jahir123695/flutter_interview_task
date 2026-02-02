import 'package:flutter/material.dart';
import '../models/collection_model.dart';
import '../widgets/collection_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int expandedIndex = -1; // Only one open at a time

  void toggleAccordion(int index) {
    setState(() {
      expandedIndex = expandedIndex == index ? -1 : index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Collections")),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: collections.length,
        itemBuilder: (context, index) {
          final collection = collections[index];
          final isExpanded = expandedIndex == index;

          return CollectionCard(
            collection: collection,
            isExpanded: isExpanded,
            onTap: () => toggleAccordion(index),
          );
        },
      ),
    );
  }
}
