import 'package:flutter/material.dart';

class InputWidgetsScreen extends StatefulWidget {
  const InputWidgetsScreen({super.key});

  @override
  State<InputWidgetsScreen> createState() => _InputWidgetsScreenState();
}

class _InputWidgetsScreenState extends State<InputWidgetsScreen> {
  final TextEditingController _textController = TextEditingController();
  bool _switchValue = false;
  bool _checkboxValue = false;
  double _sliderValue = 0.5;
  String _radioValue = 'option1';
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Input Widgets'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildWidgetSection(
            context,
            'TextField',
            'A text input widget that allows the user to enter text.',
            _buildTextFieldExample(),
          ),
          _buildWidgetSection(
            context,
            'ElevatedButton',
            'A Material Design elevated button.',
            _buildElevatedButtonExample(),
          ),
          _buildWidgetSection(
            context,
            'TextButton',
            'A Material Design text button.',
            _buildTextButtonExample(),
          ),
          _buildWidgetSection(
            context,
            'OutlinedButton',
            'A Material Design outlined button.',
            _buildOutlinedButtonExample(),
          ),
          _buildWidgetSection(
            context,
            'Switch',
            'A material design switch.',
            _buildSwitchExample(),
          ),
          _buildWidgetSection(
            context,
            'Checkbox',
            'A checkbox widget.',
            _buildCheckboxExample(),
          ),
          _buildWidgetSection(
            context,
            'Radio',
            'A material design radio button.',
            _buildRadioExample(),
          ),
          _buildWidgetSection(
            context,
            'Slider',
            'A slider widget.',
            _buildSliderExample(),
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

  Widget _buildTextFieldExample() {
    return Column(
      children: [
        TextField(
          controller: _textController,
          decoration: const InputDecoration(
            labelText: 'Enter text',
            hintText: 'Type something...',
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.text_fields),
          ),
        ),
        const SizedBox(height: 16),
        TextField(
          obscureText: !_isPasswordVisible,
          decoration: InputDecoration(
            labelText: 'Password',
            hintText: 'Enter password',
            border: const OutlineInputBorder(),
            prefixIcon: const Icon(Icons.lock),
            suffixIcon: IconButton(
              icon: Icon(
                _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
              ),
              onPressed: () {
                setState(() {
                  _isPasswordVisible = !_isPasswordVisible;
                });
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildElevatedButtonExample() {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Elevated Button Pressed!')),
            );
          },
          child: const Text('Elevated Button'),
        ),
        const SizedBox(height: 8),
        ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.add),
          label: const Text('Add Item'),
        ),
      ],
    );
  }

  Widget _buildTextButtonExample() {
    return Column(
      children: [
        TextButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Text Button Pressed!')),
            );
          },
          child: const Text('Text Button'),
        ),
        const SizedBox(height: 8),
        TextButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.download),
          label: const Text('Download'),
        ),
      ],
    );
  }

  Widget _buildOutlinedButtonExample() {
    return Column(
      children: [
        OutlinedButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Outlined Button Pressed!')),
            );
          },
          child: const Text('Outlined Button'),
        ),
        const SizedBox(height: 8),
        OutlinedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.share),
          label: const Text('Share'),
        ),
      ],
    );
  }

  Widget _buildSwitchExample() {
    return Row(
      children: [
        const Text('Enable notifications'),
        const Spacer(),
        Switch(
          value: _switchValue,
          onChanged: (value) {
            setState(() {
              _switchValue = value;
            });
          },
        ),
      ],
    );
  }

  Widget _buildCheckboxExample() {
    return Row(
      children: [
        Checkbox(
          value: _checkboxValue,
          onChanged: (value) {
            setState(() {
              _checkboxValue = value ?? false;
            });
          },
        ),
        const Text('I agree to the terms and conditions'),
      ],
    );
  }

  Widget _buildRadioExample() {
    return Column(
      children: [
        Row(
          children: [
            Radio<String>(
              value: 'option1',
              groupValue: _radioValue,
              onChanged: (value) {
                setState(() {
                  _radioValue = value!;
                });
              },
            ),
            const Text('Option 1'),
          ],
        ),
        Row(
          children: [
            Radio<String>(
              value: 'option2',
              groupValue: _radioValue,
              onChanged: (value) {
                setState(() {
                  _radioValue = value!;
                });
              },
            ),
            const Text('Option 2'),
          ],
        ),
        Row(
          children: [
            Radio<String>(
              value: 'option3',
              groupValue: _radioValue,
              onChanged: (value) {
                setState(() {
                  _radioValue = value!;
                });
              },
            ),
            const Text('Option 3'),
          ],
        ),
      ],
    );
  }

  Widget _buildSliderExample() {
    return Column(
      children: [
        Text('Value: ${(_sliderValue * 100).round()}%'),
        Slider(
          value: _sliderValue,
          onChanged: (value) {
            setState(() {
              _sliderValue = value;
            });
          },
          divisions: 10,
          label: '${(_sliderValue * 100).round()}%',
        ),
      ],
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}
