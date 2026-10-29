import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tugas_dart/main.dart';

void main() {
  testWidgets('Kantin app shows catalog, search, and cart flow', (tester) async {
    await tester.pumpWidget(const KantinApp());

    expect(find.text('Kantin Sekolah'), findsOneWidget);
    expect(find.byType(TextField), findsOneWidget);
    expect(find.text('Mi Ayam'), findsOneWidget);
    expect(find.text('Bakso'), findsOneWidget);

    await tester.enterText(find.byType(TextField), 'bak');
    await tester.pumpAndSettle();

    expect(find.text('Bakso'), findsOneWidget);
    expect(find.text('Mi Ayam'), findsNothing);

    await tester.tap(find.text('Bakso'));
    await tester.pumpAndSettle();

    expect(find.text('Masukkan ke Keranjang'), findsOneWidget);
    expect(find.text('Rp 18.000'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Masukkan ke Keranjang'));
    await tester.pumpAndSettle();

    expect(find.text('Keranjang Belanja'), findsOneWidget);
    expect(find.text('Total Pembayaran'), findsOneWidget);
    expect(find.byIcon(Icons.add), findsOneWidget);
    expect(find.byIcon(Icons.remove), findsOneWidget);

    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();

    expect(find.text('Rp 54.000'), findsOneWidget);
  });
}
