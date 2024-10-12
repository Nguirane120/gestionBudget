import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gestionbudget/screens/depenseform.dart';
import 'package:gestionbudget/widgets/input.dart';

void main() {
  testWidgets('Test for Depenseform widget', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (BuildContext context) {
            return Depenseform();
          },
        ),
      ),
    );

    expect(find.text('TITRE'), findsOneWidget);
    expect(find.text('MONTANT'), findsOneWidget);

    await tester.enterText(find.byType(InputWidget).first, 'Loyer');
    await tester.enterText(find.byType(InputWidget).last, '45000');

    var validateButton = find.text('VALIDER');

    await tester.tap(validateButton);
    await tester.pump();
  });
}
