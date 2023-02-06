// ignore_for_file: constant_identifier_names, camel_case_types, non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:habit/constant/size.dart';

/// @BorderRadius ALl R2 - 8
const RADIUS_ALL = BorderRadius.only(
  topLeft: Radius.circular(R2),
  topRight: Radius.circular(R2),
  bottomLeft: Radius.circular(R2),
  bottomRight: Radius.circular(R2),
);

/// @BorderRadiuss ALl M R3 - 16
const RADIUS_ALL_M = BorderRadius.only(
  topLeft: Radius.circular(R3),
  topRight: Radius.circular(R3),
  bottomLeft: Radius.circular(R3),
  bottomRight: Radius.circular(R3),
);

/// @BorderRadius ALl L R5 - 32
const RADIUS_ALL_L = BorderRadius.only(
  topLeft: Radius.circular(R5),
  topRight: Radius.circular(R5),
  bottomLeft: Radius.circular(R5),
  bottomRight: Radius.circular(R5),
);

/// @BorderRadius TOP R2 - 8
const RADIUS_TOP = BorderRadius.only(
  topLeft: Radius.circular(R2),
  topRight: Radius.circular(R2),
);

/// @BorderRadius TOP M R3 - 16
const RADIUS_TOP_M = BorderRadius.only(
  topLeft: Radius.circular(R3),
  topRight: Radius.circular(R3),
);

/// @BorderRadius TOP M R5 - 32
const RADIUS_TOP_L = BorderRadius.only(
  topLeft: Radius.circular(R5),
  topRight: Radius.circular(R5),
);

/// @BorderRadius BOTTOM R2 - 8
const RADIUS_BOTTOM = BorderRadius.only(
  bottomLeft: Radius.circular(R2),
  bottomRight: Radius.circular(R2),
);

/// @BorderRadius BOTTOM R3 - 12
const RADIUS_BOTTOM_M = BorderRadius.only(
  bottomLeft: Radius.circular(R3),
  bottomRight: Radius.circular(R3),
);

/// @BorderRadius BOTTOM R5 - 32
const RADIUS_BOTTOM_L = BorderRadius.only(
  bottomLeft: Radius.circular(R5),
  bottomRight: Radius.circular(R5),
);

/// @RADIUS_ALL_M
const SHERPE_ALL = RoundedRectangleBorder(borderRadius: RADIUS_ALL_M);

/// @RADIUS_TOP_M
const SHERPE_TOP = RoundedRectangleBorder(borderRadius: RADIUS_TOP_M);

/// @RADIUS_BOTTOM_M
const SHERPE_BOTTOM = RoundedRectangleBorder(borderRadius: RADIUS_BOTTOM_M);
