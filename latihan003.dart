// BR-03
// Durasi parkir dihitung per jam nanti sisa menit dibulatkan ke atas
//contohnya misal parkir baru 65 menit tapi nanti diitung 2 jam

int hitungDurasiJam(int menit) {
  if (menit <= 0) {
    return 0;
  }
  
  int jam = menit ~/ 60;//bagian ini untuk menentukan berapa jam member parkir dengan cara misal : 125 dibagi 60 maka jadi 2
  int sisaMenit = menit % 60;//nah disini untuk menghitung sisa menitnya,karena sistem hitung perjam maka kelebihan menit dianggap 1 jam,dengan cara misal 125 diambil sisa pembagian dari 60 maka jadi 5,nah 5 menit itu dibulatkan jadi 1 jam
  
  if (sisaMenit > 0 || jam == 0) {
    return jam + 1;
  }
  
  return jam;
}

// BR-01:kalo Member bulanan gratis
// BR-02:kalo Non-member tarif progresif contohnya: Jam pertama 5000 nah selanjutnya 2000 begitupun seterusnya
int hitungTarifParkir(String jenisMember, int durasiJam) {
  if (jenisMember == "member") {
    return 0; // Implementasi BR-01
  } else if (jenisMember == "non-member") {
    if (durasiJam <= 0) {
      return 0;
    }
    return 5000 + ((durasiJam - 1) * 2000); //nah disini hitung jam pertama adalah 5k dan seterusnya 2k,pada bagian durasiJam - 1 sengaja ditambahkan karena biar tarifnya 5k pada jam pertama,kalo gk ada bisa jadi 7k pada jam pertama soalnya 5k + 1 x 2k
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

void main() {
  print("Chaerul Azriel Ardinsyah");
  print("TI24PSE1");
  print("");

  // Case 1
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


  // Case 2
  // Menguji parkir non-member 45 menit dibulatkan jadi 1 jam
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
  
  // Case 3
  // Menguji parkir non-member 3 jam secara Progresif
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

  // Case 4
  // Menguji kondisi member tapi tiketnya hilang (Kena denda dikit)
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

  // Case 5
  // Menguji non-member tiket hilang dikenakan tarif dan denda
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
