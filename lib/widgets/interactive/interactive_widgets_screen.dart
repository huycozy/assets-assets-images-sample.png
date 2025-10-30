import 'package:flutter/material.dart';

class InteractiveWidgetsScreen extends StatefulWidget {
  const InteractiveWidgetsScreen({super.key});

  @override
  State<InteractiveWidgetsScreen> createState() =>
      _InteractiveWidgetsScreenState();
}

class _InteractiveWidgetsScreenState extends State<InteractiveWidgetsScreen> {
  String _gestureText = 'Tap or drag me!';
  bool _isDragging = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Interactive Widgets'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildWidgetSection(
            context,
            'GestureDetector',
            'A widget that detects gestures.',
            _buildGestureDetectorExample(),
          ),
          _buildWidgetSection(
            context,
            'InkWell',
            'A rectangular area of a Material that responds to touch.',
            _buildInkWellExample(),
          ),
          _buildWidgetSection(
            context,
            'Draggable',
            'A widget that can be dragged from.',
            _buildDraggableExample(),
          ),
          _buildWidgetSection(
            context,
            'DragTarget',
            'A widget that receives drag data.',
            _buildDragTargetExample(),
          ),
          _buildWidgetSection(
            context,
            'Dismissible',
            'A widget that can be dismissed by dragging.',
            _buildDismissibleExample(),
          ),
          _buildWidgetSection(
            context,
            'Tooltip',
            'A material design tooltip.',
            _buildTooltipExample(),
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

  Widget _buildGestureDetectorExample() {
    return GestureDetector(
      onTap: () {
        setState(() {
          _gestureText = 'Tapped!';
        });
        _resetTextAfterDelay();
      },
      onDoubleTap: () {
        setState(() {
          _gestureText = 'Double Tapped!';
        });
        _resetTextAfterDelay();
      },
      onLongPress: () {
        setState(() {
          _gestureText = 'Long Pressed!';
        });
        _resetTextAfterDelay();
      },
      onPanStart: (_) {
        setState(() {
          _isDragging = true;
          _gestureText = 'Dragging...';
        });
      },
      onPanEnd: (_) {
        setState(() {
          _isDragging = false;
          _gestureText = 'Drag ended!';
        });
        _resetTextAfterDelay();
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: double.infinity,
        height: 120,
        decoration: BoxDecoration(
          color: _isDragging ? Colors.orange : Colors.blue,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            _gestureText,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInkWellExample() {
    return InkWell(
      onTap: () {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('InkWell tapped!')));
      },
      borderRadius: BorderRadius.circular(12),
      splashColor: Colors.blue.withValues(alpha: 0.3),
      child: Container(
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blue),
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.touch_app, size: 32, color: Colors.blue),
              Text('Tap me for ripple effect'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDraggableExample() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Draggable<String>(
          data: 'red',
          feedback: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(30),
            ),
            child: const Center(
              child: Icon(Icons.palette, color: Colors.white),
            ),
          ),
          childWhenDragging: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(30),
            ),
            child: const Center(child: Icon(Icons.palette, color: Colors.grey)),
          ),
          child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(30),
            ),
            child: const Center(
              child: Icon(Icons.palette, color: Colors.white),
            ),
          ),
        ),
        Draggable<String>(
          data: 'green',
          feedback: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(30),
            ),
            child: const Center(
              child: Icon(Icons.palette, color: Colors.white),
            ),
          ),
          childWhenDragging: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(30),
            ),
            child: const Center(child: Icon(Icons.palette, color: Colors.grey)),
          ),
          child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(30),
            ),
            child: const Center(
              child: Icon(Icons.palette, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDragTargetExample() {
    return DragTarget<String>(
      onAccept: (data) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Dropped: $data')));
      },
      builder: (context, candidateData, rejectedData) {
        bool isHovering = candidateData.isNotEmpty;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: double.infinity,
          height: 100,
          decoration: BoxDecoration(
            color: isHovering ? Colors.green.shade100 : Colors.grey.shade100,
            border: Border.all(
              color: isHovering ? Colors.green : Colors.grey,
              width: isHovering ? 3 : 2,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Text(
              isHovering ? 'Drop here!' : 'Drag items here',
              style: TextStyle(
                color: isHovering
                    ? Colors.green.shade700
                    : Colors.grey.shade700,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildDismissibleExample() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 3,
      itemBuilder: (context, index) {
        return Dismissible(
          key: Key('item_$index'),
          direction: DismissDirection.endToStart,
          background: Container(
            color: Colors.red,
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(right: 16),
            child: const Icon(Icons.delete, color: Colors.white),
          ),
          onDismissed: (direction) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Item ${index + 1} dismissed')),
            );
          },
          child: ListTile(
            leading: const Icon(Icons.list),
            title: Text('Dismissible Item ${index + 1}'),
            subtitle: const Text('Swipe left to dismiss'),
            trailing: const Icon(Icons.arrow_back),
          ),
        );
      },
    );
  }

  Widget _buildTooltipExample() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Tooltip(
          message: 'This is a helpful tooltip',
          child: ElevatedButton(
            onPressed: () {},
            child: const Text('Hover me'),
          ),
        ),
        Tooltip(
          message: 'You have 5 new notifications',
          child: Icon(Icons.notifications, size: 32),
        ),
        Tooltip(
          message: 'This icon represents settings',
          child: Icon(Icons.settings, size: 32),
        ),
      ],
    );
  }

  void _resetTextAfterDelay() {
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          _gestureText = 'Tap or drag me!';
        });
      }
    });
  }
}
