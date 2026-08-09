class AddressEntity {
  final String? id;
  final String governorate;
  final String city;
  final String district;
  final String street;
  final String building;
  final int floor;
  final int apartmentNumber;
  final String label;
  final String? additionalNotes;
  final bool isDefault;

  AddressEntity({
    this.id,
    required this.governorate,
    required this.city,
    required this.district,
    required this.street,
    required this.building,
    required this.floor,
    required this.apartmentNumber,
    required this.label,
    required this.additionalNotes,
    required this.isDefault,
  });

  factory AddressEntity.placeHolder() => AddressEntity(
    governorate: '',
    city: '',
    district: '',
    street: '',
    building: '',
    floor: 1,
    apartmentNumber: 1,
    label: '',
    additionalNotes: '',
    isDefault: false,
  );
}

extension AddressCopy on AddressEntity {
  AddressEntity copyWith({
    String? id,
    String? governorate,
    String? city,
    String? district,
    String? street,
    String? building,
    int? floor,
    int? apartmentNumber,
    String? label,
    String? additionalNotes,
    bool? isDefault,
  }) {
    return AddressEntity(
      id: id ?? this.id,
      governorate: governorate ?? this.governorate,
      city: city ?? this.city,
      district: district ?? this.district,
      street: street ?? this.street,
      building: building ?? this.building,
      floor: floor ?? this.floor,
      apartmentNumber: apartmentNumber ?? this.apartmentNumber,
      label: label ?? this.label,
      additionalNotes: additionalNotes ?? this.additionalNotes,
      isDefault: isDefault ?? this.isDefault,
    );
  }
}
