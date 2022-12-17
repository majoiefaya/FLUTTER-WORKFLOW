import 'package:flutter/material.dart';
import 'package:flutter_socket_io/flutter_socket_io.dart';
import 'package:flutter_socket_io/socket_io_manager.dart';
import 'package:socket_io_client/socket_io_client.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat App',
      home: ChatScreen(),
    );
  }
}

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  // Création d'une connexion socket vers le serveur du chat
  SocketIO socketIO = SocketIOManager().createSocketIO(
    'http://localhost:3000',
    '/',
  );

  // Initialisation de la liste des messages du chat
  List<String> messages = [];

  @override
  void initState() {
    super.initState();

    // Connexion à la socket lorsque la page est chargée
    socketIO.init();

    // Ajout d'un écouteur d'événement pour recevoir les nouveaux messages du chat
    socketIO.subscribe('chat message', (jsonData) {
      setState(() {
        messages.add(jsonData['message']);
      });
    });

    // Connexion à la socket
    socketIO.connect();
  }

  @override
  void dispose() {
    // Déconnexion de la socket lorsque la page est fermée
    socketIO.disconnect();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat App'),
      ),
      body: Column(
        children: [
          // Affichage de la liste des messages du chat
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(messages[index]),
                  ),
                );
              },
            ),
          ),
          // Champ de saisie pour envoyer de nouveaux messages du chat
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onSubmitted: (message) {
                // Envoi du message de chat au serveur
                socketIO.sendMessage(
                  'chat message',
                  { 'message': message },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
