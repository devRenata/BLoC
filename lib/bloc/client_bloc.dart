import 'dart:async';

import 'package:bloc/bloc/client_events.dart';
import 'package:bloc/bloc/client_state.dart';
import 'package:bloc/models/client.dart';
import 'package:bloc/repo/client_repository.dart';

class ClientBloc {
  final _clientRepo = ClientRepository();

  final StreamController<ClientEvent> _inputClientController = StreamController<ClientEvent>();
  final StreamController<ClientState> _outputClientController = StreamController<ClientState>();

  Sink<ClientEvent> get inputClient => _inputClientController.sink;
  Stream<ClientState> get stream => _outputClientController.stream;

  ClientBloc() {
    _inputClientController.stream.listen(_mapEventToState);
  }

  _mapEventToState(ClientEvent event) {
    List<Client> clients = [];
    if(event is LoadClientEvent) {
      clients = _clientRepo.loadClients();
    }
    if(event is AddClientEvent) {
      clients = _clientRepo.addClient(event.client);
    }
    if(event is RemoveClientEvent) {
      clients = _clientRepo.removeClient(event.client);
    }

    _outputClientController.add(ClientSuccessState(clients: clients));
  }
}