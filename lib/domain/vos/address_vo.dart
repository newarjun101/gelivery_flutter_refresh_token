
import 'dart:convert';

AddressVo addressVoFromJson(String str) => AddressVo.fromJson(json.decode(str));

String addressVoToJson(AddressVo data) => json.encode(data.toJson());

class AddressVo {
  List<Item>? items;
  dynamic? totalRecords;
  dynamic? totalDue;
  dynamic? totalAmount;
  dynamic codSummaryItem;

  AddressVo({
    this.items,
    this.totalRecords,
    this.totalDue,
    this.totalAmount,
    this.codSummaryItem,
  });

  factory AddressVo.fromJson(Map<String, dynamic> json) => AddressVo(
    items: json["items"] == null ? [] : List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
    totalRecords: json["totalRecords"],
    totalDue: json["totalDue"],
    totalAmount: json["totalAmount"],
    codSummaryItem: json["codSummaryItem"],
  );

  Map<String, dynamic> toJson() => {
    "items": items == null ? [] : List<dynamic>.from(items!.map((x) => x.toJson())),
    "totalRecords": totalRecords,
    "totalDue": totalDue,
    "totalAmount": totalAmount,
    "codSummaryItem": codSummaryItem,
  };
  @override
  String toString() {
    // TODO: implement toString
    return "${toJson()}";
  }
}

class Item {
  String? contentGuid;
  String? trackingId;
  String? status;
  String? createdOn;
  String? updatedOn;
  dynamic? totalCharges;
  dynamic forShowCharges;
  dynamic cod;
  dynamic totalItems;
  String? zoneName;
  String? zoneGuid;
  String? osName;
  String? osAddress;
  DateTime? pickupDate;
  String? osGuid;
  dynamic osContactGuid;
  dynamic customerName;
  dynamic customerAddress;
  dynamic dropOffDate;
  dynamic customerGuid;
  dynamic customerContactGuid;
  String? pickupPersonName;
  String? pickupPersonGuid;
  dynamic pickupPersonAssignGuid;
  double? pickupPersonLatitude;
  double? pickupPersonLongitude;
  dynamic dropOffPersonName;
  dynamic dropOffPersonGuid;
  dynamic dropOffPersonAssignGuid;
  dynamic dropOffPersonLatitude;
  dynamic dropOffPersonLongitude;
  dynamic labourCost;
  dynamic transportCost;
  dynamic extraCost;
  dynamic? totalDeliveryCharges;
  dynamic? totalItemPrice;
  dynamic promotionAmount;
  dynamic? dueAmount;
  String? osPrimaryPhone;
  dynamic osOtherPhones;
  String? osComment;
  double? osLatitude;
  double? osLongitude;
  String? osPersonId;
  String? osTownshipName;
  dynamic osTownshipNameEn;
  String? osAddressType;
  dynamic customerPrimaryPhone;
  dynamic customerOtherPhones;
  dynamic customerComment;
  dynamic customerLatitude;
  dynamic customerLongitude;
  dynamic customerPersonId;
  dynamic customerTownshipName;
  dynamic customerTownshipNameEn;
  dynamic customerStateName;
  dynamic customerAddressType;
  String? pickupPersonPrimaryPhone;
  dynamic pickupPersonOtherPhones;
  String? pickupPersonAvatar;
  dynamic dropOffPersonPrimaryPhone;
  dynamic dropOffPersonOtherPhones;
  dynamic dropOffPersonAvatar;
  bool? refundInAdvanced;
  double? refundAmount;
  dynamic refundDate;
  String? name;
  dynamic townshipGuid;
  dynamic? totalWays;
  dynamic images;
  dynamic? itemCount;
  dynamic? addressCount;
  dynamic? completedCount;
  dynamic pickupCharges;
  bool? refunded;
  dynamic deliveryItem;
  dynamic totalCashToCollect;
  dynamic checked;
  dynamic highestMessage;
  dynamic roleName;
  dynamic refundOption;
  bool? carRequired;
  dynamic inboundStationGuid;
  dynamic inboundStationName;
  dynamic outboundStationGuid;
  dynamic outboundStationName;
  dynamic inboundBucketGuid;
  dynamic inboundBucketName;
  dynamic inboundBucketStatus;
  dynamic outboundBucketGuid;
  dynamic outboundBucketName;
  dynamic outboundBucketStatus;
  dynamic scheduleGuid;
  dynamic scheduleTime;
  dynamic codTransferred;
  dynamic codCollected;
  dynamic deliveryMethods;
  dynamic customerSignature;
  dynamic dropOffPersonSignature;
  dynamic pickupTrackingId;
  dynamic? updatedCount;
  dynamic finalCashCollected;
  dynamic nonCashCollected;
  dynamic receivedOption;
  dynamic receivedOptionName;
  dynamic nonCashTransferTo;
  dynamic reasonOfReduceAmount;
  dynamic? cashAdvanceAmount;
  bool? cashAdvanceRelease;
  String? cashAdvanceReleaseDate;
  dynamic? prepaidAmount;
  dynamic weight;
  dynamic width;
  String? remark;
  dynamic collected;
  dynamic collectedDate;
  dynamic codCollectedAmount;
  dynamic codTransferAmount;
  dynamic payableAmount;
  dynamic receivableAmount;
  dynamic completedDate;
  dynamic transferDate;
  dynamic payableDate;
  dynamic receivableDate;
  dynamic importRaw;
  dynamic extraPaidBy;
  dynamic wayName;
  dynamic message;
  dynamic updatedBy;
  bool? marketHub;
  String? routeInboundBucketStatus;
  String? routeStatus;
  dynamic failedReason;

  Item({
    this.contentGuid,
    this.trackingId,
    this.status,
    this.createdOn,
    this.updatedOn,
    this.totalCharges,
    this.forShowCharges,
    this.cod,
    this.totalItems,
    this.zoneName,
    this.zoneGuid,
    this.osName,
    this.osAddress,
    this.pickupDate,
    this.osGuid,
    this.osContactGuid,
    this.customerName,
    this.customerAddress,
    this.dropOffDate,
    this.customerGuid,
    this.customerContactGuid,
    this.pickupPersonName,
    this.pickupPersonGuid,
    this.pickupPersonAssignGuid,
    this.pickupPersonLatitude,
    this.pickupPersonLongitude,
    this.dropOffPersonName,
    this.dropOffPersonGuid,
    this.dropOffPersonAssignGuid,
    this.dropOffPersonLatitude,
    this.dropOffPersonLongitude,
    this.labourCost,
    this.transportCost,
    this.extraCost,
    this.totalDeliveryCharges,
    this.totalItemPrice,
    this.promotionAmount,
    this.dueAmount,
    this.osPrimaryPhone,
    this.osOtherPhones,
    this.osComment,
    this.osLatitude,
    this.osLongitude,
    this.osPersonId,
    this.osTownshipName,
    this.osTownshipNameEn,
    this.osAddressType,
    this.customerPrimaryPhone,
    this.customerOtherPhones,
    this.customerComment,
    this.customerLatitude,
    this.customerLongitude,
    this.customerPersonId,
    this.customerTownshipName,
    this.customerTownshipNameEn,
    this.customerStateName,
    this.customerAddressType,
    this.pickupPersonPrimaryPhone,
    this.pickupPersonOtherPhones,
    this.pickupPersonAvatar,
    this.dropOffPersonPrimaryPhone,
    this.dropOffPersonOtherPhones,
    this.dropOffPersonAvatar,
    this.refundInAdvanced,
    this.refundAmount,
    this.refundDate,
    this.name,
    this.townshipGuid,
    this.totalWays,
    this.images,
    this.itemCount,
    this.addressCount,
    this.completedCount,
    this.pickupCharges,
    this.refunded,
    this.deliveryItem,
    this.totalCashToCollect,
    this.checked,
    this.highestMessage,
    this.roleName,
    this.refundOption,
    this.carRequired,
    this.inboundStationGuid,
    this.inboundStationName,
    this.outboundStationGuid,
    this.outboundStationName,
    this.inboundBucketGuid,
    this.inboundBucketName,
    this.inboundBucketStatus,
    this.outboundBucketGuid,
    this.outboundBucketName,
    this.outboundBucketStatus,
    this.scheduleGuid,
    this.scheduleTime,
    this.codTransferred,
    this.codCollected,
    this.deliveryMethods,
    this.customerSignature,
    this.dropOffPersonSignature,
    this.pickupTrackingId,
    this.updatedCount,
    this.finalCashCollected,
    this.nonCashCollected,
    this.receivedOption,
    this.receivedOptionName,
    this.nonCashTransferTo,
    this.reasonOfReduceAmount,
    this.cashAdvanceAmount,
    this.cashAdvanceRelease,
    this.cashAdvanceReleaseDate,
    this.prepaidAmount,
    this.weight,
    this.width,
    this.remark,
    this.collected,
    this.collectedDate,
    this.codCollectedAmount,
    this.codTransferAmount,
    this.payableAmount,
    this.receivableAmount,
    this.completedDate,
    this.transferDate,
    this.payableDate,
    this.receivableDate,
    this.importRaw,
    this.extraPaidBy,
    this.wayName,
    this.message,
    this.updatedBy,
    this.marketHub,
    this.routeInboundBucketStatus,
    this.routeStatus,
    this.failedReason,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    contentGuid: json["contentGUID"],
    trackingId: json["trackingId"],
    status: json["status"],
    createdOn: json["createdOn"],
    updatedOn: json["updatedOn"],
    totalCharges: json["totalCharges"],
    forShowCharges: json["forShowCharges"],
    cod: json["cod"],
    totalItems: json["totalItems"],
    zoneName: json["zoneName"],
    zoneGuid: json["zoneGUID"],
    osName: json["osName"],
    osAddress: json["osAddress"],
    pickupDate: json["pickupDate"] == null ? null : DateTime.parse(json["pickupDate"]),
    osGuid: json["osGUID"],
    osContactGuid: json["osContactGUID"],
    customerName: json["customerName"],
    customerAddress: json["customerAddress"],
    dropOffDate: json["dropOffDate"],
    customerGuid: json["customerGUID"],
    customerContactGuid: json["customerContactGUID"],
    pickupPersonName: json["pickupPersonName"],
    pickupPersonGuid: json["pickupPersonGUID"],
    pickupPersonAssignGuid: json["pickupPersonAssignGUID"],
    pickupPersonLatitude: json["pickupPersonLatitude"]?.toDouble(),
    pickupPersonLongitude: json["pickupPersonLongitude"]?.toDouble(),
    dropOffPersonName: json["dropOffPersonName"],
    dropOffPersonGuid: json["dropOffPersonGUID"],
    dropOffPersonAssignGuid: json["dropOffPersonAssignGUID"],
    dropOffPersonLatitude: json["dropOffPersonLatitude"],
    dropOffPersonLongitude: json["dropOffPersonLongitude"],
    labourCost: json["labourCost"],
    transportCost: json["transportCost"],
    extraCost: json["extraCost"],
    totalDeliveryCharges: json["totalDeliveryCharges"],
    totalItemPrice: json["totalItemPrice"],
    promotionAmount: json["promotionAmount"],
    dueAmount: json["dueAmount"],
    osPrimaryPhone: json["osPrimaryPhone"],
    osOtherPhones: json["osOtherPhones"],
    osComment: json["osComment"],
    osLatitude: json["osLatitude"]?.toDouble(),
    osLongitude: json["osLongitude"]?.toDouble(),
    osPersonId: json["osPersonId"],
    osTownshipName: json["osTownshipName"],
    osTownshipNameEn: json["osTownshipNameEn"],
    osAddressType: json["osAddressType"],
    customerPrimaryPhone: json["customerPrimaryPhone"],
    customerOtherPhones: json["customerOtherPhones"],
    customerComment: json["customerComment"],
    customerLatitude: json["customerLatitude"],
    customerLongitude: json["customerLongitude"],
    customerPersonId: json["customerPersonId"],
    customerTownshipName: json["customerTownshipName"],
    customerTownshipNameEn: json["customerTownshipNameEn"],
    customerStateName: json["customerStateName"],
    customerAddressType: json["customerAddressType"],
    pickupPersonPrimaryPhone: json["pickupPersonPrimaryPhone"],
    pickupPersonOtherPhones: json["pickupPersonOtherPhones"],
    pickupPersonAvatar: json["pickupPersonAvatar"],
    dropOffPersonPrimaryPhone: json["dropOffPersonPrimaryPhone"],
    dropOffPersonOtherPhones: json["dropOffPersonOtherPhones"],
    dropOffPersonAvatar: json["dropOffPersonAvatar"],
    refundInAdvanced: json["refundInAdvanced"],
    refundAmount: json["refundAmount"],
    refundDate: json["refundDate"],
    name: json["name"],
    townshipGuid: json["townshipGuid"],
    totalWays: json["totalWays"],
    images: json["images"],
    itemCount: json["itemCount"],
    addressCount: json["addressCount"],
    completedCount: json["completedCount"],
    pickupCharges: json["pickupCharges"],
    refunded: json["refunded"],
    deliveryItem: json["deliveryItem"],
    totalCashToCollect: json["totalCashToCollect"],
    checked: json["checked"],
    highestMessage: json["highestMessage"],
    roleName: json["roleName"],
    refundOption: json["refundOption"],
    carRequired: json["carRequired"],
    inboundStationGuid: json["inboundStationGuid"],
    inboundStationName: json["inboundStationName"],
    outboundStationGuid: json["outboundStationGuid"],
    outboundStationName: json["outboundStationName"],
    inboundBucketGuid: json["inboundBucketGuid"],
    inboundBucketName: json["inboundBucketName"],
    inboundBucketStatus: json["inboundBucketStatus"],
    outboundBucketGuid: json["outboundBucketGuid"],
    outboundBucketName: json["outboundBucketName"],
    outboundBucketStatus: json["outboundBucketStatus"],
    scheduleGuid: json["scheduleGuid"],
    scheduleTime: json["scheduleTime"],
    codTransferred: json["codTransferred"],
    codCollected: json["codCollected"],
    deliveryMethods: json["deliveryMethods"],
    customerSignature: json["customerSignature"],
    dropOffPersonSignature: json["dropOffPersonSignature"],
    pickupTrackingId: json["pickupTrackingId"],
    updatedCount: json["updatedCount"],
    finalCashCollected: json["finalCashCollected"],
    nonCashCollected: json["nonCashCollected"],
    receivedOption: json["receivedOption"],
    receivedOptionName: json["receivedOptionName"],
    nonCashTransferTo: json["nonCashTransferTo"],
    reasonOfReduceAmount: json["reasonOfReduceAmount"],
    cashAdvanceAmount: json["cashAdvanceAmount"],
    cashAdvanceRelease: json["cashAdvanceRelease"],
    cashAdvanceReleaseDate: json["cashAdvanceReleaseDate"],
    prepaidAmount: json["prepaidAmount"],
    weight: json["weight"],
    width: json["width"],
    remark: json["remark"],
    collected: json["collected"],
    collectedDate: json["collectedDate"],
    codCollectedAmount: json["codCollectedAmount"],
    codTransferAmount: json["codTransferAmount"],
    payableAmount: json["payableAmount"],
    receivableAmount: json["receivableAmount"],
    completedDate: json["completedDate"],
    transferDate: json["transferDate"],
    payableDate: json["payableDate"],
    receivableDate: json["receivableDate"],
    importRaw: json["importRaw"],
    extraPaidBy: json["extraPaidBy"],
    wayName: json["wayName"],
    message: json["message"],
    updatedBy: json["updatedBy"],
    marketHub: json["marketHub"],
    routeInboundBucketStatus: json["routeInboundBucketStatus"],
    routeStatus: json["routeStatus"],
    failedReason: json["failedReason"],
  );

  Map<String, dynamic> toJson() => {
    "contentGUID": contentGuid,
    "trackingId": trackingId,
    "status": status,
    "createdOn": createdOn,
    "updatedOn": updatedOn,
    "totalCharges": totalCharges,
    "forShowCharges": forShowCharges,
    "cod": cod,
    "totalItems": totalItems,
    "zoneName": zoneName,
    "zoneGUID": zoneGuid,
    "osName": osName,
    "osAddress": osAddress,
    "pickupDate": "${pickupDate!.year.toString().padLeft(4, '0')}-${pickupDate!.month.toString().padLeft(2, '0')}-${pickupDate!.day.toString().padLeft(2, '0')}",
    "osGUID": osGuid,
    "osContactGUID": osContactGuid,
    "customerName": customerName,
    "customerAddress": customerAddress,
    "dropOffDate": dropOffDate,
    "customerGUID": customerGuid,
    "customerContactGUID": customerContactGuid,
    "pickupPersonName": pickupPersonName,
    "pickupPersonGUID": pickupPersonGuid,
    "pickupPersonAssignGUID": pickupPersonAssignGuid,
    "pickupPersonLatitude": pickupPersonLatitude,
    "pickupPersonLongitude": pickupPersonLongitude,
    "dropOffPersonName": dropOffPersonName,
    "dropOffPersonGUID": dropOffPersonGuid,
    "dropOffPersonAssignGUID": dropOffPersonAssignGuid,
    "dropOffPersonLatitude": dropOffPersonLatitude,
    "dropOffPersonLongitude": dropOffPersonLongitude,
    "labourCost": labourCost,
    "transportCost": transportCost,
    "extraCost": extraCost,
    "totalDeliveryCharges": totalDeliveryCharges,
    "totalItemPrice": totalItemPrice,
    "promotionAmount": promotionAmount,
    "dueAmount": dueAmount,
    "osPrimaryPhone": osPrimaryPhone,
    "osOtherPhones": osOtherPhones,
    "osComment": osComment,
    "osLatitude": osLatitude,
    "osLongitude": osLongitude,
    "osPersonId": osPersonId,
    "osTownshipName": osTownshipName,
    "osTownshipNameEn": osTownshipNameEn,
    "osAddressType": osAddressType,
    "customerPrimaryPhone": customerPrimaryPhone,
    "customerOtherPhones": customerOtherPhones,
    "customerComment": customerComment,
    "customerLatitude": customerLatitude,
    "customerLongitude": customerLongitude,
    "customerPersonId": customerPersonId,
    "customerTownshipName": customerTownshipName,
    "customerTownshipNameEn": customerTownshipNameEn,
    "customerStateName": customerStateName,
    "customerAddressType": customerAddressType,
    "pickupPersonPrimaryPhone": pickupPersonPrimaryPhone,
    "pickupPersonOtherPhones": pickupPersonOtherPhones,
    "pickupPersonAvatar": pickupPersonAvatar,
    "dropOffPersonPrimaryPhone": dropOffPersonPrimaryPhone,
    "dropOffPersonOtherPhones": dropOffPersonOtherPhones,
    "dropOffPersonAvatar": dropOffPersonAvatar,
    "refundInAdvanced": refundInAdvanced,
    "refundAmount": refundAmount,
    "refundDate": refundDate,
    "name": name,
    "townshipGuid": townshipGuid,
    "totalWays": totalWays,
    "images": images,
    "itemCount": itemCount,
    "addressCount": addressCount,
    "completedCount": completedCount,
    "pickupCharges": pickupCharges,
    "refunded": refunded,
    "deliveryItem": deliveryItem,
    "totalCashToCollect": totalCashToCollect,
    "checked": checked,
    "highestMessage": highestMessage,
    "roleName": roleName,
    "refundOption": refundOption,
    "carRequired": carRequired,
    "inboundStationGuid": inboundStationGuid,
    "inboundStationName": inboundStationName,
    "outboundStationGuid": outboundStationGuid,
    "outboundStationName": outboundStationName,
    "inboundBucketGuid": inboundBucketGuid,
    "inboundBucketName": inboundBucketName,
    "inboundBucketStatus": inboundBucketStatus,
    "outboundBucketGuid": outboundBucketGuid,
    "outboundBucketName": outboundBucketName,
    "outboundBucketStatus": outboundBucketStatus,
    "scheduleGuid": scheduleGuid,
    "scheduleTime": scheduleTime,
    "codTransferred": codTransferred,
    "codCollected": codCollected,
    "deliveryMethods": deliveryMethods,
    "customerSignature": customerSignature,
    "dropOffPersonSignature": dropOffPersonSignature,
    "pickupTrackingId": pickupTrackingId,
    "updatedCount": updatedCount,
    "finalCashCollected": finalCashCollected,
    "nonCashCollected": nonCashCollected,
    "receivedOption": receivedOption,
    "receivedOptionName": receivedOptionName,
    "nonCashTransferTo": nonCashTransferTo,
    "reasonOfReduceAmount": reasonOfReduceAmount,
    "cashAdvanceAmount": cashAdvanceAmount,
    "cashAdvanceRelease": cashAdvanceRelease,
    "cashAdvanceReleaseDate": cashAdvanceReleaseDate,
    "prepaidAmount": prepaidAmount,
    "weight": weight,
    "width": width,
    "remark": remark,
    "collected": collected,
    "collectedDate": collectedDate,
    "codCollectedAmount": codCollectedAmount,
    "codTransferAmount": codTransferAmount,
    "payableAmount": payableAmount,
    "receivableAmount": receivableAmount,
    "completedDate": completedDate,
    "transferDate": transferDate,
    "payableDate": payableDate,
    "receivableDate": receivableDate,
    "importRaw": importRaw,
    "extraPaidBy": extraPaidBy,
    "wayName": wayName,
    "message": message,
    "updatedBy": updatedBy,
    "marketHub": marketHub,
    "routeInboundBucketStatus": routeInboundBucketStatus,
    "routeStatus": routeStatus,
    "failedReason": failedReason,
  };
}
