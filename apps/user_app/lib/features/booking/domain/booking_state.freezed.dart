// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$BookingState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(String address) pickupSelected,
    required TResult Function(String pickupAddress, String destinationAddress)
    destinationSelected,
    required TResult Function(
      String pickupAddress,
      String destinationAddress,
      String ambulanceType,
    )
    confirming,
    required TResult Function(
      String bookingId,
      String driverId,
      String pickupAddress,
      String destinationAddress,
      String ambulanceType,
    )
    confirmed,
    required TResult Function(
      String bookingId,
      String driverId,
      String pickupAddress,
      String destinationAddress,
      String ambulanceType,
      double driverLatitude,
      double driverLongitude,
    )
    tracking,
    required TResult Function() completed,
    required TResult Function(String message) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(String address)? pickupSelected,
    TResult? Function(String pickupAddress, String destinationAddress)?
    destinationSelected,
    TResult? Function(
      String pickupAddress,
      String destinationAddress,
      String ambulanceType,
    )?
    confirming,
    TResult? Function(
      String bookingId,
      String driverId,
      String pickupAddress,
      String destinationAddress,
      String ambulanceType,
    )?
    confirmed,
    TResult? Function(
      String bookingId,
      String driverId,
      String pickupAddress,
      String destinationAddress,
      String ambulanceType,
      double driverLatitude,
      double driverLongitude,
    )?
    tracking,
    TResult? Function()? completed,
    TResult? Function(String message)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(String address)? pickupSelected,
    TResult Function(String pickupAddress, String destinationAddress)?
    destinationSelected,
    TResult Function(
      String pickupAddress,
      String destinationAddress,
      String ambulanceType,
    )?
    confirming,
    TResult Function(
      String bookingId,
      String driverId,
      String pickupAddress,
      String destinationAddress,
      String ambulanceType,
    )?
    confirmed,
    TResult Function(
      String bookingId,
      String driverId,
      String pickupAddress,
      String destinationAddress,
      String ambulanceType,
      double driverLatitude,
      double driverLongitude,
    )?
    tracking,
    TResult Function()? completed,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Idle value) idle,
    required TResult Function(_PickupSelected value) pickupSelected,
    required TResult Function(_DestinationSelected value) destinationSelected,
    required TResult Function(_Confirming value) confirming,
    required TResult Function(_Confirmed value) confirmed,
    required TResult Function(_Tracking value) tracking,
    required TResult Function(_Completed value) completed,
    required TResult Function(_Error value) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Idle value)? idle,
    TResult? Function(_PickupSelected value)? pickupSelected,
    TResult? Function(_DestinationSelected value)? destinationSelected,
    TResult? Function(_Confirming value)? confirming,
    TResult? Function(_Confirmed value)? confirmed,
    TResult? Function(_Tracking value)? tracking,
    TResult? Function(_Completed value)? completed,
    TResult? Function(_Error value)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_PickupSelected value)? pickupSelected,
    TResult Function(_DestinationSelected value)? destinationSelected,
    TResult Function(_Confirming value)? confirming,
    TResult Function(_Confirmed value)? confirmed,
    TResult Function(_Tracking value)? tracking,
    TResult Function(_Completed value)? completed,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookingStateCopyWith<$Res> {
  factory $BookingStateCopyWith(
    BookingState value,
    $Res Function(BookingState) then,
  ) = _$BookingStateCopyWithImpl<$Res, BookingState>;
}

/// @nodoc
class _$BookingStateCopyWithImpl<$Res, $Val extends BookingState>
    implements $BookingStateCopyWith<$Res> {
  _$BookingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BookingState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$IdleImplCopyWith<$Res> {
  factory _$$IdleImplCopyWith(
    _$IdleImpl value,
    $Res Function(_$IdleImpl) then,
  ) = __$$IdleImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$IdleImplCopyWithImpl<$Res>
    extends _$BookingStateCopyWithImpl<$Res, _$IdleImpl>
    implements _$$IdleImplCopyWith<$Res> {
  __$$IdleImplCopyWithImpl(_$IdleImpl _value, $Res Function(_$IdleImpl) _then)
    : super(_value, _then);

  /// Create a copy of BookingState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$IdleImpl implements _Idle {
  const _$IdleImpl();

  @override
  String toString() {
    return 'BookingState.idle()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$IdleImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(String address) pickupSelected,
    required TResult Function(String pickupAddress, String destinationAddress)
    destinationSelected,
    required TResult Function(
      String pickupAddress,
      String destinationAddress,
      String ambulanceType,
    )
    confirming,
    required TResult Function(
      String bookingId,
      String driverId,
      String pickupAddress,
      String destinationAddress,
      String ambulanceType,
    )
    confirmed,
    required TResult Function(
      String bookingId,
      String driverId,
      String pickupAddress,
      String destinationAddress,
      String ambulanceType,
      double driverLatitude,
      double driverLongitude,
    )
    tracking,
    required TResult Function() completed,
    required TResult Function(String message) error,
  }) {
    return idle();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(String address)? pickupSelected,
    TResult? Function(String pickupAddress, String destinationAddress)?
    destinationSelected,
    TResult? Function(
      String pickupAddress,
      String destinationAddress,
      String ambulanceType,
    )?
    confirming,
    TResult? Function(
      String bookingId,
      String driverId,
      String pickupAddress,
      String destinationAddress,
      String ambulanceType,
    )?
    confirmed,
    TResult? Function(
      String bookingId,
      String driverId,
      String pickupAddress,
      String destinationAddress,
      String ambulanceType,
      double driverLatitude,
      double driverLongitude,
    )?
    tracking,
    TResult? Function()? completed,
    TResult? Function(String message)? error,
  }) {
    return idle?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(String address)? pickupSelected,
    TResult Function(String pickupAddress, String destinationAddress)?
    destinationSelected,
    TResult Function(
      String pickupAddress,
      String destinationAddress,
      String ambulanceType,
    )?
    confirming,
    TResult Function(
      String bookingId,
      String driverId,
      String pickupAddress,
      String destinationAddress,
      String ambulanceType,
    )?
    confirmed,
    TResult Function(
      String bookingId,
      String driverId,
      String pickupAddress,
      String destinationAddress,
      String ambulanceType,
      double driverLatitude,
      double driverLongitude,
    )?
    tracking,
    TResult Function()? completed,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Idle value) idle,
    required TResult Function(_PickupSelected value) pickupSelected,
    required TResult Function(_DestinationSelected value) destinationSelected,
    required TResult Function(_Confirming value) confirming,
    required TResult Function(_Confirmed value) confirmed,
    required TResult Function(_Tracking value) tracking,
    required TResult Function(_Completed value) completed,
    required TResult Function(_Error value) error,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Idle value)? idle,
    TResult? Function(_PickupSelected value)? pickupSelected,
    TResult? Function(_DestinationSelected value)? destinationSelected,
    TResult? Function(_Confirming value)? confirming,
    TResult? Function(_Confirmed value)? confirmed,
    TResult? Function(_Tracking value)? tracking,
    TResult? Function(_Completed value)? completed,
    TResult? Function(_Error value)? error,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_PickupSelected value)? pickupSelected,
    TResult Function(_DestinationSelected value)? destinationSelected,
    TResult Function(_Confirming value)? confirming,
    TResult Function(_Confirmed value)? confirmed,
    TResult Function(_Tracking value)? tracking,
    TResult Function(_Completed value)? completed,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class _Idle implements BookingState {
  const factory _Idle() = _$IdleImpl;
}

/// @nodoc
abstract class _$$PickupSelectedImplCopyWith<$Res> {
  factory _$$PickupSelectedImplCopyWith(
    _$PickupSelectedImpl value,
    $Res Function(_$PickupSelectedImpl) then,
  ) = __$$PickupSelectedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String address});
}

/// @nodoc
class __$$PickupSelectedImplCopyWithImpl<$Res>
    extends _$BookingStateCopyWithImpl<$Res, _$PickupSelectedImpl>
    implements _$$PickupSelectedImplCopyWith<$Res> {
  __$$PickupSelectedImplCopyWithImpl(
    _$PickupSelectedImpl _value,
    $Res Function(_$PickupSelectedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BookingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? address = null}) {
    return _then(
      _$PickupSelectedImpl(
        address: null == address
            ? _value.address
            : address // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$PickupSelectedImpl implements _PickupSelected {
  const _$PickupSelectedImpl({required this.address});

  @override
  final String address;

  @override
  String toString() {
    return 'BookingState.pickupSelected(address: $address)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PickupSelectedImpl &&
            (identical(other.address, address) || other.address == address));
  }

  @override
  int get hashCode => Object.hash(runtimeType, address);

  /// Create a copy of BookingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PickupSelectedImplCopyWith<_$PickupSelectedImpl> get copyWith =>
      __$$PickupSelectedImplCopyWithImpl<_$PickupSelectedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(String address) pickupSelected,
    required TResult Function(String pickupAddress, String destinationAddress)
    destinationSelected,
    required TResult Function(
      String pickupAddress,
      String destinationAddress,
      String ambulanceType,
    )
    confirming,
    required TResult Function(
      String bookingId,
      String driverId,
      String pickupAddress,
      String destinationAddress,
      String ambulanceType,
    )
    confirmed,
    required TResult Function(
      String bookingId,
      String driverId,
      String pickupAddress,
      String destinationAddress,
      String ambulanceType,
      double driverLatitude,
      double driverLongitude,
    )
    tracking,
    required TResult Function() completed,
    required TResult Function(String message) error,
  }) {
    return pickupSelected(address);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(String address)? pickupSelected,
    TResult? Function(String pickupAddress, String destinationAddress)?
    destinationSelected,
    TResult? Function(
      String pickupAddress,
      String destinationAddress,
      String ambulanceType,
    )?
    confirming,
    TResult? Function(
      String bookingId,
      String driverId,
      String pickupAddress,
      String destinationAddress,
      String ambulanceType,
    )?
    confirmed,
    TResult? Function(
      String bookingId,
      String driverId,
      String pickupAddress,
      String destinationAddress,
      String ambulanceType,
      double driverLatitude,
      double driverLongitude,
    )?
    tracking,
    TResult? Function()? completed,
    TResult? Function(String message)? error,
  }) {
    return pickupSelected?.call(address);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(String address)? pickupSelected,
    TResult Function(String pickupAddress, String destinationAddress)?
    destinationSelected,
    TResult Function(
      String pickupAddress,
      String destinationAddress,
      String ambulanceType,
    )?
    confirming,
    TResult Function(
      String bookingId,
      String driverId,
      String pickupAddress,
      String destinationAddress,
      String ambulanceType,
    )?
    confirmed,
    TResult Function(
      String bookingId,
      String driverId,
      String pickupAddress,
      String destinationAddress,
      String ambulanceType,
      double driverLatitude,
      double driverLongitude,
    )?
    tracking,
    TResult Function()? completed,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (pickupSelected != null) {
      return pickupSelected(address);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Idle value) idle,
    required TResult Function(_PickupSelected value) pickupSelected,
    required TResult Function(_DestinationSelected value) destinationSelected,
    required TResult Function(_Confirming value) confirming,
    required TResult Function(_Confirmed value) confirmed,
    required TResult Function(_Tracking value) tracking,
    required TResult Function(_Completed value) completed,
    required TResult Function(_Error value) error,
  }) {
    return pickupSelected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Idle value)? idle,
    TResult? Function(_PickupSelected value)? pickupSelected,
    TResult? Function(_DestinationSelected value)? destinationSelected,
    TResult? Function(_Confirming value)? confirming,
    TResult? Function(_Confirmed value)? confirmed,
    TResult? Function(_Tracking value)? tracking,
    TResult? Function(_Completed value)? completed,
    TResult? Function(_Error value)? error,
  }) {
    return pickupSelected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_PickupSelected value)? pickupSelected,
    TResult Function(_DestinationSelected value)? destinationSelected,
    TResult Function(_Confirming value)? confirming,
    TResult Function(_Confirmed value)? confirmed,
    TResult Function(_Tracking value)? tracking,
    TResult Function(_Completed value)? completed,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (pickupSelected != null) {
      return pickupSelected(this);
    }
    return orElse();
  }
}

abstract class _PickupSelected implements BookingState {
  const factory _PickupSelected({required final String address}) =
      _$PickupSelectedImpl;

  String get address;

  /// Create a copy of BookingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PickupSelectedImplCopyWith<_$PickupSelectedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DestinationSelectedImplCopyWith<$Res> {
  factory _$$DestinationSelectedImplCopyWith(
    _$DestinationSelectedImpl value,
    $Res Function(_$DestinationSelectedImpl) then,
  ) = __$$DestinationSelectedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String pickupAddress, String destinationAddress});
}

/// @nodoc
class __$$DestinationSelectedImplCopyWithImpl<$Res>
    extends _$BookingStateCopyWithImpl<$Res, _$DestinationSelectedImpl>
    implements _$$DestinationSelectedImplCopyWith<$Res> {
  __$$DestinationSelectedImplCopyWithImpl(
    _$DestinationSelectedImpl _value,
    $Res Function(_$DestinationSelectedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BookingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? pickupAddress = null, Object? destinationAddress = null}) {
    return _then(
      _$DestinationSelectedImpl(
        pickupAddress: null == pickupAddress
            ? _value.pickupAddress
            : pickupAddress // ignore: cast_nullable_to_non_nullable
                  as String,
        destinationAddress: null == destinationAddress
            ? _value.destinationAddress
            : destinationAddress // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$DestinationSelectedImpl implements _DestinationSelected {
  const _$DestinationSelectedImpl({
    required this.pickupAddress,
    required this.destinationAddress,
  });

  @override
  final String pickupAddress;
  @override
  final String destinationAddress;

  @override
  String toString() {
    return 'BookingState.destinationSelected(pickupAddress: $pickupAddress, destinationAddress: $destinationAddress)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DestinationSelectedImpl &&
            (identical(other.pickupAddress, pickupAddress) ||
                other.pickupAddress == pickupAddress) &&
            (identical(other.destinationAddress, destinationAddress) ||
                other.destinationAddress == destinationAddress));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, pickupAddress, destinationAddress);

  /// Create a copy of BookingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DestinationSelectedImplCopyWith<_$DestinationSelectedImpl> get copyWith =>
      __$$DestinationSelectedImplCopyWithImpl<_$DestinationSelectedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(String address) pickupSelected,
    required TResult Function(String pickupAddress, String destinationAddress)
    destinationSelected,
    required TResult Function(
      String pickupAddress,
      String destinationAddress,
      String ambulanceType,
    )
    confirming,
    required TResult Function(
      String bookingId,
      String driverId,
      String pickupAddress,
      String destinationAddress,
      String ambulanceType,
    )
    confirmed,
    required TResult Function(
      String bookingId,
      String driverId,
      String pickupAddress,
      String destinationAddress,
      String ambulanceType,
      double driverLatitude,
      double driverLongitude,
    )
    tracking,
    required TResult Function() completed,
    required TResult Function(String message) error,
  }) {
    return destinationSelected(pickupAddress, destinationAddress);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(String address)? pickupSelected,
    TResult? Function(String pickupAddress, String destinationAddress)?
    destinationSelected,
    TResult? Function(
      String pickupAddress,
      String destinationAddress,
      String ambulanceType,
    )?
    confirming,
    TResult? Function(
      String bookingId,
      String driverId,
      String pickupAddress,
      String destinationAddress,
      String ambulanceType,
    )?
    confirmed,
    TResult? Function(
      String bookingId,
      String driverId,
      String pickupAddress,
      String destinationAddress,
      String ambulanceType,
      double driverLatitude,
      double driverLongitude,
    )?
    tracking,
    TResult? Function()? completed,
    TResult? Function(String message)? error,
  }) {
    return destinationSelected?.call(pickupAddress, destinationAddress);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(String address)? pickupSelected,
    TResult Function(String pickupAddress, String destinationAddress)?
    destinationSelected,
    TResult Function(
      String pickupAddress,
      String destinationAddress,
      String ambulanceType,
    )?
    confirming,
    TResult Function(
      String bookingId,
      String driverId,
      String pickupAddress,
      String destinationAddress,
      String ambulanceType,
    )?
    confirmed,
    TResult Function(
      String bookingId,
      String driverId,
      String pickupAddress,
      String destinationAddress,
      String ambulanceType,
      double driverLatitude,
      double driverLongitude,
    )?
    tracking,
    TResult Function()? completed,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (destinationSelected != null) {
      return destinationSelected(pickupAddress, destinationAddress);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Idle value) idle,
    required TResult Function(_PickupSelected value) pickupSelected,
    required TResult Function(_DestinationSelected value) destinationSelected,
    required TResult Function(_Confirming value) confirming,
    required TResult Function(_Confirmed value) confirmed,
    required TResult Function(_Tracking value) tracking,
    required TResult Function(_Completed value) completed,
    required TResult Function(_Error value) error,
  }) {
    return destinationSelected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Idle value)? idle,
    TResult? Function(_PickupSelected value)? pickupSelected,
    TResult? Function(_DestinationSelected value)? destinationSelected,
    TResult? Function(_Confirming value)? confirming,
    TResult? Function(_Confirmed value)? confirmed,
    TResult? Function(_Tracking value)? tracking,
    TResult? Function(_Completed value)? completed,
    TResult? Function(_Error value)? error,
  }) {
    return destinationSelected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_PickupSelected value)? pickupSelected,
    TResult Function(_DestinationSelected value)? destinationSelected,
    TResult Function(_Confirming value)? confirming,
    TResult Function(_Confirmed value)? confirmed,
    TResult Function(_Tracking value)? tracking,
    TResult Function(_Completed value)? completed,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (destinationSelected != null) {
      return destinationSelected(this);
    }
    return orElse();
  }
}

abstract class _DestinationSelected implements BookingState {
  const factory _DestinationSelected({
    required final String pickupAddress,
    required final String destinationAddress,
  }) = _$DestinationSelectedImpl;

  String get pickupAddress;
  String get destinationAddress;

  /// Create a copy of BookingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DestinationSelectedImplCopyWith<_$DestinationSelectedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ConfirmingImplCopyWith<$Res> {
  factory _$$ConfirmingImplCopyWith(
    _$ConfirmingImpl value,
    $Res Function(_$ConfirmingImpl) then,
  ) = __$$ConfirmingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({
    String pickupAddress,
    String destinationAddress,
    String ambulanceType,
  });
}

/// @nodoc
class __$$ConfirmingImplCopyWithImpl<$Res>
    extends _$BookingStateCopyWithImpl<$Res, _$ConfirmingImpl>
    implements _$$ConfirmingImplCopyWith<$Res> {
  __$$ConfirmingImplCopyWithImpl(
    _$ConfirmingImpl _value,
    $Res Function(_$ConfirmingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BookingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pickupAddress = null,
    Object? destinationAddress = null,
    Object? ambulanceType = null,
  }) {
    return _then(
      _$ConfirmingImpl(
        pickupAddress: null == pickupAddress
            ? _value.pickupAddress
            : pickupAddress // ignore: cast_nullable_to_non_nullable
                  as String,
        destinationAddress: null == destinationAddress
            ? _value.destinationAddress
            : destinationAddress // ignore: cast_nullable_to_non_nullable
                  as String,
        ambulanceType: null == ambulanceType
            ? _value.ambulanceType
            : ambulanceType // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$ConfirmingImpl implements _Confirming {
  const _$ConfirmingImpl({
    required this.pickupAddress,
    required this.destinationAddress,
    required this.ambulanceType,
  });

  @override
  final String pickupAddress;
  @override
  final String destinationAddress;
  @override
  final String ambulanceType;

  @override
  String toString() {
    return 'BookingState.confirming(pickupAddress: $pickupAddress, destinationAddress: $destinationAddress, ambulanceType: $ambulanceType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConfirmingImpl &&
            (identical(other.pickupAddress, pickupAddress) ||
                other.pickupAddress == pickupAddress) &&
            (identical(other.destinationAddress, destinationAddress) ||
                other.destinationAddress == destinationAddress) &&
            (identical(other.ambulanceType, ambulanceType) ||
                other.ambulanceType == ambulanceType));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    pickupAddress,
    destinationAddress,
    ambulanceType,
  );

  /// Create a copy of BookingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConfirmingImplCopyWith<_$ConfirmingImpl> get copyWith =>
      __$$ConfirmingImplCopyWithImpl<_$ConfirmingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(String address) pickupSelected,
    required TResult Function(String pickupAddress, String destinationAddress)
    destinationSelected,
    required TResult Function(
      String pickupAddress,
      String destinationAddress,
      String ambulanceType,
    )
    confirming,
    required TResult Function(
      String bookingId,
      String driverId,
      String pickupAddress,
      String destinationAddress,
      String ambulanceType,
    )
    confirmed,
    required TResult Function(
      String bookingId,
      String driverId,
      String pickupAddress,
      String destinationAddress,
      String ambulanceType,
      double driverLatitude,
      double driverLongitude,
    )
    tracking,
    required TResult Function() completed,
    required TResult Function(String message) error,
  }) {
    return confirming(pickupAddress, destinationAddress, ambulanceType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(String address)? pickupSelected,
    TResult? Function(String pickupAddress, String destinationAddress)?
    destinationSelected,
    TResult? Function(
      String pickupAddress,
      String destinationAddress,
      String ambulanceType,
    )?
    confirming,
    TResult? Function(
      String bookingId,
      String driverId,
      String pickupAddress,
      String destinationAddress,
      String ambulanceType,
    )?
    confirmed,
    TResult? Function(
      String bookingId,
      String driverId,
      String pickupAddress,
      String destinationAddress,
      String ambulanceType,
      double driverLatitude,
      double driverLongitude,
    )?
    tracking,
    TResult? Function()? completed,
    TResult? Function(String message)? error,
  }) {
    return confirming?.call(pickupAddress, destinationAddress, ambulanceType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(String address)? pickupSelected,
    TResult Function(String pickupAddress, String destinationAddress)?
    destinationSelected,
    TResult Function(
      String pickupAddress,
      String destinationAddress,
      String ambulanceType,
    )?
    confirming,
    TResult Function(
      String bookingId,
      String driverId,
      String pickupAddress,
      String destinationAddress,
      String ambulanceType,
    )?
    confirmed,
    TResult Function(
      String bookingId,
      String driverId,
      String pickupAddress,
      String destinationAddress,
      String ambulanceType,
      double driverLatitude,
      double driverLongitude,
    )?
    tracking,
    TResult Function()? completed,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (confirming != null) {
      return confirming(pickupAddress, destinationAddress, ambulanceType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Idle value) idle,
    required TResult Function(_PickupSelected value) pickupSelected,
    required TResult Function(_DestinationSelected value) destinationSelected,
    required TResult Function(_Confirming value) confirming,
    required TResult Function(_Confirmed value) confirmed,
    required TResult Function(_Tracking value) tracking,
    required TResult Function(_Completed value) completed,
    required TResult Function(_Error value) error,
  }) {
    return confirming(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Idle value)? idle,
    TResult? Function(_PickupSelected value)? pickupSelected,
    TResult? Function(_DestinationSelected value)? destinationSelected,
    TResult? Function(_Confirming value)? confirming,
    TResult? Function(_Confirmed value)? confirmed,
    TResult? Function(_Tracking value)? tracking,
    TResult? Function(_Completed value)? completed,
    TResult? Function(_Error value)? error,
  }) {
    return confirming?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_PickupSelected value)? pickupSelected,
    TResult Function(_DestinationSelected value)? destinationSelected,
    TResult Function(_Confirming value)? confirming,
    TResult Function(_Confirmed value)? confirmed,
    TResult Function(_Tracking value)? tracking,
    TResult Function(_Completed value)? completed,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (confirming != null) {
      return confirming(this);
    }
    return orElse();
  }
}

abstract class _Confirming implements BookingState {
  const factory _Confirming({
    required final String pickupAddress,
    required final String destinationAddress,
    required final String ambulanceType,
  }) = _$ConfirmingImpl;

  String get pickupAddress;
  String get destinationAddress;
  String get ambulanceType;

  /// Create a copy of BookingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConfirmingImplCopyWith<_$ConfirmingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ConfirmedImplCopyWith<$Res> {
  factory _$$ConfirmedImplCopyWith(
    _$ConfirmedImpl value,
    $Res Function(_$ConfirmedImpl) then,
  ) = __$$ConfirmedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({
    String bookingId,
    String driverId,
    String pickupAddress,
    String destinationAddress,
    String ambulanceType,
  });
}

/// @nodoc
class __$$ConfirmedImplCopyWithImpl<$Res>
    extends _$BookingStateCopyWithImpl<$Res, _$ConfirmedImpl>
    implements _$$ConfirmedImplCopyWith<$Res> {
  __$$ConfirmedImplCopyWithImpl(
    _$ConfirmedImpl _value,
    $Res Function(_$ConfirmedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BookingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookingId = null,
    Object? driverId = null,
    Object? pickupAddress = null,
    Object? destinationAddress = null,
    Object? ambulanceType = null,
  }) {
    return _then(
      _$ConfirmedImpl(
        bookingId: null == bookingId
            ? _value.bookingId
            : bookingId // ignore: cast_nullable_to_non_nullable
                  as String,
        driverId: null == driverId
            ? _value.driverId
            : driverId // ignore: cast_nullable_to_non_nullable
                  as String,
        pickupAddress: null == pickupAddress
            ? _value.pickupAddress
            : pickupAddress // ignore: cast_nullable_to_non_nullable
                  as String,
        destinationAddress: null == destinationAddress
            ? _value.destinationAddress
            : destinationAddress // ignore: cast_nullable_to_non_nullable
                  as String,
        ambulanceType: null == ambulanceType
            ? _value.ambulanceType
            : ambulanceType // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$ConfirmedImpl implements _Confirmed {
  const _$ConfirmedImpl({
    required this.bookingId,
    required this.driverId,
    required this.pickupAddress,
    required this.destinationAddress,
    required this.ambulanceType,
  });

  @override
  final String bookingId;
  @override
  final String driverId;
  @override
  final String pickupAddress;
  @override
  final String destinationAddress;
  @override
  final String ambulanceType;

  @override
  String toString() {
    return 'BookingState.confirmed(bookingId: $bookingId, driverId: $driverId, pickupAddress: $pickupAddress, destinationAddress: $destinationAddress, ambulanceType: $ambulanceType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConfirmedImpl &&
            (identical(other.bookingId, bookingId) ||
                other.bookingId == bookingId) &&
            (identical(other.driverId, driverId) ||
                other.driverId == driverId) &&
            (identical(other.pickupAddress, pickupAddress) ||
                other.pickupAddress == pickupAddress) &&
            (identical(other.destinationAddress, destinationAddress) ||
                other.destinationAddress == destinationAddress) &&
            (identical(other.ambulanceType, ambulanceType) ||
                other.ambulanceType == ambulanceType));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    bookingId,
    driverId,
    pickupAddress,
    destinationAddress,
    ambulanceType,
  );

  /// Create a copy of BookingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConfirmedImplCopyWith<_$ConfirmedImpl> get copyWith =>
      __$$ConfirmedImplCopyWithImpl<_$ConfirmedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(String address) pickupSelected,
    required TResult Function(String pickupAddress, String destinationAddress)
    destinationSelected,
    required TResult Function(
      String pickupAddress,
      String destinationAddress,
      String ambulanceType,
    )
    confirming,
    required TResult Function(
      String bookingId,
      String driverId,
      String pickupAddress,
      String destinationAddress,
      String ambulanceType,
    )
    confirmed,
    required TResult Function(
      String bookingId,
      String driverId,
      String pickupAddress,
      String destinationAddress,
      String ambulanceType,
      double driverLatitude,
      double driverLongitude,
    )
    tracking,
    required TResult Function() completed,
    required TResult Function(String message) error,
  }) {
    return confirmed(
      bookingId,
      driverId,
      pickupAddress,
      destinationAddress,
      ambulanceType,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(String address)? pickupSelected,
    TResult? Function(String pickupAddress, String destinationAddress)?
    destinationSelected,
    TResult? Function(
      String pickupAddress,
      String destinationAddress,
      String ambulanceType,
    )?
    confirming,
    TResult? Function(
      String bookingId,
      String driverId,
      String pickupAddress,
      String destinationAddress,
      String ambulanceType,
    )?
    confirmed,
    TResult? Function(
      String bookingId,
      String driverId,
      String pickupAddress,
      String destinationAddress,
      String ambulanceType,
      double driverLatitude,
      double driverLongitude,
    )?
    tracking,
    TResult? Function()? completed,
    TResult? Function(String message)? error,
  }) {
    return confirmed?.call(
      bookingId,
      driverId,
      pickupAddress,
      destinationAddress,
      ambulanceType,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(String address)? pickupSelected,
    TResult Function(String pickupAddress, String destinationAddress)?
    destinationSelected,
    TResult Function(
      String pickupAddress,
      String destinationAddress,
      String ambulanceType,
    )?
    confirming,
    TResult Function(
      String bookingId,
      String driverId,
      String pickupAddress,
      String destinationAddress,
      String ambulanceType,
    )?
    confirmed,
    TResult Function(
      String bookingId,
      String driverId,
      String pickupAddress,
      String destinationAddress,
      String ambulanceType,
      double driverLatitude,
      double driverLongitude,
    )?
    tracking,
    TResult Function()? completed,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (confirmed != null) {
      return confirmed(
        bookingId,
        driverId,
        pickupAddress,
        destinationAddress,
        ambulanceType,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Idle value) idle,
    required TResult Function(_PickupSelected value) pickupSelected,
    required TResult Function(_DestinationSelected value) destinationSelected,
    required TResult Function(_Confirming value) confirming,
    required TResult Function(_Confirmed value) confirmed,
    required TResult Function(_Tracking value) tracking,
    required TResult Function(_Completed value) completed,
    required TResult Function(_Error value) error,
  }) {
    return confirmed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Idle value)? idle,
    TResult? Function(_PickupSelected value)? pickupSelected,
    TResult? Function(_DestinationSelected value)? destinationSelected,
    TResult? Function(_Confirming value)? confirming,
    TResult? Function(_Confirmed value)? confirmed,
    TResult? Function(_Tracking value)? tracking,
    TResult? Function(_Completed value)? completed,
    TResult? Function(_Error value)? error,
  }) {
    return confirmed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_PickupSelected value)? pickupSelected,
    TResult Function(_DestinationSelected value)? destinationSelected,
    TResult Function(_Confirming value)? confirming,
    TResult Function(_Confirmed value)? confirmed,
    TResult Function(_Tracking value)? tracking,
    TResult Function(_Completed value)? completed,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (confirmed != null) {
      return confirmed(this);
    }
    return orElse();
  }
}

abstract class _Confirmed implements BookingState {
  const factory _Confirmed({
    required final String bookingId,
    required final String driverId,
    required final String pickupAddress,
    required final String destinationAddress,
    required final String ambulanceType,
  }) = _$ConfirmedImpl;

  String get bookingId;
  String get driverId;
  String get pickupAddress;
  String get destinationAddress;
  String get ambulanceType;

  /// Create a copy of BookingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConfirmedImplCopyWith<_$ConfirmedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TrackingImplCopyWith<$Res> {
  factory _$$TrackingImplCopyWith(
    _$TrackingImpl value,
    $Res Function(_$TrackingImpl) then,
  ) = __$$TrackingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({
    String bookingId,
    String driverId,
    String pickupAddress,
    String destinationAddress,
    String ambulanceType,
    double driverLatitude,
    double driverLongitude,
  });
}

/// @nodoc
class __$$TrackingImplCopyWithImpl<$Res>
    extends _$BookingStateCopyWithImpl<$Res, _$TrackingImpl>
    implements _$$TrackingImplCopyWith<$Res> {
  __$$TrackingImplCopyWithImpl(
    _$TrackingImpl _value,
    $Res Function(_$TrackingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BookingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookingId = null,
    Object? driverId = null,
    Object? pickupAddress = null,
    Object? destinationAddress = null,
    Object? ambulanceType = null,
    Object? driverLatitude = null,
    Object? driverLongitude = null,
  }) {
    return _then(
      _$TrackingImpl(
        bookingId: null == bookingId
            ? _value.bookingId
            : bookingId // ignore: cast_nullable_to_non_nullable
                  as String,
        driverId: null == driverId
            ? _value.driverId
            : driverId // ignore: cast_nullable_to_non_nullable
                  as String,
        pickupAddress: null == pickupAddress
            ? _value.pickupAddress
            : pickupAddress // ignore: cast_nullable_to_non_nullable
                  as String,
        destinationAddress: null == destinationAddress
            ? _value.destinationAddress
            : destinationAddress // ignore: cast_nullable_to_non_nullable
                  as String,
        ambulanceType: null == ambulanceType
            ? _value.ambulanceType
            : ambulanceType // ignore: cast_nullable_to_non_nullable
                  as String,
        driverLatitude: null == driverLatitude
            ? _value.driverLatitude
            : driverLatitude // ignore: cast_nullable_to_non_nullable
                  as double,
        driverLongitude: null == driverLongitude
            ? _value.driverLongitude
            : driverLongitude // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc

class _$TrackingImpl implements _Tracking {
  const _$TrackingImpl({
    required this.bookingId,
    required this.driverId,
    required this.pickupAddress,
    required this.destinationAddress,
    required this.ambulanceType,
    required this.driverLatitude,
    required this.driverLongitude,
  });

  @override
  final String bookingId;
  @override
  final String driverId;
  @override
  final String pickupAddress;
  @override
  final String destinationAddress;
  @override
  final String ambulanceType;
  @override
  final double driverLatitude;
  @override
  final double driverLongitude;

  @override
  String toString() {
    return 'BookingState.tracking(bookingId: $bookingId, driverId: $driverId, pickupAddress: $pickupAddress, destinationAddress: $destinationAddress, ambulanceType: $ambulanceType, driverLatitude: $driverLatitude, driverLongitude: $driverLongitude)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TrackingImpl &&
            (identical(other.bookingId, bookingId) ||
                other.bookingId == bookingId) &&
            (identical(other.driverId, driverId) ||
                other.driverId == driverId) &&
            (identical(other.pickupAddress, pickupAddress) ||
                other.pickupAddress == pickupAddress) &&
            (identical(other.destinationAddress, destinationAddress) ||
                other.destinationAddress == destinationAddress) &&
            (identical(other.ambulanceType, ambulanceType) ||
                other.ambulanceType == ambulanceType) &&
            (identical(other.driverLatitude, driverLatitude) ||
                other.driverLatitude == driverLatitude) &&
            (identical(other.driverLongitude, driverLongitude) ||
                other.driverLongitude == driverLongitude));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    bookingId,
    driverId,
    pickupAddress,
    destinationAddress,
    ambulanceType,
    driverLatitude,
    driverLongitude,
  );

  /// Create a copy of BookingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TrackingImplCopyWith<_$TrackingImpl> get copyWith =>
      __$$TrackingImplCopyWithImpl<_$TrackingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(String address) pickupSelected,
    required TResult Function(String pickupAddress, String destinationAddress)
    destinationSelected,
    required TResult Function(
      String pickupAddress,
      String destinationAddress,
      String ambulanceType,
    )
    confirming,
    required TResult Function(
      String bookingId,
      String driverId,
      String pickupAddress,
      String destinationAddress,
      String ambulanceType,
    )
    confirmed,
    required TResult Function(
      String bookingId,
      String driverId,
      String pickupAddress,
      String destinationAddress,
      String ambulanceType,
      double driverLatitude,
      double driverLongitude,
    )
    tracking,
    required TResult Function() completed,
    required TResult Function(String message) error,
  }) {
    return tracking(
      bookingId,
      driverId,
      pickupAddress,
      destinationAddress,
      ambulanceType,
      driverLatitude,
      driverLongitude,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(String address)? pickupSelected,
    TResult? Function(String pickupAddress, String destinationAddress)?
    destinationSelected,
    TResult? Function(
      String pickupAddress,
      String destinationAddress,
      String ambulanceType,
    )?
    confirming,
    TResult? Function(
      String bookingId,
      String driverId,
      String pickupAddress,
      String destinationAddress,
      String ambulanceType,
    )?
    confirmed,
    TResult? Function(
      String bookingId,
      String driverId,
      String pickupAddress,
      String destinationAddress,
      String ambulanceType,
      double driverLatitude,
      double driverLongitude,
    )?
    tracking,
    TResult? Function()? completed,
    TResult? Function(String message)? error,
  }) {
    return tracking?.call(
      bookingId,
      driverId,
      pickupAddress,
      destinationAddress,
      ambulanceType,
      driverLatitude,
      driverLongitude,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(String address)? pickupSelected,
    TResult Function(String pickupAddress, String destinationAddress)?
    destinationSelected,
    TResult Function(
      String pickupAddress,
      String destinationAddress,
      String ambulanceType,
    )?
    confirming,
    TResult Function(
      String bookingId,
      String driverId,
      String pickupAddress,
      String destinationAddress,
      String ambulanceType,
    )?
    confirmed,
    TResult Function(
      String bookingId,
      String driverId,
      String pickupAddress,
      String destinationAddress,
      String ambulanceType,
      double driverLatitude,
      double driverLongitude,
    )?
    tracking,
    TResult Function()? completed,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (tracking != null) {
      return tracking(
        bookingId,
        driverId,
        pickupAddress,
        destinationAddress,
        ambulanceType,
        driverLatitude,
        driverLongitude,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Idle value) idle,
    required TResult Function(_PickupSelected value) pickupSelected,
    required TResult Function(_DestinationSelected value) destinationSelected,
    required TResult Function(_Confirming value) confirming,
    required TResult Function(_Confirmed value) confirmed,
    required TResult Function(_Tracking value) tracking,
    required TResult Function(_Completed value) completed,
    required TResult Function(_Error value) error,
  }) {
    return tracking(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Idle value)? idle,
    TResult? Function(_PickupSelected value)? pickupSelected,
    TResult? Function(_DestinationSelected value)? destinationSelected,
    TResult? Function(_Confirming value)? confirming,
    TResult? Function(_Confirmed value)? confirmed,
    TResult? Function(_Tracking value)? tracking,
    TResult? Function(_Completed value)? completed,
    TResult? Function(_Error value)? error,
  }) {
    return tracking?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_PickupSelected value)? pickupSelected,
    TResult Function(_DestinationSelected value)? destinationSelected,
    TResult Function(_Confirming value)? confirming,
    TResult Function(_Confirmed value)? confirmed,
    TResult Function(_Tracking value)? tracking,
    TResult Function(_Completed value)? completed,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (tracking != null) {
      return tracking(this);
    }
    return orElse();
  }
}

abstract class _Tracking implements BookingState {
  const factory _Tracking({
    required final String bookingId,
    required final String driverId,
    required final String pickupAddress,
    required final String destinationAddress,
    required final String ambulanceType,
    required final double driverLatitude,
    required final double driverLongitude,
  }) = _$TrackingImpl;

  String get bookingId;
  String get driverId;
  String get pickupAddress;
  String get destinationAddress;
  String get ambulanceType;
  double get driverLatitude;
  double get driverLongitude;

  /// Create a copy of BookingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TrackingImplCopyWith<_$TrackingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CompletedImplCopyWith<$Res> {
  factory _$$CompletedImplCopyWith(
    _$CompletedImpl value,
    $Res Function(_$CompletedImpl) then,
  ) = __$$CompletedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CompletedImplCopyWithImpl<$Res>
    extends _$BookingStateCopyWithImpl<$Res, _$CompletedImpl>
    implements _$$CompletedImplCopyWith<$Res> {
  __$$CompletedImplCopyWithImpl(
    _$CompletedImpl _value,
    $Res Function(_$CompletedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BookingState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$CompletedImpl implements _Completed {
  const _$CompletedImpl();

  @override
  String toString() {
    return 'BookingState.completed()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CompletedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(String address) pickupSelected,
    required TResult Function(String pickupAddress, String destinationAddress)
    destinationSelected,
    required TResult Function(
      String pickupAddress,
      String destinationAddress,
      String ambulanceType,
    )
    confirming,
    required TResult Function(
      String bookingId,
      String driverId,
      String pickupAddress,
      String destinationAddress,
      String ambulanceType,
    )
    confirmed,
    required TResult Function(
      String bookingId,
      String driverId,
      String pickupAddress,
      String destinationAddress,
      String ambulanceType,
      double driverLatitude,
      double driverLongitude,
    )
    tracking,
    required TResult Function() completed,
    required TResult Function(String message) error,
  }) {
    return completed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(String address)? pickupSelected,
    TResult? Function(String pickupAddress, String destinationAddress)?
    destinationSelected,
    TResult? Function(
      String pickupAddress,
      String destinationAddress,
      String ambulanceType,
    )?
    confirming,
    TResult? Function(
      String bookingId,
      String driverId,
      String pickupAddress,
      String destinationAddress,
      String ambulanceType,
    )?
    confirmed,
    TResult? Function(
      String bookingId,
      String driverId,
      String pickupAddress,
      String destinationAddress,
      String ambulanceType,
      double driverLatitude,
      double driverLongitude,
    )?
    tracking,
    TResult? Function()? completed,
    TResult? Function(String message)? error,
  }) {
    return completed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(String address)? pickupSelected,
    TResult Function(String pickupAddress, String destinationAddress)?
    destinationSelected,
    TResult Function(
      String pickupAddress,
      String destinationAddress,
      String ambulanceType,
    )?
    confirming,
    TResult Function(
      String bookingId,
      String driverId,
      String pickupAddress,
      String destinationAddress,
      String ambulanceType,
    )?
    confirmed,
    TResult Function(
      String bookingId,
      String driverId,
      String pickupAddress,
      String destinationAddress,
      String ambulanceType,
      double driverLatitude,
      double driverLongitude,
    )?
    tracking,
    TResult Function()? completed,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (completed != null) {
      return completed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Idle value) idle,
    required TResult Function(_PickupSelected value) pickupSelected,
    required TResult Function(_DestinationSelected value) destinationSelected,
    required TResult Function(_Confirming value) confirming,
    required TResult Function(_Confirmed value) confirmed,
    required TResult Function(_Tracking value) tracking,
    required TResult Function(_Completed value) completed,
    required TResult Function(_Error value) error,
  }) {
    return completed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Idle value)? idle,
    TResult? Function(_PickupSelected value)? pickupSelected,
    TResult? Function(_DestinationSelected value)? destinationSelected,
    TResult? Function(_Confirming value)? confirming,
    TResult? Function(_Confirmed value)? confirmed,
    TResult? Function(_Tracking value)? tracking,
    TResult? Function(_Completed value)? completed,
    TResult? Function(_Error value)? error,
  }) {
    return completed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_PickupSelected value)? pickupSelected,
    TResult Function(_DestinationSelected value)? destinationSelected,
    TResult Function(_Confirming value)? confirming,
    TResult Function(_Confirmed value)? confirmed,
    TResult Function(_Tracking value)? tracking,
    TResult Function(_Completed value)? completed,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (completed != null) {
      return completed(this);
    }
    return orElse();
  }
}

abstract class _Completed implements BookingState {
  const factory _Completed() = _$CompletedImpl;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
    _$ErrorImpl value,
    $Res Function(_$ErrorImpl) then,
  ) = __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$BookingStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
    _$ErrorImpl _value,
    $Res Function(_$ErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BookingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$ErrorImpl(
        null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'BookingState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of BookingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(String address) pickupSelected,
    required TResult Function(String pickupAddress, String destinationAddress)
    destinationSelected,
    required TResult Function(
      String pickupAddress,
      String destinationAddress,
      String ambulanceType,
    )
    confirming,
    required TResult Function(
      String bookingId,
      String driverId,
      String pickupAddress,
      String destinationAddress,
      String ambulanceType,
    )
    confirmed,
    required TResult Function(
      String bookingId,
      String driverId,
      String pickupAddress,
      String destinationAddress,
      String ambulanceType,
      double driverLatitude,
      double driverLongitude,
    )
    tracking,
    required TResult Function() completed,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(String address)? pickupSelected,
    TResult? Function(String pickupAddress, String destinationAddress)?
    destinationSelected,
    TResult? Function(
      String pickupAddress,
      String destinationAddress,
      String ambulanceType,
    )?
    confirming,
    TResult? Function(
      String bookingId,
      String driverId,
      String pickupAddress,
      String destinationAddress,
      String ambulanceType,
    )?
    confirmed,
    TResult? Function(
      String bookingId,
      String driverId,
      String pickupAddress,
      String destinationAddress,
      String ambulanceType,
      double driverLatitude,
      double driverLongitude,
    )?
    tracking,
    TResult? Function()? completed,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(String address)? pickupSelected,
    TResult Function(String pickupAddress, String destinationAddress)?
    destinationSelected,
    TResult Function(
      String pickupAddress,
      String destinationAddress,
      String ambulanceType,
    )?
    confirming,
    TResult Function(
      String bookingId,
      String driverId,
      String pickupAddress,
      String destinationAddress,
      String ambulanceType,
    )?
    confirmed,
    TResult Function(
      String bookingId,
      String driverId,
      String pickupAddress,
      String destinationAddress,
      String ambulanceType,
      double driverLatitude,
      double driverLongitude,
    )?
    tracking,
    TResult Function()? completed,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Idle value) idle,
    required TResult Function(_PickupSelected value) pickupSelected,
    required TResult Function(_DestinationSelected value) destinationSelected,
    required TResult Function(_Confirming value) confirming,
    required TResult Function(_Confirmed value) confirmed,
    required TResult Function(_Tracking value) tracking,
    required TResult Function(_Completed value) completed,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Idle value)? idle,
    TResult? Function(_PickupSelected value)? pickupSelected,
    TResult? Function(_DestinationSelected value)? destinationSelected,
    TResult? Function(_Confirming value)? confirming,
    TResult? Function(_Confirmed value)? confirmed,
    TResult? Function(_Tracking value)? tracking,
    TResult? Function(_Completed value)? completed,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_PickupSelected value)? pickupSelected,
    TResult Function(_DestinationSelected value)? destinationSelected,
    TResult Function(_Confirming value)? confirming,
    TResult Function(_Confirmed value)? confirmed,
    TResult Function(_Tracking value)? tracking,
    TResult Function(_Completed value)? completed,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements BookingState {
  const factory _Error(final String message) = _$ErrorImpl;

  String get message;

  /// Create a copy of BookingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
