import '../models/client.dart';

abstract class ClientRepository {
  void insertClient(Client client);
  List<Client> getAllClients();
  Client? getClient(String id);
  void updateClient(Client client);
  void deleteClient(String id);
}
