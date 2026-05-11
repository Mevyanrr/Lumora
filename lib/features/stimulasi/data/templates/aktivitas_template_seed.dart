/// Data template aktivitas stimulasi bayi per range usia.
/// Digunakan untuk seed ke Firestore collection: aktivitas_template/{ageRange}/aktivitas/{id}
///
/// Range usia yang tersedia: 0-2, 3-5, 6-8, 9-11, 12-14, 15-17, 18-20, 21-24
///
/// Cara seed: panggil AktivitasTemplateSeed.seedAll() satu kali dari admin.

class AktivitasTemplateSeed {
  static Map<String, List<Map<String, dynamic>>> get allTemplates => {
    '0-2': [
      {
        'id': 'skin_to_skin',
        'title': 'Skin to Skin / Kangaroo Care',
        'description':
            'Letakkan bayi di dada orangtua dengan kulit bersentuhan langsung. Lakukan selama 20–30 menit dalam keadaan tenang.',
        'fungsi': 'Merangsang ikatan emosional & menstabilkan suhu tubuh bayi',
        'actvtotal': 'Lakukan minimal 4 kali sebulan',
        'totalCount': 4,
      },
      {
        'id': 'tummy_time_awal',
        'title': 'Tummy Time Pertama',
        'description':
            'Baringkan bayi tengkurap di atas dada atau perut orangtua selama 2–3 menit. Awasi terus dan pastikan jalan napas tidak tertutup.',
        'fungsi': 'Melatih otot leher & punggung atas',
        'actvtotal': 'Lakukan minimal 6 kali sebulan',
        'totalCount': 6,
      },
      {
        'id': 'stimulasi_visual',
        'title': 'Stimulasi Visual Hitam Putih',
        'description':
            'Tunjukkan kartu atau mainan bermotif hitam putih kontras berjarak ±20–30 cm dari wajah bayi selama 2–3 menit.',
        'fungsi': 'Merangsang perkembangan penglihatan dini',
        'actvtotal': 'Lakukan minimal 8 kali sebulan',
        'totalCount': 8,
      },
      {
        'id': 'pijat_bayi',
        'title': 'Pijat Bayi Lembut',
        'description':
            'Pijat seluruh tubuh bayi dengan gerakan lembut melingkar menggunakan minyak bayi. Mulai dari kaki, perut, punggung, lalu tangan.',
        'fungsi': 'Merangsang sensorik & melancarkan sirkulasi',
        'actvtotal': 'Lakukan minimal 8 kali sebulan',
        'totalCount': 8,
      },
      {
        'id': 'bicara_bayi',
        'title': 'Ngobrol & Nyanyikan Lagu',
        'description':
            'Ajak bayi berbicara dengan suara lembut, ceritakan aktivitas sehari-hari, atau nyanyikan lagu anak sederhana.',
        'fungsi': 'Stimulasi pendengaran & perkembangan bahasa',
        'actvtotal': 'Lakukan minimal 12 kali sebulan',
        'totalCount': 12,
      },
    ],

    '3-5': [
      {
        'id': 'tummy_time_lantai',
        'title': 'Tummy Time di Lantai',
        'description':
            'Baringkan bayi tengkurap di matras atau alas lembut di lantai. Letakkan mainan berwarna cerah di depannya agar ia mengangkat kepala.',
        'fungsi': 'Memperkuat otot leher, bahu & persiapan merangkak',
        'actvtotal': 'Lakukan minimal 8 kali sebulan',
        'totalCount': 8,
      },
      {
        'id': 'raih_mainan',
        'title': 'Latihan Meraih Mainan',
        'description':
            'Gantung mainan berwarna cerah atau berbunyi di depan bayi saat berbaring. Biarkan ia mencoba meraih dengan tangannya.',
        'fungsi': 'Melatih koordinasi tangan-mata & motorik halus',
        'actvtotal': 'Lakukan minimal 8 kali sebulan',
        'totalCount': 8,
      },
      {
        'id': 'cermin_wajah',
        'title': 'Eksplorasi Cermin',
        'description':
            'Dudukkan bayi sambil digendong menghadap cermin. Buat ekspresi wajah berbeda sambil berkata nama bagian wajah.',
        'fungsi': 'Stimulasi visual, sosial & kesadaran diri',
        'actvtotal': 'Lakukan minimal 6 kali sebulan',
        'totalCount': 6,
      },
      {
        'id': 'rolling_over',
        'title': 'Latihan Berguling',
        'description':
            'Bantu bayi belajar berguling dari telentang ke miring. Letakkan mainan di sisinya agar ia tertarik berbalik. Dampingi selalu.',
        'fungsi': 'Melatih motorik kasar & kekuatan otot inti',
        'actvtotal': 'Lakukan minimal 6 kali sebulan',
        'totalCount': 6,
      },
      {
        'id': 'eksplorasi_tekstur',
        'title': 'Eksplorasi Tekstur Kain',
        'description':
            'Sentuhkan berbagai tekstur kain (halus, kasar, berbulu) ke telapak tangan dan kaki bayi secara bergantian.',
        'fungsi': 'Stimulasi sensorik tactile',
        'actvtotal': 'Lakukan minimal 8 kali sebulan',
        'totalCount': 8,
      },
    ],

    '6-8': [
      {
        'id': 'duduk_bantuan',
        'title': 'Latihan Duduk dengan Bantuan',
        'description':
            'Dukung bayi duduk menggunakan bantal berbentuk U atau pegang punggungnya. Biarkan ia belajar menyeimbangkan tubuh 3–5 menit.',
        'fungsi': 'Memperkuat otot punggung & keseimbangan',
        'actvtotal': 'Lakukan minimal 8 kali sebulan',
        'totalCount': 8,
      },
      {
        'id': 'pindah_mainan',
        'title': 'Memindahkan Mainan Antar Tangan',
        'description':
            'Berikan mainan ringan di satu tangan, lalu dorong perlahan ke arah tangan lain agar bayi belajar memindahkannya sendiri.',
        'fungsi': 'Koordinasi motorik bilateral & motorik halus',
        'actvtotal': 'Lakukan minimal 8 kali sebulan',
        'totalCount': 8,
      },
      {
        'id': 'mpasi_pertama',
        'title': 'Eksplorasi MPASI (Finger Food)',
        'description':
            'Kenalkan tekstur makanan lembut dengan membiarkan bayi memegang dan merasakannya sendiri. Dampingi selalu saat makan.',
        'fungsi': 'Stimulasi sensorik oral & motorik halus',
        'actvtotal': 'Lakukan minimal 8 kali sebulan',
        'totalCount': 8,
      },
      {
        'id': 'peek_a_boo',
        'title': 'Permainan Peek-a-Boo',
        'description':
            'Tutup wajah dengan tangan atau kain, lalu buka sambil berkata "cilukba!" dengan ekspresi ceria. Ulangi sambil tertawa bersama.',
        'fungsi': 'Stimulasi sosial, emosi & konsep permanensi objek',
        'actvtotal': 'Lakukan minimal 10 kali sebulan',
        'totalCount': 10,
      },
      {
        'id': 'merangkak_early',
        'title': 'Persiapan Merangkak',
        'description':
            'Bantu bayi merangkak dengan menopang perutnya menggunakan selimut gulung. Dorong ia meraih mainan di depan.',
        'fungsi': 'Memperkuat otot lengan, perut & koordinasi tubuh',
        'actvtotal': 'Lakukan minimal 6 kali sebulan',
        'totalCount': 6,
      },
    ],

    '9-11': [
      {
        'id': 'merangkak_aktif',
        'title': 'Merangkak Aktif',
        'description':
            'Buat jalur merangkak dengan bantal dan mainan. Letakkan mainan favoritnya di ujung jalur agar ia termotivasi merangkak sendiri.',
        'fungsi': 'Motorik kasar & koordinasi tubuh menyeluruh',
        'actvtotal': 'Lakukan minimal 8 kali sebulan',
        'totalCount': 8,
      },
      {
        'id': 'berdiri_pegangan',
        'title': 'Latihan Berdiri Berpegangan',
        'description':
            'Biarkan bayi berpegangan pada sofa atau meja rendah yang aman untuk berdiri. Awasi dan pastikan lingkungan bebas bahaya.',
        'fungsi': 'Menguatkan otot kaki & keseimbangan',
        'actvtotal': 'Lakukan minimal 8 kali sebulan',
        'totalCount': 8,
      },
      {
        'id': 'pincer_grasp',
        'title': 'Latihan Menjepit (Pincer Grasp)',
        'description':
            'Letakkan benda kecil aman (potongan buah/sayur lembut) di meja. Biarkan bayi mencoba mengambil dengan jari telunjuk dan ibu jari.',
        'fungsi': 'Motorik halus & koordinasi jari',
        'actvtotal': 'Lakukan minimal 8 kali sebulan',
        'totalCount': 8,
      },
      {
        'id': 'buku_board_book',
        'title': 'Membaca Board Book Bersama',
        'description':
            'Baca buku bergambar tebal bersama bayi. Tunjuk gambar dan sebutkan namanya. Biarkan ia membalik halamannya sendiri.',
        'fungsi': 'Stimulasi bahasa, visual & kognitif',
        'actvtotal': 'Lakukan minimal 8 kali sebulan',
        'totalCount': 8,
      },
      {
        'id': 'lambaikan_tangan',
        'title': 'Mengajarkan Lambaikan Tangan',
        'description':
            'Setiap perpisahan atau saat berjumpa, tunjukkan gerakan lambaikan tangan sambil berkata "dadah" atau "halo".',
        'fungsi': 'Perkembangan sosial & bahasa isyarat awal',
        'actvtotal': 'Lakukan minimal 10 kali sebulan',
        'totalCount': 10,
      },
    ],

    '12-14': [
      {
        'id': 'jalan_pegangan',
        'title': 'Latihan Jalan Berpegangan (Cruising)',
        'description':
            'Biarkan bayi berjalan menyamping sambil berpegangan pada sofa atau meja. Taruh mainan di ujung untuk memotivasi.',
        'fungsi': 'Menguatkan otot kaki & keseimbangan berjalan',
        'actvtotal': 'Lakukan minimal 8 kali sebulan',
        'totalCount': 8,
      },
      {
        'id': 'susun_balok',
        'title': 'Menyusun Balok/Mainan',
        'description':
            'Berikan 2–4 balok besar. Tunjukkan cara menumpuknya lalu biarkan ia mencoba sendiri. Tepuk tangan saat berhasil.',
        'fungsi': 'Motorik halus, kognitif & pemecahan masalah',
        'actvtotal': 'Lakukan minimal 8 kali sebulan',
        'totalCount': 8,
      },
      {
        'id': 'kata_pertama',
        'title': 'Merangsang Kata Pertama',
        'description':
            'Gunakan kata-kata sederhana berulang seperti "mama", "papa", "minum", "makan". Tunjuk benda dan sebutkan namanya berulang.',
        'fungsi': 'Perkembangan bahasa & kosa kata aktif',
        'actvtotal': 'Lakukan minimal 12 kali sebulan',
        'totalCount': 12,
      },
      {
        'id': 'main_air',
        'title': 'Bermain Air (Water Play)',
        'description':
            'Isi baskom kecil dengan air hangat. Biarkan bayi memercikkan dan merasakan air dengan tangan. Selalu awasi.',
        'fungsi': 'Stimulasi sensorik & eksplorasi lingkungan',
        'actvtotal': 'Lakukan minimal 6 kali sebulan',
        'totalCount': 6,
      },
      {
        'id': 'imitasi_gerakan',
        'title': 'Tiru-Tiruan Gerakan',
        'description':
            'Lakukan gerakan sederhana seperti tepuk tangan, angkat tangan, atau menunjuk. Ajak bayi meniru. Berikan pujian setiap kali ia berhasil.',
        'fungsi': 'Kemampuan imitasi, sosial & bahasa',
        'actvtotal': 'Lakukan minimal 10 kali sebulan',
        'totalCount': 10,
      },
    ],

    '15-17': [
      {
        'id': 'jalan_mandiri',
        'title': 'Berjalan Mandiri',
        'description':
            'Dorong bayi berjalan mandiri di area aman. Beri jarak pendek antara dua orangtua dan bergantian panggil namanya untuk berjalan.',
        'fungsi': 'Motorik kasar & kepercayaan diri',
        'actvtotal': 'Lakukan minimal 10 kali sebulan',
        'totalCount': 10,
      },
      {
        'id': 'corat_coret',
        'title': 'Corat-Coret Pertama',
        'description':
            'Berikan krayon besar atau spidol khusus bayi dan kertas lebar. Biarkan ia mencorat-coret bebas. Tunjukkan cara memegangnya.',
        'fungsi': 'Motorik halus & ekspresi kreatif',
        'actvtotal': 'Lakukan minimal 6 kali sebulan',
        'totalCount': 6,
      },
      {
        'id': 'sortir_bentuk',
        'title': 'Sortir Bentuk & Warna',
        'description':
            'Gunakan mainan sortir berbentuk (kotak, bulat, segitiga). Tunjukkan cara memasukkan ke lubang yang sesuai, lalu biarkan ia mencoba.',
        'fungsi': 'Kognitif, pemecahan masalah & motorik halus',
        'actvtotal': 'Lakukan minimal 8 kali sebulan',
        'totalCount': 8,
      },
      {
        'id': 'makan_mandiri',
        'title': 'Latihan Makan Mandiri dengan Sendok',
        'description':
            'Berikan sendok bayi dan makanan yang mudah disendok. Dampingi dan biarkan ia mencoba menyuap sendiri meski berantakan.',
        'fungsi': 'Kemandirian & motorik halus',
        'actvtotal': 'Lakukan minimal 8 kali sebulan',
        'totalCount': 8,
      },
      {
        'id': 'menunjuk_gambar',
        'title': 'Menunjuk Gambar di Buku',
        'description':
            'Buka buku gambar dan tanya "Mana kucingnya?" atau "Mana matanya?". Minta bayi menunjuk gambar yang disebutkan.',
        'fungsi': 'Reseptif bahasa & pemahaman kata',
        'actvtotal': 'Lakukan minimal 8 kali sebulan',
        'totalCount': 8,
      },
    ],

    '18-20': [
      {
        'id': 'berlari_bermain',
        'title': 'Bermain Kejar-Kejaran',
        'description':
            'Ajak anak berlari bersama di tempat aman. Bergantian jadi yang mengejar. Ini juga waktu bonding yang menyenangkan.',
        'fungsi': 'Motorik kasar & perkembangan sosial',
        'actvtotal': 'Lakukan minimal 8 kali sebulan',
        'totalCount': 8,
      },
      {
        'id': 'puzzle_sederhana',
        'title': 'Puzzle 2–4 Keping',
        'description':
            'Berikan puzzle kayu sederhana 2–4 keping. Tunjukkan cara memasangkan, lalu biarkan ia mencoba sendiri. Bantu jika sudah frustrasi.',
        'fungsi': 'Kognitif, motorik halus & kesabaran',
        'actvtotal': 'Lakukan minimal 8 kali sebulan',
        'totalCount': 8,
      },
      {
        'id': 'dua_kata',
        'title': 'Stimulasi Kalimat Dua Kata',
        'description':
            'Perluas kata-kata anak. Jika ia bilang "minum", balas "mau minum air ya?". Gunakan kalimat pendek dan jelas setiap hari.',
        'fungsi': 'Perkembangan bahasa & kosakata',
        'actvtotal': 'Lakukan minimal 12 kali sebulan',
        'totalCount': 12,
      },
      {
        'id': 'role_play_awal',
        'title': 'Bermain Pura-Pura Sederhana',
        'description':
            'Ajak bermain pura-pura minum teh dengan cangkir mainan, atau pura-pura memasak. Ikuti arahnya dan perluas imajinasinya.',
        'fungsi': 'Kognitif, bahasa & perkembangan sosial-emosi',
        'actvtotal': 'Lakukan minimal 6 kali sebulan',
        'totalCount': 6,
      },
      {
        'id': 'menyebut_nama',
        'title': 'Mengenal & Menyebut Anggota Tubuh',
        'description':
            'Tanya sambil menunjuk: "Mana hidungnya? Mana telinganya?" Lalu minta ia menyebutkan atau menunjuk sendiri.',
        'fungsi': 'Bahasa aktif & pengetahuan diri',
        'actvtotal': 'Lakukan minimal 8 kali sebulan',
        'totalCount': 8,
      },
    ],

    '21-24': [
      {
        'id': 'naik_turun_tangga',
        'title': 'Latihan Naik Turun Tangga',
        'description':
            'Bantu anak naik turun 2–3 anak tangga sambil memegang pegangan atau tangan orangtua. Puji setiap langkahnya.',
        'fungsi': 'Motorik kasar, keseimbangan & kepercayaan diri',
        'actvtotal': 'Lakukan minimal 6 kali sebulan',
        'totalCount': 6,
      },
      {
        'id': 'main_pasir_air',
        'title': 'Bermain Pasir atau Playdough',
        'description':
            'Berikan playdough atau pasir kinetik aman. Tunjukkan cara memipihkan, menggulung, dan membentuk. Biarkan ia berkreasi bebas.',
        'fungsi': 'Motorik halus, kreativitas & sensorik',
        'actvtotal': 'Lakukan minimal 6 kali sebulan',
        'totalCount': 6,
      },
      {
        'id': 'kalimat_tiga_kata',
        'title': 'Stimulasi Kalimat 3 Kata',
        'description':
            'Perluas bicara anak ke kalimat 3 kata. Jika ia bilang "mau susu", balas "mau minum susu ya". Gunakan nada hangat dan tidak memaksa.',
        'fungsi': 'Ekspansi bahasa & tata bahasa awal',
        'actvtotal': 'Lakukan minimal 12 kali sebulan',
        'totalCount': 12,
      },
      {
        'id': 'menggambar_bebas',
        'title': 'Menggambar Bebas',
        'description':
            'Sediakan kertas dan krayon. Biarkan anak menggambar bebas. Tanya tentang gambarnya dan beri pujian meskipun belum jelas bentuknya.',
        'fungsi': 'Kreativitas, motorik halus & ekspresi diri',
        'actvtotal': 'Lakukan minimal 6 kali sebulan',
        'totalCount': 6,
      },
      {
        'id': 'berbagi_bermain',
        'title': 'Bermain Bergantian (Turn Taking)',
        'description':
            'Bermain permainan sederhana bergantian seperti lempar tangkap bola. Jelaskan "sekarang giliranmu" dan "giliran mama/papa".',
        'fungsi': 'Kemampuan sosial, emosi & kesabaran menunggu',
        'actvtotal': 'Lakukan minimal 8 kali sebulan',
        'totalCount': 8,
      },
    ],
  };
}
