import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,  
      title: 'Conversor de monedas',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pinkAccent),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Convertidor de monedas'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

enum Moneda {euro, peso, dolar}

class _MyHomePageState extends State<MyHomePage> {
  final _importe = TextEditingController();
  double _total1 = 1.0, _total2 = 1.0;
  String _mensaje1 = "", _mensaje2 = "";

  void _convertirMoneda(Enum moneda) {
    setState(() {
      switch (moneda) {
        case Moneda.euro:
          _total1 = double.parse (_importe.text) * 4496.07;
          _mensaje1 = "Peso: $_total1";
          _total2 = double.parse (_importe.text) * 1.07;
          _mensaje2 = "Dolar: $_total2";
          break;
        case Moneda.peso:
          _total1 = double.parse (_importe.text) * 0.00022;
          _mensaje1 = "Euro: $_total1";
          _total2 = double.parse (_importe.text) * 0.00024;
          _mensaje2 = "Dolar: $_total2";
          break;
        case Moneda.dolar:
          _total1 = double.parse (_importe.text) * 0.94;
          _mensaje1 = "Euro: $_total1";
          _total2 = double.parse (_importe.text) * 4213.55;
          _mensaje2 = "peso: $_total2";
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding (
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              controller: _importe,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Digite el valor a convertir'),
              keyboardType: TextInputType.number,
            ),
                const SizedBox(
                  height: 20,
                ),
            Row (
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget> [
            ElevatedButton.icon(
                onPressed: () {
                  _convertirMoneda(Moneda.euro);
                },
                label: const Text ("Euro"),
                icon: const Icon (Icons.euro),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton.icon(
              onPressed: () {
                _convertirMoneda(Moneda.peso);
              },
              label: const Text ("Peso Colombiano"),
              icon: const Icon (Icons.currency_exchange_outlined),
            ),
            const SizedBox(
              height: 20,
            ),
            ],
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton.icon(
              onPressed: () {
                _convertirMoneda(Moneda.dolar);
              },
              label: const Text ("Dolar"),
              icon: const Icon (Icons.currency_exchange_sharp),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              '$_mensaje1',
              style: const TextStyle (
                fontSize: 15,
              ),
            ),
          const SizedBox(
            height: 20,
          ),
            Text(
              '$_mensaje2',
              style: const TextStyle (
                  fontSize: 15,
            ),
            ),
          ],
        ),
      ),
    ),
    );
  }
}
