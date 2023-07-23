class UserModel {
  int id;
  String name;
  String username;
  String emial;
  UserAddress address;

  UserModel({
    required this.id,
    required this.name,
    required this.username,
    required this.emial,
    required this.address,
  });

  factory UserModel.fromJson({dynamic jsonData}) {
    return UserModel(
      id: jsonData['id'],
      name: jsonData['name'],
      username: jsonData['username'],
      emial: jsonData['email'],
      address: UserAddress.fromJson(
        jsonData: jsonData['address'],
      ),
    );
  }

  @override
  String toString() {
    return 'id => $id , name => $name , username => $username , email => $emial , address => $address';
  }
}

class UserAddress {
  String street;
  String suite;
  String city;
  String zipcode;
  Geo geo;

  UserAddress({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo,
  });

  factory UserAddress.fromJson({dynamic jsonData}) {
    return UserAddress(
      street: jsonData['street'],
      suite: jsonData['suite'],
      city: jsonData['city'],
      zipcode: jsonData['zipcode'],
      geo: Geo.fromJson(
        jsonData: jsonData['geo'],
      ),
    );
  }
  @override
  String toString() {
    // TODO: implement toString
    return 'street => $street , suite => $suite , city => $city , zipcode => $zipcode , go => $geo';
  }
}

class Geo {
  String lat;
  String lng;

  Geo({required this.lat, required this.lng});

  factory Geo.fromJson({required dynamic jsonData}) {
    return Geo(
      lat: jsonData['lat'],
      lng: jsonData['lng'],
    );
  }
  @override
  String toString() {
    return 'lat => $lat , lng => $lng';
  }
}
