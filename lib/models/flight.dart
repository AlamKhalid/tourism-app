class Flight {
  final String flightCode;
  final String departureTime;
  final String arrivalTime;
  final String duration;
  final double price;

  const Flight({
    required this.flightCode,
    required this.departureTime,
    required this.arrivalTime,
    required this.duration,
    required this.price,
  });

  factory Flight.fromJson(Map<String, dynamic> json) {
    return Flight(
      flightCode: json['flight_code'],
      departureTime: json['departureAirport']['time'].substring(11),
      arrivalTime: json['arrivalAirport']['time'].substring(11),
      duration: json['duration']['text'],
      price: json['totals']['total'],
    );
  }
}
