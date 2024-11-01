class UserModel {
  final int id;
  final String name;
  final String token;
  final String phone;
  final String address;
  final String mail;
  final String username;
  final String password;
  final int admin;
  final bool is_admin;
  final bool is_active;
  final String created_at;
  final String updated_at;
  final String password_text;
  final String branch;
  UserModel({
    required this.token,
    required this.id,
    required this.name,
    required this.phone,
    required this.address,
    required this.mail,
    required this.username,
    required this.password,
    required this.admin,
    required this.is_admin,
    required this.is_active,
    required this.created_at,
    required this.updated_at,
    required this.password_text,
    required this.branch,
  });

  UserModel copyWith({
    int? id,
    String? name,
    String? token,
    String? phone,
    String? address,
    String? mail,
    String? username,
    String? password,
    int? admin,
    bool? is_admin,
    bool? is_active,
    String? created_at,
    String? updated_at,
    String? password_text,
    String? branch,
  }) {
    return UserModel(
      token: token ?? this.token,
      id: id ?? this.id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      address: address ?? this.address,
      mail: mail ?? this.mail,
      username: username ?? this.username,
      password: password ?? this.password,
      admin: admin ?? this.admin,
      is_admin: is_admin ?? this.is_admin,
      is_active: is_active ?? this.is_active,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
      password_text: password_text ?? this.password_text,
      branch: branch ?? this.branch,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'token': token,
      'name': name,
      'phone': phone,
      'address': address,
      'mail': mail,
      'username': username,
      'password': password,
      'admin': admin,
      'is_admin': is_admin,
      'is_active': is_active,
      'created_at': created_at,
      'updated_at': updated_at,
      'password_text': password_text,
      'branch': branch,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      token: map['token'] ?? '',
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
      phone: map['phone'] ?? '',
      address: map['address'] ?? '',
      mail: map['mail'] ?? '',
      username: map['username'] ?? '',
      password: map['password'] ?? '',
      admin: map['admin'] ?? 0,
      is_admin: map['is_admin'] ?? false,
      is_active: map['is_active'] ?? false,
      created_at: map['created_at'] ?? '',
      updated_at: map['updated_at'] ?? '',
      password_text: map['password_text'] ?? '',
      branch: map['branch'] ?? '',
    );
  }
}
