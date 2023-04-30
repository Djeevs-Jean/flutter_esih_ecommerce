import 'package:flutter/material.dart';

class PayementPage extends StatelessWidget {
  const PayementPage({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text("Payment Page"))),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(onPressed: () {}, icon: const Icon(Icons.payment), label: const Text("Pay with Paypal")),
            const SizedBox(height: 22,),
            ElevatedButton.icon(onPressed: () {}, icon: const Icon(Icons.payment), label: const Text("Pay With MasterCard"),)
          ],
        ),
      ),
    );
  }
  
}