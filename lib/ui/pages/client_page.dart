import 'dart:math';

import 'package:bloc/bloc/client_bloc.dart';
import 'package:bloc/bloc/client_events.dart';
import 'package:bloc/bloc/client_state.dart';
import 'package:flutter/material.dart';

class ClientPage extends StatefulWidget {
  const ClientPage({super.key});

  @override
  State<ClientPage> createState() => _ClientPageState();
}

class _ClientPageState extends State<ClientPage> {
  //final clientList = [];
  late final ClientBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = ClientBloc();
    bloc.inputClient.add(LoadClientEvent());
  }

  @override
  void dispose() {
    bloc.inputClient.close();
    super.dispose();
  }

  String randomName() {
    final rand = Random();
    return ['Maria Julia', 'Vinicius Silva', 'Luiz Erval', 'Rodrigo Cavassini']
        .elementAt(rand.nextInt(4));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clients'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person_add),
            onPressed: () {},
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: StreamBuilder<ClientState>(
          stream: bloc.stream,
          builder: (context, AsyncSnapshot<ClientState> snapshot) {
            final clientsList = snapshot.data?.clients ?? [];
            return ListView.separated(
              itemCount: clientsList.length,
              itemBuilder: (context, index) => ListTile(
                leading: CircleAvatar(
                  child: ClipRRect(
                    child: Text(clientsList[index].name.substring(0,1)),
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                title: Text(clientsList[index].name),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {},
                ),
              ),
              separatorBuilder: (_, __) => const Divider(),
            );
          }
        ),
      ),
    );
  }
}
