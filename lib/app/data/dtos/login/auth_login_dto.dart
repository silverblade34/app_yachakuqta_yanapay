// To parse this JSON data, do
//
//     final authLoginDto = authLoginDtoFromJson(jsonString);

import 'dart:convert';

AuthLoginDto authLoginDtoFromJson(String str) => AuthLoginDto.fromJson(json.decode(str));

String authLoginDtoToJson(AuthLoginDto data) => json.encode(data.toJson());

class AuthLoginDto {
    String message;
    Data data;
    bool status;

    AuthLoginDto({
        required this.message,
        required this.data,
        required this.status,
    });

    factory AuthLoginDto.fromJson(Map<String, dynamic> json) => AuthLoginDto(
        message: json["message"],
        data: Data.fromJson(json["data"]),
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": data.toJson(),
        "status": status,
    };
}

class Data {
    String token;
    String username;
    String role;
    String name;

    Data({
        required this.token,
        required this.username,
        required this.role,
        required this.name,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json["token"],
        username: json["username"],
        role: json["role"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "token": token,
        "username": username,
        "role": role,
        "name": name,
    };
}
