CREATE DATABASE HUMAN_RESOURCES

CREATE TABLE Departmanlar (

departman_id INT PRIMARY KEY,
departman_adi VARCHAR(50) NOT NULL,
lokasyon VARCHAR(50),
butce DECIMAL(10,2),
yonetici_id INT NOT NULL

);

CREATE TABLE Calisanlar (

calisan_id INT PRIMARY KEY,
ad VARCHAR(50) NOT NULL,
soyad VARCHAR(50) NOT NULL,
pozisyon VARCHAR(50) NOT NULL,
departman_id INT NOT NULL REFERENCES Departmanlar(departman_id),
maas DECIMAL(10,2),
ise_giris_tarihi DATE

);

CREATE TABLE Bordro (

bordro_id INT PRIMARY KEY,
calisan_id INT NOT NULL REFERENCES Calisanlar(calisan_id),
ay INT,
yil INT,
net_maas DECIMAL(10,2),
prim DECIMAL(10,2),
kesinti DECIMAL(10,2)

);

CREATE TABLE Izinler (

izin_id INT PRIMARY KEY,
calisan_id INT REFERENCES Calisanlar(calisan_id),
izin_turu VARCHAR(50),
baslangic DATE,
bitis DATE,
onay_durumu VARCHAR(50)


);

ALTER TABLE Departmanlar
ADD FOREIGN KEY (yonetici_id) REFERENCES Calisanlar(calisan_id)

ALTER TABLE Calisanlar
ADD 
isten_cikis_tarihi DATE,
cikis_nedeni VARCHAR(100),
durum VARCHAR(20) DEFAULT 'Aktif';

ALTER TABLE Departmanlar
ALTER COLUMN yonetici_id INT NULL;

INSERT INTO Departmanlar (departman_id, departman_adi, lokasyon, butce, yonetici_id)
VALUES
(1, 'Ýnsan Kaynaklarý', 'Ýstanbul - Merkez', 750000.00, NULL),
(2, 'Bilgi Teknolojileri', 'Ankara - Teknokent', 1800000.00, NULL),
(3, 'Satýþ', 'Ýzmir', 1200000.00, NULL),
(4, 'Muhasebe ve Finans', 'Ýstanbul - Merkez', 600000.00, NULL),
(5, 'Üretim', 'Bursa', 3500000.00, NULL),
(6, 'Pazarlama', 'Ýstanbul - Levent', 1400000.00, NULL),
(7, 'Ar-Ge', 'Kocaeli - Gebze', 2100000.00, NULL),
(8, 'Müþteri Hizmetleri', 'Eskiþehir', 450000.00, NULL),
(9, 'Hukuk', 'Ankara', 550000.00, NULL),
(10, 'Lojistik ve Depo', 'Sakarya', 800000.00, NULL),
(11, 'Satýn Alma', 'Ýstanbul - Merkez', 500000.00, NULL),
(12, 'Kalite Kontrol', 'Bursa', 650000.00, NULL);

INSERT INTO Calisanlar (calisan_id, ad, soyad, pozisyon, departman_id, maas, ise_giris_tarihi, isten_cikis_tarihi, cikis_nedeni, durum)
VALUES
(1, 'Ayþe', 'Yýlmaz', 'ÝK Müdürü', 1, 45000.00, '2019-03-15', NULL, NULL, 'Aktif'),
(2, 'Burak', 'Demir', 'ÝK Uzmaný', 1, 28000.00, '2021-06-10', NULL, NULL, 'Aktif'),
(3, 'Selin', 'Kaya', 'Ýþe Alým Sorumlusu', 1, 26000.00, '2022-01-20', NULL, NULL, 'Aktif'),
(4, 'Mert', 'Çelik', 'Stajyer', 1, 17002.00, '2024-09-01', NULL, NULL, 'Aktif'),
(5, 'Can', 'Öztürk', 'IT Direktörü', 2, 85000.00, '2018-05-12', NULL, NULL, 'Aktif'),
(6, 'Emre', 'Aydýn', 'Senior Backend Dev', 2, 65000.00, '2020-02-14', NULL, NULL, 'Aktif'),
(7, 'Gizem', 'Bulut', 'Frontend Developer', 2, 55000.00, '2021-11-05', NULL, NULL, 'Aktif'),
(8, 'Okan', 'Þen', 'Veri Analisti', 2, 48000.00, '2023-03-01', NULL, NULL, 'Aktif'),
(9, 'Deniz', 'Arslan', 'Junior Developer', 2, 35000.00, '2024-01-15', NULL, NULL, 'Aktif'),
(10, 'Zeynep', 'Kurt', 'Sistem Yöneticisi', 2, 52000.00, '2019-08-20', '2024-05-15', 'Ýstifa - Yurt Dýþý', 'Pasif'), -- Ayrýlan Personel
(11, 'Ahmet', 'Yýldýz', 'Satýþ Müdürü', 3, 50000.00, '2018-01-10', NULL, NULL, 'Aktif'),
(12, 'Mehmet', 'Kara', 'Bölge Sorumlusu', 3, 35000.00, '2020-04-12', NULL, NULL, 'Aktif'),
(13, 'Elif', 'Aksoy', 'Satýþ Temsilcisi', 3, 25000.00, '2022-07-01', NULL, NULL, 'Aktif'),
(14, 'Cem', 'Uçar', 'Satýþ Temsilcisi', 3, 24000.00, '2023-02-28', '2023-11-30', 'Performans Düþüklüðü', 'Pasif'), -- Ayrýlan
(15, 'Seda', 'Polat', 'Satýþ Destek', 3, 22000.00, '2021-09-15', '2024-01-10', 'Ýstifa', 'Pasif'), -- Ayrýlan
(16, 'Fatma', 'Koç', 'Mali Ýþler Müdürü', 4, 55000.00, '2017-06-30', NULL, NULL, 'Aktif'),
(17, 'Ali', 'Güneþ', 'Muhasebe Uzmaný', 4, 32000.00, '2019-11-11', NULL, NULL, 'Aktif'),
(18, 'Hande', 'Erkin', 'Finans Uzmaný', 4, 34000.00, '2020-03-03', NULL, NULL, 'Aktif'),
(19, 'Mustafa', 'Þahin', 'Üretim Müdürü', 5, 48000.00, '2016-09-01', NULL, NULL, 'Aktif'),
(20, 'Kemal', 'Tunç', 'Vardiya Amiri', 5, 30000.00, '2018-02-15', NULL, NULL, 'Aktif'),
(21, 'Hüseyin', 'Boz', 'Makine Operatörü', 5, 23000.00, '2020-01-20', NULL, NULL, 'Aktif'),
(22, 'Ýsmail', 'Sarý', 'Montaj Elemaný', 5, 21000.00, '2021-05-10', NULL, NULL, 'Aktif'),
(23, 'Orhan', 'Can', 'Teknisyen', 5, 25000.00, '2019-07-22', NULL, NULL, 'Aktif'),
(24, 'Serkan', 'Dað', 'Operatör', 5, 22000.00, '2022-12-01', NULL, NULL, 'Aktif'),
(25, 'Murat', 'Avcý', 'Operatör', 5, 22000.00, '2023-06-15', NULL, NULL, 'Aktif'),
(26, 'Hakan', 'Tepe', 'Ýþçi', 5, 18000.00, '2024-02-01', NULL, NULL, 'Aktif'),
(27, 'Rýza', 'Baba', 'Ustabaþý', 5, 35000.00, '2015-04-10', '2024-06-01', 'Emeklilik', 'Pasif'), -- Emekli oldu
(28, 'Pelin', 'Su', 'Pazarlama Müdürü', 6, 52000.00, '2019-01-05', NULL, NULL, 'Aktif'),
(29, 'Berk', 'Atar', 'Dijital Pazarlama', 6, 38000.00, '2021-03-15', NULL, NULL, 'Aktif'),
(30, 'Cansu', 'Dere', 'Sosyal Medya Uzmaný', 6, 30000.00, '2022-08-20', NULL, NULL, 'Aktif'),
(31, 'Tarýk', 'Akan', 'Ar-Ge Müdürü', 7, 60000.00, '2018-11-01', NULL, NULL, 'Aktif'),
(32, 'Filiz', 'Akýn', 'Mühendis', 7, 45000.00, '2020-05-05', NULL, NULL, 'Aktif'),
(33, 'Kadir', 'Ýnanýr', 'Prototip Sorumlusu', 7, 40000.00, '2019-09-09', NULL, NULL, 'Aktif'),
(34, 'Ezgi', 'Mola', 'Takým Lideri', 8, 28000.00, '2020-01-10', NULL, NULL, 'Aktif'),
(35, 'Ozan', 'Güven', 'Müþteri Temsilcisi', 8, 19000.00, '2023-01-01', NULL, NULL, 'Aktif'),
(36, 'Aslý', 'Enver', 'Müþteri Temsilcisi', 8, 19000.00, '2023-05-12', NULL, NULL, 'Aktif'),
(37, 'Murat', 'Boz', 'Müþteri Temsilcisi', 8, 18500.00, '2023-08-01', '2024-02-15', 'Ýstifa', 'Pasif'), -- Ayrýlan
(38, 'Selami', 'Þahin', 'Hukuk Müþaviri', 9, 58000.00, '2017-02-20', NULL, NULL, 'Aktif'),
(39, 'Ebru', 'Gündeþ', 'Avukat', 9, 42000.00, '2021-10-10', NULL, NULL, 'Aktif'),
(40, 'Müslüm', 'Gürses', 'Lojistik Müdürü', 10, 40000.00, '2016-05-30', NULL, NULL, 'Aktif'),
(41, 'Ferdi', 'Tayfur', 'Depo Sorumlusu', 10, 25000.00, '2019-04-15', NULL, NULL, 'Aktif'),
(42, 'Ýbrahim', 'Tatlýses', 'Þoför', 10, 22000.00, '2020-06-01', NULL, NULL, 'Aktif'),
(43, 'Ajda', 'Pekkan', 'Satýn Alma Müdürü', 11, 47000.00, '2015-01-01', NULL, NULL, 'Aktif'),
(44, 'Sezen', 'Aksu', 'Satýn Alma Uzmaný', 11, 31000.00, '2018-09-09', NULL, NULL, 'Aktif'),
(45, 'Tarkan', 'Tevetoðlu', 'Kalite Müdürü', 12, 46000.00, '2017-12-12', NULL, NULL, 'Aktif'),
(46, 'Kenan', 'Doðulu', 'Kalite Uzmaný', 12, 33000.00, '2021-07-20', NULL, NULL, 'Aktif'),
(47, 'Sertab', 'Erener', 'Kalite Teknisyeni', 12, 26000.00, '2022-04-05', NULL, NULL, 'Aktif'),
(48, 'Cemal', 'Süreya', 'Depo Elemaný', 10, 21500.00, '2022-03-10', NULL, NULL, 'Aktif'),
(49, 'Attila', 'Ýlhan', 'Þoför', 10, 23000.00, '2021-08-15', NULL, NULL, 'Aktif'),
(50, 'Nazým', 'Hikmet', 'Montaj Elemaný', 5, 22500.00, '2023-01-20', NULL, NULL, 'Aktif'),
(51, 'Orhan', 'Veli', 'Paketleme Sorumlusu', 5, 21000.00, '2023-05-05', NULL, NULL, 'Aktif'),
(52, 'Can', 'Yücel', 'Üretim Operatörü', 5, 22000.00, '2020-11-11', NULL, NULL, 'Aktif'),
(53, 'Tomris', 'Uyar', 'Kalite Kontrolcü', 12, 26000.00, '2021-02-14', NULL, NULL, 'Aktif'),
(54, 'Edip', 'Cansever', 'Makine Bakýmcý', 5, 28000.00, '2019-07-01', NULL, NULL, 'Aktif'),
(55, 'Turgut', 'Uyar', 'Vardiya Amiri', 5, 32000.00, '2018-09-10', NULL, NULL, 'Aktif'),
(56, 'Nilgün', 'Marmara', 'Depo Sorumlusu', 10, 24000.00, '2022-12-01', NULL, NULL, 'Aktif'),
(57, 'Tezer', 'Özlü', 'Sevkiyat Planlama', 10, 29000.00, '2020-06-20', NULL, NULL, 'Aktif'),
(58, 'Oðuz', 'Atay', 'Satýþ Temsilcisi', 3, 24000.00, '2023-01-15', '2023-09-01', 'Ýstifa', 'Pasif'),
(59, 'Yusuf', 'Atýlgan', 'Satýþ Temsilcisi', 3, 24000.00, '2023-02-01', NULL, NULL, 'Aktif'),
(60, 'Sabahattin', 'Ali', 'Müþteri Temsilcisi', 8, 19500.00, '2024-01-10', NULL, NULL, 'Aktif'),
(61, 'Yaþar', 'Kemal', 'Müþteri Temsilcisi', 8, 19500.00, '2023-11-05', '2024-03-01', 'Performans', 'Pasif'),
(62, 'Ahmet', 'Hamdi', 'Bölge Satýþ Sorumlusu', 3, 38000.00, '2019-04-20', NULL, NULL, 'Aktif'),
(63, 'Halide', 'Edip', 'Satýþ Destek', 3, 23000.00, '2022-08-15', NULL, NULL, 'Aktif'),
(64, 'Reþat', 'Nuri', 'Çaðrý Merkezi Uzmaný', 8, 20000.00, '2021-05-30', NULL, NULL, 'Aktif'),
(65, 'Sait', 'Faik', 'Satýþ Temsilcisi', 3, 25000.00, '2021-09-10', NULL, NULL, 'Aktif'),
(66, 'Aziz', 'Nesin', 'Senior DevOps Engineer', 2, 70000.00, '2020-03-15', NULL, NULL, 'Aktif'),
(67, 'Rýfat', 'Ilgaz', 'Veri Bilimci', 7, 65000.00, '2021-01-20', NULL, NULL, 'Aktif'),
(68, 'Muzaffer', 'Ýzgü', 'Yazýlým Test Mühendisi', 2, 45000.00, '2022-07-07', NULL, NULL, 'Aktif'),
(69, 'Fakir', 'Baykurt', 'Ürün Yöneticisi', 7, 55000.00, '2019-12-01', NULL, NULL, 'Aktif'),
(70, 'Haldun', 'Taner', 'Mobil Uygulama Geliþtirici', 2, 48000.00, '2023-05-15', NULL, NULL, 'Aktif'),
(71, 'Necip', 'Fazýl', 'Siber Güvenlik Uzmaný', 2, 60000.00, '2020-10-10', NULL, NULL, 'Aktif'),
(72, 'Peyami', 'Safa', 'Junior Developer', 2, 35000.00, '2024-02-01', NULL, NULL, 'Aktif'),
(73, 'Yahya', 'Kemal', 'Ýdari Ýþler Sorumlusu', 1, 27000.00, '2018-06-01', NULL, NULL, 'Aktif'),
(74, 'Ziya', 'Gökalp', 'Bordro Uzmaný', 4, 33000.00, '2019-09-20', NULL, NULL, 'Aktif'),
(75, 'Mehmet', 'Akif', 'Avukat', 9, 44000.00, '2021-03-15', NULL, NULL, 'Aktif'),
(76, 'Namýk', 'Kemal', 'Satýn Alma Sorumlusu', 11, 29000.00, '2022-04-04', NULL, NULL, 'Aktif'),
(77, 'Þinasi', 'Efendi', 'Muhasebe Elemaný', 4, 26000.00, '2023-10-01', NULL, NULL, 'Aktif'),
(78, 'Barýþ', 'Manço', 'Kreatif Direktör', 6, 60000.00, '2017-05-05', NULL, NULL, 'Aktif'),
(79, 'Cem', 'Karaca', 'Etkinlik Yöneticisi', 6, 35000.00, '2019-08-15', NULL, NULL, 'Aktif'),
(80, 'Erkin', 'Koray', 'Teknik Ressam', 7, 34000.00, '2020-02-20', NULL, NULL, 'Aktif'),
(81, 'Fikret', 'Kýzýlok', 'Üretim Planlama', 5, 30000.00, '2021-11-11', NULL, NULL, 'Aktif'),
(82, 'Bülent', 'Ortaçgil', 'Müþteri Temsilcisi', 8, 19000.00, '2023-12-01', NULL, NULL, 'Aktif'),
(83, 'Mazhar', 'Alanson', 'Grafik Tasarýmcý', 6, 32000.00, '2022-06-15', NULL, NULL, 'Aktif'),
(84, 'Fuat', 'Güner', 'Muhasebe Þefi', 4, 42000.00, '2016-03-10', NULL, NULL, 'Aktif'),
(85, 'Özkan', 'Uður', 'Ýnsan Kaynaklarý Uzmaný', 1, 30000.00, '2020-09-09', NULL, NULL, 'Aktif'),
(86, 'Þebnem', 'Ferah', 'Satýþ Temsilcisi', 3, 26000.00, '2022-01-20', NULL, NULL, 'Aktif'),
(87, 'Teoman', 'Yakupoðlu', 'Depo Görevlisi', 10, 21000.00, '2023-04-05', NULL, NULL, 'Aktif'),
(88, 'Hayko', 'Cepkin', 'Sistem Destek Uzmaný', 2, 38000.00, '2021-12-12', NULL, NULL, 'Aktif'),
(89, 'Haluk', 'Levent', 'Sosyal Sorumluluk Uzm.', 1, 28000.00, '2019-10-29', NULL, NULL, 'Aktif'),
(90, 'Volkan', 'Konak', 'Lojistik Planlama', 10, 31000.00, '2018-07-22', NULL, NULL, 'Aktif'),
(91, 'Kazým', 'Koyuncu', 'Çevre Mühendisi', 12, 40000.00, '2020-05-05', NULL, NULL, 'Aktif'),
(92, 'Kýraç', 'Tufan', 'Bakým Onarým Þefi', 5, 36000.00, '2017-08-30', NULL, NULL, 'Aktif'),
(93, 'Murat', 'Kekilli', 'Üretim Ýþçisi', 5, 20500.00, '2022-09-15', NULL, NULL, 'Aktif'),
(94, 'Çelik', 'Eriþçi', 'Satýþ Temsilcisi', 3, 24500.00, '2023-03-01', NULL, NULL, 'Aktif'),
(95, 'Ýzel', 'Çeliköz', 'Pazarlama Uzmaný', 6, 33000.00, '2021-02-14', NULL, NULL, 'Aktif'),
(96, 'Ercan', 'Saatçi', 'Finans Analisti', 4, 39000.00, '2019-11-11', NULL, NULL, 'Aktif'),
(97, 'Yonca', 'Evcimik', 'Dans Eðitmeni (Sosyal)', 1, 25000.00, '2022-05-20', '2024-01-01', 'Proje Bitiþi', 'Pasif'),
(98, 'Burak', 'Kut', 'Stajyer', 2, 17002.00, '2024-06-01', NULL, NULL, 'Aktif'),
(99, 'Mustafa', 'Sandal', 'Pazarlama Yöneticisi', 6, 45000.00, '2018-04-15', NULL, NULL, 'Aktif'),
(100, 'Serdar', 'Ortaç', 'Ar-Ge Teknisyeni', 7, 32000.00, '2020-08-08', NULL, NULL, 'Aktif'),
(101, 'Demet', 'Akalýn', 'Müþteri Temsilcisi', 8, 19000.00, '2023-07-01', NULL, NULL, 'Aktif'),
(102, 'Hande', 'Yener', 'Müþteri Temsilcisi', 8, 19500.00, '2023-05-15', NULL, NULL, 'Aktif'),
(103, 'Gülþen', 'Bayraktar', 'Satýþ Temsilcisi', 3, 27000.00, '2021-09-09', NULL, NULL, 'Aktif'),
(104, 'Hadise', 'Açýkgöz', 'Marka Yöneticisi', 6, 42000.00, '2019-02-20', NULL, NULL, 'Aktif'),
(105, 'Murat', 'Dalkýlýç', 'Yazýlým Geliþtirici', 2, 40000.00, '2022-10-10', NULL, NULL, 'Aktif'),
(106, 'Berkay', 'Þahin', 'Satýn Alma Asistaný', 11, 24000.00, '2023-01-05', NULL, NULL, 'Aktif'),
(107, 'Merve', 'Özbey', 'Hukuk Asistaný', 9, 28000.00, '2022-03-30', NULL, NULL, 'Aktif'),
(108, 'Simge', 'Saðýn', 'Sekreter', 1, 22000.00, '2021-06-01', NULL, NULL, 'Aktif'),
(109, 'Aleyna', 'Tilki', 'Genç Yetenek Stajyeri', 6, 17002.00, '2024-07-01', NULL, NULL, 'Aktif'),
(110, 'Edis', 'Görgülü', 'Dijital Ýçerik Üretici', 6, 31000.00, '2022-04-15', NULL, NULL, 'Aktif'),
(111, 'Zeynep', 'Bastýk', 'Etkinlik Koordinatörü', 1, 29000.00, '2021-11-20', NULL, NULL, 'Aktif'),
(112, 'Fatma', 'Turgut', 'Kalite Mühendisi', 12, 43000.00, '2020-01-10', NULL, NULL, 'Aktif'),
(113, 'Can', 'Bonomo', 'Grafiker', 6, 30000.00, '2022-08-08', NULL, NULL, 'Aktif'),
(114, 'Kalben', 'Saðdýç', 'Metin Yazarý', 6, 28000.00, '2021-12-01', NULL, NULL, 'Aktif'),
(115, 'Mabel', 'Matiz', 'Veri Analisti', 2, 46000.00, '2020-05-15', NULL, NULL, 'Aktif'),
(116, 'Ceylan', 'Ertem', 'Ar-Ge Mühendisi', 7, 50000.00, '2019-09-01', NULL, NULL, 'Aktif'),
(117, 'Gökhan', 'Türkmen', 'Saha Satýþ Elemaný', 3, 24000.00, '2023-02-14', NULL, NULL, 'Aktif'),
(118, 'Soner', 'Sarýkabadayý', 'Depo Personeli', 10, 21500.00, '2022-10-20', NULL, NULL, 'Aktif'),
(119, 'Emre', 'Altuð', 'Üretim Þefi', 5, 38000.00, '2017-11-11', NULL, NULL, 'Aktif'),
(120, 'Rafet', 'El Roman', 'Lojistik Uzmaný', 10, 29000.00, '2019-03-30', NULL, NULL, 'Aktif'),
(121, 'Gülben', 'Ergen', 'Ýdari Asistan', 1, 23000.00, '2020-07-07', NULL, NULL, 'Aktif'),
(122, 'Seda', 'Sayan', 'Yemekhane Sorumlusu', 1, 25000.00, '2016-01-01', NULL, NULL, 'Aktif'),
(123, 'Bülent', 'Ersoy', 'Baþdanýþman', 1, 90000.00, '2015-01-01', NULL, NULL, 'Aktif'),
(124, 'Orhan', 'Gencebay', 'Onursal Baþkan Yrd.', 1, 95000.00, '2015-01-01', '2023-12-31', 'Emeklilik', 'Pasif'),
(125, 'Cüneyt', 'Arkýn', 'Güvenlik Amiri', 1, 35000.00, '2016-06-01', '2024-01-01', 'Emeklilik', 'Pasif'),
(126, 'Kadir', 'Çöpdemir', 'Müþteri Ýliþkileri', 8, 26000.00, '2021-04-15', NULL, NULL, 'Aktif'),
(127, 'Beyazýt', 'Öztürk', 'Showroom Müdürü', 3, 48000.00, '2018-09-09', NULL, NULL, 'Aktif'),
(128, 'Okan', 'Bayülgen', 'Medya Yöneticisi', 6, 55000.00, '2017-10-10', NULL, NULL, 'Aktif'),
(129, 'Acun', 'Ilýcalý', 'Strateji Direktörü', 1, 80000.00, '2016-11-11', NULL, NULL, 'Aktif'),
(130, 'Þeyma', 'Subaþý', 'Sosyal Medya Asistaný', 6, 20000.00, '2022-01-01', '2023-06-01', 'Ýstifa', 'Pasif'),
(131, 'Ali', 'Koç', 'Yönetim Kurulu Üyesi', 1, 1.00, '2015-01-01', NULL, NULL, 'Aktif'),
(132, 'Fatih', 'Terim', 'Takým Koçu (Motivasyon)', 1, 75000.00, '2019-05-20', NULL, NULL, 'Aktif'),
(133, 'Þenol', 'Güneþ', 'Eðitim Uzmaný', 1, 40000.00, '2018-08-01', NULL, NULL, 'Aktif'),
(134, 'Mustafa', 'Denizli', 'Danýþman', 1, 45000.00, '2017-02-15', NULL, NULL, 'Aktif'),
(135, 'Arda', 'Turan', 'Saha Personeli', 3, 25000.00, '2023-01-01', NULL, NULL, 'Aktif'),
(136, 'Burak', 'Yýlmaz', 'Saha Sorumlusu', 3, 27000.00, '2022-09-01', NULL, NULL, 'Aktif'),
(137, 'Mesut', 'Özil', 'Yazýlým Mimarý', 2, 72000.00, '2021-02-01', '2024-03-01', 'Ýstifa', 'Pasif'),
(138, 'Nuri', 'Þahin', 'Sistem Analisti', 2, 55000.00, '2020-06-15', NULL, NULL, 'Aktif'),
(139, 'Hamit', 'Altýntop', 'Proje Yöneticisi', 2, 58000.00, '2019-03-10', NULL, NULL, 'Aktif'),
(140, 'Nihat', 'Kahveci', 'Satýþ Temsilcisi', 3, 26000.00, '2021-11-11', NULL, NULL, 'Aktif'),
(141, 'Rýdvan', 'Dilmen', 'Analist', 2, 50000.00, '2018-05-05', NULL, NULL, 'Aktif'),
(142, 'Sergen', 'Yalçýn', 'Yaratýcý Direktör', 6, 60000.00, '2019-01-20', NULL, NULL, 'Aktif'),
(143, 'Metin', 'Tekin', 'ÝK Uzmaný', 1, 32000.00, '2020-02-28', NULL, NULL, 'Aktif'),
(144, 'Ali', 'Gültiken', 'Bordro Sorumlusu', 4, 31000.00, '2021-07-15', NULL, NULL, 'Aktif'),
(145, 'Feyyaz', 'Uçar', 'Ýdari Ýþler Þefi', 1, 34000.00, '2019-12-12', NULL, NULL, 'Aktif'),
(146, 'Hagi', 'Gheorghe', 'Yazýlým Efsanesi', 2, 85000.00, '2016-08-01', NULL, NULL, 'Aktif'),
(147, 'Alex', 'DeSouza', 'Veri Mimarý', 2, 82000.00, '2017-09-01', NULL, NULL, 'Aktif'),
(148, 'Hami', 'Mandýralý', 'Kalite Kontrolcü', 12, 30000.00, '2018-11-20', NULL, NULL, 'Aktif'),
(149, 'Tanju', 'Çolak', 'Satýþ Temsilcisi', 3, 28000.00, '2020-04-10', NULL, NULL, 'Aktif'),
(150, 'Aykut', 'Kocaman', 'Operasyon Müdürü', 5, 50000.00, '2015-05-05', NULL, NULL, 'Aktif');

UPDATE Departmanlar SET yonetici_id = 1 WHERE departman_id = 1;  
UPDATE Departmanlar SET yonetici_id = 5 WHERE departman_id = 2;  
UPDATE Departmanlar SET yonetici_id = 11 WHERE departman_id = 3; 
UPDATE Departmanlar SET yonetici_id = 16 WHERE departman_id = 4; 
UPDATE Departmanlar SET yonetici_id = 19 WHERE departman_id = 5;
UPDATE Departmanlar SET yonetici_id = 28 WHERE departman_id = 6; 
UPDATE Departmanlar SET yonetici_id = 31 WHERE departman_id = 7; 
UPDATE Departmanlar SET yonetici_id = 34 WHERE departman_id = 8; 
UPDATE Departmanlar SET yonetici_id = 38 WHERE departman_id = 9; 
UPDATE Departmanlar SET yonetici_id = 40 WHERE departman_id = 10;
UPDATE Departmanlar SET yonetici_id = 43 WHERE departman_id = 11;
UPDATE Departmanlar SET yonetici_id = 45 WHERE departman_id = 12;

INSERT INTO Izinler (izin_id, calisan_id, izin_turu, baslangic, bitis, onay_durumu)
VALUES
(1, 1, 'Yýllýk Ýzin', '2024-07-10', '2024-07-24', 'Onaylandý'),
(2, 5, 'Yýllýk Ýzin', '2024-08-01', '2024-08-15', 'Onaylandý'),
(3, 12, 'Yýllýk Ýzin', '2024-06-15', '2024-06-22', 'Onaylandý'),
(4, 20, 'Yýllýk Ýzin', '2024-07-01', '2024-07-10', 'Onaylandý'),
(5, 45, 'Yýllýk Ýzin', '2024-09-01', '2024-09-14', 'Onaylandý'),
(6, 100, 'Yýllýk Ýzin', '2024-08-20', '2024-08-30', 'Onaylandý'),
(7, 8, 'Rapor', '2024-01-10', '2024-01-12', 'Onaylandý'),
(8, 35, 'Rapor', '2024-02-14', '2024-02-16', 'Onaylandý'),
(9, 60, 'Rapor', '2024-11-05', '2024-11-07', 'Onaylandý'),
(10, 88, 'Rapor', '2024-12-01', '2024-12-03', 'Onaylandý'),
(11, 22, 'Mazeret Ýzni', '2024-04-05', '2024-04-06', 'Reddedildi'),
(12, 110, 'Yýllýk Ýzin', '2024-05-10', '2024-05-20', 'Reddedildi'),
(13, 140, 'Ücretsiz Ýzin', '2024-03-01', '2024-03-15', 'Reddedildi'),
(14, 15, 'Yýllýk Ýzin', '2024-12-20', '2024-12-30', 'Bekliyor'),
(15, 75, 'Mazeret Ýzni', '2024-11-15', '2024-11-16', 'Bekliyor'),
(16, 108, 'Doðum Ýzni', '2024-06-01', '2024-09-30', 'Onaylandý'), 
(17, 98, 'Askerlik', '2024-01-01', '2024-06-30', 'Onaylandý'), 
(18, 50, 'Mazeret Ýzni', '2024-02-01', '2024-02-02', 'Onaylandý'),
(19, 50, 'Rapor', '2024-03-10', '2024-03-15', 'Onaylandý'),
(20, 50, 'Yýllýk Ýzin', '2024-08-01', '2024-08-07', 'Onaylandý'),
(21, 129, 'Ýdari Ýzin', '2024-01-02', '2024-01-05', 'Onaylandý'),
(22, 137, 'Rapor', '2024-02-20', '2024-02-28', 'Onaylandý'),
(23, 70, 'Evlilik Ýzni', '2024-09-10', '2024-09-15', 'Onaylandý'),
(24, 40, 'Ölüm Ýzni', '2024-05-05', '2024-05-07', 'Onaylandý'),
(25, 131, 'Yýllýk Ýzin', '2024-07-15', '2024-08-15', 'Onaylandý');