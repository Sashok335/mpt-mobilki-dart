import '../models/service.dart';

abstract class ServiceRepository {
  void insertService(Service service);
  List<Service> getAllServices();
  Service? getService(String id);
  void updateService(Service service);
  void deleteService(String id);
}
