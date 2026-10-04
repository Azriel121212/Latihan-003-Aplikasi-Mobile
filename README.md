# PARKIR LANGGANAN
Chaerul Azriel Ardiansyah - 1124160129

## Business Rules

* **BR-01:** Kendaraan dengan status member bulanan digratiskan dari biaya parkir (tarif Rp0).
* **BR-02:** Kendaraan non-member dikenakan tarif parkir progresif (Rp5.000 jam pertama, Rp2.000 jam berikutnya).
* **BR-03:** Durasi parkir dihitung dalam satuan jam, di mana sisa menit dibulatkan ke atas menjadi 1 jam penuh.
* **BR-04:** Jika tiket parkir hilang, maka dikenakan denda sebesar Rp20.000.
* **BR-05:** Denda tiket hilang berlaku untuk semua jenis pelanggan (member maupun non-member) dan ditambahkan ke total akhir pembayaran.

````dart
// BR-03
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

// BR-01: Member bulanan gratis
// BR-02: Non-member tarif progresif (Misal: Jam pertama 5000, selanjutnya 2000)
int hitungTarifParkir(String jenisMember, int durasiJam) {
  if (jenisMember == "member") {
    return 0; // Implementasi BR-01
  } else if (jenisMember == "non-member") {
    if (durasiJam <= 0) {
      return 0;
    }
    return 5000 + ((durasiJam - 1) * 2000); // Implementasi BR-02
  }
  
  return 0;
}

// BR-04
// Tiket hilang denda Rp20.000
int hitungDenda(String statusTiket) {
  if (statusTiket == "hilang") {
    return 20000;
  }
  return 0;
}

// BR-05
// Denda tiket hilang ditambahkan ke total akhir pembayaran
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


````
