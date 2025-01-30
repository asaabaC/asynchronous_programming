// future builder that displays your name after 3 seconds
import "dart:async";

Future<String> displayName() async {
  await Future.delayed(Duration(seconds: 3));
  return "asaaba shallot";
}

void main() async {
  String name = await displayName();
  print(name);
}
