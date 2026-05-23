import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared/shared.dart';

class BookingPickupScreen extends StatefulWidget {
  const BookingPickupScreen({super.key});

  @override
  State<BookingPickupScreen> createState() => _BookingPickupScreenState();
}

class _BookingPickupScreenState extends State<BookingPickupScreen> {
  final _searchController = TextEditingController();

  final List<String> _recentSearches = [
    'My Current Location (Gachibowli)',
    'Docwo Headquarters, Hitech City',
    'Apollo Hospital, Jubilee Hills',
    'Secunderabad Railway Station',
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Set Pickup Location'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Input Row
              TextField(
                controller: _searchController,
                autofocus: true,
                decoration: InputDecoration(
                  hintText: 'Search pickup address...',
                  prefixIcon: const Icon(Icons.circle, color: AppColors.infoBlue, size: 12),
                  suffixIcon: _searchController.text.isNotEmpty
                      ? IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: () => setState(() => _searchController.clear()),
                        )
                      : null,
                ),
                onChanged: (val) => setState(() {}),
              ),
              AppSizes.spaceLg,

              // Current Location Quick Trigger
              ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Color(0xFFE3F2FD),
                  child: Icon(Icons.my_location, color: AppColors.infoBlue),
                ),
                title: Text('Use Current Location', style: AppTextStyles.bodyMediumBold),
                subtitle: Text('Gachibowli, Hyderabad, Telangana 500032', style: AppTextStyles.caption),
                onTap: () {
                  context.push('/booking/destination');
                },
              ),
              const Divider(),
              AppSizes.spaceSm,

              Text(
                'Recent Searches',
                style: AppTextStyles.subtitle.copyWith(fontSize: 14),
              ),
              AppSizes.spaceSm,

              Expanded(
                child: ListView.separated(
                  itemCount: _recentSearches.length,
                  separatorBuilder: (context, index) => const Divider(),
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: const Icon(Icons.history, color: AppColors.lightTextSecondary),
                      title: Text(_recentSearches[index], style: AppTextStyles.bodyMedium),
                      onTap: () {
                        context.push('/booking/destination');
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
