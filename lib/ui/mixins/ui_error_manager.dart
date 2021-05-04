import 'package:flutter/material.dart';
import 'package:for_dev/ui/helpers/errors/errors.dart';

import '../components/components.dart';

mixin UIErrorManager {
  void handleMainError(BuildContext context, Stream<UIError> stream) {
    stream.listen((error) {
      if (error != null) {
        showErrorMessage(context, error.description);
      }
    });
  }
}
