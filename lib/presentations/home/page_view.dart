import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:funica/presentations/home/home_page.dart';
import 'package:funica/presentations/product_manager/add_products.dart';

class PageViewScreen extends StatefulWidget {
  const PageViewScreen({
    Key? key,
  }) : super(key: key);
  @override
  _PageViewScreenState createState() => _PageViewScreenState();
}

class _PageViewScreenState extends State<PageViewScreen>
    with WidgetsBindingObserver {
  int? _selectedPageIndex;
  late List<Widget> _pages;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _selectedPageIndex = 0;
    _pages = [
      HomePage(),
      HomePage(),
      HomePage(),
      ProductForm(),
      HomePage(),
    ];
    _pageController = PageController(initialPage: _selectedPageIndex!);
  }

  @override
  Widget build(BuildContext context) {
    //  final height = MediaQuery.of(context).size.height;
    // final width = MediaQuery.of(context).size.width;
    final color = Theme.of(context);
    DateTime preBackpress = DateTime.now();
    return WillPopScope(
      onWillPop: () async {
        final timegap = DateTime.now().difference(preBackpress);
        final cantExit = timegap >=const  Duration(seconds: 2);
        preBackpress = DateTime.now();
        if (_selectedPageIndex == 0) {
          if (cantExit) {
            Fluttertoast.showToast(
                msg: "Press back button again to exit",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: color.backgroundColor,
                textColor: color.primaryColor,
                fontSize: 13.0);
            return false;
          } else {
            return true;
          }
        } else {
          setState(() {
            _selectedPageIndex = 0;
            _pageController.jumpToPage(_selectedPageIndex!);
          });
          return false;
        }
      },
      child: Scaffold(
        body: PageView(
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(),
          children: _pages,
        ),
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: color.backgroundColor,
          ),
          child: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_outlined,
                  size: 25,
                ),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_bag_outlined,
                  size: 25,
                ),
                label: "Cart",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_cart_outlined,
                  size: 25,
                ),
                label: "Cart",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.wallet_outlined,
                  size: 25,
                ),
                label: "Wallet",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person_outlined,
                  size: 25,
                ),
                label: "Profile",
              ),
            ],
            showSelectedLabels: true,
            showUnselectedLabels: true,
            selectedItemColor: color.primaryColor,
            unselectedItemColor: color.hintColor,
            type: BottomNavigationBarType.fixed,
            // showSelectedLabels: true,
            // showUnselectedLabels: false,
            currentIndex: _selectedPageIndex!,
            onTap: (selectedPageIndex) {
              setState(() {
                _selectedPageIndex = selectedPageIndex;
                if (selectedPageIndex == 0 ||
                    selectedPageIndex == 1 ||
                    selectedPageIndex == 2 ||
                    selectedPageIndex == 3 ||
                    selectedPageIndex == 4) {
                  _pageController.jumpToPage(selectedPageIndex);
                }
              });
            },
          ),
        ),
      ),
    );
  }
}
