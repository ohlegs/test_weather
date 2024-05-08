class DeviceType {
  final bool isMobile;
  final bool isTablet;
  final bool isLaptop;
  final bool isDesktop;
  final bool isTV;

  DeviceType({
    required this.isMobile,
    required this.isTablet,
    required this.isLaptop,
    required this.isDesktop,
    required this.isTV,
  });

  factory DeviceType.fromResolution(double resolution) {
    if (resolution <= 480) {
      return DeviceType(
        isMobile: true,
        isTablet: false,
        isLaptop: false,
        isDesktop: false,
        isTV: false,
      );
    } else if (resolution <= 768) {
      return DeviceType(
        isMobile: false,
        isTablet: true,
        isLaptop: false,
        isDesktop: false,
        isTV: false,
      );
    } else if (resolution <= 1024) {
      return DeviceType(
        isMobile: false,
        isTablet: false,
        isLaptop: true,
        isDesktop: false,
        isTV: false,
      );
    } else if (resolution <= 1200) {
      return DeviceType(
        isMobile: false,
        isTablet: false,
        isLaptop: false,
        isDesktop: true,
        isTV: false,
      );
    } else {
      return DeviceType(
        isMobile: false,
        isTablet: false,
        isLaptop: false,
        isDesktop: false,
        isTV: true,
      );
    }
  }
}
