// BR-01
// Durasi parkir dihitung per jam, sisa menit dibulatkan ke atas
int hitungDurasiJam(int menit) {
  if (menit <= 0) {
    return 0;
  }
  
  int jam = menit ~/ 60;
  int sisaMenit = menit % 60;
  
  if (sisaMenit > 0 || jam == 0) {
    return jam + 1;
  }
  
  return jam;
}

// BR-02
// Member bulanan gratis
// Non-member tarif progresif (Misal: Jam pertama 5000, selanjutnya 2000)
int hitungTarifParkir(String jenisMember, int durasiJam) {
  if (jenisMember == "member") {
    return 0;
  } else if (jenisMember == "non-member") {
    if (durasiJam <= 0) {
      return 0;
    }
    return 5000 + ((durasiJam - 1) * 2000);
  }
  
  return 0;
}

// BR-03
// Tiket hilang denda Rp20.000
int hitungDenda(String statusTiket) {
  if (statusTiket == "hilang") {
    return 20000;
  }
  return 0;
}

// Menghitung total pembayaran (Tarif Parkir + Denda jika ada)
int hitungTotalBayar(int tarif, int denda) {
  return tarif + denda;
}

//TEST PROGRAM-------------------------------------------------------------------------

void main() {

  // Skenario 1
  // Menguji parkir member (Gratis)
  int durasiJam = hitungDurasiJam(120);
  int tarif = hitungTarifParkir("member", durasiJam);
  int denda = hitungDenda("ada");
  int total = hitungTotalBayar(tarif, denda);

  print("Skenario 1");
  print("Status: Member");
  print("Durasi: 120 menit");
  print("Tiket: Ada");
  print("Total Bayar: Rp$total");
  print("");


  // Skenario 2
  // Menguji parkir non-member 45 menit (dihitung 1 jam)
  durasiJam = hitungDurasiJam(45);
  tarif = hitungTarifParkir("non-member", durasiJam);
  denda = hitungDenda("ada");
  total = hitungTotalBayar(tarif, denda);

  print("Skenario 2");
  print("Status: Non-Member");
  print("Durasi: 45 menit");
  print("Tiket: Ada");
  print("Total Bayar: Rp$total");
  print("");
  

  // Skenario 3
  // Menguji parkir non-member 3 jam (Progresif)
  durasiJam = hitungDurasiJam(180);
  tarif = hitungTarifParkir("non-member", durasiJam);
  denda = hitungDenda("ada");
  total = hitungTotalBayar(tarif, denda);

  print("Skenario 3");
  print("Status: Non-Member");
  print("Durasi: 180 menit");
  print("Tiket: Ada");
  print("Total Bayar: Rp$total");
  print("");


  // Skenario 4
  // Menguji member tapi tiket hilang (Kena denda doang)
  durasiJam = hitungDurasiJam(60);
  tarif = hitungTarifParkir("member", durasiJam);
  denda = hitungDenda("hilang");
  total = hitungTotalBayar(tarif, denda);

  print("Skenario 4");
  print("Status: Member");
  print("Durasi: 60 menit");
  print("Tiket: Hilang");
  print("Total Bayar: Rp$total");
  print("");


  // Skenario 5
  // Menguji non-member tiket hilang (Tarif + Denda)
  durasiJam = hitungDurasiJam(60);
  tarif = hitungTarifParkir("non-member", durasiJam);
  denda = hitungDenda("hilang");
  total = hitungTotalBayar(tarif, denda);

  print("Skenario 5");
  print("Status: Non-Member");
  print("Durasi: 60 menit");
  print("Tiket: Hilang");
  print("Total Bayar: Rp$total");
}
