import 'package:function/handler.dart' as handler;
import 'dart:io';
import 'dart:convert';

String streamReadAllSync(Stream<List<int>> stream,
    {Encoding encoding = systemEncoding}) {
  final List<int> input = [];
  int byte;

  while ((byte = stdin.readByteSync()) != -1)
    input.add(byte);

  final String inputStr = encoding.decode(input);

  if (inputStr.isEmpty)
    return inputStr;

  // Manually trim the trailing newline added in the response string
  return inputStr.substring(0, inputStr.length - 1);
}

void main() async {
  String input = streamReadAllSync(stdin);
  print(handler.Handle(input));
}
