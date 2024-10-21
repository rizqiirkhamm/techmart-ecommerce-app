import 'package:ecommerce_techmart/features/home/page/index/cart.dart';
import 'package:ecommerce_techmart/features/home/page/index/page.dart';
import 'package:flutter/material.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  double totalAmount = 0;
  double shippingCost = 5.00; // Default shipping cost
  String address = "123 Main St, City, Country"; // Example address
  String selectedShippingMethod = "Standard"; // Selected shipping method
  String? voucherCode; // Variable to hold the voucher code
  double discount = 0.0; // Discount amount
  bool isLoading = false; // Loading state

  @override
  void initState() {
    super.initState();
    for (var cart in demoCarts) {
      totalAmount += cart.product.price * cart.numOfItem;
    }
  }

  void applyVoucher(String code) {
    const voucherMap = {
      "DISCOUNT10": 10.0,
      "FREESHIP": 5.0,
    };

    if (voucherMap.containsKey(code)) {
      setState(() {
        discount = voucherMap[code]!;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Voucher applied! Discount: \$${discount.toStringAsFixed(2)}")),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: const Text("Invalid voucher code")),
      );
    }
  }

  Future<void> processPayment() async {
    setState(() {
      isLoading = true; // Set loading to true
    });

    await Future.delayed(const Duration(seconds: 2));


    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Payment Successful"),
          content: const Text("Thank you for your purchase!"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) =>  HomePage()),
                );
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );


    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    double finalTotal = (totalAmount + shippingCost) - discount;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Checkout"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Shipping Address",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  ElevatedButton(
                    onPressed: () {  },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      backgroundColor: const Color(0xFF00BF6D), // Change color if needed
                    ),
                    child: const Text("New", style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.all(16.0),
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Text(
                  address,
                  style: const TextStyle(fontSize: 14),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Your Items",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              ListView.builder(
                itemCount: demoCarts.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 4,
                    color: Colors.white,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          demoCarts[index].product.images[0],
                          width: 60,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(
                        demoCarts[index].product.title,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        "\$${demoCarts[index].product.price} x ${demoCarts[index].numOfItem}",
                      ),
                      trailing: Text(
                        "\$${(demoCarts[index].product.price * demoCarts[index].numOfItem).toStringAsFixed(2)}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                },
              ),
              const Divider(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  "Subtotal: \$${totalAmount.toStringAsFixed(2)}",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Select Kurir",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              ListTile(
                title: const Text("Standard JNE"),
                subtitle: const Text("\$5.00"),
                trailing: Radio(
                  value: "Standard",
                  groupValue: selectedShippingMethod,
                  onChanged: (value) {
                    setState(() {
                      selectedShippingMethod = value.toString();
                      shippingCost = 5.00;
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text("Sicepat Express"),
                subtitle: const Text("\$10.00"),
                trailing: Radio(
                  value: "Express",
                  groupValue: selectedShippingMethod,
                  onChanged: (value) {
                    setState(() {
                      selectedShippingMethod = value.toString();
                      shippingCost = 10.00;
                    });
                  },
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Apply Voucher Code",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextField(
                onChanged: (value) {
                  voucherCode = value;
                },
                decoration: InputDecoration(
                  hintText: "Enter voucher code",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  if (voucherCode != null && voucherCode!.isNotEmpty) {
                    applyVoucher(voucherCode!);
                  }
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text("Apply Voucher"),
              ),
              const SizedBox(height: 10),
              const Divider(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  "Ongkir: \$${shippingCost.toStringAsFixed(2)}",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  "Discount: \$${discount.toStringAsFixed(2)}",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  "Total: \$${finalTotal.toStringAsFixed(2)}",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: isLoading
                    ? null
                    : () {
                  processPayment();
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor: const Color(0xFF00BF6D),
                ),
                child: isLoading
                    ? const Center(child: CircularProgressIndicator(color: Colors.white))
                    : const Text("Pay Now", style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
