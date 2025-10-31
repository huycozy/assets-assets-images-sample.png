import 'package:flutter/material.dart';
import '../widgets/basic/basic_widgets_screen.dart';
import '../widgets/layout/layout_widgets_screen.dart';
import '../widgets/input/input_widgets_screen.dart';
import '../widgets/display/display_widgets_screen.dart';
import '../widgets/scrolling/scrolling_widgets_screen.dart';
import '../widgets/interactive/interactive_widgets_screen.dart';
import '../widgets/navigation/navigation_widgets_screen.dart';
import '../widgets/dialogs/dialog_widgets_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Widgets Gallery'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: isMobile ? 12.0 : 24.0, vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Explore Flutter Widgets',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontSize: isMobile ? 24 : null,
              ),
            ),
            SizedBox(height: isMobile ? 6 : 8),
            SelectableText(
              'Discover and learn about all available widgets in Flutter framework',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Theme.of(
                  context,
                ).colorScheme.onSurface.withValues(alpha: 0.7),
                fontSize: isMobile ? 14 : null,
              ),
            ),
            SizedBox(height: isMobile ? 16 : 24),
            Expanded(
              child: GridView.count(
                crossAxisCount: isMobile ? 1 : 2,
                crossAxisSpacing: isMobile ? 8 : 16,
                mainAxisSpacing: isMobile ? 8 : 16,
                childAspectRatio: isMobile ? 2.8 : 2.0,
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
                  _buildCategoryCard(
                    context,
                    'Dialog Widgets',
                    'AlertDialog, SimpleDialog, Custom Dialogs, etc.',
                    Icons.chat,
                    Colors.deepOrange,
                    const DialogWidgetsScreen(),
                  ),
                  _buildCategoryCard(
                    context,
                    'Navigation Widgets',
                    'Drawer, BottomNavigationBar, TabBar, etc.',
                    Icons.navigation,
                    Colors.indigo,
                    const NavigationWidgetsScreen(),
                  ),
                ],
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
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

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
          padding: EdgeInsets.all(isMobile ? 12.0 : 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(isMobile ? 8.0 : 6.0),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Icon(icon, size: isMobile ? 24 : 20, color: color),
              ),
              SizedBox(height: isMobile ? 8 : 6),
              Text(
                title,
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: isMobile ? 16 : null,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: isMobile ? 4 : 1),
              Text(
                description,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontSize: isMobile ? 12 : null,
                ),
                textAlign: TextAlign.center,
                maxLines: isMobile ? 3 : 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
