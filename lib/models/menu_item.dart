class MenuItem {
  final String id;
  final String name;
  final String description;
  final int price;
  final String imagePath;

  const MenuItem({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imagePath,
  });
}

class CartItem {
  final MenuItem menu;
  int quantity;

  CartItem({
    required this.menu,
    required this.quantity,
  });

  int get subtotal => menu.price * quantity;
}

String formatCurrency(int value) {
  final format = value.toString();
  final buffer = StringBuffer();

  for (var i = 0; i < format.length; i++) {
    final index = format.length - i;
    buffer.write(format[i]);
    if (index > 3 && index % 3 == 0) {
      buffer.write('.');
    }
  }

  return 'Rp ${buffer.toString()}';
}
