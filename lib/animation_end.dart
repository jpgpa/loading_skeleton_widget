enum AnimationEnd {
  EXTREMELY_ON_TOP,
  MODERATELY_ON_TOP,
  NORMAL,
  MODERATEKY_ON_BOTTOM,
  EXTREMELY_ON_BOTTOM,
}

extension AnimationEndExtension on AnimationEnd {
  double get value {
    switch (this) {
      case AnimationEnd.EXTREMELY_ON_TOP:
        return -7;
      case AnimationEnd.MODERATELY_ON_TOP:
        return -3;
      case AnimationEnd.NORMAL:
        return 0;
      case AnimationEnd.MODERATEKY_ON_BOTTOM:
        return 3;
      case AnimationEnd.EXTREMELY_ON_BOTTOM:
        return 7;
      default:
        return 0;
    }
  }
}
