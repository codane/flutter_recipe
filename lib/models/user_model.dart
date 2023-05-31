
class UserModel {
  final String uid;
  final String name;

  UserModel({
    required this.uid,
    required this.name,
  });

  UserModel copyWith({
    String? uid,
    String? name,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] ?? '',
      name: map['name'] ?? '',
    );
  }

  @override
  String toString() => 'User(uid: $uid, name: $name)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is UserModel &&
      other.uid == uid &&
      other.name == name;
  }

  @override
  int get hashCode => uid.hashCode ^ name.hashCode;
}
