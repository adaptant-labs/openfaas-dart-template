# Dart Template for OpenFaaS

An OpenFaaS template for writing serverless functions in Dart.

## Usage

First, fetch the template:

```shell script
$ faas-cli template pull https://github.com/adaptant-labs/openfaas-dart-template
Fetch templates from repository: https://github.com/adaptant-labs/openfaas-dart-template at master
2019/09/17 00:57:59 Attempting to expand templates from https://github.com/adaptant-labs/openfaas-dart-template
2019/09/17 00:58:00 Fetched 1 template(s) : [dart] from https://github.com/adaptant-labs/openfaas-dart-template
```

Then begin a new project:

```shell script
$ faas-cli new hellodart --lang dart
```

Make some modifications to `hellodart/lib/handler.dart` and `hellodart/pubspec.yaml`:

```dart
import 'dart:core';
import 'dart:io';

String Handle(String req) {
  final begin = DateTime.now();

  print("Hello from Dart! -- Invoked at: " + begin.toIso8601String());

  // Do some work
  sleep(Duration(milliseconds: 20));

  final elapsed = DateTime.now().difference(begin).inMilliseconds;

  print(elapsed.toString() + "ms elapsed");

  return req;
}
```

Build, deploy, and test:

```shell script
$ faas-cli build -f hellodart.yml
$ faas-cli deploy -f hellodart.yml
$ echo | faas-cli invoke hellodart
Hello from Dart! -- Invoked at: 2019-09-16T23:15:04.095636
23ms elapsed
```
## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: https://github.com/adaptant-labs/openfaas-dart-template/issues

## License

Licensed under the terms of the MIT license, the main license under which the OpenFaaS project is licensed.
For additional information, the full version of the license can be found in the
[LICENSE](https://raw.githubusercontent.com/adaptant-labs/openfaas-dart-template/master/LICENSE)
file included in this distribution.

## Acknowledgements

This project has received funding from the European Union’s Horizon 2020 research and innovation programme under grant
agreement No [825480](http://sodalite.eu/).

