testWidgets('Login validation works', (WidgetTester tester) async {
  await tester.pumpWidget(MaterialApp(home: LoginPage()));

  await tester.tap(find.byType(ElevatedButton));
  await tester.pump();

  expect(find.text('Required'), findsWidgets);
});
