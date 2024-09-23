Use sys;

/* ===============================================
		           GROUP BY
   ===============================================*/
   
/*
 GROUP BY SQL ifadesi, veritabanı sorgularında belirli bir veya
 birden fazla sütuna göre satırları gruplandırmak için kullanılır.
 Genellikle aggregate (toplulaştırma) fonksiyonlar
 (COUNT(), SUM(), AVG(), MIN(), MAX() vb.) ile birlikte kullanılır.
 GROUP BY ifadesi, belirtilen sütunlardaki değerlere göre benzersiz
 gruplar oluşturur ve her grup için aggregate fonksiyonların sonuçlarını
 döndürür. Bu, veriler üzerinde özetlemeler ve analizler yapmayı sağlar.
*/

/*
 Notlar
GROUP BY kullanılırken, SELECT ifadesinde belirtilen sütunların ya gruplandırma
ifadesinde (GROUP BY kısmında) belirtilmiş olması ya da bir agregate fonksiyonunun
parçası olması gerekir.
Birden fazla sütun üzerinde gruplandırma yapılabilir. Bu durumda, sütunlar virgül
ile ayrılarak GROUP BY ifadesine eklenir.
*/

/*
*************** SYNTAX ***************
SELECT sutun_adi, SUM(adet) AS toplam_adet
FROM tablo_adi
GROUP BY sutun_adi(gruplanacak verilerin oldugu);
*/

CREATE TABLE manav (
    id INT ,
    urun_adi VARCHAR(50),
    miktar_kg DECIMAL(5, 2),
    satis_fiyati DECIMAL(7, 2),
    satis_tarihi DATE,
    kategori VARCHAR(50)
);

INSERT INTO manav (id, urun_adi, miktar_kg, satis_fiyati, satis_tarihi, kategori) VALUES
(1, 'Elma', 10.5, 315.00, '2023-01-10', 'Meyve'),
(2, 'Muz', 20.0, 600.00, '2023-01-12', 'Meyve'),
(3, 'Portakal', 15.75, 472.50, '2023-01-14', 'Meyve'),
(4, 'Domates', 25.0, 250.00, '2023-01-16', 'Sebze'),
(5, 'Biber', 10.0, 300.00, '2023-01-18', 'Sebze'),
(6, 'Patlıcan', 13.5, 202.50, '2023-01-20', 'Sebze'),
(7, 'Salatalık', 17.0, 170.00, '2023-01-22', 'Sebze'),
(8, 'Üzüm', 22.0, 660.00, '2023-01-24', 'Meyve'),
(9, 'Kavun', 30.0, 450.00, '2023-01-26', 'Meyve'),
(10, 'Karpuz', 50.0, 500.00, '2023-01-28', 'Meyve'),
(11,'Elma', 2.5, 30.00, '2023-01-12', 'Meyve'),
(12,'Muz', 2.0, 30.00, '2023-01-12', 'Meyve'),
(13,'Portakal', 3.0, 20.00, '2023-01-12', 'Meyve'),
(14,'Domates', 4.0, 10.00, '2023-01-12', 'Sebze'),
(15,'Biber', 1.5, 15.00, '2023-01-12', 'Sebze'),
(16,'Patlıcan', 2.0, 12.00, '2023-01-12', 'Sebze'),
(17,'Salatalık', 3.0, 8.00, '2023-01-12', 'Sebze'),
(18,'Üzüm', 2.5, 25.00, '2023-01-12', 'Meyve'),
(19,'Kavun', 3.5, 18.00, '2023-01-12', 'Meyve'),
(20,'Karpuz', 5.0, 22.00, '2023-01-12', 'Meyve');

SELECT * FROM manav;


/* ===============================================
		       ORDER BY
   ===============================================*/

-- ORDER BY, LIMIT VE OFFSET gibi filtreleme ifadeleri
-- database uzerinde degil bize donen sonuc uzerinde 
-- filtreleme yapar. Database de bir degisiklik yapmaz.


/*
   ORDER BY ifadesi, SQL sorgularında sonuçları belirli bir
   veya birden fazla sütuna göre sıralamak için kullanılır.
   Bu ifade, sıralama işleminin yükselen (ascending) veya 
   azalan (descending) düzeninde yapılmasını sağlar. 
   ASC anahtar kelimesi yükselen sıralamayı (dogal),
   DESC anahtar kelimesi ise azalan sıralamayı(ters) belirtir.
*/

/*
*************** SYNTAX ***************
SELECT sütun_adları
FROM tablo_adı
ORDER BY sıralanacak_sütun ASC|DESC;

*/

/*  ============================= SORU-4 =============================
    Kitaplik tablosundaki kitapları yayın yılına göre eski olanlardan
    yeni olanlara doğru sıralayiniz.
    ===================================================================
*/

SELECT kitap_adi, yayin_yili
FROM kitaplik
ORDER BY yayin_yili ASC;


/*  ============================= SORU-5 =============================
    Kitaplik tablosundaki kitapların yayın yılına göre yeni olanlardan
    eski olanlara doğru sıralayiniz.
    ===================================================================
*/

SELECT kitap_adi, yayin_yili
FROM kitaplik
ORDER BY yayin_yili DESC;


/*  ============================= SORU-6 =============================
    Kitaplik tablosundaki "Fyodor Dostoyevski"nin kitaplarını yayın 
    yılına göre eskiden gunumuze sırayiniz.
    ===================================================================
*/


SELECT kitap_adi, yayin_yili
FROM kitaplik
WHERE yazar = 'Fyodor Dostoyevski'
ORDER BY yayin_yili ASC;

/*  ============================= SORU-7 =============================
    Kitaplik tablosundaki yazarlarin isimlerini ters siralayiniz
    ===================================================================
*/

-- Tekrarli 
SELECT yazar 
FROM kitaplik
ORDER BY yazar DESC;


-- Tekrarsiz
SELECT DISTINCT yazar 
FROM kitaplik
ORDER BY yazar DESC;


/*  ============================= SORU-8 =============================
    Kitaplik tablosundaki "Lev Tolstoy" un kitaplarını isimlerine 
    göre dogal sıralayiniz.
    ===================================================================
*/

SELECT kitap_adi
FROM kitaplik
WHERE yazar = 'Lev Tolstoy'
ORDER BY kitap_adi;

-- MySQL default OrderType ASC'dir. Yazilmasa da ASC calisir.

/*  ============================= SORU-9 =============================
    Kitaplik tablosundaki yazar isimlerini ve kitaplarini 
    dogal sırayiniz.
    ===================================================================
*/ 

SELECT yazar, kitap_adi
FROM kitaplik
ORDER BY yazar ASC, kitap_adi ASC;


-- MySQL default orderType ASC'dir

-- ORDER BY komutundan sonra yazilan sutunlardan ilkinden baslanir
-- esitlik devam ediyorsa ikinciye gecilir eger esitlik bozulmussa 
-- ucuncuye gecilmez. Ancak esitlik devam ediyorsa esitlik bozulana
-- kadar var olan sutunlarda siralama yapmaya devam eder.

/*  ============================= SORU-10 =============================
    Kitaplik tablosundaki yayin yili ve yazar isimlerini ve kitaplarini 
    dogal sırayiniz.
    ===================================================================
*/

SELECT yayin_yili, yazar, kitap_adi
FROM kitaplik
ORDER BY yayin_yili, yazar, kitap_adi;


/*  ============================= SORU-11 =============================
    Kitaplik tablosundaki kitaplari yayin yilina gore gunumuzden eskiye
    ve yazar isimlerini dogal sırayiniz.
    ===================================================================
*/

SELECT kitap_adi, yayin_yili, yazar
FROM kitaplik
ORDER BY yayin_yili DESC, yazar;


/*===============================================
		      LIMIT - OFFSET
===============================================*/

/*
LIMIT ifadesi, bir sorgu sonucundan döndürülecek 
maksimum satır sayısını belirlemenizi sağlar. 
Eğer bir sorgu sonucu çok sayıda satır döndürüyorsa
 ve siz sadece bir kısmını görmek istiyorsanız, 
 LIMIT kullanabilirsiniz.
*/

/*
*************** SYNTAX ***************
SELECT * FROM tablo_adi
LIMIT 10;   -- Sonuc kumesinde olusan tablodan sadece ilk 10 datayi goster.
*/


/*
 OFFSET ifadesi, sorgu sonucu setinde bir başlangıç
 noktası belirler. 
 Bu, özellikle sayfalama işlemlerinde faydalıdır. 
 OFFSET genellikle LIMIT ile birlikte kullanılır.
*/

/*
*************** SYNTAX ***************
SELECT * FROM tablo_adi
LIMIT 10 OFFSET 20;  -- ilk 20 datayi atla sonraki 10 datayi (21 den 30) getir.
*/

/*  =============================  SORU-12 =============================
    Kitaplik tablosundan ilk 5 Kitabı listeleyiniz.
    ===================================================================
 */

SELECT * FROM kitaplik
LIMIT 5;

/*  =============================  SORU-13 =============================
    Kitaplik tablosundaki en yeni 3 Kitabı listeleyiniz.
    ===================================================================
 */

SELECT * FROM kitaplik
ORDER BY yayin_yili DESC
LIMIT 3;


-- RAND() fonksiyonu, özellikle bir tablodan rastgele kayıtlar seçmek için 
--   kullanılır.
-- ORDER BY RAND() ifadesi, tablonun satırlarını rastgele bir sıraya sokar. 
-- Bu yöntem, özellikle küçük ve orta ölçekli tablolar için uygundur. 
-- Ancak, büyük veri setleri için performans sorunlarına yol açabilir.

/*  =============================  SORU-14 =============================
    Kitaplik tablosundan rastgele 3 kitap secip listeleyiniz.
    ===================================================================
*/

SELECT * FROM kitaplik
ORDER BY RAND()
LIMIT 3;

/*  =============================  SORU-15 =============================
    Kitaplik tablosundan en eski iki kitabi listeleyiniz.
    ===================================================================
*/ 

SELECT *FROM kitaplik
ORDER BY yayin_yili ASC
LIMIT 2;

/*  =============================  SORU-16 =============================
    Kitaplik tablosundan yazari 'Fyodor Dostoyevski' olan kitapları 
    en fazla 2 tane olacak sekilde listeleyiniz.
    ===================================================================
*/

SELECT kitap_adi
FROM kitaplik
WHERE yazar ='Fyodor Dostoyevski'
LIMIT  2;


-- En eski 2 kitabini listeleyiniz.

SELECT kitap_adi, yayin_yili
FROM kitaplik
WHERE yazar ='Fyodor Dostoyevski'
ORDER BY yayin_yili ASC
LIMIT  2;


/*  =============================  SORU-17 =============================
    Kitaplik tablosundaki yayın yılına göre sıralanmış 
    kitapların 3. sayfasını listeleyiniz.
    (Her sayfanin boyutu 3 kitap ile sinirlidir.)
    ===================================================================
*/

SELECT * FROM kitaplik
ORDER BY yayin_yili
LIMIT 3 
OFFSET 6;  -- ILK 6 DATAYI ATLA SONRAKI 3 DATAYI (7. 8. 9.) LISTELE.

/*  =============================  SORU-18 =============================
    Kitaplik tablosundaki alfabetik siralanmis kitaplarin 4. sayfasını listeleyiniz.
    (Her sayfanin boyutu 2 kitap ile sinirlidir.)
    ===================================================================
*/

SELECT * FROM kitaplik
ORDER BY kitap_adi
LIMIT 2 
OFFSET 6;


/*  =============================  SORU-19 =============================
    Kitaplik tablosundaki 'Fyodor Dostoyevski' nin kitaplarinin 2. sayfasını listeleyiniz.
    (Her sayfanin boyutu 1 kitap ile sinirlidir.)
    ===================================================================
*/

SELECT * FROM kitaplik
WHERE yazar = 'Fyodor Dostoyevski'
LIMIT 1
OFFSET 1;


/*  =============================  SORU-20 =============================
    Kitaplik tablosundaki yayin yili 1950'den once olan 
    kitaplarin 1. sayfasını listeleyiniz. 
    (Her sayfanin boyutu 4 kitap ile sinirlidir.)
    ===================================================================
*/

SELECT * FROM kitaplik
WHERE yayin_yili < 1950
LIMIT 4; 