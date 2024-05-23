import '../models/client.dart';

class ClientRepository {
  final List<Client> _clients = [];

  List<Client> loadClients() {
    _clients.addAll([
      Client(name: 'José Armando'),
      Client(name: 'Miguel Soares'),
      Client(name: 'Amanda Josué'),
      Client(name: 'Beatriz Alice'),
    ]);
    return _clients;
  }

  List<Client> addClient(Client client) {
    _clients.add(client);
    return _clients;
  }

  List<Client> removeClient(Client client) {
    _clients.remove(client);
    return _clients; 
  }
}
