<cfset staffService = createObject("component", "com.StaffService")>

<cfif structKeyExists(form, "btnKaydet")>
    <cfset staffService.addEmployee(
        name    = form.fullName, 
        role    = form.role, 
        sal     = form.salary, 
        phone   = form.phone, 
        blood   = form.blood, 
        address = form.address,
        tcNo    = form.tcNo, 
        email   = form.email
    )>
    <cflocation url="index.cfm?sayfa=personel&status=success" addtoken="false">
</cfif>

<cfif structKeyExists(url, "deleteID")>
    <cfset staffService.deleteEmployee(url.deleteID)>
    <cflocation url="index.cfm?sayfa=personel&status=deleted" addtoken="false">
</cfif>

<cfset employees = staffService.getEmployees()>

<style>
    .form-fix { display: block !important; width: 100%; }
    .flex-container { display: flex; gap: 20px; align-items: stretch; margin-top: 15px; }
    .inputs-area { flex: 2; display: grid; grid-template-columns: 1fr 1fr; gap: 15px; }
    .textarea-area { flex: 1; display: flex; flex-direction: column; }
    .textarea-area textarea { 
        width: 100%; padding: 12px; border: 1px solid #ddd; border-radius: 8px; 
        resize: none; flex-grow: 1; font-family: inherit; box-sizing: border-box; 
        background: #fcfcfc; min-height: 140px;
    }
    .my-input { padding: 12px; border: 1px solid #ddd; border-radius: 8px; font-size: 14px; width: 100%; box-sizing: border-box; }
    .btn-wrapper { text-align: center; margin-top: 25px; border-top: 1px solid #eee; padding-top: 20px; }
    .btn-submit { background: #2ecc71; color: white; border: none; padding: 12px 60px; border-radius: 30px; font-weight: bold; cursor: pointer; font-size: 16px; }
    .blood-tag { background-color: #e74c3c; color: white; padding: 4px 10px; border-radius: 20px; font-weight: bold; font-size: 11px; }
    .card { background: white; padding: 20px; border-radius: 10px; box-shadow: 0 2px 10px rgba(0,0,0,0.05); margin-bottom: 20px; }
    
    /* Profesyonel Görev Yazısı Stili */
    .role-text { 
        color: #4b6584; /* Profesyonel Mavi-Gri tonu */
        font-size: 11px; 
        font-weight: 600; 
        text-transform: uppercase; 
        letter-spacing: 0.5px;
        margin-top: 3px; 
        display: block; 
    }
</style>

<h1>👥 Personel Yönetim Merkezi</h1>

<cfif structKeyExists(url, "status")>
    <cfif url.status EQ "success">
        <div style="padding:15px; margin-bottom:20px; border-radius:8px; background:#d4edda; color:#155724; border-left:5px solid #28a745;">Personel başarıyla kaydedildi!</div>
    <cfelseif url.status EQ "deleted">
        <div style="padding:15px; margin-bottom:20px; border-radius:8px; background:#f8d7da; color:#721c24; border-left:5px solid #dc3545;">🗑️ Personel silindi.</div>
    </cfif>
</cfif>

<div class="card" style="border-top: 4px solid #2ecc71;">
    <h3 style="margin-top:0;">+ Yeni Personel Tanımla</h3>
    <form method="POST" class="form-fix">
        <div class="flex-container">
            <div class="inputs-area">
                <input type="text" name="fullName" placeholder="Ad Soyad" required class="my-input">
                <input type="text" name="role" placeholder="Görevi" required class="my-input">
                <input type="text" name="tcNo" placeholder="TC Kimlik No" maxlength="11" class="my-input">
                <input type="text" name="phone" placeholder="Telefon (05xx)" class="my-input">
                <input type="number" name="salary" placeholder="Maaş (TL)" required class="my-input">
                <input type="email" name="email" placeholder="E-posta Adresi" class="my-input">
            </div>
            <div class="textarea-area">
                <select name="blood" class="my-input" style="background:white; margin-bottom:15px;">
                    <option value="">Kan Grubu Seçiniz</option>
                    <option value="A Rh+">A Rh+</option><option value="A Rh-">A Rh-</option>
                    <option value="B Rh+">B Rh+</option><option value="B Rh-">B Rh-</option>
                    <option value="AB Rh+">AB Rh+</option><option value="AB Rh-">AB Rh-</option>
                    <option value="0 Rh+">0 Rh+</option><option value="0 Rh-">0 Rh-</option>
                </select>
                <textarea name="address" placeholder="Detaylı Adres Bilgisi..."></textarea>
            </div>
        </div>
        <div class="btn-wrapper">
            <button type="submit" name="btnKaydet" class="btn-submit">Yeni Çalışanı Kaydet</button>
        </div>
    </form>
</div>

<div class="card">
    <h3>Mevcut Çalışan Listesi</h3>
    <table style="width: 100%; border-collapse: collapse; font-size: 13px;">
        <thead>
            <tr style="background: #f8f9fa;">
                <th style="padding:12px; text-align: left;">##</th>
                <th style="text-align: left;">Ad Soyad</th>
                <th style="text-align: left;">TC No</th>
                <th style="text-align: left;">E-Posta</th>
                <th style="text-align: left;">Maaş</th>
                <th style="text-align: left;">Telefon</th>
                <th style="text-align: left;">Adres</th>
                <th style="text-align:center;">Kan</th>
                <th style="text-align:center;">İşlemler</th>
            </tr>
        </thead>
        <tbody>
            <cfoutput query="employees">
            <tr style="border-bottom: 1px solid ##eee;">
                <td style="padding:12px; font-weight:bold; color:##999;">#employees.currentRow#</td>
                
                <td>
                    <div style="font-weight: bold; color: ##2c3e50; font-size: 14px;">#FullName#</div>
                    <span class="role-text">#Role#</span>
                </td>
                
                <td>#len(TC_No) ? TC_No : "---"#</td>
                <td>#len(Email) ? Email : "---"#</td>
                <td>#NumberFormat(Salary, "__.00")# TL</td>
                <td>#PhoneNumber#</td>
                <td title="#HomeAddress#">
                     <div style="max-width: 250px; word-wrap: break-word; white-space: normal; line-height: 1.4;">
                        #HomeAddress#
                     </div>
                </td>
                <td style="text-align:center;">
                    <span class="blood-tag">#BloodGroup#</span>
                </td>
                <td style="text-align:center;">
                    <a href="index.cfm?sayfa=personel&deleteID=#EmployeeID#" 
                       onclick="return confirm('#FullName# silinsin mi?')"
                       style="color:##e74c3c; text-decoration:none; font-weight:bold;">
                       🗑️ Sil
                    </a>
                </td>
            </tr>
            </cfoutput>
        </tbody>
    </table>
</div>