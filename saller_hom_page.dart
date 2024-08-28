import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pikaaya_customer_seller/xyz_mart.dart';

class SallerHomPage extends StatefulWidget {
  const SallerHomPage({Key? key}) : super(key: key);

  @override
  State<SallerHomPage> createState() => _SallerHomPageState();
}

class _SallerHomPageState extends State<SallerHomPage> {
  DateTime _selectedDate = DateTime.now();
  bool _isOnline = false; // This will track the online/offline status
  int _selectedIndex = 0; // To keep track of the currently selected tab
  final PageController _pageController = PageController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onTabTapped(int index) {
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    final currentDate = DateFormat('dd MMMM yyyy').format(DateTime.now());

    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: [
          // Home Page Content
          _buildHomePage(),
          // Peoples Page Content
          Scaffold(
            appBar: AppBar(
              title: Text(" People Page"),centerTitle: true,
              backgroundColor: Colors.blue,
            ),
            body: Container(
              child:  Center( child: Text('Welcome',style: TextStyle(fontSize: 20), ),),
            ),

          ),
          // Wallet Page Content
         Scaffold(
           appBar: AppBar(
             title: Text(" Wallet Page"),centerTitle: true,
             backgroundColor: Colors.blue,
           ),
           body: Container(
             child:  Center( child: Text('Welcome',style: TextStyle(fontSize: 20), ),),
           ),
         ),
          // Profile Page Content
          Scaffold(
            appBar: AppBar(
              title: Text(" Profile Page"),centerTitle: true,
              backgroundColor: Colors.blue,
            ),
            body: Container(
              child:  Center( child: Text('Welcome',style: TextStyle(fontSize: 20), ),),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onTabTapped,
        selectedItemColor: Colors.purple, // Change selected item color
        unselectedItemColor: Colors.deepPurple, // Change unselected item color
        backgroundColor: Colors.white,
        iconSize: 35,// Change background color of BottomNavigationBar
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home) ,
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.support_agent),
            label: 'Customer Support',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            label: 'Wallet',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget _buildHomePage() {
    final isWideScreen = MediaQuery.of(context).size.width > 600;

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(top: isWideScreen ? 20 : 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Container(
              padding: EdgeInsets.all(isWideScreen ? 60 : 40),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF9C27B0), Color(0xFFCF0A2C)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/Images/user_avtar.png'),
                    radius: isWideScreen ? 40 : 30,
                  ),
                  SizedBox(width: isWideScreen ? 40 : 30),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Rahul Singh',
                          style: TextStyle(color: Colors.white, fontSize: isWideScreen ? 24 : 18),
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Text(
                              'Offline',
                              style: TextStyle(color: Colors.white, fontSize: isWideScreen ? 18 : 15),
                            ),
                            SizedBox(width: 5),
                            Switch(
                              activeColor: Colors.green,
                              value: _isOnline,
                              onChanged: (value) {
                                setState(() {
                                  _isOnline = value;
                                });
                              },
                            ),
                            SizedBox(width: 5),
                            Text(
                              'Online',
                              style: TextStyle(color: Colors.white, fontSize: isWideScreen ? 18 : 15),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      'Hello XYZ Store, here is your \nseller dashboard!',
                      style: TextStyle(color: Colors.black, fontSize: 18),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(width: 10),
                  InkWell(
                    onTap: () {
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>XYZMart()),);

                    },
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.local_grocery_store, color: Colors.red, size: 40),
                            SizedBox(height: 5),
                            Text(
                              'My Store',
                              style: TextStyle(color: Colors.black, fontSize: 16),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )

                ],
              ),
            ),

            // Date Picker Section
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1),
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Icon(Icons.calendar_today, color: Colors.blue),
                  SizedBox(width: 180),
                  Expanded(
                    child: InkWell(
                      onTap: () => _selectDate(context),
                      child: Text(
                        DateFormat('dd MMMM yyyy').format(_selectedDate),
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Icon(Icons.arrow_drop_down, color: Colors.red),
                ],
              ),
            ),

            // Orders Dashboard
            DashboardSection(
              header: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Orders Dashboard',
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.normal),
                    ),
                    TextButton(
                      onPressed: () {
                        // Add your onPressed logic here
                      },
                      child: Text(
                        'Order Management',
                        style: TextStyle(color: Colors.red, fontSize: 16),
                      ),
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 10.0),
                        backgroundColor: Colors.grey[100],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              items: [
                DashboardItem(title: 'Orders Received', value: '00', color: Colors.lightGreen ,logo: AssetImage('assets/Images/orderlogo.png')),
                DashboardItem(title: 'Orders Pending', value: '00', color: Colors.lightGreen, logo: AssetImage('assets/Images/orderlogo.png')),
                DashboardItem(title: 'Orders Delivered', value: '00', color: Colors.lightGreen, logo: AssetImage('assets/Images/orderlogo.png')),
                DashboardItem(title: 'Orders Cancelled', value: '00', color: Colors.lightGreen, logo: AssetImage('assets/Images/orderlogo.png')),
                DashboardItem(title: 'Received Amount', value: '00', color: Colors.lightGreen, logo: AssetImage('assets/Images/orderlogo.png')),
                DashboardItem(title: 'Order Missing Items', value: '00', color: Colors.lightGreen, logo: AssetImage('assets/Images/orderlogo.png')),
                DashboardItem(title: 'Out For Delivery', value: '00:00 hrs', color: Colors.lightGreen, logo: AssetImage('assets/Images/orderlogo.png')),
              ],
            ),

            // Products Dashboard
            DashboardSection(
              header: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Products Dashboard',
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.normal),
                    ),
                    TextButton(
                      onPressed: () {
                        // Add your onPressed logic here
                      },
                      child: Text(
                        'Products Management',
                        style: TextStyle(color: Colors.red, fontSize: 16),
                      ),
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 10.0),
                        backgroundColor: Colors.grey[100],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              items: [
                DashboardItem(title: 'Total Products', value: '00', color: Colors.lightBlueAccent, logo: AssetImage('assets/Images/product_logo.png')),
                DashboardItem(title: 'Total Published Products', value: '00', color: Colors.lightBlueAccent, logo: AssetImage('assets/Images/product_logo.png')),
                DashboardItem(title: 'Total Unpublished Products', value: '00', color: Colors.lightBlueAccent, logo: AssetImage('assets/Images/product_logo.png')),
                DashboardItem(title: 'Rejected Products', value: '00', color: Colors.lightBlueAccent, logo: AssetImage('assets/Images/product_logo.png')),
                DashboardItem(title: 'Stock Quantity', value: '00', color: Colors.lightBlueAccent, logo: AssetImage('assets/Images/product_logo.png')),
              ],
            ),

            // Stock Dashboard Section
            DashboardSection(
              header: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Stocks Dashboard',
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.normal),
                    ),
                    TextButton(
                      onPressed: () {
                        // Add your onPressed logic here
                      },
                      child: Text(
                        'Stock Management',
                        style: TextStyle(color: Colors.red, fontSize: 16),
                      ),
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 10.0),
                        backgroundColor: Colors.grey[100],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              items: [
                DashboardItem(title: 'Stock Value', value: '00', color: Colors.orangeAccent, logo: AssetImage('assets/Images/stock_logo.png')),
                DashboardItem(title: 'Low Stock Products', value: '00', color: Colors.orangeAccent, logo: AssetImage('assets/Images/stock_logo.png')),
                DashboardItem(title: 'Rejected Products', value: '00', color: Colors.orangeAccent, logo: AssetImage('assets/Images/stock_logo.png')),
              ],
            ),

            // Top 10 Selling Products Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Section Header
                  Text(
                    'Top 10 Selling Products',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.blue,
                      decorationThickness: 2,
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 45,
                    width: 400,
                    decoration: BoxDecoration(
                      color: Colors.orange[200],
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Row(
                      children: [
                        Text(
                          'Products',
                          style: TextStyle(color: Colors.indigo, fontSize: 20),
                        ),
                        SizedBox(width: 120),
                        Text(
                          'Quantity Sold',
                          style: TextStyle(color: Colors.indigo, fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  // List of Products
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/Images/product_logo.png',
                              width: 80,
                              height: 80,
                            ),
                            SizedBox(width: 90),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  index % 2 == 0 ? 'Masala Noodles' : 'Aata Noodles',
                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '2 packs',
                                  style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Section Header
                  Text(
                    'Top 10 Rated Products',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.blue,
                      decorationThickness: 2,
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 45,
                    width: 400,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Row(
                      children: [
                        Text(
                          'Products',
                          style: TextStyle(color: Colors.indigo, fontSize: 20),
                        ),
                        SizedBox(width: 120),
                        Text(
                          'Review (Rating)',
                          style: TextStyle(color: Colors.indigo, fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  // List of Products
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/Images/product_logo.png',
                              width: 80,
                              height: 80,
                            ),
                            SizedBox(width: 90),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  index % 2 == 0 ? 'Masala Noodles' : 'Aata Noodles',
                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '2 packs',
                                  style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DashboardSection extends StatelessWidget {
  final Widget header;
  final List<DashboardItem> items;

  DashboardSection({required this.header, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header Section with minimal padding
        Padding(
          padding: const EdgeInsets.all(0.0), // Adjust padding as needed
          child: header,
        ),
        // GridView without extra space
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 2.5,
          ),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return Container(
              decoration: BoxDecoration(
                color: item.color,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  SizedBox(width: 10), // Add space between logo and content
                  Image(
                    image: item.logo,
                    width: 40, // Adjust logo size as needed
                    height: 40,
                  ),
                  SizedBox(width: 10), // Space between logo and content
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(item.title, style: TextStyle(color: Colors.white)),
                        SizedBox(height: 5),
                        Text(item.value, style: TextStyle(color: Colors.white, fontSize: 16)),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}

class DashboardItem {
  final String title;
  final String value;
  final Color color;
  final ImageProvider logo;

  DashboardItem({
    required this.title,
    required this.value,
    required this.color,
    required this.logo,
  });
}

