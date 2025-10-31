import 'package:flutter/material.dart';

class ScrollingWidgetsScreen extends StatelessWidget {
  const ScrollingWidgetsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scrolling Widgets'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildWidgetSection(
            context,
            'ListView',
            'A scrollable, linear list of widgets.',
            _buildListViewExample(),
          ),
          _buildWidgetSection(
            context,
            'GridView',
            'A scrollable, 2D array of widgets.',
            _buildGridViewExample(),
          ),
          _buildWidgetSection(
            context,
            'SingleChildScrollView',
            'A box in which a single widget can be scrolled.',
            _buildSingleChildScrollViewExample(),
          ),
          _buildWidgetSection(
            context,
            'PageView',
            'A scrollable list that works page by page.',
            _buildPageViewExample(),
          ),
          _buildWidgetSection(
            context,
            'CustomScrollView',
            'A scrollView that creates custom scroll effects using slivers.',
            _buildCustomScrollViewExample(),
          ),
          _buildWidgetSection(
            context,
            'RefreshIndicator',
            'A widget that supports the Material "swipe to refresh" idiom.',
            _buildRefreshIndicatorExample(),
          ),
          _buildWidgetSection(
            context,
            'ReorderableListView',
            'A list whose items the user can reorder by dragging.',
            _buildReorderableListViewExample(),
          ),
          _buildWidgetSection(
            context,
            'ExpansionTile',
            'A single-line ListTile with a button to expand/collapse the tile and reveal its children.',
            _buildExpansionTileExample(),
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
              height: 200,
              width: double.infinity,
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

  Widget _buildListViewExample() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.blue,
            child: Text('${index + 1}'),
          ),
          title: Text('Item ${index + 1}'),
          subtitle: Text('This is item number ${index + 1} in the list'),
          trailing: const Icon(Icons.arrow_forward_ios),
        );
      },
    );
  }

  Widget _buildGridViewExample() {
    return GridView.builder(
      padding: const EdgeInsets.all(8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: 9,
      itemBuilder: (context, index) {
        final colors = [
          Colors.red,
          Colors.green,
          Colors.blue,
          Colors.orange,
          Colors.purple,
        ];
        final color = colors[index % colors.length];
        return Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              'Grid ${index + 1}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildSingleChildScrollViewExample() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          10,
          (index) => Container(
            width: 100,
            height: 150,
            margin: const EdgeInsets.only(right: 8),
            decoration: BoxDecoration(
              color: Colors.amber[400 + index * 100],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.star, color: Colors.white, size: 24),
                  Text(
                    'Item ${index + 1}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPageViewExample() {
    return PageView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        final colors = [
          Colors.teal,
          Colors.indigo,
          Colors.pink,
          Colors.cyan,
          Colors.lime,
        ];
        final color = colors[index % colors.length];
        return Container(
          margin: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.pageview, color: Colors.white, size: 48),
                const SizedBox(height: 16),
                Text(
                  'Page ${index + 1}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Swipe to see more pages',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildCustomScrollViewExample() {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 100,
          floating: false,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            title: const Text('Custom ScrollView'),
            background: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue, Colors.purple],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
          ),
        ),
        SliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 4,
            mainAxisSpacing: 4,
          ),
          delegate: SliverChildBuilderDelegate((context, index) {
            final colors = [Colors.red, Colors.green, Colors.blue];
            final color = colors[index % colors.length];
            return Container(
              color: color,
              child: Center(
                child: Text(
                  '${index + 1}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          }, childCount: 9),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return ListTile(
              leading: const Icon(Icons.list),
              title: Text('List Item ${index + 1}'),
              subtitle: Text('This is item ${index + 1} in a sliver list'),
            );
          }, childCount: 5),
        ),
      ],
    );
  }

  Widget _buildRefreshIndicatorExample() {
    return Builder(
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            final List<String> items = List.generate(10, (index) => 'Item ${index + 1}');
            bool isRefreshing = false;

            return RefreshIndicator(
              onRefresh: () async {
                setState(() {
                  isRefreshing = true;
                });

                // Simulate a network call or data refresh
                await Future.delayed(const Duration(seconds: 2));

                setState(() {
                  isRefreshing = false;
                });

                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Data refreshed successfully!'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                }
              },
              child: ListView.builder(
                itemCount: items.length + 1,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    // Header item with instructions
                    return Container(
                      padding: const EdgeInsets.all(16),
                      color: Theme.of(context).colorScheme.primaryContainer,
                      child: Column(
                        children: [
                          const Icon(
                            Icons.refresh,
                            size: 32,
                            color: Colors.white,
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Pull down to refresh',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            'Last refresh: ${isRefreshing ? "Refreshing..." : "Never"}',
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    );
                  }

                  final itemIndex = index - 1;
                  return Card(
                    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        child: Text(
                          '${itemIndex + 1}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      title: Text(items[itemIndex]),
                      subtitle: Text('Pull to refresh this list'),
                      trailing: Icon(
                        Icons.arrow_downward,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  );
                },
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildReorderableListViewExample() {
    return Builder(
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            final List<String> items = [
              '📚 Books',
              '🎵 Music',
              '🎬 Movies',
              '🎮 Games',
              '📷 Photography',
              '🍳 Cooking',
              '🏃 Exercise',
              '📝 Writing',
            ];

            return Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.info_outline, color: Colors.white),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          'Drag and drop items to reorder them!',
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: ReorderableListView.builder(
                    itemCount: items.length,
                    onReorder: (int oldIndex, int newIndex) {
                      setState(() {
                        if (oldIndex < newIndex) {
                          newIndex -= 1;
                        }
                        final String item = items.removeAt(oldIndex);
                        items.insert(newIndex, item);
                      });
                    },
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        key: ValueKey(items[index]),
                        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                        elevation: 2,
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Theme.of(context).colorScheme.primary,
                            child: Text(
                              '${index + 1}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          title: Text(
                            items[index],
                            style: const TextStyle(fontWeight: FontWeight.w500),
                          ),
                          subtitle: Text('Drag to reorder this item'),
                          trailing: const Icon(Icons.drag_indicator),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Widget _buildExpansionTileExample() {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        ExpansionTile(
          leading: const Icon(Icons.person),
          title: const Text('User Profile'),
          subtitle: const Text('Click to expand'),
          backgroundColor: Colors.blue.shade50,
          children: const [
            ListTile(
              leading: Icon(Icons.email),
              title: Text('Email'),
              subtitle: Text('user@example.com'),
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('Phone'),
              subtitle: Text('+1 234 567 8900'),
            ),
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text('Location'),
              subtitle: Text('San Francisco, CA'),
            ),
          ],
        ),
        ExpansionTile(
          leading: const Icon(Icons.settings),
          title: const Text('Settings'),
          subtitle: const Text('Application settings'),
          backgroundColor: Colors.green.shade50,
          initiallyExpanded: true,
          children: const [
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text('Notifications'),
              subtitle: Text('Manage notification preferences'),
            ),
            ListTile(
              leading: Icon(Icons.privacy_tip),
              title: Text('Privacy'),
              subtitle: Text('Privacy and security settings'),
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text('Help & Support'),
              subtitle: Text('Get help with the application'),
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('About'),
              subtitle: Text('Application information'),
            ),
          ],
        ),
        ExpansionTile(
          leading: const Icon(Icons.shopping_cart),
          title: const Text('Shopping Cart'),
          subtitle: const Text('3 items'),
          backgroundColor: Colors.orange.shade50,
          children: const [
            ListTile(
              leading: Icon(Icons.shopping_bag),
              title: Text('Item 1'),
              subtitle: Text('Quantity: 2 - \$19.99'),
              trailing: Text('\$39.98'),
            ),
            ListTile(
              leading: Icon(Icons.shopping_bag),
              title: Text('Item 2'),
              subtitle: Text('Quantity: 1 - \$24.99'),
              trailing: Text('\$24.99'),
            ),
            ListTile(
              leading: Icon(Icons.shopping_bag),
              title: Text('Item 3'),
              subtitle: Text('Quantity: 1 - \$14.99'),
              trailing: Text('\$14.99'),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.attach_money),
              title: Text('Total'),
              trailing: Text(
                '\$79.96',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
          ],
        ),
        ExpansionTile(
          leading: const Icon(Icons.folder),
          title: const Text('File Manager'),
          subtitle: const Text('File and folder management'),
          backgroundColor: Colors.purple.shade50,
          children: const [
            ListTile(
              leading: Icon(Icons.photo),
              title: Text('Images'),
              subtitle: Text('245 files'),
              trailing: Text('12.3 GB'),
            ),
            ListTile(
              leading: Icon(Icons.videocam),
              title: Text('Videos'),
              subtitle: Text('18 files'),
              trailing: Text('8.7 GB'),
            ),
            ListTile(
              leading: Icon(Icons.description),
              title: Text('Documents'),
              subtitle: Text('156 files'),
              trailing: Text('2.1 GB'),
            ),
          ],
        ),
      ],
    );
  }
}
