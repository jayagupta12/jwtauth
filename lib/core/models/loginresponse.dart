import 'dart:convert';

LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
    LoginResponse({
        this.responsetoken,
        this.user,
    });

    String responsetoken;
    User user;

    factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        responsetoken: json["responsetoken"],
        user: User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "responsetoken": responsetoken,
        "user": user.toJson(),
    };
}

class User {
    User({
        this.id,
        this.name,
        this.email,
        this.pass,
    });

    String id;
    String name;
    String email;
    String pass;

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        pass: json["pass"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "email": email,
        "pass": pass,
    };
}
