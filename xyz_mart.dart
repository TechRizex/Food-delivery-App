import 'package:flutter/material.dart';

class XYZMart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Back"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // This will pop the current screen
          },
        ),
        backgroundColor: const Color(0xFF9C27B0), // Matching gradient start color
        elevation: 0,
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 160, // Adjusted height
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF9C27B0), Color(0xFFCF0A2C)],
                  ),
                  borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
                ),
              ),
              Align(
                alignment: Alignment.center, // Center the image within the container
                child: CircleAvatar(
                  radius: 70, // Adjusted the size of the circle
                  backgroundColor: const Color(0xFFCF0A2C), // Matching gradient end color
                  child: Image.asset(
                    'assets/Images/store_image.png',
                    height: 120, // Adjusted height of the image
                    width: 120, // Adjusted width of the image
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(
            "XYZ MART",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          SizedBox(height: 5),
          Text(
            "Category: Grocery Store",
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
          SizedBox(height: 5),
          Text(
            "Address: Bada Bazar, Chota Chowk, Jammu",
            style: TextStyle(fontSize: 14, color: Colors.black),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.star, color: Colors.orange, size: 20),
              Icon(Icons.star, color: Colors.orange, size: 20),
              Icon(Icons.star, color: Colors.orange, size: 20),
              Icon(Icons.star, color: Colors.orange, size: 20),
              Icon(Icons.star_half, color: Colors.orange, size: 20),
            ],
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SizedBox(
              height: 35, // Adjust the height as needed
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search for listed products",
                  prefixIcon: Icon(Icons.search),
                  contentPadding: EdgeInsets.symmetric(vertical: 8), // Adjust padding to control height
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ),
          ),

          SizedBox(height: 10),
          Expanded(

            child: ListView(
              children: [
                productCard("Beco Tissue Roll", "₹100", "₹85", 4, "assets/Images/tissue_roll.png"),
                productCard("Masala Maggie", "₹34", "₹31", 3.5, "assets/Images/masala_maggie.png"),
                productCard("Aata Maggie", "₹40", "₹35", 4, "assets/Images/aata_maggie.png"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget productCard(String title, String sellingPrice, String landingPrice, double rating, String imagePath) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        contentPadding: EdgeInsets.all(10),
        leading: Image.asset(imagePath, width: 50, height: 50),
        title: Text(title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Selling Price: $sellingPrice", style: TextStyle(color: Colors.black)),
            Text("Landing Price: $landingPrice", style: TextStyle(color: Colors.green)),
            Row(
              children: List.generate(5, (index) {
                return Icon(
                  index < rating ? Icons.star : Icons.star_border,
                  color: Colors.orange,
                  size: 20,
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
