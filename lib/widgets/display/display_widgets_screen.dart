import 'package:flutter/material.dart';

class DisplayWidgetsScreen extends StatelessWidget {
  const DisplayWidgetsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Display Widgets'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildWidgetSection(
            context,
            'Icon',
            'A Material Design icon.',
            _buildIconExample(),
          ),
          _buildWidgetSection(
            context,
            'Image',
            'A widget that displays an image.',
            _buildImageExample(),
          ),
          _buildWidgetSection(
            context,
            'CircleAvatar',
            'A circle that represents a user.',
            _buildCircleAvatarExample(),
          ),
          _buildWidgetSection(
            context,
            'Card',
            'A Material Design card.',
            _buildCardExample(context),
          ),
          _buildWidgetSection(
            context,
            'Chip',
            'A material design chip.',
            _buildChipExample(),
          ),
          _buildWidgetSection(
            context,
            'Badge',
            'A material design badge.',
            _buildBadgeExample(),
          ),
          _buildWidgetSection(
            context,
            'Divider',
            'A thin horizontal line with padding on either side.',
            _buildDividerExample(),
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
              constraints: const BoxConstraints(minHeight: 200, maxHeight: 400),
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(8),
              ),
              child: IntrinsicHeight(child: example),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIconExample() {
    return const Wrap(
      alignment: WrapAlignment.spaceEvenly,
      spacing: 16,
      runSpacing: 8,
      children: [
        Column(
          children: [
            Icon(Icons.favorite, color: Colors.red, size: 32),
            Text('Favorite', style: TextStyle(fontSize: 14)),
          ],
        ),
        Column(
          children: [
            Icon(Icons.star, color: Colors.amber, size: 32),
            Text('Star', style: TextStyle(fontSize: 14)),
          ],
        ),
        Column(
          children: [
            Icon(Icons.home, color: Colors.blue, size: 32),
            Text('Home', style: TextStyle(fontSize: 14)),
          ],
        ),
        Column(
          children: [
            Icon(Icons.settings, color: Colors.grey, size: 32),
            Text('Settings', style: TextStyle(fontSize: 14)),
          ],
        ),
      ],
    );
  }

  Widget _buildImageExample() {
    return Column(
      children: [
        Image.network(
          'https://picsum.photos/seed/flutter/300/150.jpg',
          height: 150,
          width: double.infinity,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              height: 150,
              width: double.infinity,
              color: Colors.grey.shade300,
              child: const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.image_not_supported, size: 48),
                    Text('Image failed to load'),
                  ],
                ),
              ),
            );
          },
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              'assets/images/sample.png',
              width: 60,
              height: 60,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 60,
                  height: 60,
                  color: Colors.grey.shade300,
                  child: const Icon(Icons.image, color: Colors.grey),
                );
              },
            ),
            Container(
              width: 60,
              height: 60,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    'https://picsum.photos/seed/avatar/60/60.jpg',
                  ),
                  fit: BoxFit.cover,
                ),
                shape: BoxShape.circle,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCircleAvatarExample() {
    return const Wrap(
      alignment: WrapAlignment.spaceEvenly,
      spacing: 16,
      runSpacing: 8,
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: Colors.blue,
          child: Text(
            'JD',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(
            'https://picsum.photos/seed/user1/60/60.jpg',
          ),
        ),
        CircleAvatar(
          radius: 30,
          backgroundColor: Colors.green,
          child: Icon(Icons.person, color: Colors.white, size: 30),
        ),
      ],
    );
  }

  Widget _buildCardExample(BuildContext context) {
    return Card(
      elevation: 8,
      child: Column(
        children: [
          Container(
            height: 100,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue, Colors.purple],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Card Title',
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                const Text(
                  'This is a sample card with elevation and gradient background.',
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(onPressed: () {}, child: const Text('ACTION')),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChipExample() {
    return const Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        Chip(label: Text('Default', style: TextStyle(fontSize: 14))),
        Chip(
          avatar: Icon(Icons.person, size: 16),
          label: Text('User', style: TextStyle(fontSize: 14)),
          backgroundColor: Colors.blue,
        ),
        Chip(
          label: Text('Deletable', style: TextStyle(fontSize: 14)),
          onDeleted: null,
          deleteIcon: Icon(Icons.close, size: 18),
        ),
        ActionChip(
          label: Text('Action', style: TextStyle(fontSize: 14)),
          avatar: Icon(Icons.touch_app, size: 16),
          onPressed: null,
        ),
        FilterChip(
          label: Text('Filter', style: TextStyle(fontSize: 14)),
          selected: true,
          onSelected: null,
        ),
        ChoiceChip(
          label: Text('Choice', style: TextStyle(fontSize: 14)),
          selected: false,
          onSelected: null,
        ),
      ],
    );
  }

  Widget _buildBadgeExample() {
    return const Wrap(
      alignment: WrapAlignment.spaceEvenly,
      spacing: 16,
      runSpacing: 8,
      children: [
        Badge(
          label: Text('3', style: TextStyle(fontSize: 12)),
          child: Icon(Icons.notifications, size: 24),
        ),
        Badge(
          label: Text('NEW', style: TextStyle(fontSize: 12)),
          child: ElevatedButton(
            onPressed: null,
            child: Text('Button', style: TextStyle(fontSize: 14)),
          ),
        ),
        Badge(
          backgroundColor: Colors.red,
          label: Text('99+', style: TextStyle(fontSize: 12)),
          child: Icon(Icons.mail, size: 24),
        ),
      ],
    );
  }

  Widget _buildDividerExample() {
    return const Column(
      children: [
        Text('First item', style: TextStyle(fontSize: 16)),
        Divider(height: 32, thickness: 2),
        Text('Second item', style: TextStyle(fontSize: 16)),
        Divider(height: 32, thickness: 2, indent: 20, endIndent: 20),
        Text('Third item', style: TextStyle(fontSize: 16)),
      ],
    );
  }
}