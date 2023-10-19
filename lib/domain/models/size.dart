enum Size {
  xs('Extra Small'),
  s('Small'),
  m('Medium'),
  l('Large'),
  xl('Extra Large'),
  xxl('Extra Extra Large');

  const Size(this.name);

  final String name;
}

extension SizeExtension on Size {
  String get name {
    switch (this) {
      case Size.s:
        return 'Extra Small';
      case Size.m:
        return 'Small';
      case Size.l:
        return 'Medium';
      case Size.xl:
        return 'Extra Large';
      case Size.xxl:
        return 'Extra Extra Large';
      default:
        return 'Unknown';
    }
  }
}
