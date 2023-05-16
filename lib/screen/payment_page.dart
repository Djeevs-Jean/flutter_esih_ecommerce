import 'package:flutter/material.dart';

class PayementPage extends StatelessWidget {
  const PayementPage({Key? key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text("Payment Page"))),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
              width: 200,
              height: 40,
              child: Row(
                children: [
                  Image.asset("assets/moncash.png", height: 40),
                  const Text("Paiement with monCash")
                ],
             ),
            ),
            
            // ElevatedButton(
            //   onPressed: (){},
            //   child: Image.asset(
            //     "assets/moncash.png",
            //     width: double.infinity,
            //     height: 40,
            //   ),
            // ),
            // ElevatedButton.icon(onPressed: () {}, icon: const Icon(Icons.payment), label: const Text("Pay with Paypal")),
            // const SizedBox(height: 22,),
            // ElevatedButton.icon(onPressed: () {}, icon: const Icon(Icons.payment), label: const Text("Pay With MonCash"),)
          ],
        ),
      ),
    );
  }
  
}