import 'package:flutter/material.dart';

class DialogWidgetsScreen extends StatelessWidget {
  const DialogWidgetsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dialog Widgets'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildWidgetSection(
            context,
            'AlertDialog',
            'A material design alert dialog that informs the user about situations that require acknowledgement.',
            _buildAlertDialogExample(),
          ),
          _buildWidgetSection(
            context,
            'SimpleDialog',
            'A material design simple dialog that offers the user a choice between several options.',
            _buildSimpleDialogExample(),
          ),
          _buildWidgetSection(
            context,
            'Dialog',
            'A basic dialog that can be customized with any content.',
            _buildCustomDialogExample(),
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
              constraints: const BoxConstraints(minHeight: 200, maxHeight: 200),
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

  Widget _buildAlertDialogExample() {
    return Builder(
      builder: (context) {
        return Center(
          child: ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext dialogContext) {
                  return AlertDialog(
                    title: const Text('Alert Dialog'),
                    content: const Text(
                      'This is an alert dialog. It informs the user about important information that requires acknowledgement.',
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(dialogContext).pop(),
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () => Navigator.of(dialogContext).pop(),
                        child: const Text('OK'),
                      ),
                    ],
                  );
                },
              );
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            ),
            child: const Text('Show Alert', style: TextStyle(fontSize: 14)),
          ),
        );
      },
    );
  }

  Widget _buildSimpleDialogExample() {
    return Builder(
      builder: (context) {
        return Center(
          child: ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext dialogContext) {
                  return SimpleDialog(
                    title: const Text('Choose an option'),
                    children: [
                      SimpleDialogOption(
                        onPressed: () => Navigator.of(dialogContext).pop('Option 1'),
                        child: const Text('Option 1'),
                      ),
                      SimpleDialogOption(
                        onPressed: () => Navigator.of(dialogContext).pop('Option 2'),
                        child: const Text('Option 2'),
                      ),
                      SimpleDialogOption(
                        onPressed: () => Navigator.of(dialogContext).pop('Option 3'),
                        child: const Text('Option 3'),
                      ),
                      SimpleDialogOption(
                        onPressed: () => Navigator.of(dialogContext).pop('Cancel'),
                        child: const Text('Cancel'),
                      ),
                    ],
                  );
                },
              );
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            ),
            child: const Text('Show Simple Dialog', style: TextStyle(fontSize: 14)),
          ),
        );
      },
    );
  }

  Widget _buildCustomDialogExample() {
    return Builder(
      builder: (context) {
        return Center(
      child: ElevatedButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext dialogContext) {
              return Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.info_outline,
                        size: 48,
                        color: Colors.blue,
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Custom Dialog',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'This is a custom dialog with a unique design and layout.',
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () => Navigator.of(dialogContext).pop(),
                            child: const Text('Close'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        ),
        child: const Text('Show Custom Dialog', style: TextStyle(fontSize: 14)),
      ),
        );
      },
    );
  }
}
