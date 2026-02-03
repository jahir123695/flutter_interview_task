import 'package:flutter/material.dart';
import '../models/collection_model.dart';
import '../widgets/collection_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int expandedIndex = -1;

  void toggleAccordion(int index) {
    setState(() {
      expandedIndex = expandedIndex == index ? -1 : index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff5f5f5),
      appBar: AppBar(
        title: const Text("Collections"),
        backgroundColor: Color(0xff216584),
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
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
