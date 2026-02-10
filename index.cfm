<!DOCTYPE html>
<html lang="tr">
<head>
    <meta charset="UTF-8">
    <title>ÇİFTLİK ERP | Yönetim Paneli</title>
    <link rel="stylesheet" href="assets/css/style.css">
    <style>
        body { margin: 0; display: flex; height: 100vh; background-color: #f4f7f6; font-family: 'Segoe UI', sans-serif; overflow: hidden; }
        
        /* Sidebar Tasarımı */
        .sidebar { 
            width: 280px; background-color: #1a252f; color: white; 
            display: flex; flex-direction: column; flex-shrink: 0;
            box-shadow: 2px 0 10px rgba(0,0,0,0.3);
        }

        .sidebar-header {
            padding: 30px 20px; text-align: center; background: #141c24;
        }

        .sidebar-header h2 { margin: 0; color: #2ecc71; letter-spacing: 2px; }

        .main-content { flex-grow: 1; overflow-y: auto; padding: 30px; }

        /* Menü Linkleri */
        .sidebar nav { flex: 1; padding: 10px 0; }
        .sidebar a {
            padding: 15px 25px; color: #adb5bd; text-decoration: none;
            display: flex; align-items: center; gap: 12px; transition: 0.2s;
            border-left: 4px solid transparent; font-size: 15px;
        }

        .sidebar a:hover { background-color: #2c3e50; color: white; border-left: 4px solid #2ecc71; }
        .sidebar a.active { background-color: #2c3e50; color: white; border-left: 4px solid #2ecc71; }

        .user-panel { padding: 20px; background: #141c24; border-top: 1px solid #2c3e50; font-size: 13px; }
    </style>
</head>
<body>

    <div class="sidebar">
        <div class="sidebar-header">
            <h2>ÇİFTLİK ERP</h2>
            <small style="color: #5d6d7e;">V 1.0.0</small>
        </div>
        
        <nav>
            <a href="index.cfm?sayfa=dashboard">📊 Genel Durum</a>
            <a href="index.cfm?sayfa=hayvanlar">🐄 Hayvan Portföyü</a>
            <a href="index.cfm?sayfa=sut">🥛 Süt Üretim Takibi</a>
            <a href="index.cfm?sayfa=yem">🌾 Yem & Stok Yönetimi</a>
            <a href="index.cfm?sayfa=saglik">🏥 Sağlık & Veteriner</a>
            <a href="index.cfm?sayfa=personel">👥 Personel & Görevler</a>
            <a href="index.cfm?sayfa=finans">💰 Finansal Raporlar</a>
            <a href="index.cfm?sayfa=ayarlar">⚙️ Sistem Ayarları</a>
        </nav>

        <div class="user-panel">
            🟢 Yönetici: <strong>Reis</strong><br>
            <a href="logout.cfm" style="padding: 10px 0; color: #e74c3c; font-size: 12px;">🚪 Oturumu Kapat</a>
        </div>
    </div>

    <div class="main-content">
        <cfif structKeyExists(url, "sayfa")>
            <cfif fileExists(expandPath("views/#url.sayfa#.cfm"))>
                <cfinclude template="views/#url.sayfa#.cfm">
            <cfelse>
                <div style="padding:50px; text-align:center;">
                    <h2>🚧 Bu Modül Henüz Hazır Değil</h2>
                    <p>#url.sayfa#.cfm dosyası views klasöründe bulunamadı.</p>
                </div>
            </cfif>
        <cfelse>
            <h1>Hoş Geldin Reis!</h1>
            <p>Çiftliğin bugünkü durumu için bir menü seç.</p>
        </cfif>
    </div>

</body>
</html>