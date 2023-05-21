import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SubscribePage extends StatefulWidget {
  @override
  _SubscribePageState createState() => _SubscribePageState();
}

class _SubscribePageState extends State<SubscribePage> {
  String selectedCurrency = 'IDR'; // Mata uang yang dipilih
  double pricePerMonth = 50000;

  Map<String, double> exchangeRates = {
    'IDR': 1, // Rupiah
    'USD': 0.000067, // Dolar Amerika
    'EUR': 0.000062, // Euro
    'JPY': 0.0092, // Yen Jepang
    'MYR': 0.00029, // Ringgit
    'PHP': 0.0033, // Peso
  };

  double calculateTotalPrice() {
    double price;
    return pricePerMonth * exchangeRates[selectedCurrency]!;
  }

  void sendMessageToWhatsApp() async {
    String phoneNumber = '6285747950721';
    String duration = 'Bulan';

    String currency = selectedCurrency;
    String message =
        'Ingin order\n\nDurasi: 1 $duration\n Mata Uang: $currency';
    String url =
        'https://wa.me/$phoneNumber?text=${Uri.encodeComponent(message)}';

    await launch(url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Subscribe Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Pilih Paket Berlangganan:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                double totalPrice = calculateTotalPrice();
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Pembayaran 1 Bulan'),
                    content: Text(
                        'Total harga: ${totalPrice.toStringAsFixed(2)} $selectedCurrency'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          sendMessageToWhatsApp();
                          Navigator.pop(context);
                        },
                        child: Text('Bayar'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Tutup'),
                      ),
                    ],
                  ),
                );
              },
              child: Text('1 Bulan - Rp 50.000'),
            ),
            SizedBox(height: 20),
            Text(
              'Pilih Mata Uang:',
              style: TextStyle(fontSize: 18),
            ),
            DropdownButton<String>(
              value: selectedCurrency,
              onChanged: (String? newValue) {
                setState(() {
                  selectedCurrency = newValue!;
                });
              },
              items: exchangeRates.keys
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
