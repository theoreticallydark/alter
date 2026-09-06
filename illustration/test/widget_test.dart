import 'package:flutter_test/flutter_test.dart';
import 'package:illustration/main.dart';

void main() {
  testWidgets('AlterWidgetbookApp pump smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const AlterWidgetbookApp());
    expect(find.byType(AlterWidgetbookApp), findsOneWidget);
  });
}
