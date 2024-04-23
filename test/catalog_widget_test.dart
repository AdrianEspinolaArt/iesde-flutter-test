import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:processo_selecao_iesde/models/cart_model.dart';
import 'package:processo_selecao_iesde/models/catalog_model.dart';
import 'package:processo_selecao_iesde/screens/catalog.dart';
import 'package:provider/provider.dart';

Widget createCatalogScreen() => MultiProvider(
      providers: [
        Provider(create: (context) => CatalogModel()),
        ChangeNotifierProxyProvider<CatalogModel, CartModel>(
          create: (context) => CartModel(),
          update: (context, catalog, cart) {
            cart!.catalog = catalog;
            return cart;
          },
        ),
      ],
      child: const MaterialApp(

      ),
    );

void main() {
  final catalogListItems = CatalogModel.itemNames.sublist(0, 3);

  group('CatalogScreen Widget Tests', () {
    testWidgets('Testing item row counts and text', (tester) async {
      await tester.pumpWidget(createCatalogScreen());
      for (var item in catalogListItems) {
        expect(find.text(item), findsWidgets);
      }
    });

    testWidgets('Testing the ADD buttons and check after clicking',
        (tester) async {
      await tester.pumpWidget(createCatalogScreen());

      // Should find ADD buttons on the screen.
      expect(find.text('ADD'), findsWidgets);

      // Performing the click on the ADD button of the first item in the list.
      await tester.tap(find.widgetWithText(TextButton, 'ADD').first);
      await tester.pumpAndSettle();

      // Verifying if the tapped ADD button has changed to the check icon.
      expect(find.byIcon(Icons.check), findsOneWidget);
    });
  });
}
