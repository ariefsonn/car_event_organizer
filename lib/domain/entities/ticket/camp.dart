class Ticket {
  final dynamic id;
  final dynamic name;
  final dynamic tanggal;
  final dynamic lokasi;
  final dynamic jumlah_tiket;
  final dynamic harga;
  final dynamic description;
  final dynamic even_schedule;
  final dynamic year;
  final dynamic country;

  const Ticket ({
    required this.id,
    required this.name,
    required this.tanggal,
    required this.lokasi,
    required this.jumlah_tiket,
    required this.harga,
    required this.description,
    required this.even_schedule,
    required this.country,
    required this.year,
  });

  factory Ticket.fromJson(Map<dynamic, dynamic> json) {
    return Ticket(
      id: json['id'],
      name: json['name'],
      tanggal: json['tanggal'],
      lokasi: json['lokasi'],
      jumlah_tiket: json['jumlah_tiket'],
      harga: json['harga'],
      description: json['description'],
      even_schedule: json['even_schedule'],
      country: json['country'],
      year: json['year'],
    );
  }
}