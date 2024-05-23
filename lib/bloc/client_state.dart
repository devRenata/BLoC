import '../models/client.dart';

abstract class ClientState {
  List<Client> clients;

  ClientState({required this.clients});
}

class ClientInitialState extends ClientState{
  ClientInitialState(): super(clients: []);
}

class ClientSuccessState extends ClientState {
  ClientSuccessState({required super.clients});
}

class ClientErrorState extends ClientState {
  ClientErrorState({required super.clients});
}