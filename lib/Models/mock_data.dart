
import 'package:logistics_manager/Models/vehicles_model.dart';

import 'drivers_model.dart';

List<DriverModel> mockDrivers = [
  DriverModel(id: "D1", name: "Ali", licenseNumber: "L1234"),
  DriverModel(id: "D2", name: "Kareem", licenseNumber: "L5678"),
  DriverModel(id: "D3", name: "Mohamed", licenseNumber: "L9123"),
  DriverModel(id: "D4", name: "Salah", licenseNumber: "L4567"),
];

List<VehicleModel> mockVehicles = [
  VehicleModel(id: "V1", name: "Truck 1", type: VehicleType.truck),
  VehicleModel(id: "V2", name: "Van 2", type: VehicleType.van),
  VehicleModel(id: "V3", name: "Bike 1", type: VehicleType.bike),
  VehicleModel(id: "V4", name: "Van 3", type: VehicleType.van),
];
