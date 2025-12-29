
-- Her departmanýn adý, çalýþan sayýsý ve toplam maaþ maliyeti	

SELECT
	d.departman_adi AS 'Departman Adý',
	COUNT(c.calisan_id) AS 'Çalýþan Sayýsý',
	SUM(c.maas) AS 'Toplam Maaþ'
FROM Departmanlar d
INNER JOIN Calisanlar c ON d.departman_id = c.departman_id
GROUP BY d.departman_adi;

-- Her departmanda en düþük, en yüksek ve ortalama maaþ

SELECT
	d.departman_adi AS 'Departman Adý',
	MAX(c.maas) AS 'En Yüksek Maaþ',
	MIN(c.maas) AS 'En Düþük Maaþ',
	CAST(AVG(c.maas) AS DECIMAL(10,2))  AS 'Ortalama Maaþ' 
FROM Departmanlar d
INNER JOIN Calisanlar c ON d.departman_id = c.departman_id
GROUP BY d.departman_adi;

-- Þirketten ayrýlan çalýþanlarý (Pasif olanlarýn) Adý, Soyadý, Hangi Departmanda çalýþtýðý ve Neden Çýktýðý

SELECT
	c.ad AS 'Ad',
	c.soyad AS 'Soyad',
	d.departman_adi AS 'Departman Adý',
	c.cikis_nedeni AS 'Ayrýlýþ Nedeni',
	c.isten_cikis_tarihi AS 'Ayrýlýþ Tarihi'
FROM Calisanlar c
INNER JOIN Departmanlar d ON c.departman_id = d.departman_id
WHERE c.durum = 'Pasif'

-- Þirkete 2024 yýlýnda giren (ise_giris_tarihi 2024 olan) VE maaþý 30.000 TL'den yüksek olan çalýþanlar

SELECT * FROM Calisanlar
WHERE YEAR(ise_giris_tarihi) = 2024 and maas > 30000