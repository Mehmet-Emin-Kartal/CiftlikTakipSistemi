INSERT INTO Employees (FullName, Role, HireDate, Salary, JobDescription) VALUES 
('Ahmet Yýlmaz', 'Çiftlik Müdürü', '2024-01-01', 75000.00, 'Genel operasyon, finansal yönetim ve idari yönetimden sorumlu.'),
('Mehmet Demir', 'Veteriner Tekniker', '2024-01-01', 65000.00, 'Hayvan saðlýðý günlük taramasý ve veteriner hekime asistanlýk.'),
('Vet. Selim Aras', 'Dýþ Veteriner', '2024-01-01', 55000.00, 'Dýþarýdan hizmet veren uzman hekim; operasyonlar, doðum ve aþý takibi.'),
('Hüseyin Kaya', 'Yem Sorumlusu', '2024-01-01', 40000.00, 'Hayvan rasyonu hazýrlama, depo yönetimi ve stok takibi.'),
('Mustafa Yýldýz', 'Saðým Operatörü', '2024-01-01', 38000.00, 'Sabah ve akþam saðým makinelerinin yönetimi ve temizliði.'),
('Recep Aydýn', 'Saðým Operatörü', '2024-01-01', 38000.00, 'Sabah ve akþam saðým makinelerinin yönetimi ve temizliði.'),
('Fatma Ak', 'Bakýcý', '2024-01-01', 35000.00, 'Doðumhane takibi, yeni doðan buzaðý besleme ve bakým sorumlusu.'),
('Ali Kurt', 'Bakýcý', '2024-01-01', 35000.00, 'Ahýr düzeni, hayvan refahý ve genel temizlik iþleri.'),
('Osman Can', 'Gece Bekçisi', '2024-01-01', 35000.00, 'Gece güvenliði, doðum ve acil durumlarýn telsizle bildirilmesi.');

-- 100 ADET ANAÇ ÝNEK (2024 BAÞI GÝRÝÞLÝ)
DECLARE @i INT = 1;
WHILE @i <= 100
BEGIN
    INSERT INTO Animals (EarTagNumber, Breed, BirthDate, EntryDate, CurrentStatus, LactationCount)
    VALUES (
        'TR-34-' + RIGHT('000' + CAST(@i AS VARCHAR), 3), 
        'Holstein', 
        DATEADD(MONTH, - (36 + (@i % 12)), '2024-01-01'), 
        '2024-01-01', 
        'Sagmal', 
        2 
    );
    SET @i = @i + 1;
END


-- 3. TABLO: 11 ALICI (10 Süt Maðazasý + 1 Besi Çiftliði)
INSERT INTO BuyingCompanies (CompanyName, TaxNumber, ContactInfo) VALUES 
('Marmara Süt Fabrikasý', 'TAX-101', 'Ýstanbul - Süt Alýcýsý'),
('Ege Mandýra Ltd.', 'TAX-102', 'Ýzmir - Süt Alýcýsý'),
('Anadolu Gýda A.Þ.', 'TAX-103', 'Ankara - Süt Alýcýsý'),
('Trakya Peynir Dünyasý', 'TAX-104', 'Edirne - Süt Alýcýsý'),
('Akçaabat Mandýra', 'TAX-105', 'Trabzon - Süt Alýcýsý'),
('Þehir Marketler Grubu', 'TAX-106', 'Bursa - Süt Alýcýsý'),
('Güney Süt Entegre', 'TAX-107', 'Adana - Süt Alýcýsý'),
('Butik Gurme Süt', 'TAX-108', 'Muðla - Süt Alýcýsý'),
('Öz Süt Üretim', 'TAX-109', 'Konya - Süt Alýcýsý'),
('Merkez Þarküteri', 'TAX-110', 'Kayseri - Süt Alýcýsý'),
('Yavuz Besi Çiftliði', 'TAX-200', 'Balýkesir - ERKEK BUZAÐI TEK ALICISI'); -- 11. Kayýt

-- 4. TABLO: YEM STOKLARI (AMBAR GÝRÝÞÝ)
INSERT INTO FeedStock (FeedName, CurrentQuantity, CriticalLevel, Unit) VALUES 
('Mýsýr Silajý', 200000.00, 15000.00, 'kg'),
('Yonca Otu', 60000.00, 5000.00, 'kg'),
('Saman (Balya)', 50000.00, 4000.00, 'kg'),
('Süt Yemi (Fabrika)', 40000.00, 3000.00, 'kg'),
('Buzaðý Yemi', 15000.00, 1500.00, 'kg');



-- 1. GRUP (1-20 arasý inekler): Ocak 2024'te doðuracaklar (Süt üretimi hemen baþlýyor)
INSERT INTO Breeding (AnimalID, InseminationDate, PregnancyConfirmed, ExpectedBirthDate)
SELECT AnimalID, '2023-04-10', 1, '2024-01-15' FROM Animals WHERE AnimalID BETWEEN 1 AND 20;

-- 2. GRUP (21-40 arasý inekler): Mart 2024'te doðuracaklar
INSERT INTO Breeding (AnimalID, InseminationDate, PregnancyConfirmed, ExpectedBirthDate)
SELECT AnimalID, '2023-06-15', 1, '2024-03-22' FROM Animals WHERE AnimalID BETWEEN 21 AND 40;

-- 3. GRUP (41-60 arasý inekler): Mayýs 2024'te doðuracaklar
INSERT INTO Breeding (AnimalID, InseminationDate, PregnancyConfirmed, ExpectedBirthDate)
SELECT AnimalID, '2023-08-10', 1, '2024-05-18' FROM Animals WHERE AnimalID BETWEEN 41 AND 60;

-- 4. GRUP (61-80 arasý inekler): Temmuz 2024'te doðuracaklar
INSERT INTO Breeding (AnimalID, InseminationDate, PregnancyConfirmed, ExpectedBirthDate)
SELECT AnimalID, '2023-10-12', 1, '2024-07-20' FROM Animals WHERE AnimalID BETWEEN 61 AND 80;

-- 5. GRUP (81-100 arasý inekler): Eylül 2024'te doðuracaklar
INSERT INTO Breeding (AnimalID, InseminationDate, PregnancyConfirmed, ExpectedBirthDate)
SELECT AnimalID, '2023-12-05', 1, '2024-09-12' FROM Animals WHERE AnimalID BETWEEN 81 AND 100;




-- 1. GRUP (1-20 arasý inekler): Ocak 2024'te doðuracaklar (Süt üretimi hemen baþlýyor)
INSERT INTO Breeding (AnimalID, InseminationDate, PregnancyConfirmed, ExpectedBirthDate)
SELECT AnimalID, '2023-04-10', 1, '2024-01-15' FROM Animals WHERE AnimalID BETWEEN 1 AND 20;

-- 2. GRUP (21-40 arasý inekler): Mart 2024'te doðuracaklar
INSERT INTO Breeding (AnimalID, InseminationDate, PregnancyConfirmed, ExpectedBirthDate)
SELECT AnimalID, '2023-06-15', 1, '2024-03-22' FROM Animals WHERE AnimalID BETWEEN 21 AND 40;

-- 3. GRUP (41-60 arasý inekler): Mayýs 2024'te doðuracaklar
INSERT INTO Breeding (AnimalID, InseminationDate, PregnancyConfirmed, ExpectedBirthDate)
SELECT AnimalID, '2023-08-10', 1, '2024-05-18' FROM Animals WHERE AnimalID BETWEEN 41 AND 60;

-- 4. GRUP (61-80 arasý inekler): Temmuz 2024'te doðuracaklar
INSERT INTO Breeding (AnimalID, InseminationDate, PregnancyConfirmed, ExpectedBirthDate)
SELECT AnimalID, '2023-10-12', 1, '2024-07-20' FROM Animals WHERE AnimalID BETWEEN 61 AND 80;

-- 5. GRUP (81-100 arasý inekler): Eylül 2024'te doðuracaklar
INSERT INTO Breeding (AnimalID, InseminationDate, PregnancyConfirmed, ExpectedBirthDate)
SELECT AnimalID, '2023-12-05', 1, '2024-09-12' FROM Animals WHERE AnimalID BETWEEN 81 AND 100;



-- 2024 YILI DOÐUMLARI (100 ADET)
-- Grup 1: Ocak
INSERT INTO Calves (MotherID, BirthDate, Gender, BirthWeight, CurrentStatus)
SELECT AnimalID, '2024-01-15', 'Diþi', 38.0, 'Sürüde' FROM Animals WHERE AnimalID BETWEEN 1 AND 10;
INSERT INTO Calves (MotherID, BirthDate, Gender, BirthWeight, CurrentStatus)
SELECT AnimalID, '2024-01-15', 'Erkek', 41.0, 'Satýldý' FROM Animals WHERE AnimalID BETWEEN 11 AND 20;

-- Grup 2: Mart
INSERT INTO Calves (MotherID, BirthDate, Gender, BirthWeight, CurrentStatus)
SELECT AnimalID, '2024-03-22', 'Diþi', 38.0, 'Sürüde' FROM Animals WHERE AnimalID BETWEEN 21 AND 30;
INSERT INTO Calves (MotherID, BirthDate, Gender, BirthWeight, CurrentStatus)
SELECT AnimalID, '2024-03-22', 'Erkek', 41.0, 'Satýldý' FROM Animals WHERE AnimalID BETWEEN 31 AND 40;

-- Grup 3: Mayýs
INSERT INTO Calves (MotherID, BirthDate, Gender, BirthWeight, CurrentStatus)
SELECT AnimalID, '2024-05-18', 'Diþi', 38.0, 'Sürüde' FROM Animals WHERE AnimalID BETWEEN 41 AND 50;
INSERT INTO Calves (MotherID, BirthDate, Gender, BirthWeight, CurrentStatus)
SELECT AnimalID, '2024-05-18', 'Erkek', 41.0, 'Satýldý' FROM Animals WHERE AnimalID BETWEEN 51 AND 60;

-- Grup 4: Temmuz
INSERT INTO Calves (MotherID, BirthDate, Gender, BirthWeight, CurrentStatus)
SELECT AnimalID, '2024-07-20', 'Diþi', 38.0, 'Sürüde' FROM Animals WHERE AnimalID BETWEEN 61 AND 70;
INSERT INTO Calves (MotherID, BirthDate, Gender, BirthWeight, CurrentStatus)
SELECT AnimalID, '2024-07-20', 'Erkek', 41.0, 'Satýldý' FROM Animals WHERE AnimalID BETWEEN 71 AND 80;

-- Grup 5: Eylül
INSERT INTO Calves (MotherID, BirthDate, Gender, BirthWeight, CurrentStatus)
SELECT AnimalID, '2024-09-12', 'Diþi', 38.0, 'Sürüde' FROM Animals WHERE AnimalID BETWEEN 81 AND 90;
INSERT INTO Calves (MotherID, BirthDate, Gender, BirthWeight, CurrentStatus)
SELECT AnimalID, '2024-09-12', 'Erkek', 41.0, 'Satýldý' FROM Animals WHERE AnimalID BETWEEN 91 AND 100;

-- 2025 YILI DOÐUMLARI (100 ADET - AYNI GRUPLAR TEKRAR DOÐURUYOR)
INSERT INTO Calves (MotherID, BirthDate, Gender, BirthWeight, CurrentStatus)
SELECT AnimalID, '2025-01-15', 'Diþi', 39.0, 'Sürüde' FROM Animals WHERE AnimalID BETWEEN 1 AND 10;
INSERT INTO Calves (MotherID, BirthDate, Gender, BirthWeight, CurrentStatus)
SELECT AnimalID, '2025-01-15', 'Erkek', 42.0, 'Satýldý' FROM Animals WHERE AnimalID BETWEEN 11 AND 20;

INSERT INTO Calves (MotherID, BirthDate, Gender, BirthWeight, CurrentStatus)
SELECT AnimalID, '2025-03-22', 'Diþi', 39.0, 'Sürüde' FROM Animals WHERE AnimalID BETWEEN 21 AND 30;
INSERT INTO Calves (MotherID, BirthDate, Gender, BirthWeight, CurrentStatus)
SELECT AnimalID, '2025-03-22', 'Erkek', 42.0, 'Satýldý' FROM Animals WHERE AnimalID BETWEEN 31 AND 40;

INSERT INTO Calves (MotherID, BirthDate, Gender, BirthWeight, CurrentStatus)
SELECT AnimalID, '2025-05-18', 'Diþi', 39.0, 'Sürüde' FROM Animals WHERE AnimalID BETWEEN 41 AND 50;
INSERT INTO Calves (MotherID, BirthDate, Gender, BirthWeight, CurrentStatus)
SELECT AnimalID, '2025-05-18', 'Erkek', 42.0, 'Satýldý' FROM Animals WHERE AnimalID BETWEEN 51 AND 60;

INSERT INTO Calves (MotherID, BirthDate, Gender, BirthWeight, CurrentStatus)
SELECT AnimalID, '2025-07-20', 'Diþi', 39.0, 'Sürüde' FROM Animals WHERE AnimalID BETWEEN 61 AND 70;
INSERT INTO Calves (MotherID, BirthDate, Gender, BirthWeight, CurrentStatus)
SELECT AnimalID, '2025-07-20', 'Erkek', 42.0, 'Satýldý' FROM Animals WHERE AnimalID BETWEEN 71 AND 80;

INSERT INTO Calves (MotherID, BirthDate, Gender, BirthWeight, CurrentStatus)
SELECT AnimalID, '2025-09-12', 'Diþi', 39.0, 'Sürüde' FROM Animals WHERE AnimalID BETWEEN 81 AND 90;
INSERT INTO Calves (MotherID, BirthDate, Gender, BirthWeight, CurrentStatus)
SELECT AnimalID, '2025-09-12', 'Erkek', 42.0, 'Satýldý' FROM Animals WHERE AnimalID BETWEEN 91 AND 100;



-- SQL Server (MS SQL) Uyumlu 2 Yýllýk Süt Üretim Sorgusu
DECLARE @StartDate DATE = '2024-01-01';
DECLARE @EndDate DATE = '2025-12-31';

-- Tarihleri geçici olarak oluþturmak için bir sayý tablosu kullanýyoruz
;WITH TarihDöngüsü AS (
    SELECT @StartDate AS Tarih
    UNION ALL
    SELECT DATEADD(DAY, 1, Tarih)
    FROM TarihDöngüsü
    WHERE Tarih < @EndDate
)
INSERT INTO DailyMilkProduction (AnimalID, ProductionDate, Session, AmountLitres, IsSaleable)
SELECT 
    a.AnimalID,
    t.Tarih,
    s.Session,
    CASE WHEN s.Session = 'Sabah' THEN 14.5 ELSE 12.5 END AS Litre,
    1
FROM Animals a
CROSS JOIN TarihDöngüsü t
CROSS JOIN (SELECT 'Sabah' AS Session UNION ALL SELECT 'Akþam') s
WHERE 
    -- Senin meþhur 5 periyotlu 80-20 kuralýn:
    (MONTH(t.Tarih) IN (1, 2) AND a.AnimalID > 20) OR
    (MONTH(t.Tarih) IN (3, 4) AND (a.AnimalID <= 20 OR a.AnimalID > 40)) OR
    (MONTH(t.Tarih) IN (5, 6) AND (a.AnimalID <= 40 OR a.AnimalID > 60)) OR
    (MONTH(t.Tarih) IN (7, 8) AND (a.AnimalID <= 60 OR a.AnimalID > 80)) OR
    (MONTH(t.Tarih) IN (9, 10, 11, 12) AND a.AnimalID <= 80)
OPTION (MAXRECURSION 0); -- 730 günlük döngü için bu þart




-- 15. TABLO: TANKA SÜT GÝRÝÞÝ (HATA DÜZELTÝLMÝÞ)
INSERT INTO MilkTank (CurrentVolume, EntryExitAmount, Temperature, LastCleanedDate)
SELECT 
    DailyTotal AS CurrentVolume,  -- O gün tankta biriken miktar
    DailyTotal AS EntryExitAmount, -- Giren miktar
    3.8 AS Temperature,           -- Soðutma derecesi
    ProdDate                      -- Tarih
FROM (
    -- Önce her günün toplamýný bir kenarda hesaplýyoruz
    SELECT 
        CAST(ProductionDate AS DATE) as ProdDate, 
        SUM(AmountLitres) as DailyTotal
    FROM DailyMilkProduction
    WHERE IsSaleable = 1
    GROUP BY CAST(ProductionDate AS DATE)
) AS SubQuery
ORDER BY ProdDate;



-- 5. TABLO: 2 YILLIK TOPLU SATIÞ KAYDI (TANKTAN SATIÞA)
INSERT INTO MilkSales (CompanyID, SaleDate, AmountLitres, UnitPrice, IsPaid)
SELECT 
    (ABS(CHECKSUM(NEWID())) % 10) + 1 AS CompanyID, -- 10 mandýraya rastgele daðýtým
    LastCleanedDate AS SaleDate,                    -- Tanktaki kayýt tarihi satýþ tarihimiz
    EntryExitAmount AS AmountLitres,                -- Tanktaki toplam günlük süt
    CASE 
        WHEN YEAR(LastCleanedDate) = 2024 THEN 15.50 
        ELSE 19.50 
    END AS UnitPrice,                               -- Yýla göre birim fiyat
    1 AS IsPaid                                     -- Tahsilat tamam
FROM MilkTank;



-- 7. TABLO: 2 YILLIK YEM TÜKETÝM KAYDI
INSERT INTO FeedConsumption (FeedID, ConsumptionDate, AnimalGroup, QuantityUsed)
SELECT 
    f.FeedID,
    t.Tarih,
    CASE WHEN a.AnimalID <= 80 THEN 'Saðmal Grup' ELSE 'Kuru Dönem' END AS AnimalGroup,
    CASE 
        WHEN f.FeedID = 4 THEN 12.5 -- Süt Yemi (80 saðmal için günlük 12.5 kg)
        WHEN f.FeedID = 1 THEN 25.0 -- Mýsýr Silajý
        WHEN f.FeedID = 5 THEN 3.0  -- Buzaðý Yemi (Sadece buzaðý varsa kullanýlýr ama sisteme iþleyelim)
        ELSE 5.0                    -- Saman ve Yonca
    END AS Miktar
FROM FeedStock f
CROSS JOIN (
    -- 2024 ve 2025 yýllarýný kapsayan gün döngüsü
    SELECT TOP 731 DATEADD(DAY, ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) - 1, '2024-01-01') AS Tarih
    FROM sys.messages s1 CROSS JOIN sys.messages s2
) t
CROSS JOIN (SELECT TOP 100 AnimalID FROM Animals) a
WHERE t.Tarih <= '2025-12-31';




-- 8. TABLO: 2 YILLIK VETERÝNER TEDAVÝ KAYITLARINI OLUÞTURMA
INSERT INTO VetTreatments (AnimalID, Diagnosis, MedicineName, StartDate, EndDate, MilkWithdrawalDays)
SELECT TOP 60
    A.AnimalID,
    CASE (ABS(CHECKSUM(NEWID())) % 3) 
        WHEN 0 THEN 'Mastit (Meme Ýltihabý)'
        WHEN 1 THEN 'Ayak Yarasý / Topallýk'
        ELSE 'Þiþkinlik / Sindirim Sorunu' 
    END AS Diagnosis,
    CASE (ABS(CHECKSUM(NEWID())) % 3) 
        WHEN 0 THEN 'Antibiyotik-X'
        WHEN 1 THEN 'Merhem-Y'
        ELSE 'Vitamin-Z' 
    END AS MedicineName,
    DATEADD(DAY, (ABS(CHECKSUM(NEWID())) % 730), '2024-01-01') AS StartDate,
    NULL AS EndDate, -- Daha sonra güncellenebilir
    CASE (ABS(CHECKSUM(NEWID())) % 2) 
        WHEN 0 THEN 5 -- 5 gün sütü dökülecek
        ELSE 0 -- Süt dökülmesine gerek yok (vitamin vb.)
    END AS MilkWithdrawalDays
FROM Animals A
CROSS JOIN (SELECT TOP 10 * FROM sys.objects) O -- Rastgelelik için
ORDER BY NEWID();

-- EndDate'i StartDate'den 3-5 gün sonrasý olacak þekilde güncelleyelim
UPDATE VetTreatments SET EndDate = DATEADD(DAY, 4, StartDate) WHERE EndDate IS NULL;



-- Vaccinations tablosuna buzaðýlarý da kabul etmesi için bir sütun ekle
ALTER TABLE Vaccinations ADD CalfID INT NULL;

-- 1. KISIM: Yetiþkin Ýneklerin (Animals) 2024-2025 Aþýlarý
INSERT INTO Vaccinations (AnimalID, VaccineName, ApplicationDate, NextDueDate)
SELECT AnimalID, 'Þap Aþýsý (Karma)', '2024-04-10', '2024-10-10' FROM Animals
UNION ALL
SELECT AnimalID, 'LSD (Çiçek) Aþýsý', '2024-11-15', '2025-05-15' FROM Animals
UNION ALL
SELECT AnimalID, 'Þap Aþýsý (Karma)', '2025-04-20', '2025-10-20' FROM Animals;

-- 2. KISIM: Diþi Buzaðýlarýn (Calves) Bebeklik Aþýlarý
-- Sadece Diþi olan ve satýlmayan buzaðýlarý kapsar
INSERT INTO Vaccinations (CalfID, VaccineName, ApplicationDate, NextDueDate)
SELECT 
    CalfID, 
    'Karma Buzaðý Aþýsý', 
    DATEADD(MONTH, 3, BirthDate), -- Doðumdan 3 ay sonraki tarih
    DATEADD(MONTH, 9, BirthDate)  -- Ýlk dozdan 6 ay sonraki tarih
FROM Calves
WHERE Gender = 'Diþi' AND CurrentStatus != 'Satýldý';







-- 11. TABLO: SENÝN SÜTUN ÝSÝMLERÝNE GÖRE SÜT ANALÝZÝ
INSERT INTO [cýftlýk1].[dbo].[MilkAnalysis] (AnalysisDate, FatRate, ProteinRate, BacteriaCount, QualityGrade)
SELECT 
    DATEADD(MONTH, n, '2024-01-15') AS AnalysisDate, 
    CAST((3.5 + (ABS(CHECKSUM(NEWID())) % 15) / 10.0) AS DECIMAL(4,2)) AS FatRate, -- FatPercentage yerine FatRate
    CAST((3.0 + (ABS(CHECKSUM(NEWID())) % 10) / 10.0) AS DECIMAL(4,2)) AS ProteinRate, -- ProteinPercentage yerine ProteinRate
    (10000 + (ABS(CHECKSUM(NEWID())) % 40000)) AS BacteriaCount,
    CASE 
        WHEN (ABS(CHECKSUM(NEWID())) % 3) = 0 THEN 'A Sýnýfý' 
        WHEN (ABS(CHECKSUM(NEWID())) % 3) = 1 THEN 'B Sýnýfý' 
        ELSE 'C Sýnýfý' 
    END AS QualityGrade -- Senin tablandaki sütun
FROM (SELECT TOP 24 ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) - 1 AS n FROM sys.objects) AS Months;







-- 12. TABLO: GENEL GÝDERLERÝ DOLDURMA (2024-2025)
INSERT INTO GeneralExpenses (ExpenseType, ExpenseDate, Amount, Description)

-- A. Maaþlar (Her ayýn 5'inde toplu ödeme)
SELECT 
    'Personel Maaþý', 
    DATEADD(MONTH, n, '2024-01-05') AS ExpenseDate, 
    85000.00 AS Amount, 
    'Tüm personel kadrosu aylýk maaþ ödemesi'
FROM (SELECT TOP 24 ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) - 1 AS n FROM sys.objects) AS Months

UNION ALL

-- B. Yem Alýmý (3 ayda bir büyük parti alým)
SELECT 
    'Yem Alýmý', 
    DATEADD(MONTH, n*3, '2024-02-15') AS ExpenseDate, 
    150000.00 AS Amount, 
    'Konsantre yem ve kaba yem stok yenileme'
FROM (SELECT TOP 8 ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) - 1 AS n FROM sys.objects) AS Quarters

UNION ALL

-- C. Faturalar (Elektrik ve Su)
SELECT 
    'Fatura (Elk/Su)', 
    DATEADD(MONTH, n, '2024-01-20') AS ExpenseDate, 
    (10000 + (ABS(CHECKSUM(NEWID())) % 5000)) AS Amount, 
    'Saðýmhane ve ahýr enerji/su gideri'
FROM (SELECT TOP 24 ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) - 1 AS n FROM sys.objects) AS Months;




-- 14. ANIMAL EVENTS (80/20 Döngüsüyle Uyumlu)
-- Ýlk 20 hayvanýn kuruya ayrýlma olayý (Dinlenme)
INSERT INTO AnimalEvents (AnimalID, EmployeeID, EventType, EventDate, Description)
SELECT TOP 20
    AnimalID,
    (SELECT TOP 1 EmployeeID FROM Employees WHERE Role LIKE '%Bakýcý%' OR Role LIKE '%Veteriner%') AS EmployeeID,
    'Kuruya Ayýrma',
    DATEADD(MONTH, -2, GETDATE()), -- 2 ay önce kuruya alýndýlar
    'Laktasyon dönemi bitti, dinlenme evresine (kuru dönem) geçiþ yapýldý.'
FROM Animals ORDER BY AnimalID ASC;

-- Diðer 80 hayvanýn saðým baþlangýç (Doðum) olaylarý
INSERT INTO AnimalEvents (AnimalID, EmployeeID, EventType, EventDate, Description)
SELECT TOP 80
    AnimalID,
    (SELECT TOP 1 EmployeeID FROM Employees WHERE Role LIKE '%Bakýcý%' OR Role LIKE '%Veteriner%') AS EmployeeID,
    'Doðum / Saðým Baþlangýcý',
    DATEADD(DAY, -15, GETDATE()), -- Yakýn zamanda doðum yapýp saðýma geçtiler
    'Baþarýlý doðum sonrasý taze gruba alýndý ve saðým döngüsü baþladý.'
FROM Animals ORDER BY AnimalID DESC;





-- 19. ANIMAL STATUS HISTORY (80/20 Rotasyon Kaydý)
-- Kurudaki 20 hayvanýn geçmiþi
INSERT INTO AnimalStatusHistory (AnimalID, StatusChangeDate, OldStatus, NewStatus, Reason)
SELECT TOP 20
    AnimalID,
    DATEADD(MONTH, -2, GETDATE()),
    'Saðmal',
    'Kuru',
    '80/20 Rotasyon planý gereði dinlenme dönemi.'
FROM Animals ORDER BY AnimalID ASC;

-- Saðýmdaki 80 hayvanýn geçmiþi
INSERT INTO AnimalStatusHistory (AnimalID, StatusChangeDate, OldStatus, NewStatus, Reason)
SELECT TOP 80
    AnimalID,
    DATEADD(DAY, -15, GETDATE()),
    'Kuru',
    'Saðmal',
    'Doðum tamamlandý, laktasyon (süt verme) döngüsüne girildi.'
FROM Animals ORDER BY AnimalID DESC;





-- AnimalEvents tarihlerini 1 yýl geriye çek (2025'e düþsünler)
UPDATE AnimalEvents 
SET EventDate = DATEADD(YEAR, -1, EventDate)
WHERE YEAR(EventDate) >= 2026;

-- AnimalStatusHistory tarihlerini 1 yýl geriye çek
UPDATE AnimalStatusHistory 
SET StatusChangeDate = DATEADD(YEAR, -1, StatusChangeDate)
WHERE YEAR(StatusChangeDate) >= 2026;



-- Tabloyu sýfýrla
TRUNCATE TABLE AnimalEvents;

-- A) 2023 TOHUMLAMALARI (Hayvanlar bize gebe gelmeden önceki kayýtlar)
INSERT INTO AnimalEvents (AnimalID, EmployeeID, EventType, EventDate, Description)
SELECT AnimalID, 1, 'Tohumlama', InseminationDate, 'Satýn alýnmadan önce yapýlan baþarýlý tohumlama kaydý.'
FROM Breeding;

-- B) 1 OCAK 2024 ÇÝFTLÝÐE GÝRÝÞ
INSERT INTO AnimalEvents (AnimalID, EmployeeID, EventType, EventDate, Description)
SELECT AnimalID, 1, 'Sürüye Katýlým', '2024-01-01', 'Anaç inek gebe/saðmal olarak sürüye dahil edildi.'
FROM Animals WHERE AnimalID <= 100;

-- C) 2024-2025 DOÐUMLARI
INSERT INTO AnimalEvents (AnimalID, EmployeeID, EventType, EventDate, Description)
SELECT MotherID, 1, 'Doðum', BirthDate, 'Planlý doðum gerçekleþti. Buzaðý küpelendi.'
FROM Calves;




-- Tabloyu sýfýrla
TRUNCATE TABLE AnimalEvents;

-- 1. ADIM: 100 ANAÇ HAYVANIN GÝRÝÞÝ (100 Satýr)
INSERT INTO AnimalEvents (AnimalID, EmployeeID, EventType, EventDate, Description)
SELECT AnimalID, 1, 'Sürüye Katýlým', '2024-01-01', 'Anaç inek sürüye dahil edildi.'
FROM Animals WHERE AnimalID <= 100;

-- 2. ADIM: 200 BUZAÐININ DOÐUM ANI (200 Satýr)
INSERT INTO AnimalEvents (AnimalID, EmployeeID, EventType, EventDate, Description)
SELECT MotherID, 1, 'Doðum', BirthDate, 'Doðum gerçekleþti. Buzaðý kaydý yapýldý.'
FROM Calves;

-- ÞÝMDÝ KONTROL ET REÝS:
-- SELECT COUNT(*) FROM AnimalEvents;  --> Burasý tam 300 verecek.




-- Tabloyu sýfýrla
TRUNCATE TABLE AnimalEvents;

-- 1. ADIM: 100 ANAÇ HAYVANIN GÝRÝÞÝ (100 Satýr)
INSERT INTO AnimalEvents (AnimalID, EmployeeID, EventType, EventDate, Description)
SELECT AnimalID, 1, 'Sürüye Katýlým', '2024-01-01', 'Anaç inek sürüye dahil edildi.'
FROM Animals WHERE AnimalID <= 100;

-- 2. ADIM: 200 BUZAÐI DOÐUMU (100 Diþi Sürüye, 100 Erkek Satýþa)
-- Diþiler için (100 Satýr)
INSERT INTO AnimalEvents (AnimalID, EmployeeID, EventType, EventDate, Description)
SELECT MotherID, 1, 'Doðum', BirthDate, 'Diþi buzaðý doðdu, sürüye katýldý.'
FROM Calves WHERE Gender = 'Diþi';

-- Erkekler için (100 Satýr)
INSERT INTO AnimalEvents (AnimalID, EmployeeID, EventType, EventDate, Description)
SELECT MotherID, 1, 'Doðum ve Satýþ', BirthDate, 'Erkek buzaðý doðdu ve ayný gün iþletme dýþýna satýldý.'
FROM Calves WHERE Gender = 'Erkek';

-- KONTROL: SELECT COUNT(*) FROM AnimalEvents; -- TAM 300 SATIR!




-- Tabloyu sýfýrla
TRUNCATE TABLE AnimalStatusHistory;

-- 1. ADIM: 100 ANAÇ HAYVANIN ÝLK GÝRÝÞ STATÜSÜ (100 Satýr)
INSERT INTO AnimalStatusHistory (AnimalID, StatusChangeDate, OldStatus, NewStatus, Reason)
SELECT 
    AnimalID, 
    '2024-01-01', 
    'Yeni Kayýt', 
    'Sagmal', 
    'Çiftliðe saðmal olarak giriþ yapýldý.'
FROM Animals WHERE AnimalID <= 100;

-- 2. ADIM: 200 DOÐUM SONRASI DURUM GÜNCELLEMESÝ (200 Satýr)
-- Her doðumda anne inek için bir kayýt açýyoruz
INSERT INTO AnimalStatusHistory (AnimalID, StatusChangeDate, OldStatus, NewStatus, Reason)
SELECT 
    MotherID, 
    BirthDate, 
    'Kuru', -- Doðumdan hemen önceki hali
    'Sagmal', -- Doðumdan sonraki hali
    CASE 
        WHEN Gender = 'Diþi' THEN 'Doðum yaptý (Diþi). Süt verimi devam ediyor.'
        ELSE 'Doðum yaptý (Erkek yavru satýldý). Süt verimi devam ediyor.'
    END
FROM Calves;

-- KONTROL: SELECT COUNT(*) FROM AnimalStatusHistory; -- TAM 300 SATIR!





-- Tabloyu sýfýrla ve 2024-2025 için hesapla
TRUNCATE TABLE MonthlyProfitloss;

INSERT INTO MonthlyProfitloss (ReportYear, ReportMonth, TotalIncome, TotalExpense)
SELECT 
    Years.Y, Months.M,
    -- Gelir: Süt satýþlarýndan gelen toplam para
    ISNULL((SELECT SUM(AmountLitres * UnitPrice) FROM MilkSales WHERE YEAR(SaleDate) = Years.Y AND MONTH(SaleDate) = Months.M), 0) AS TotalIncome,
    -- Gider: Genel giderler (Yem, Elektrik vb.) + 10 Personelin Toplam Maaþý
    ISNULL((SELECT SUM(Amount) FROM GeneralExpenses WHERE YEAR(ExpenseDate) = Years.Y AND MONTH(ExpenseDate) = Months.M), 0) 
    + (SELECT SUM(Salary) FROM Employees) AS TotalExpense
FROM (SELECT 2024 AS Y UNION SELECT 2025) AS Years
CROSS JOIN (SELECT 1 AS M UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 
            UNION SELECT 7 UNION SELECT 8 UNION SELECT 9 UNION SELECT 10 UNION SELECT 11 UNION SELECT 12) AS Months;



-- Önce tabloyu temizleyelim
TRUNCATE TABLE Assets_Maintenance;

-- Senin sütun isimlerine göre 2024-2025 verilerini girelim
INSERT INTO Assets_Maintenance (AssetName, LastServiceDate, NextServiceDate, TotalCost, IssueDescription)
VALUES 
('Süt Saðým Ünitesi', '2024-02-15', '2024-08-15', 2500.00, 'Vakum pompasý bakýmý ve hortum deðiþimi yapýldý.'),
('Süt Soðutma Tanký', '2024-05-10', '2024-11-10', 1800.00, 'Gaz basýmý ve termostat kontrolü gerçekleþtirildi.'),
('Traktör (New Holland)', '2024-08-20', '2025-02-20', 4500.00, '500 saat bakýmý, yað ve filtre deðiþimi yapýldý.'),
('Süt Saðým Ünitesi', '2025-02-15', '2025-08-15', 2750.00, 'Genel yýllýk revizyon ve parça yaðlamasý yapýldý.'),
('Süt Soðutma Tanký', '2025-06-05', '2025-12-05', 1200.00, 'Dijital panel kontrolü ve iç temizlik yapýldý.'),
('Traktör (New Holland)', '2025-09-12', '2026-03-12', 4800.00, 'Þanzýman yaðý ve hidrolik sistem bakýmý tamamlandý.');