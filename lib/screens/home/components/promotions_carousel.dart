import 'package:flutter/material.dart';

class PromotionCarousel extends StatefulWidget {
  const PromotionCarousel({super.key});

  @override
  State<PromotionCarousel> createState() => _PromotionCarouselState();
}

class _PromotionCarouselState extends State<PromotionCarousel> {
  final List<Map<String, String>> promotions = [
    {
      'title': '50% Off Oil Change',
      'image': 'assets/images/Periodic Service.png',
      'description': 'Limited-time discount on all oil changes!',
    },
    {
      'title': 'Free Tire Rotation',
      'image': 'assets/images/Tyres & Wheel Care.png',
      'description': 'Get a free tire rotation with your next service.',
    },
    {
      'title': 'Brake Pads Special',
      'image': 'assets/images/Suspension & Fitments.png',
      'description': 'Buy brake pads and get free installation.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: PageView.builder(
        itemCount: promotions.length,
        itemBuilder: (context, index) {
          return _buildPromotionCard(promotions[index]);
        },
      ),
    );
  }

  Widget _buildPromotionCard(Map<String, String> promo) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: InkWell(
        borderRadius: BorderRadius.circular(30),
        onTap: () => Navigator.pushNamed(context, '/program-date'),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withValues(alpha: 0.1),
            borderRadius: const BorderRadius.all(Radius.circular(30)),
            border: Border.all(color: Theme.of(context).primaryColor, width: 2),
          ),
          child: Row(
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(image: AssetImage(promo['image']!), fit: BoxFit.cover),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(promo['title']!, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    SizedBox(height: 4),
                    Text(promo['description']!, style: TextStyle(fontSize: 12)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
