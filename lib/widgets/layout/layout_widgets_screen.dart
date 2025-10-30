import 'package:flutter/material.dart';

class LayoutWidgetsScreen extends StatelessWidget {
  const LayoutWidgetsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Layout Widgets'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildWidgetSection(
            context,
            'Padding',
            'A widget that insets its child by the given padding.',
            _buildPaddingExample(),
          ),
          _buildWidgetSection(
            context,
            'Align',
            'A widget that aligns its child within itself and optionally sizes itself based on the child\'s size.',
            _buildAlignExample(),
          ),
          _buildWidgetSection(
            context,
            'Expanded',
            'A widget that expands a child of a Row, Column, or Flex so that the child fills the available space.',
            _buildExpandedExample(),
          ),
          _buildWidgetSection(
            context,
            'Stack',
            'A widget that positions its children relative to the edges of its box.',
            _buildStackExample(),
          ),
          _buildWidgetSection(
            context,
            'Wrap',
            'A widget that displays its children in multiple horizontal or vertical runs.',
            _buildWrapExample(),
          ),
        ],
      ),
    );
  }

  Widget _buildWidgetSection(
    BuildContext context,
    String title,
    String description,
    Widget example,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(description, style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(8),
              ),
              child: example,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaddingExample() {
    return Container(
      color: Colors.blue.shade100,
      child: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          'This text has 16px padding on all sides',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }

  Widget _buildAlignExample() {
    return Container(
      height: 120,
      color: Colors.grey.shade200,
      child: const Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Top Left',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              'Center',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Text(
              'Bottom Right',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExpandedExample() {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            height: 60,
            color: Colors.red,
            child: const Center(
              child: Text('Flex 1', style: TextStyle(color: Colors.white)),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            height: 60,
            color: Colors.green,
            child: const Center(
              child: Text('Flex 2', style: TextStyle(color: Colors.white)),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            height: 60,
            color: Colors.blue,
            child: const Center(
              child: Text('Flex 1', style: TextStyle(color: Colors.white)),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStackExample() {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 150,
          color: Colors.purple.shade100,
        ),
        Positioned(
          top: 10,
          left: 10,
          child: Container(
            width: 80,
            height: 80,
            color: Colors.red,
            child: const Center(
              child: Text('Top Left', style: TextStyle(color: Colors.white)),
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: Container(
            width: 60,
            height: 60,
            color: Colors.blue,
            child: const Center(
              child: Text('BR', style: TextStyle(color: Colors.white)),
            ),
          ),
        ),
        Center(
          child: Container(
            padding: const EdgeInsets.all(8),
            color: Colors.orange,
            child: const Text(
              'Center',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildWrapExample() {
    return Wrap(
      spacing: 8.0,
      runSpacing: 4.0,
      children: [
        Chip(label: const Text('Flutter')),
        Chip(label: const Text('Dart')),
        Chip(label: const Text('Widgets')),
        Chip(label: const Text('Material')),
        Chip(label: const Text('Cupertino')),
        Chip(label: const Text('Stateless')),
        Chip(label: const Text('Stateful')),
        Chip(label: const Text('Animation')),
        Chip(label: const Text('Gesture')),
        Chip(label: const Text('Layout')),
      ],
    );
  }
}
