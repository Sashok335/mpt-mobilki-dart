import '../models/house.dart';

abstract class HouseRepository {
  void insertHouse(House house);
  List<House> getAllHouses();
  House? getHouse(String id);
  void updateHouse(House house);
  void deleteHouse(String id);
}
