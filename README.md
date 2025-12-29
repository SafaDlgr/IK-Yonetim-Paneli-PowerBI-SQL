# 🚀 İnsan Kaynakları (İK) Yönetim Paneli - Power BI & SQL

Bu proje, ham verilerin **SQL** veritabanında yapılandırılmasından, **Power BI** üzerinde profesyonel bir iş zekası (BI) raporuna dönüştürülmesine kadar uzanan **uçtan uca (End-to-End)** bir veri analizi çalışmasıdır.

![Dashboard Ekran Görüntüsü](Ekran_Goruntusu.jpg)
*(Buraya dashboard'un ekran görüntüsünü ekleyeceksiniz)*

## 🎯 Projenin Amacı

Bir şirketin İnsan Kaynakları departmanı için kritik performans göstergelerini (KPI) takip etmek, çalışan dağılımını analiz etmek ve finansal maliyetleri görselleştirerek yönetime stratejik karar desteği sağlamaktır.

## 🛠️ Kullanılan Teknolojiler ve Yetkinlikler

### 1. SQL (Veritabanı Tasarımı & Yönetimi)
* **Veritabanı Mimarisi:** İlişkisel veritabanı (Relational Database) tasarımı ve Normalizasyon.
* **Tablo Yapısı:** `Calisanlar`, `Departmanlar`, `Bordro` ve `Izinler` tablolarının oluşturulması ve ilişkilendirilmesi (Primary Key & Foreign Key).
* **Sorgular:** Veri analizi için gelişmiş `SELECT`, `JOIN`, `GROUP BY` ve `WHERE` filtrelemeleri.

### 2. Power BI (Veri Görselleştirme & İş Zekası)
* **Veri Modelleme:** Yıldız Şema (Star Schema) yapısının kurulması.
* **DAX (Data Analysis Expressions):**
  * `CALCULATE`, `RELATED`, `FORMAT`, `COUNTROWS` gibi fonksiyonlarla dinamik ölçümlerin (Measures) yazılması.
  * *Örnek Ölçümler:* Aktif Çalışan Sayısı, Turnover (İşten Ayrılma) Oranı, Yıllık Toplam Maliyet.
* **Görselleştirme:** KPI Kartları, Azure Harita (Map), Yığılmış Çubuk Grafikler, Çizgi Grafikler.
* **UI/UX Tasarımı:** Kullanıcı dostu arayüz, koşullu biçimlendirme ve interaktif filtreler (Slicers).

## 📊 Dashboard Özellikleri

1.  **KPI Kartları:** Anlık çalışan sayısı, ortalama maaş, toplam maliyet ve bekleyen izin taleplerinin özeti.
2.  **Coğrafi Analiz (Harita):** Çalışanların Türkiye genelindeki (İstanbul, Ankara, İzmir vb.) lokasyon dağılımı.
3.  **Departman Analizi:** Hangi departmanda (IT, İK, Üretim vb.) kaç kişinin çalıştığının oransal gösterimi.
4.  **Finansal Trend:** Maaş ödemelerinin aylar bazında artış/azalış trendi (Ocak - Aralık).
5.  **İnteraktif Filtreleme:** Departman seçimine göre tüm sayfanın dinamik olarak güncellenmesi.

## 📂 Proje Dosyaları

* **`IK_Veritabani.sql`:** Veritabanını ve tabloları oluşturan kaynak SQL kodları.
* **`IK_Analiz_Projesi.pbix`:** Power BI rapor dosyası.
* **`Ekran_Goruntuleri/`:** Projeye ait görseller.

## 🚀 Kurulum

1.  `.sql` dosyasını SQL Server'da çalıştırarak veritabanını oluşturun.
2.  `.pbix` dosyasını Power BI Desktop ile açın.
3.  Veri kaynağı ayarlarından kendi sunucu adınızı (Server Name) güncelleyin.
4.  "Yenile" (Refresh) butonuna basarak verileri çekin.

---
**Geliştirici:** Safa
*Yönetim Bilişim Sistemleri Öğrencisi & Veri Analisti Adayı*