import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared/shared.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingData> _slides = [
    OnboardingData(
      title: 'Emergency SOS Response',
      description: 'One tap to call an ambulance to your precise live location within seconds.',
      icon: Icons.emergency,
      color: AppColors.emergencyRed,
    ),
    OnboardingData(
      title: 'Live Real-time Tracking',
      description: 'Track the assigned paramedic on the live map and know the exact ETA.',
      icon: Icons.map_outlined,
      color: AppColors.infoBlue,
    ),
    OnboardingData(
      title: 'Certified Paramedics',
      description: 'Top-tier medical specialists and life-support vehicles ready to save lives.',
      icon: Icons.security,
      color: AppColors.successGreen,
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.lg),
          child: Column(
            children: [
              // Skip Button
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: () => context.go('/login'),
                  child: Text(
                    'Skip',
                    style: AppTextStyles.bodyMediumBold.copyWith(
                      color: AppColors.emergencyRed,
                    ),
                  ),
                ),
              ),

              // Swipeable Carousel
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  itemCount: _slides.length,
                  itemBuilder: (context, index) {
                    final slide = _slides[index];
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(AppSizes.xxl),
                          decoration: BoxDecoration(
                            color: slide.color.withOpacity(0.1),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            slide.icon,
                            size: 100,
                            color: slide.color,
                          ),
                        ),
                        AppSizes.spaceXl,
                        Text(
                          slide.title,
                          style: AppTextStyles.h2.copyWith(
                            color: theme.colorScheme.onSurface,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        AppSizes.spaceMd,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: AppSizes.md),
                          child: Text(
                            slide.description,
                            style: AppTextStyles.bodyMedium.copyWith(
                              color: theme.colorScheme.onSurface.withOpacity(0.6),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),

              // Page Indicators & Action Button
              Column(
                children: [
                  // Dot Indicators
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      _slides.length,
                      (index) => AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.symmetric(horizontal: 4.0),
                        height: 8.0,
                        width: _currentPage == index ? 24.0 : 8.0,
                        decoration: BoxDecoration(
                          color: _currentPage == index
                              ? AppColors.emergencyRed
                              : AppColors.lightBorder,
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                      ),
                    ),
                  ),
                  AppSizes.spaceXl,

                  // Main Button
                  ElevatedButton(
                    onPressed: () {
                      if (_currentPage == _slides.length - 1) {
                        context.go('/login');
                      } else {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                    child: Text(
                      _currentPage == _slides.length - 1 ? 'Get Started' : 'Next',
                    ),
                  ),
                  AppSizes.spaceMd,
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OnboardingData {
  final String title;
  final String description;
  final IconData icon;
  final Color color;

  OnboardingData({
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
  });
}
