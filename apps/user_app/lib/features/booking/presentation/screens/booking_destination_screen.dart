import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared/shared.dart';

class BookingDestinationScreen extends StatefulWidget {
  const BookingDestinationScreen({super.key});

  @override
  State<BookingDestinationScreen> createState() => _BookingDestinationScreenState();
}

class _BookingDestinationScreenState extends State<BookingDestinationScreen> {
  final _searchController = TextEditingController();

  final List<HospitalData> _emergencyHospitals = [
    HospitalData(
      name: 'Apollo Health City',
      address: 'Jubilee Hills, Hyderabad (4.2 km)',
      emergencyContact: '+91 40 2360 7777',
      isTraumaCenter: true,
    ),
    HospitalData(
      name: 'Care Hospitals',
      address: 'Gachibowli, Hyderabad (1.8 km)',
      emergencyContact: '+91 40 6111 1111',
      isTraumaCenter: true,
    ),
    HospitalData(
      name: 'Continental Hospitals',
      address: 'Nanakramguda, Gachibowli (3.5 km)',
      emergencyContact: '+91 40 6700 0000',
      isTraumaCenter: false,
    ),
    HospitalData(
      name: 'KIMS Hospitals',
      address: 'Kondapur, Hyderabad (5.1 km)',
      emergencyContact: '+91 40 4488 5000',
      isTraumaCenter: true,
    ),
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
        title: const Text('Select Destination Hospital'),
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
                decoration: const InputDecoration(
                  hintText: 'Search nearest Hospital or Trauma Center...',
                  prefixIcon: Icon(Icons.location_on, color: AppColors.emergencyRed, size: 16),
                ),
                onChanged: (val) => setState(() {}),
              ),
              AppSizes.spaceLg,

              Text(
                'Recommended Trauma & ICU Centers',
                style: AppTextStyles.subtitle.copyWith(fontSize: 14),
              ),
              AppSizes.spaceSm,

              Expanded(
                child: ListView.separated(
                  itemCount: _emergencyHospitals.length,
                  separatorBuilder: (context, index) => const Divider(),
                  itemBuilder: (context, index) {
                    final hospital = _emergencyHospitals[index];
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: hospital.isTraumaCenter
                            ? AppColors.emergencyRed.withOpacity(0.1)
                            : Colors.grey[200],
                        child: Icon(
                          Icons.local_hospital,
                          color: hospital.isTraumaCenter
                              ? AppColors.emergencyRed
                              : AppColors.lightTextSecondary,
                        ),
                      ),
                      title: Row(
                        children: [
                          Expanded(child: Text(hospital.name, style: AppTextStyles.bodyMediumBold)),
                          if (hospital.isTraumaCenter)
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                              decoration: BoxDecoration(
                                color: AppColors.emergencyRed,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                'TRAUMA',
                                style: AppTextStyles.caption.copyWith(
                                  color: Colors.white,
                                  fontSize: 8,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                        ],
                      ),
                      subtitle: Text(hospital.address, style: AppTextStyles.caption),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 14),
                      onTap: () {
                        context.push('/booking/summary', extra: hospital.name);
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

class HospitalData {
  final String name;
  final String address;
  final String emergencyContact;
  final bool isTraumaCenter;

  HospitalData({
    required this.name,
    required this.address,
    required this.emergencyContact,
    required this.isTraumaCenter,
  });
}
