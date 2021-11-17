// To parse this JSON data, do
//
//     final modal = modalFromMap(jsonString);

import 'dart:convert';

Modal modalFromMap(String str) => Modal.fromMap(json.decode(str));

String modalToMap(Modal data) => json.encode(data.toMap());

class Modal {
  Modal({
    this.success,
    this.pagination,
    this.data,
  });

  bool? success;
  Pagination? pagination;
  Data? data;

  factory Modal.fromMap(Map<String, dynamic> json) => Modal(
        success: json["success"],
        pagination: Pagination.fromMap(json["pagination"]),
        data: Data.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "pagination": pagination!.toMap(),
        "data": data!.toMap(),
      };
}

class Data {
  Data({
    this.branch,
    this.quick,
    this.restaurant,
  });

  Branch? branch;
  List<dynamic>? quick;
  List<Restaurant>? restaurant;

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        branch: Branch.fromMap(json["branch"]),
        quick: List<dynamic>.from(json["quick"].map((x) => x)),
        restaurant: List<Restaurant>.from(
            json["restaurant"].map((x) => Restaurant.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "branch": branch!.toMap(),
        "quick": List<dynamic>.from(quick!.map((x) => x)),
        "restaurant": List<dynamic>.from(restaurant!.map((x) => x.toMap())),
      };
}

class Branch {
  Branch({
    this.id,
    this.location,
    this.status,
    this.name,
    this.supportNumber,
    this.category,
    this.offers,
    this.branchBanner,
    this.distance,
  });

  String? id;
  BranchLocation? location;
  bool? status;
  String? name;
  int? supportNumber;
  List<Category>? category;
  List<dynamic>? offers;
  List<BranchBanner>? branchBanner;
  double? distance;

  factory Branch.fromMap(Map<String, dynamic> json) => Branch(
        id: json["_id"],
        location: BranchLocation.fromMap(json["location"]),
        status: json["status"],
        name: json["name"],
        supportNumber: json["supportNumber"],
        category: List<Category>.from(
            json["category"].map((x) => Category.fromMap(x))),
        offers: List<dynamic>.from(json["offers"].map((x) => x)),
        branchBanner: List<BranchBanner>.from(
            json["branchBanner"].map((x) => BranchBanner.fromMap(x))),
        distance: json["distance"].toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "location": location!.toMap(),
        "status": status,
        "name": name,
        "supportNumber": supportNumber,
        "category": List<dynamic>.from(category!.map((x) => x.toMap())),
        "offers": List<dynamic>.from(offers!.map((x) => x)),
        "branchBanner": List<dynamic>.from(branchBanner!.map((x) => x.toMap())),
        "distance": distance,
      };
}

class BranchBanner {
  BranchBanner({
    this.clickable,
    this.id,
    this.image,
  });

  bool? clickable;
  String? id;
  String? image;

  factory BranchBanner.fromMap(Map<String, dynamic> json) => BranchBanner(
        clickable: json["clickable"],
        id: json["_id"],
        image: json["image"],
      );

  Map<String, dynamic> toMap() => {
        "clickable": clickable,
        "_id": id,
        "image": image,
      };
}

class Category {
  Category({
    this.id,
    this.image,
    this.name,
    this.v,
  });

  String? id;
  String? image;
  String? name;
  int? v;

  factory Category.fromMap(Map<String, dynamic> json) => Category(
        id: json["_id"],
        image: json["image"],
        name: json["name"],
        v: json["__v"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "image": image,
        "name": name,
        "__v": v,
      };
}

class BranchLocation {
  BranchLocation({
    this.type,
    this.coordinates,
    this.address,
  });

  String? type;
  List<double>? coordinates;
  String? address;

  factory BranchLocation.fromMap(Map<String, dynamic> json) => BranchLocation(
        type: json["type"],
        coordinates:
            List<double>.from(json["coordinates"].map((x) => x.toDouble())),
        address: json["address"],
      );

  Map<String, dynamic> toMap() => {
        "type": type,
        "coordinates": List<dynamic>.from(coordinates!.map((x) => x)),
        "address": address,
      };
}

class Restaurant {
  Restaurant({
    this.id,
    this.location,
    this.quickDelivery,
    this.storeStatus,
    this.name,
    this.branch,
    this.storeBg,
    this.openTime,
    this.closeTime,
    this.cuisine,
    this.sortOrder,
    this.avgPersonAmt,
    this.distance,
  });

  String? id;
  RestaurantLocation? location;
  bool? quickDelivery;
  bool? storeStatus;
  String? name;
  String? branch;
  String? storeBg;
  String? openTime;
  String? closeTime;
  String? cuisine;
  int? sortOrder;
  int? avgPersonAmt;
  double? distance;

  factory Restaurant.fromMap(Map<String, dynamic> json) => Restaurant(
        id: json["_id"],
        location: RestaurantLocation.fromMap(json["location"]),
        quickDelivery: json["quickDelivery"],
        storeStatus: json["storeStatus"],
        name: json["name"],
        branch: json["branch"],
        storeBg: json["storeBg"],
        openTime: json["openTime"],
        closeTime: json["closeTime"],
        cuisine: json["cuisine"],
        sortOrder: json["sortOrder"],
        avgPersonAmt: json["avgPersonAmt"],
        distance: json["distance"].toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "location": location!.toMap(),
        "quickDelivery": quickDelivery,
        "storeStatus": storeStatus,
        "name": name,
        "branch": branch,
        "storeBg": storeBg,
        "openTime": openTime,
        "closeTime": closeTime,
        "cuisine": cuisine,
        "sortOrder": sortOrder,
        "avgPersonAmt": avgPersonAmt,
        "distance": distance,
      };
}

class RestaurantLocation {
  RestaurantLocation({
    this.address,
  });

  String? address;

  factory RestaurantLocation.fromMap(Map<String, dynamic> json) =>
      RestaurantLocation(
        address: json["address"],
      );

  Map<String, dynamic> toMap() => {
        "address": address,
      };
}

class Pagination {
  Pagination();

  factory Pagination.fromMap(Map<String, dynamic> json) => Pagination();

  Map<String, dynamic> toMap() => {};
}
