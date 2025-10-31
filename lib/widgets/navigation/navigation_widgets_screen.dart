import 'package:flutter/material.dart';

class NavigationWidgetsScreen extends StatelessWidget {
  const NavigationWidgetsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigation Widgets'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildWidgetSection(
            context,
            'Drawer',
            'A material design panel that slides in horizontally from the edge of a Scaffold.',
            _buildDrawerExample(),
          ),
          _buildWidgetSection(
            context,
            'BottomNavigationBar',
            'A bottom navigation bar that displays a row of small buttons at the bottom of the screen.',
            _buildBottomNavigationBarExample(),
          ),
          _buildWidgetSection(
            context,
            'BottomAppBar',
            'A material design bottom app bar that can contain navigation controls and other widgets.',
            _buildBottomAppBarExample(),
          ),
          _buildWidgetSection(
            context,
            'TabBar',
            'A horizontal row of tabs that can be tapped to switch between different views.',
            _buildTabBarExample(),
          ),
          _buildWidgetSection(
            context,
            'NavigationRail',
            'A side navigation bar that displays a vertical row of navigation items.',
            _buildNavigationRailExample(),
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
              height: 200,
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

  Widget _buildDrawerExample() {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.menu_open, size: 48, color: Colors.grey[600]),
            const SizedBox(height: 16),
            const Text(
              'Interactive Drawer Example',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Tap the button to open drawer demo',
              style: TextStyle(color: Colors.grey[600]),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Builder(
              builder: (context) {
                return ElevatedButton.icon(
                  onPressed: () => _showDrawerDemo(context),
                  icon: const Icon(Icons.open_in_new),
                  label: const Text('Open Drawer Demo'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showDrawerDemo(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        final GlobalKey<ScaffoldState> drawerKey = GlobalKey<ScaffoldState>();

        return Dialog(
          child: SizedBox(
            width: 300,
            height: 400,
            child: Scaffold(
              key: drawerKey,
              appBar: AppBar(
                title: const Text('Drawer Demo'),
                backgroundColor: Colors.blue.shade100,
                leading: IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () {
                    drawerKey.currentState?.openDrawer();
                  },
                ),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.of(dialogContext).pop(),
                  ),
                ],
              ),
              drawer: Drawer(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    const DrawerHeader(
                      decoration: BoxDecoration(color: Colors.blue),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Icon(Icons.person, color: Colors.blue),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'User Name',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          Text(
                            'user@example.com',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ListTile(
                      leading: const Icon(Icons.home),
                      title: const Text('Home'),
                      subtitle: const Text('Navigate to home page'),
                      onTap: () {
                        ScaffoldMessenger.of(dialogContext).showSnackBar(
                          const SnackBar(
                            content: Text('Navigating to Home...'),
                          ),
                        );
                        Navigator.of(dialogContext).pop();
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.search),
                      title: const Text('Search'),
                      subtitle: const Text('Search for content'),
                      onTap: () {
                        ScaffoldMessenger.of(dialogContext).showSnackBar(
                          const SnackBar(content: Text('Opening Search...')),
                        );
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.favorite),
                      title: const Text('Favorites'),
                      subtitle: const Text('View favorite items'),
                      onTap: () {
                        ScaffoldMessenger.of(dialogContext).showSnackBar(
                          const SnackBar(content: Text('Opening Favorites...')),
                        );
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.settings),
                      title: const Text('Settings'),
                      subtitle: const Text('App settings'),
                      onTap: () {
                        ScaffoldMessenger.of(dialogContext).showSnackBar(
                          const SnackBar(content: Text('Opening Settings...')),
                        );
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.info),
                      title: const Text('About'),
                      subtitle: const Text('About this app'),
                      onTap: () {
                        ScaffoldMessenger.of(dialogContext).showSnackBar(
                          const SnackBar(
                            content: Text('About Flutter Widgets Gallery'),
                          ),
                        );
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.logout),
                      title: const Text('Logout'),
                      subtitle: const Text('Sign out of account'),
                      onTap: () {
                        ScaffoldMessenger.of(dialogContext).showSnackBar(
                          const SnackBar(content: Text('Logging out...')),
                        );
                      },
                    ),
                  ],
                ),
              ),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.menu, size: 48, color: Colors.blue),
                    const SizedBox(height: 16),
                    const Text(
                      'Tap the menu icon to open drawer',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Or swipe from the left edge',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton.icon(
                      onPressed: () {
                        drawerKey.currentState?.openDrawer();
                      },
                      icon: const Icon(Icons.menu_open),
                      label: const Text('Open Drawer'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildBottomNavigationBarExample() {
    return Column(
      children: [
        Expanded(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Center(child: Text('Selected: Home')),
          ),
        ),
        BottomNavigationBar(
          currentIndex: 1,
          onTap: (index) {},
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.explore),
              label: 'Explore',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        ),
      ],
    );
  }

  Widget _buildBottomAppBarExample() {
    return Scaffold(
      appBar: AppBar(title: const Text('Example'), toolbarHeight: 40),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Center(child: Text('Content Area')),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            IconButton(icon: const Icon(Icons.menu), onPressed: () {}),
            const Spacer(),
            IconButton(icon: const Icon(Icons.search), onPressed: () {}),
            IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
          ],
        ),
      ),
      floatingActionButton: const FloatingActionButton(
        onPressed: null,
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }

  Widget _buildTabBarExample() {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          const TabBar(
            tabs: [
              Tab(text: 'Chats'),
              Tab(text: 'Status'),
              Tab(text: 'Calls'),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Center(child: Text('Chats Content')),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.green.shade50,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Center(child: Text('Status Content')),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.orange.shade50,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Center(child: Text('Calls Content')),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavigationRailExample() {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: NavigationRail(
            selectedIndex: 0,
            onDestinationSelected: (index) {},
            labelType: NavigationRailLabelType.selected,
            destinations: const [
              NavigationRailDestination(
                icon: Icon(Icons.home),
                label: Text('Home'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.search),
                label: Text('Search'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.favorite),
                label: Text('Favorites'),
              ),
            ],
          ),
        ),
        const VerticalDivider(thickness: 1, width: 1),
        Expanded(
          flex: 2,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Center(child: Text('Selected: Home')),
          ),
        ),
      ],
    );
  }
}
