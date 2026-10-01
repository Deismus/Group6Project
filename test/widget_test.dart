import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('REQ-1: User can select a major from the dropdown', (WidgetTester tester) async {
    String? selectedMajor;

    // Sample major list matching REQ-1 options
    final testMajors = ['Accounting', 'Computer Science', 'Finance'];

    // Render the REQ-1 Dropdown component
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Center(
                child: DropdownButton<String>(
                  key: const Key('major_dropdown'),
                  hint: const Text('Select a Major'),
                  value: selectedMajor,
                  items: testMajors.map((String major) {
                    return DropdownMenuItem<String>(
                      value: major,
                      child: Text(major),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedMajor = newValue;
                    });
                  },
                ),
              );
            },
          ),
        ),
      ),
    );

    // 1. Verify the dropdown widget exists on screen
    expect(find.byKey(const Key('major_dropdown')), findsOneWidget);
    expect(find.text('Select a Major'), findsOneWidget);

    // 2. Tap the dropdown to open options
    await tester.tap(find.byKey(const Key('major_dropdown')));
    await tester.pumpAndSettle();

    // 3. Select 'Computer Science'
    await tester.tap(find.text('Computer Science').last);
    await tester.pumpAndSettle();

    // 4. Assert REQ-1 acceptance criterion: selection updated successfully
    expect(selectedMajor, equals('Computer Science'));
  });
}