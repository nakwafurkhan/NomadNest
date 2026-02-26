import 'package:flutter/material.dart';
// Assuming your theme file exists here
// import '../../../core/theme/app_theme.dart'; 

// Mock Theme for demonstration if the import is missing
class NomadNestTheme {
  static const Color deepTeal = Color(0xFF004D40);
  static const Color sageGreen = Color(0xFF81C784);
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          // 1. Stylized App Bar
          SliverAppBar(
            expandedHeight: 140.0,
            floating: true,
            pinned: true,
            elevation: 0,
            backgroundColor: NomadNestTheme.deepTeal,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: const EdgeInsets.only(left: 20, bottom: 16),
              title: const Text(
                'Find your Nest',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              background: Container(color: NomadNestTheme.deepTeal),
            ),
          ),

          // 2. Main Content
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSearchBar(),
                  const SizedBox(height: 30),
                  _buildSectionHeader("Categories"),
                  const SizedBox(height: 16),
                  _buildCategories(),
                  const SizedBox(height: 30),
                  _buildSectionHeader("Featured Stays"),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ),

          // 3. Featured Hotels List
          SliverPadding(
            padding: const EdgeInsets.only(bottom: 20),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => _buildHotelCard(index),
                childCount: 5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: const TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search, color: NomadNestTheme.sageGreen),
          hintText: "Search by city, hotel...",
          hintStyle: TextStyle(color: Colors.grey),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 15),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: NomadNestTheme.deepTeal,
          ),
        ),
        TextButton(
          onPressed: () {},
          child: const Text("See all", style: TextStyle(color: NomadNestTheme.sageGreen)),
        )
      ],
    );
  }

  Widget _buildCategories() {
    final List<Map<String, dynamic>> cats = [
      {"name": "Nature", "icon": Icons.forest},
      {"name": "City", "icon": Icons.location_city},
      {"name": "Beach", "icon": Icons.beach_access},
      {"name": "Tiny Home", "icon": Icons.home_filled}, // Fixed syntax here
      {"name": "Mountain", "icon": Icons.terrain},
    ];

    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: cats.length,
        itemBuilder: (context, i) => Padding(
          padding: const EdgeInsets.only(right: 24),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: NomadNestTheme.sageGreen.withOpacity(0.15),
                  shape: BoxShape.circle,
                ),
                child: Icon(cats[i]['icon'] as IconData, color: NomadNestTheme.deepTeal, size: 28),
              ),
              const SizedBox(height: 8),
              Text(
                cats[i]['name'] as String,
                style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHotelCard(int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      height: 260,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          children: [
            // Image Layer
            Positioned.fill(
              child: Image.network(
                "https://images.unsplash.com/photo-1566073771259-6a8506099945?auto=format&fit=crop&q=80&w=800",
                fit: BoxFit.cover,
              ),
            ),
            // Gradient Overlay
            Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [Colors.black.withOpacity(0.8), Colors.transparent],
                  ),
                ),
              ),
            ),
            // Price Tag
            Positioned(
              top: 16,
              right: 16,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  "\$120/night",
                  style: TextStyle(fontWeight: FontWeight.bold, color: NomadNestTheme.deepTeal),
                ),
              ),
            ),
            // Details
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "The Serene Nest Resort",
                    style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: const [
                      Icon(Icons.location_on, color: NomadNestTheme.sageGreen, size: 16),
                      SizedBox(width: 4),
                      Text("Bali, Indonesia", style: TextStyle(color: Colors.white70)),
                      Spacer(),
                      Icon(Icons.star, color: Colors.amber, size: 18),
                      Text(" 4.9", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}