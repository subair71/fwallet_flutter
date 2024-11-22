import 'package:flutter/material.dart';

class HomePageWithBottomNav extends StatefulWidget {
  const HomePageWithBottomNav({super.key});

  @override
  _HomePageWithBottomNavState createState() => _HomePageWithBottomNavState();
}

class _HomePageWithBottomNavState extends State<HomePageWithBottomNav> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    const TopUpScreen(),
    const BeneficiariesScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.credit_card),
            label: 'Top-Up',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Beneficiaries',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

// Placeholder Screens
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Home Screen'));
  }
}

class TopUpScreen extends StatelessWidget {
  const TopUpScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Top-Up Screen'));
  }
}

class BeneficiariesScreen extends StatelessWidget {
  const BeneficiariesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Beneficiaries Screen'));
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Profile Screen'));
  }
}
