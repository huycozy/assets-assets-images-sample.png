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

  Widget _buildIconExample() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            const Icon(Icons.favorite, color: Colors.red, size: 32),
            const Text('Favorite'),
          ],
        ),
        Column(
          children: [
            const Icon(Icons.star, color: Colors.amber, size: 32),
            const Text('Star'),
          ],
        ),
        Column(
          children: [
            const Icon(Icons.home, color: Colors.blue, size: 32),
            const Text('Home'),
          ],
        ),
        Column(
          children: [
            const Icon(Icons.settings, color: Colors.grey, size: 32),
            const Text('Settings'),
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const CircleAvatar(
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
        const CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(
            'https://picsum.photos/seed/user1/60/60.jpg',
          ),
        ),
        CircleAvatar(
          radius: 30,
          backgroundColor: Colors.green.shade400,
          child: const Icon(Icons.person, color: Colors.white, size: 30),
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
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
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
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        const Chip(label: Text('Default')),
        Chip(
          avatar: const Icon(Icons.person, size: 16),
          label: const Text('User'),
          backgroundColor: Colors.blue.shade100,
        ),
        Chip(
          label: const Text('Deletable'),
          onDeleted: () {},
          deleteIcon: const Icon(Icons.close),
        ),
        const ActionChip(label: Text('Action'), avatar: Icon(Icons.touch_app), onPressed: null),
        const FilterChip(label: Text('Filter'), selected: true, onSelected: null),
        const ChoiceChip(
          label: Text('Choice'),
          selected: false,
          onSelected: null,
        ),
      ],
    );
  }

  Widget _buildBadgeExample() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Badge(label: const Text('3'), child: const Icon(Icons.notifications)),
        Badge(
          label: const Text('NEW'),
          child: ElevatedButton(onPressed: () {}, child: const Text('Button')),
        ),
        Badge(
          backgroundColor: Colors.red,
          label: const Text('99+'),
          child: const Icon(Icons.mail),
        ),
      ],
    );
  }

  Widget _buildDividerExample() {
    return const Column(
      children: [
        Text('First item'),
        Divider(height: 32, thickness: 2),
        Text('Second item'),
        Divider(height: 32, thickness: 2, indent: 20, endIndent: 20),
        Text('Third item'),
      ],
    );
  }
}
