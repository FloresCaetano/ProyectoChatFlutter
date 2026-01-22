import 'package:firebase_database/firebase_database.dart';
import '../../domain/models/message.dart';

class FirebaseService{
  final DatabaseReference _reference = FirebaseDatabase.instance.ref('chat/general');

  Future<void> enviarMensaje(Mensaje mensaje) async{
    await _reference.push().set(mensaje.toJson());
  }

  //DatabaseReference get mensajesRef => _reference;

  //recibir mensajes
  Stream<List<Mensaje>> recibirMensajes(){
    return _reference.onValue.map((event){
      final data = event.snapshot.value as Map<dynamic, dynamic>?;
      if (data == null) return [];
      final mensajes = data.values
          .map((e) => Mensaje.fromJson(e))
          .toList();
        mensajes.sort((a,b) => a.timestamp.compareTo(b.timestamp));
      return mensajes;
    });
  }
}