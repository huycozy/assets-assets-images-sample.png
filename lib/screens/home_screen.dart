import 'package:flutter/material.dart';
import '../widgets/basic/basic_widgets_screen.dart';
import '../widgets/layout/layout_widgets_screen.dart';
import '../widgets/input/input_widgets_screen.dart';
import '../widgets/display/display_widgets_screen.dart';
import '../widgets/scrolling/scrolling_widgets_screen.dart';
import '../widgets/interactive/interactive_widgets_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Widgets Gallery'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Explore Flutter Widgets',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 8),
            SelectableText(
              'Discover and learn about all available widgets in Flutter framework',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Theme.of(
                  context,
                ).colorScheme.onSurface.withValues(alpha: 0.7),
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 48.0),
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 2,
                  children: [
                  _buildCategoryCard(
                    context,
                    'Basic Widgets',
                    'Text, Row, Column, Container, etc.',
                    Icons.text_fields,
                    Colors.blue,
                    const BasicWidgetsScreen(),
                  ),
                  _buildCategoryCard(
                    context,
                    'Layout Widgets',
                    'Padding, Align, Expanded, Stack, etc.',
                    Icons.grid_view,
                    Colors.green,
                    const LayoutWidgetsScreen(),
                  ),
                  _buildCategoryCard(
                    context,
                    'Input Widgets',
                    'TextField, Button, Checkbox, etc.',
                    Icons.input,
                    Colors.orange,
                    const InputWidgetsScreen(),
                  ),
                  _buildCategoryCard(
                    context,
                    'Display Widgets',
                    'Image, Icon, CircleAvatar, etc.',
                    Icons.image,
                    Colors.purple,
                    const DisplayWidgetsScreen(),
                  ),
                  _buildCategoryCard(
                    context,
                    'Scrolling Widgets',
                    'ListView, GridView, CustomScrollView, etc.',
                    Icons.list_alt,
                    Colors.red,
                    const ScrollingWidgetsScreen(),
                  ),
                  _buildCategoryCard(
                    context,
                    'Interactive Widgets',
                    'GestureDetector, InkWell, Draggable, etc.',
                    Icons.touch_app,
                    Colors.teal,
                    const InteractiveWidgetsScreen(),
                  ),
                ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryCard(
    BuildContext context,
    String title,
    String description,
    IconData icon,
    Color color,
    Widget destination,
  ) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => destination),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Icon(icon, size: 20, color: color),
              ),
              const SizedBox(height: 6),
              Text(
                title,
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 1),
              Text(
                description,
                style: Theme.of(context).textTheme.bodySmall,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
