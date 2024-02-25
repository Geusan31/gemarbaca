import 'dart:convert';

import 'package:flutter/material.dart';

ImageProvider base64Widget(String base64String) {
  return MemoryImage(base64Decode(base64String));
}
