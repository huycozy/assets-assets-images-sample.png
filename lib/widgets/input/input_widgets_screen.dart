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
  String? _dropdownValue;
  String? _dropdownMenuValue;

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
          _buildWidgetSection(
            context,
            'DropdownButton',
            'A material design dropdown button for selecting from a list of items.',
            _buildDropdownButtonExample(),
          ),
          _buildWidgetSection(
            context,
            'DropdownMenu',
            'A dropdown menu that allows users to select from a list of options.',
            _buildDropdownMenuExample(),
          ),
          _buildWidgetSection(
            context,
            'SearchAnchor',
            'A search view that can be anchored to a bar or other widget.',
            _buildSearchAnchorExample(),
          ),
          _buildWidgetSection(
            context,
            'PopupMenuButton',
            'A button that displays a menu when pressed, allowing selection from multiple options.',
            _buildPopupMenuExample(),
          ),
          _buildWidgetSection(
            context,
            'TimePicker',
            'A Material Design time picker that allows users to select a time.',
            _buildTimePickerExample(),
          ),
          _buildWidgetSection(
            context,
            'DatePicker',
            'A Material Design date picker that allows users to select a date.',
            _buildDatePickerExample(),
          ),
          _buildWidgetSection(
            context,
            'SegmentedButton',
            'A button that allows selecting from multiple mutually exclusive options.',
            _buildSegmentedButtonExample(),
          ),
          _buildWidgetSection(
            context,
            'ToggleButtons',
            'A set of toggle buttons that allow selecting multiple options simultaneously.',
            _buildToggleButtonsExample(),
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

  Widget _buildTextFieldExample() {
    return Column(
      children: [
        TextField(
          controller: _textController,
          style: const TextStyle(fontSize: 16.0),
          decoration: const InputDecoration(
            labelText: 'Enter text',
            hintText: 'Type something...',
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.text_fields),
            labelStyle: TextStyle(fontSize: 16.0),
            hintStyle: TextStyle(fontSize: 16.0),
          ),
        ),
        const SizedBox(height: 16),
        TextField(
          obscureText: !_isPasswordVisible,
          style: const TextStyle(fontSize: 16.0),
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
            labelStyle: const TextStyle(fontSize: 16.0),
            hintStyle: const TextStyle(fontSize: 16.0),
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
          child: const Text(
            'Elevated Button',
            style: TextStyle(fontSize: 16.0),
          ),
        ),
        const SizedBox(height: 8),
        ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.add),
          label: const Text('Add Item', style: TextStyle(fontSize: 16.0)),
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
          child: const Text('Text Button', style: TextStyle(fontSize: 16.0)),
        ),
        const SizedBox(height: 8),
        TextButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.download),
          label: const Text('Download', style: TextStyle(fontSize: 16.0)),
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
          child: const Text(
            'Outlined Button',
            style: TextStyle(fontSize: 16.0),
          ),
        ),
        const SizedBox(height: 8),
        OutlinedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.share),
          label: const Text('Share', style: TextStyle(fontSize: 16.0)),
        ),
      ],
    );
  }

  Widget _buildSwitchExample() {
    return Row(
      children: [
        const Text('Enable notifications', style: TextStyle(fontSize: 16.0)),
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
        Expanded(
          child: const Text(
            'I agree to the terms and conditions',
            style: TextStyle(fontSize: 16.0),
          ),
        ),
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
            const Text('Option 1', style: TextStyle(fontSize: 16.0)),
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
            const Text('Option 2', style: TextStyle(fontSize: 16.0)),
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
            const Text('Option 3', style: TextStyle(fontSize: 16.0)),
          ],
        ),
      ],
    );
  }

  Widget _buildSliderExample() {
    return Column(
      children: [
        Text(
          'Value: ${(_sliderValue * 100).round()}%',
          style: const TextStyle(fontSize: 16.0),
        ),
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

  Widget _buildDropdownButtonExample() {
    final List<String> items = [
      'Apple',
      'Banana',
      'Orange',
      'Grape',
      'Strawberry',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DropdownButton<String>(
          value: _dropdownValue,
          hint: const Text('Select a fruit', style: TextStyle(fontSize: 16.0)),
          isExpanded: true,
          items: items.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value, style: const TextStyle(fontSize: 16.0)),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              _dropdownValue = newValue;
            });
          },
        ),
        if (_dropdownValue != null) ...[
          const SizedBox(height: 8),
          Text(
            'Selected: $_dropdownValue',
            style: const TextStyle(fontSize: 16.0),
          ),
        ],
      ],
    );
  }

  Widget _buildDropdownMenuExample() {
    final List<String> menuItems = ['Red', 'Green', 'Blue', 'Yellow', 'Purple'];

    return DropdownMenu<String>(
      initialSelection: _dropdownMenuValue ?? menuItems.first,
      controller: TextEditingController(),
      requestFocusOnTap: true,
      label: const Text('Color', style: TextStyle(fontSize: 16.0)),
      onSelected: (String? value) {
        setState(() {
          _dropdownMenuValue = value;
        });
      },
      dropdownMenuEntries: menuItems.map((String value) {
        return DropdownMenuEntry<String>(value: value, label: value);
      }).toList(),
    );
  }

  Widget _buildSearchAnchorExample() {
    return SearchAnchor.bar(
      suggestionsBuilder: (BuildContext context, SearchController controller) {
        return List<Widget>.generate(5, (int index) {
          return ListTile(
            titleAlignment: ListTileTitleAlignment.center,
            title: Text('Initial list item $index'),
          );
        });
      },
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  Widget _buildPopupMenuExample() {
    return Builder(
      builder: (context) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                PopupMenuButton<String>(
                  icon: const Icon(Icons.more_vert),
                  tooltip: 'Show options',
                  onSelected: (String value) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text('Selected: $value')));
                  },
                  itemBuilder: (BuildContext context) => [
                    const PopupMenuItem<String>(
                      value: 'edit',
                      child: Row(
                        children: [
                          Icon(Icons.edit),
                          SizedBox(width: 8),
                          Text('Edit'),
                        ],
                      ),
                    ),
                    const PopupMenuItem<String>(
                      value: 'copy',
                      child: Row(
                        children: [
                          Icon(Icons.copy),
                          SizedBox(width: 8),
                          Text('Copy'),
                        ],
                      ),
                    ),
                    const PopupMenuItem<String>(
                      value: 'delete',
                      child: Row(
                        children: [
                          Icon(Icons.delete),
                          SizedBox(width: 8),
                          Text('Delete'),
                        ],
                      ),
                    ),
                    const PopupMenuDivider(),
                    const PopupMenuItem<String>(
                      value: 'share',
                      child: Row(
                        children: [
                          Icon(Icons.share),
                          SizedBox(width: 8),
                          Text('Share'),
                        ],
                      ),
                    ),
                  ],
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    // Show popup menu at button position
                    showMenu<String>(
                      context: context,
                      position: const RelativeRect.fromLTRB(100, 100, 0, 0),
                      items: [
                        const PopupMenuItem<String>(
                          value: 'download',
                          child: Row(
                            children: [
                              Icon(Icons.download),
                              SizedBox(width: 8),
                              Text('Download'),
                            ],
                          ),
                        ),
                        const PopupMenuItem<String>(
                          value: 'upload',
                          child: Row(
                            children: [
                              Icon(Icons.upload),
                              SizedBox(width: 8),
                              Text('Upload'),
                            ],
                          ),
                        ),
                        const PopupMenuDivider(),
                        const PopupMenuItem<String>(
                          value: 'settings',
                          child: Row(
                            children: [
                              Icon(Icons.settings),
                              SizedBox(width: 8),
                              Text('Settings'),
                            ],
                          ),
                        ),
                      ],
                    ).then((value) {
                      if (value != null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Action selected: $value')),
                        );
                      }
                    });
                  },
                  icon: const Icon(Icons.menu),
                  label: const Text('Show Menu'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                'PopupMenuButton displays menu options when tapped\nTry both the icon menu and the button menu',
                style: TextStyle(fontSize: 12, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildTimePickerExample() {
    return Builder(
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            TimeOfDay selectedTime = TimeOfDay.now();

            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () async {
                        final TimeOfDay? picked = await showTimePicker(
                          context: context,
                          initialTime: selectedTime,
                          builder: (BuildContext context, Widget? child) {
                            return MediaQuery(
                              data: MediaQuery.of(
                                context,
                              ).copyWith(alwaysUse24HourFormat: false),
                              child: child!,
                            );
                          },
                        );
                        if (picked != null) {
                          setState(() {
                            selectedTime = picked;
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Time selected: ${picked.format(context)}',
                              ),
                            ),
                          );
                        }
                      },
                      icon: const Icon(Icons.access_time),
                      label: const Text('Pick Time'),
                    ),
                    ElevatedButton.icon(
                      onPressed: () async {
                        final TimeOfDay? picked = await showTimePicker(
                          context: context,
                          initialTime: selectedTime,
                          builder: (BuildContext context, Widget? child) {
                            return MediaQuery(
                              data: MediaQuery.of(
                                context,
                              ).copyWith(alwaysUse24HourFormat: true),
                              child: child!,
                            );
                          },
                        );
                        if (picked != null) {
                          setState(() {
                            selectedTime = picked;
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Time selected (24h): ${picked.hour.toString().padLeft(2, '0')}:${picked.minute.toString().padLeft(2, '0')}',
                              ),
                            ),
                          );
                        }
                      },
                      icon: const Icon(Icons.schedule),
                      label: const Text('24h Format'),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.access_time, size: 32),
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Selected Time:',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            selectedTime.format(context),
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Widget _buildDatePickerExample() {
    return Builder(
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            DateTime selectedDate = DateTime.now();

            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () async {
                        final DateTime? picked = await showDatePicker(
                          context: context,
                          initialDate: selectedDate,
                          firstDate: DateTime(2020),
                          lastDate: DateTime(2030),
                        );
                        if (picked != null) {
                          setState(() {
                            selectedDate = picked;
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Date selected: ${_formatDate(picked)}',
                              ),
                            ),
                          );
                        }
                      },
                      icon: const Icon(Icons.calendar_today),
                      label: const Text('Pick Date'),
                    ),
                    ElevatedButton.icon(
                      onPressed: () async {
                        final DateTimeRange? picked = await showDateRangePicker(
                          context: context,
                          firstDate: DateTime(2020),
                          lastDate: DateTime(2030),
                        );
                        if (picked != null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Date range: ${_formatDate(picked.start)} - ${_formatDate(picked.end)}',
                              ),
                            ),
                          );
                        }
                      },
                      icon: const Icon(Icons.date_range),
                      label: const Text('Date Range'),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.calendar_today, size: 32),
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Selected Date:',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            _formatDate(selectedDate),
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            _getDayOfWeek(selectedDate),
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  String _getDayOfWeek(DateTime date) {
    const days = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday',
    ];
    return days[date.weekday - 1];
  }

  Widget _buildToggleButtonsExample() {
    return StatefulBuilder(
      builder: (context, setState) {
        List<bool> isSelected1 = [true, false, false];
        List<bool> isSelected2 = [false, true, false, false];
        List<bool> isSelected3 = [true, true, false];

        return Column(
          children: [
            const Text(
              'Text ToggleButtons:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            ToggleButtons(
              direction: Axis.horizontal,
              onPressed: (int index) {
                setState(() {
                  for (int i = 0; i < isSelected1.length; i++) {
                    isSelected1[i] = i == index;
                  }
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Selected: ${['Bold', 'Italic', 'Underline'][index]}',
                    ),
                  ),
                );
              },
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              selectedBorderColor: Theme.of(context).colorScheme.primary,
              selectedColor: Colors.white,
              fillColor: Theme.of(context).colorScheme.primary,
              color: Theme.of(context).colorScheme.outline,
              constraints: const BoxConstraints(
                minHeight: 40.0,
                minWidth: 80.0,
              ),
              isSelected: isSelected1,
              children: const [
                Text('Bold', style: TextStyle(fontWeight: FontWeight.bold)),
                Text('Italic', style: TextStyle(fontStyle: FontStyle.italic)),
                Text(
                  'Underline',
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              ],
            ),
            const SizedBox(height: 24),
            const Text(
              'Icon ToggleButtons:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            ToggleButtons(
              direction: Axis.horizontal,
              onPressed: (int index) {
                setState(() {
                  for (int i = 0; i < isSelected2.length; i++) {
                    isSelected2[i] = i == index;
                  }
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'View mode: ${['List', 'Grid', 'Card', 'Map'][index]}',
                    ),
                  ),
                );
              },
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              selectedBorderColor: Colors.green,
              selectedColor: Colors.white,
              fillColor: Colors.green,
              color: Colors.grey.shade600,
              isSelected: isSelected2,
              children: const [
                Icon(Icons.list),
                Icon(Icons.grid_view),
                Icon(Icons.credit_card),
                Icon(Icons.map),
              ],
            ),
            const SizedBox(height: 24),
            const Text(
              'Multiple Selection ToggleButtons:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Flexible(
              child: ToggleButtons(
                direction: Axis.horizontal,
                onPressed: (int index) {
                  setState(() {
                    isSelected3[index] = !isSelected3[index];
                  });
                  final selectedItems = <String>[];
                  if (isSelected3[0]) selectedItems.add('WiFi');
                  if (isSelected3[1]) selectedItems.add('Bluetooth');
                  if (isSelected3[2]) selectedItems.add('GPS');
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Selected: ${selectedItems.join(", ")}'),
                    ),
                  );
                },
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                selectedBorderColor: Colors.blue,
                selectedColor: Colors.white,
                fillColor: Colors.blue,
                color: Colors.grey.shade600,
                isSelected: isSelected3,
                children: const [
                  Icon(Icons.wifi),
                  Icon(Icons.bluetooth),
                  Icon(Icons.gps_fixed),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                'ToggleButtons allow multiple selection\n• Single selection: Text and Icon examples\n• Multiple selection: Settings example',
                style: TextStyle(fontSize: 12, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildSegmentedButtonExample() {
    return Builder(
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            String selectedTimeView = 'day';

            return Column(
              children: [
                const Text(
                  'SegmentedButton Example',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                Flexible(
                  child: SizedBox(
                    width: 300,
                    child: SegmentedButton<String>(
                      segments: const [
                        ButtonSegment<String>(
                          value: 'day',
                          label: Text('Day'),
                          icon: Icon(Icons.wb_sunny),
                        ),
                        ButtonSegment<String>(
                          value: 'week',
                          label: Text('Week'),
                          icon: Icon(Icons.date_range),
                        ),
                        ButtonSegment<String>(
                          value: 'month',
                          label: Text('Month'),
                          icon: Icon(Icons.calendar_month),
                        ),
                      ],
                      selected: {selectedTimeView},
                      onSelectionChanged: (Set<String> newSelection) {
                        setState(() {
                          selectedTimeView = newSelection.first;
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Time view changed to: $selectedTimeView',
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
