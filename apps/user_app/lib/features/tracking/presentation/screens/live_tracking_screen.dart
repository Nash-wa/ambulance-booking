import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared/shared.dart';
import '../providers/tracking_provider.dart';
import '../../../booking/domain/booking_status.dart';

class LiveTrackingScreen extends ConsumerStatefulWidget {
  final String bookingId;
  const LiveTrackingScreen({super.key, required this.bookingId});

  @override
  ConsumerState<LiveTrackingScreen> createState() => _LiveTrackingScreenState();
}

class _LiveTrackingScreenState extends ConsumerState<LiveTrackingScreen> {
  GoogleMapController? _mapController;
  final Set<Marker> _markers = {};
  final LatLng _userLocation = const LatLng(11.2588, 75.7804);

  @override
  void initState() {
    super.initState();
    // Start polling when screen opens
    Future.microtask(() =>
      ref.read(trackingProvider.notifier).startTracking(widget.bookingId)
    );
  }

  @override
  void dispose() {
    // Stop polling when user leaves screen
    ref.read(trackingProvider.notifier).stopTracking();
    super.dispose();
  }

  void _updateAmbulanceMarker(LatLng position) {
    setState(() {
      _markers.removeWhere((m) => m.markerId.value == 'ambulance');
      _markers.add(Marker(
        markerId: const MarkerId('ambulance'),
        position: position,
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueRed,  // 🚑 red marker
        ),
        infoWindow: const InfoWindow(title: 'Ambulance En Route'),
      ));
    });
    // Smoothly move camera to follow ambulance
    _mapController?.animateCamera(
      CameraUpdate.newLatLng(position),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final driverLocation = ref.watch(trackingProvider.select((state) => state.driverLocation));

    // When driver location updates → move pin
    if (driverLocation != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          _updateAmbulanceMarker(driverLocation);
        }
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text('Emergency Response Live', style: AppTextStyles.subtitle),
            Text('ID: ${widget.bookingId}', style: AppTextStyles.caption.copyWith(color: theme.colorScheme.onSurface.withOpacity(0.5))),
          ],
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/home'),
        ),
      ),
      body: Stack(
        children: [
          // Fullscreen map
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: _userLocation,
              zoom: 14,
            ),
            markers: {
              Marker(
                markerId: const MarkerId('user'),
                position: _userLocation,
                icon: BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueBlue,
                ),
                infoWindow: const InfoWindow(title: 'Your Location'),
              ),
              ..._markers,
            },
            onMapCreated: (ctrl) => _mapController = ctrl,
            myLocationEnabled: true,
            mapType: MapType.normal,
            zoomControlsEnabled: false,
          ),

          // Bottom driver info card
          const Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: _DriverInfoCard(),
          ),
        ],
      ),
    );
  }
}

class _DriverInfoCard extends ConsumerWidget {
  const _DriverInfoCard();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final driverName = ref.watch(trackingProvider.select((s) => s.driverName));
    final vehicleNumber = ref.watch(trackingProvider.select((s) => s.vehicleNumber));
    final eta = ref.watch(trackingProvider.select((s) => s.eta));
    final status = ref.watch(trackingProvider.select((s) => s.status));

    return Container(
      padding: const EdgeInsets.all(AppSizes.lg),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(AppSizes.radiusXl)),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 20, offset: Offset(0, -5)),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Status timeline chips
          _StatusTimeline(status: status),
          AppSizes.spaceLg,

          Row(
            children: [
              // Driver avatar
              CircleAvatar(
                radius: 26,
                backgroundColor: AppColors.emergencyRed.withValues(alpha: 0.1),
                child: const Icon(Icons.airport_shuttle, color: AppColors.emergencyRed, size: 28),
              ),
              AppSizes.spaceMd,

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      driverName.isEmpty ? 'Searching...' : driverName,
                      style: AppTextStyles.bodyLarge.copyWith(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      vehicleNumber.isEmpty ? 'Allocating responder...' : vehicleNumber,
                      style: AppTextStyles.caption.copyWith(color: theme.colorScheme.onSurface.withValues(alpha: 0.6)),
                    ),
                  ],
                ),
              ),

              // ETA badge
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                decoration: BoxDecoration(
                  color: AppColors.emergencyRed.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Text(
                      eta,
                      style: AppTextStyles.bodyMediumBold.copyWith(
                        fontSize: 18,
                        color: AppColors.emergencyRed,
                      ),
                    ),
                    Text(
                      'ETA',
                      style: AppTextStyles.caption.copyWith(
                        fontSize: 10,
                        color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 8),
              // Call button
              IconButton(
                onPressed: () {
                  // url_launcher: tel: mock
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Calling Rajan Kumar (+91 9876543210)...')),
                  );
                },
                icon: const Icon(Icons.call_rounded, color: AppColors.successGreen),
                style: IconButton.styleFrom(
                  backgroundColor: AppColors.successGreen.withValues(alpha: 0.1),
                ),
              ),
            ],
          ),
          AppSizes.spaceMd,
        ],
      ),
    );
  }
}

class _StatusTimeline extends StatelessWidget {
  final BookingStatus status;
  const _StatusTimeline({required this.status});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildTimelineNode(
          label: 'Request',
          isActive: status == BookingStatus.searching || status == BookingStatus.enRoute || status == BookingStatus.arrived,
          isCompleted: status == BookingStatus.enRoute || status == BookingStatus.arrived,
        ),
        _buildConnector(isCompleted: status == BookingStatus.enRoute || status == BookingStatus.arrived),
        _buildTimelineNode(
          label: 'En Route',
          isActive: status == BookingStatus.enRoute || status == BookingStatus.arrived,
          isCompleted: status == BookingStatus.arrived,
        ),
        _buildConnector(isCompleted: status == BookingStatus.arrived),
        _buildTimelineNode(
          label: 'Arrived',
          isActive: status == BookingStatus.arrived,
          isCompleted: status == BookingStatus.arrived,
        ),
      ],
    );
  }

  Widget _buildTimelineNode({
    required String label,
    required bool isActive,
    required bool isCompleted,
  }) {
    final color = isCompleted 
        ? AppColors.successGreen 
        : (isActive ? AppColors.emergencyRed : Colors.grey.shade400);

    return Column(
      children: [
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.1),
            shape: BoxShape.circle,
            border: Border.all(color: color, width: 2),
          ),
          child: Center(
            child: Icon(
              isCompleted ? Icons.check : Icons.circle,
              size: isCompleted ? 12 : 8,
              color: color,
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: AppTextStyles.caption.copyWith(
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            color: isActive ? color : Colors.grey.shade600,
          ),
        ),
      ],
    );
  }

  Widget _buildConnector({required bool isCompleted}) {
    return Expanded(
      child: Container(
        height: 2,
        color: isCompleted ? AppColors.successGreen : Colors.grey.shade300,
        margin: const EdgeInsets.only(bottom: 16),
      ),
    );
  }
}
