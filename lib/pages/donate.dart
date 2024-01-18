import 'package:flutter/material.dart';

class Donate extends StatefulWidget {
  const Donate({Key? key}) : super(key: key);

  @override
  _Donate createState() => _Donate();
}

class _Donate extends State<Donate> {
  int _selectedAmount = 0;
  bool _isManual = false;
  int _selectedPayment = 0;

  final List<int> _amounts = [100, 200, 1000, 5000];

  final List<String> _paymentMethods = ['Paypal', 'Card'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: const Text(
                'Select Amount',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              padding: const EdgeInsets.all(16),
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              children: List.generate(
                _amounts.length,
                (index) => ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _selectedAmount = index;
                      _isManual = false;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _selectedAmount == index
                        ? Color.fromARGB(255, 239, 218, 29)
                        : Colors.grey[300],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'LKR ${_amounts[index]}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  const Text(
                    'Enter Price Manually',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 16), // Add some space between the text and the TextField
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Enter price',
                      ),
                      keyboardType: TextInputType.number, // Adjust the keyboard type as needed
                      // Add any additional properties or controllers as needed
                    ),
                  ),
                ],
              ),
            ),

            Container(
              padding: const EdgeInsets.all(16.0),
              child: const Text(
                'Select Payment',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: _paymentMethods.length,
              itemBuilder: (context, index) => RadioListTile(
                title: Text(
                  _paymentMethods[index],
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                value: index,
                groupValue: _selectedPayment,
                onChanged: (value) {
                  setState(() {
                    _selectedPayment = value!;
                  });
                },
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 228, 208, 98),
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: const Text(
                  'Payment Confirm',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
