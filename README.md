# DoubleTapToExit

Add double-tap-to-exit functionality to your app using this package !

## Getting Started

Add this to your package's `pubspec.yaml` file

```yaml
dependencies:
  double_tap_to_exit: ^1.0.0
```

## Usage

First, you just have to import the package using:

```dart
import 'package:double_tap_to_exit/double_tap_to_exit.dart';
```

Wrap your `Scaffold` widget with the `DoubleTapToExit` widget, passing an optional `snackBar`:


```dart

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DoubleTapToExit(
      child: Scaffold(),
      snackBar: const SnackBar(
        content: Text('Tap again to exit !'),
      ),
    );
  }
}

```
## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.