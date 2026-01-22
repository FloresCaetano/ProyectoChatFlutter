import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/services/firebase_service.dart';
import '../../domain/models/message.dart';

//una instancia a Firebase
final firebaseServiceProvider = Provider<FirebaseService>((ref) {
  return FirebaseService();
});

final mensajeProvider = StreamProvider<List<Mensaje>> ( (ref){
  final service = ref.read(firebaseServiceProvider);
  return service.recibirMensajes();
});