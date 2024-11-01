
class PatientModel {
  final int id;
  final List patientdetails_set;
  final Map branch;
  final String user;
  final String payment;
  final String name;
  final String phone;
  final String address;
  final int price;
  final int total_amount;
  final int discount_amount;
  final int advance_amount;
  final int balance_amount;
  final String date_nd_time;
  final bool is_active;
  final String created_at;
  final String updated_at;
  PatientModel({
    required this.id,
    required this.patientdetails_set,
    required this.branch,
    required this.user,
    required this.payment,
    required this.name,
    required this.phone,
    required this.address,
    required this.price,
    required this.total_amount,
    required this.discount_amount,
    required this.advance_amount,
    required this.balance_amount,
    required this.date_nd_time,
    required this.is_active,
    required this.created_at,
    required this.updated_at,
  });

  PatientModel copyWith({
    int? id,
    List? patientdetails_set,
    Map? branch,
    String? user,
    String? payment,
    String? name,
    String? phone,
    String? address,
    int? price,
    int? total_amount,
    int? discount_amount,
    int? advance_amount,
    int? balance_amount,
    String? date_nd_time,
    bool? is_active,
    String? created_at,
    String? updated_at,
  }) {
    return PatientModel(
      id: id ?? this.id,
      patientdetails_set: patientdetails_set ?? this.patientdetails_set,
      branch: branch ?? this.branch,
      user: user ?? this.user,
      payment: payment ?? this.payment,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      address: address ?? this.address,
      price: price ?? this.price,
      total_amount: total_amount ?? this.total_amount,
      discount_amount: discount_amount ?? this.discount_amount,
      advance_amount: advance_amount ?? this.advance_amount,
      balance_amount: balance_amount ?? this.balance_amount,
      date_nd_time: date_nd_time ?? this.date_nd_time,
      is_active: is_active ?? this.is_active,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'patientdetails_set': patientdetails_set,
      'branch': branch,
      'user': user,
      'payment': payment,
      'name': name,
      'phone': phone,
      'address': address,
      'price': price,
      'total_amount': total_amount,
      'discount_amount': discount_amount,
      'advance_amount': advance_amount,
      'balance_amount': balance_amount,
      'date_nd_time': date_nd_time,
      'is_active': is_active,
      'created_at': created_at,
      'updated_at': updated_at,
    };
  }

  factory PatientModel.fromMap(Map map) {
    return PatientModel(
      id: map['id'] ?? 0,
      patientdetails_set: map['patientdetails_set'] ?? [],
      branch: map['branch'] ?? {},
      user: map['user'] ?? '',
      payment: map['payment'] ?? '',
      name: map['name'] ?? '',
      phone: map['phone'] ?? '',
      address: map['address'] ?? '',
      price: map['price'] ?? 0,
      total_amount: map['total_amount'] ?? 0,
      discount_amount: map['discount_amount'] ?? 0,
      advance_amount: map['advance_amount'] ?? 0,
      balance_amount: map['balance_amount'] ?? 0,
      date_nd_time: map['date_nd_time'] ?? '',
      is_active: map['is_active'] ?? false,
      created_at: map['created_at'] ?? '',
      updated_at: map['updated_at'] ?? '',
    );
  }
}
