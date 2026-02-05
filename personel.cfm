
<cfset staffService = createObject("component", "com.StaffService")>

<cfif structKeyExists(form, "btnKaydet")>
    <cfset staffService.addEmployee(form.fullName, form.role, form.salary, form.jobDesc)>
    <cflocation url="personel.cfm?status=success" addtoken="false">
</cfif>

<cfif structKeyExists(url, "deleteID")>
    <cfset staffService.deleteEmployee(url.deleteID)>
    <cflocation url="personel.cfm?status=deleted" addtoken="false">
</cfif>

<cfset employees = staffService.getEmployees()>

<!DOCTYPE html>
<html lang="tr">
<head>
    <meta charset="UTF-8">
    <title>Personel Yönetimi | Çiftlik ERP</title>
    <link rel="stylesheet" href="assets/css/style.css">
</head>
<body>

    <div class="sidebar">
        <h2>ÇİFTLİK ERP</h2>
        <a href="index.cfm">🏠 Dashboard</a>
        <a href="personel.cfm" style="background:#34495e; color:white;">👥 Personel Takibi</a>
        <a href="sut_yonetimi.cfm">🥛 Süt & Tank Yönetimi</a>
        <a href="hayvanlar.cfm">🐄 Hayvan Portföyü</a>
        <a href="finans.cfm">💰 Finansal Raporlar</a>
    </div>

    <div class="main-content">
        <h1>👥 Personel Yönetim Merkezi</h1>

        <cfif structKeyExists(url, "status")>
            <cfif url.status EQ "success">
                <div class="status-msg">✔️ Personel başarıyla kaydedildi!</div>
            <cfelseif url.status EQ "deleted">
                <div class="status-msg" style="background:#f8d7da; color:#721c24; border-left:5px solid #dc3545;">🗑️ Personel sistemden silindi.</div>
            </cfif>
        </cfif>

        <div class="card" style="border-top: 4px solid #2ecc71;">
            <h3>+ Yeni Personel Tanımla</h3>
            <form method="POST">
                <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 20px;">
                    <input type="text" name="fullName" placeholder="Ad Soyad" required>
                    <input type="text" name="role" placeholder="Görevi" required>
                    <input type="number" name="salary" placeholder="Maaş (TL)" required>
                    <input type="text" name="jobDesc" placeholder="İş Tanımı">
                    
                    <button type="submit" name="btnKaydet" style="grid-column: span 2;">Yeni Çalışan Ekle</button>
                </div>
            </form>
        </div>

        <div class="card">
            <h3>Mevcut Çalışan Listesi</h3>
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Ad Soyad</th>
                        <th>Pozisyon</th>
                        <th>Maaş</th>
                        <th>Giriş Tarihi</th>
                        <th style="text-align:center;">İşlemler</th>
                    </tr>
                </thead>
                <tbody>
                    <cfoutput query="employees">
                    <tr>
                        <td>#EmployeeID#</td>
                        <td><strong>#FullName#</strong></td>
                        <td>#Role#</td>
                        <td>#NumberFormat(Salary, "__.00")# TL</td>
                        <td>#DateFormat(HireDate, "dd.mm.yyyy")#</td>
                        <td style="text-align:center;">
                            <a href="personel.cfm?deleteID=#EmployeeID#" 
                               class="btn-sil" 
                               onclick="return confirm('#FullName# isimli personeli silmek istediğine emin misin?')">
                               🗑️ Sil
                            </a>
                        </td>
                    </tr>
                    </cfoutput>
                </tbody>
            </table>
        </div>
    </div>

</body>
</html>