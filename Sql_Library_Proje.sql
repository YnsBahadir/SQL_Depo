-- Tabloların oluşturulması:

create table kategori(
    katID number(2) constraint kategori_katID_pk primary key,
    katAdi varchar2(30) not null
);

create table kitap(
    ISBN number(13) constraint kitap_ISBN_pk primary key,
    baslık varchar2(25) not null,
    YDil varchar2(15) default('English') not null,
    SayfaS varchar2(1000) not null,
    kategori number(2) constraint kitap_kategori_fk references kategori(katID)
);

create table yazar(
    yazarID number(10) constraint yazar_yazarID_pk primary key,
    ad varchar2(15) not null,
    soyad varchar2(20) not null,
    dogTar date,
    sehir varchar2(15) default('CORUM') not null
);

create table yayıncı(
    yayınID number(10) constraint yayıncı_yayınID_pk primary key,
    yayıncıAdi varchar2(35) not null,
    telefon number(12) not null
);

create table yazarkitap(
    ISBN number(13) constraint yazarkitap_ISBN_fk references kitap(ISBN),
    yazarID number(10) constraint yazarkitap_yazarID_fk references yazar(yazarID)
);

create table kitapyayın(
    yayınID number(10) constraint kitapyayın_yayınID_fk references yayıncı(yayınID),
    ISBN number(13) constraint kitapyayın_ISBN_fk references kitap(ISBN),
    basım_tarihi date
);

create table calısan(
    calısanNo number(6) constraint calısan_calısanNo_pk primary key,
    ad varchar2(15) not null,
    soyad varchar2(20) not null,
    sehir varchar2(12) default('GAZIMAGUSA') not null,
    telefon number(12) not null,
    maas number(6) not null,
    girisTar date,
    yoneticiNo number(6) constraint calısan_yoneticiNo_fk references calısan(calısanNo)
);

create table departman(
    depNo number(4) constraint departman_depNo_pk primary key,
    depAdi varchar2(30) not null,
    yoneticiNo number(6) constraint departman_yoneticiNo_fk references calısan(calısanNo)
);

create table uye(
    uyeID number(10) constraint uye_uyeID_pk primary key,
    ad varchar2(15) not null,
    soyad varchar2(20) not null,
    dogTar date,
    kayıtTar date,
    tel number(12) not null,
    ilce varchar2(12) default('GAZIMAGUSA') not null,
    unvan varchar2(30) default('Ogretim_Görevlisi') not null,
    ogrNo number(8) not null,
    calısanNo number(6) constraint uye_calısanNo_fk references calısan(calısanNo)
);

create table uyekitapkira(
    kNo number(10) constraint uyekitapkira_kNo_pk primary key,
    kTarihi date,
    iadeTarihi date,
    uyeID number(10) constraint uyekitapkira_uyeID_fk references uye(uyeID),
    ISBN number(13) constraint uyekitapkira_ISBN_fk references kitap(ISBN)
);



---INSERT cümlecikleri:

insert into kategori(katID, katAdi)
values(00,'Giriş');
insert into kategori(katID, katAdi)
values(01,'İlk Kat');
insert into kategori(katID, katAdi)
values(02,'Bilgisayar');
insert into kategori(katID, katAdi)
values(03,'Mimari');
insert into kategori(katID, katAdi)
values(04,'Saglık');



insert into kitap(ISBN, baslık, YDil, SayfaS, kategori)
values(9638527412684, 'İşlemcilere Giriş', 'Türkçe', '300', 02);
insert into kitap(ISBN, baslık, YDil, SayfaS, kategori)
values(1234567899876, 'Modern Architecture', 'English', '300', 03);
insert into kitap(ISBN, baslık, YDil, SayfaS, kategori)
values(9876543210123, 'Kütüphane Kuralları', 'Türkçe', '15', 00);
insert into kitap(ISBN, baslık, YDil, SayfaS, kategori)
values(1023456789123, 'Come fare la pizza?', 'Italiano', '150', 01);
insert into kitap(ISBN, baslık, YDil, SayfaS, kategori)
values(1047258369987, 'First aid', 'English', '150', 04);



insert into yazar(yazarID, ad, soyad, dogTar, sehir)
values(1234567890, 'Jacob', 'Reinherd', '12-DEC-1987', 'London');
insert into yazar(yazarID, ad, soyad, dogTar, sehir)
values(9876543210, 'Yunus', 'Bahadır', '12-DEC-2003', 'Ankara');
insert into yazar(yazarID, ad, soyad, dogTar, sehir)
values(2200046735, 'Bora', 'Sarıkaya', '03-JUN-2003', 'Izmir');
insert into yazar(yazarID, ad, soyad, dogTar, sehir)
values(3692581470, 'Lunari', 'Akkardi', '07-AUG-2003', 'Roma');
insert into yazar(yazarID, ad, soyad, dogTar, sehir)
values(1047258369, 'Jayk', 'Violet', '21-MAR-1956', 'Corum');



insert into yayıncı(yayınID, yayıncıAdi, telefon)
values(1059263478, 'Çap Yayınları', 905555555555);
insert into yayıncı(yayınID, yayıncıAdi, telefon)
values(1059263477, 'Adem Yayınları', 90444444444);
insert into yayıncı(yayınID, yayıncıAdi, telefon)
values(1059263476, 'Havva Yayınları', 905554445555);
insert into yayıncı(yayınID, yayıncıAdi, telefon)
values(1059263475, 'Veli Yayınları', 903333333333);
insert into yayıncı(yayınID, yayıncıAdi, telefon)
values(1059263474, 'Yunus Yayınları', 906666666666);



insert into yazarkitap(ISBN, yazarID)
values(9638527412684, 9876543210);
insert into yazarkitap(ISBN, yazarID)
values(1234567899876, 1234567890);
insert into yazarkitap(ISBN, yazarID)
values(9876543210123, 2200046735);
insert into yazarkitap(ISBN, yazarID)
values(1023456789123, 3692581470);
insert into yazarkitap(ISBN, yazarID)
values(1047258369987, 1047258369);



insert into kitapyayın(yayınID, ISBN, basım_Tarihi)
values(1059263478, 9638527412684, '01-DEC-2021');
insert into kitapyayın(yayınID, ISBN, basım_Tarihi)
values(1059263477, 1234567899876, '01-DEC-2021');
insert into kitapyayın(yayınID, ISBN, basım_Tarihi)
values(1059263476, 9876543210123, '09-MAY-2022');
insert into kitapyayın(yayınID, ISBN, basım_Tarihi)
values(1059263475, 1023456789123, '14-MAR-2023');
insert into kitapyayın(yayınID, ISBN, basım_Tarihi)
values(1059263474, 1047258369987, '25-DEC-2018');



insert into uye(uyeID, ad, soyad, dogTar, kayıtTar, tel, ilce, unvan, ogrNo, calısanNo)
values(2200045200, 'Yunus', 'Bahadır', '12-DEC-2003', '13-JAN-2022', 05391145653, 'Ankara', 'Ogrenci', 22000452, NULL);
insert into uye(uyeID, ad, soyad, dogTar, kayıtTar, tel, ilce, unvan, ogrNo, calısanNo)
values(2200045201, 'Bora', 'Sarıkaya', '03-JUN-2003', '05-JAN-2022', 05000000000, 'Izmir', 'Ogrenci', 22000467, NULL);
insert into uye(uyeID, ad, soyad, dogTar, kayıtTar, tel, ilce, unvan, ogrNo, calısanNo)
values(2200045202, 'Lunari', 'Akkardi', '07-AUG-2003', '19-MAY-2018', 05391145635, 'Ankara', 'Ogrenci', 22000453, NULL);
insert into uye(uyeID, ad, soyad, dogTar, kayıtTar, tel, ilce, unvan, ogrNo, calısanNo)
values(2200045203, 'Kent', 'Clark', '03-JUL-1992', '26-JUL-2013', 05000000000, 'Girne', 'Çalışan', 13000134, 600606);
insert into uye(uyeID, ad, soyad, dogTar, kayıtTar, tel, ilce, unvan, ogrNo, calısanNo)
values(2200045204, 'Zuhal', 'Uzay', '11-SEP-1980', '08-SEP-2020', 05000000011, 'Lefkosa', 'Profesör', 01000198, NULL);



insert into calısan(calısanNo, ad, soyad, sehir, telefon, maas, girisTar, yoneticiNo)
values(000007, 'Tancan', 'Uzay', 'Lefkosa', 05000000009, 400000, '24-AUG-2010', null);
insert into calısan(calısanNo, ad, soyad, sehir, telefon, maas, girisTar, yoneticiNo)
values(600606, 'Kent', 'Clark', 'Girne', 05000000000, 200000, '27-JUL-2013', 000007);
insert into calısan(calısanNo, ad, soyad, sehir, telefon, maas, girisTar, yoneticiNo)
values(000010, 'Dave', 'Kılıc', 'Mersin', 05000000123, 200000, '03-AUG-2011', 000007);
insert into calısan(calısanNo, ad, soyad, sehir, telefon, maas, girisTar, yoneticiNo)
values(000011, 'Ryan', 'Kalkan', 'London', 05000000124, 300000, '02-SEP-2012', 000007);
insert into calısan(calısanNo, ad, soyad, sehir, telefon, maas, girisTar, yoneticiNo)
values(000012, 'Rastan', 'Mızrak', 'Karpaz', 05000000125, 190000, '01-AUG-2013', 000007);



insert into departman(depNo, depAdi, yoneticiNo)
values(4444, 'Khada Jhin', 600606);
insert into departman(depNo, depAdi, yoneticiNo)
values(1234, 'Master', 000007);
insert into departman(depNo, depAdi, yoneticiNo)
values(1235, 'Sihirdar', 000007);
insert into departman(depNo, depAdi, yoneticiNo)
values(1236, 'Neeko', 600606);
insert into departman(depNo, depAdi, yoneticiNo)
values(1237, 'Depo', 000011);



select * from uyekitapkira
insert into uyekitapkira(kNo, kTarihi, iadeTarihi, uyeID, ISBN)
values(1, '01-SEP-2019', '16-SEP-2019', 2200045202, 1023456789123);
insert into uyekitapkira(kNo, kTarihi, iadeTarihi, uyeID, ISBN)
values(3, '01-SEP-2019', '16-SEP-2019', 2200045202, 9638527412684);
insert into uyekitapkira(kNo, kTarihi, iadeTarihi, uyeID, ISBN)
values(2, '07-AUG-2023', '23-AUG-2023', 2200045200, 1023456789123);
insert into uyekitapkira(kNo, kTarihi, iadeTarihi, uyeID, ISBN)
values(4, '07-AUG-2023', '23-AUG-2023', 2200045200, 9638527412684);
insert into uyekitapkira(kNo, kTarihi, iadeTarihi, uyeID, ISBN)
values(5, '01-JUN-2022', '16-JUN-2022', 2200045201, 9876543210123);


---Delete Table:

delete from uye
where upper(ad) = 'ZUHAL';

---Alter Sütun ADD/Update

alter table uye
add cinsiyet char(1) constraint ogrenci_cinsiyet_ck check(upper(cinsiyet) in('E','K'));

update uye
set cinsiyet = 'E'
where uyeID = 2200045200;

update uye
set cinsiyet = 'K'
where uyeID = 2200045202;

update uye
set cinsiyet = 'K'
where uyeID = 2200045204;

update uye
set cinsiyet = 'E'
where uyeID = 2200045201;

update uye
set cinsiyet = 'E'
where uyeID = 2200045203;

--Drop table örnek

drop table kategori;


--Sorgular



Bir yayıncının bastığı kitapları listeleme:

SELECT y.yayıncıAdi, k.baslık, ky.basım_tarihi
FROM yayıncı y
JOIN kitapyayın ky ON y.yayınID = ky.yayınID
JOIN kitap k ON ky.ISBN = k.ISBN;

Bir yazarın yazdığı kitapları listeleme:

SELECT y.ad, y.soyad, k.baslık
FROM yazar y
JOIN yazarkitap yk ON y.yazarID = yk.yazarID
JOIN kitap k ON yk.ISBN = k.ISBN;

Bir çalışanın bağlı olduğu departmanı bulma:

SELECT c.ad, c.soyad, d.depAdi
FROM calısan c
JOIN departman d ON c.yoneticiNo = d.yoneticiNo;

Kiralanma işlemlerinde kitapların isimlerini, kiralama tarihini ve iade tarihini listeleyiniz.

SELECT k.baslık, uk.kTarihi, uk.iadeTarihi
FROM uye u
JOIN uyekitapkira uk ON u.uyeID = uk.uyeID
JOIN kitap k ON uk.ISBN = k.ISBN;

Ankaradan gelen uyelerin isim, soyisim ve doğum tarihlerini listeleyen sorgu:

select ad, soyad, ilce
from uye
where upper(ilce) = 'ANKARA';
