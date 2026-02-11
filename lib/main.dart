import 'package:flutter/material.dart';

void main() {
  runApp(const AppCafeteria());
}

class AppCafeteria extends StatelessWidget {
  const AppCafeteria({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cafetería Silva',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown),
      ),
      home: const MenuCafeteria(),
    );
  }
} 

class MenuCafeteria extends StatelessWidget {
  const MenuCafeteria({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50], // Fondo crema muy claro
      appBar: AppBar(
        title: const Text(
          'Cafetería 23 casi 24 Nava - 6º J',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.brown[700], // Café oscuro
        leading: IconButton(
          icon: const Icon(Icons.coffee, color: Colors.white),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.account_circle, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: const [
              // Tarjeta 1
              CoffeeCard(
                producto: 'Cappuccino Italiano',
                detalle: 'Espresso con espuma de leche sedosa',
                imageUrl: 'https://raw.githubusercontent.com/navalucia/imagenes-para-flutter-6J-11-Febrero/refs/heads/main/cafe1.jpg',
              ),
              SizedBox(height: 12),
              // Tarjeta 2
              CoffeeCard(
                producto: 'Caramel Macchiato',
                detalle: 'Leche manchada con vainilla y caramelo',
                imageUrl: 'https://raw.githubusercontent.com/navalucia/imagenes-para-flutter-6J-11-Febrero/refs/heads/main/cafe2.jpg',
              ),
              SizedBox(height: 12),
              // Tarjeta 3
              CoffeeCard(
                producto: 'Mocha Helado',
                detalle: 'Chocolate, café y hielos frappé',
                imageUrl: 'https://raw.githubusercontent.com/navalucia/imagenes-para-flutter-6J-11-Febrero/refs/heads/main/cafe3.jpg',
              ),
              SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}

class CoffeeCard extends StatelessWidget {
  final String producto;
  final String detalle;
  final String imageUrl;

  const CoffeeCard({
    super.key,
    required this.producto,
    required this.detalle,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.brown[400], // Color café medio
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 5,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        leading: Container(
          width: 55,
          height: 55,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white24, width: 2),
          ),
          child: ClipOval(
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
              // Si la imagen falla, muestra este icono en lugar de quedarse en blanco
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.coffee_maker, color: Colors.white, size: 30);
              },
              // Mientras carga muestra un pequeño indicador
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return const Center(child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white));
              },
            ),
          ),
        ),
        title: Text(
          producto,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        subtitle: Text(
          detalle,
          style: const TextStyle(color: Colors.white70, fontSize: 13),
        ),
        trailing: const Icon(
          Icons.add_circle_outline,
          color: Colors.white,
          size: 28,
        ),
      ),
    );
  }
}