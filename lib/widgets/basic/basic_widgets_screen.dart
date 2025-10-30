import 'package:flutter/material.dart';

class BasicWidgetsScreen extends StatelessWidget {
  const BasicWidgetsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basic Widgets'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildWidgetSection(
            context,
            'Text',
            'The Text widget displays a string of text with a single style.',
            _buildTextExample(),
          ),
          _buildWidgetSection(
            context,
            'Row',
            'A widget that displays its children in a horizontal array.',
            _buildRowExample(),
          ),
          _buildWidgetSection(
            context,
            'Column',
            'A widget that displays its children in a vertical array.',
            _buildColumnExample(),
          ),
          _buildWidgetSection(
            context,
            'Container',
            'A convenience widget that combines common painting, positioning, and sizing widgets.',
            _buildContainerExample(),
          ),
          _buildWidgetSection(
            context,
            'SizedBox',
            'A box with a specified size.',
            _buildSizedBoxExample(),
          ),
          _buildWidgetSection(
            context,
            'Center',
            'A widget that centers its child within itself.',
            _buildCenterExample(),
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

  Widget _buildTextExample() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'This is a simple text widget',
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 8),
        Text(
          'This is styled text',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'This is a longer text that demonstrates how the Text widget handles wrapping when the content exceeds the available width. It automatically breaks lines and continues on the next line.',
          style: TextStyle(fontSize: 14),
        ),
      ],
    );
  }

  Widget _buildRowExample() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: 50,
          height: 50,
          color: Colors.red,
          child: const Center(
            child: Text('1', style: TextStyle(color: Colors.white)),
          ),
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.green,
          child: const Center(
            child: Text('2', style: TextStyle(color: Colors.white)),
          ),
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.blue,
          child: const Center(
            child: Text('3', style: TextStyle(color: Colors.white)),
          ),
        ),
      ],
    );
  }

  Widget _buildColumnExample() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: double.infinity,
          height: 40,
          color: Colors.orange,
          child: const Center(
            child: Text('First', style: TextStyle(color: Colors.white)),
          ),
        ),
        Container(
          width: double.infinity,
          height: 40,
          color: Colors.purple,
          child: const Center(
            child: Text('Second', style: TextStyle(color: Colors.white)),
          ),
        ),
        Container(
          width: double.infinity,
          height: 40,
          color: Colors.cyan,
          child: const Center(
            child: Text('Third', style: TextStyle(color: Colors.white)),
          ),
        ),
      ],
    );
  }

  Widget _buildContainerExample() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue.shade400, Colors.purple.shade400],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: const Text(
        'Styled Container',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildSizedBoxExample() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          width: 60,
          height: 60,
          child: Container(
            color: Colors.teal,
            child: const Center(
              child: Text('60x60', style: TextStyle(color: Colors.white)),
            ),
          ),
        ),
        SizedBox(
          width: 80,
          height: 40,
          child: Container(
            color: Colors.indigo,
            child: const Center(
              child: Text('80x40', style: TextStyle(color: Colors.white)),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCenterExample() {
    return Container(
      width: double.infinity,
      height: 120,
      color: Colors.grey.shade200,
      child: const Center(
        child: Text(
          'Centered Content',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
