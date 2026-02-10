<cfset cowService = createObject("component", "com.CowService")>
<cfset allAnimals = cowService.getAnimals()>

<style>
    /* Hayvanlar sayfasına özel kutu stili */
    .stat-card {
        background: #2ecc71;
        color: white;
        padding: 20px;
        border-radius: 12px;
        display: inline-block;
        margin-bottom: 25px;
        box-shadow: 0 4px 10px rgba(46, 204, 113, 0.2);
    }
    .stat-card h2 { margin: 0; font-size: 32px; }
    .stat-card p { margin: 5px 0 0 0; opacity: 0.9; }
    
    .card { background: white; padding: 25px; border-radius: 15px; box-shadow: 0 4px 15px rgba(0,0,0,0.08); }
</style>

<div class="main-content-inner">
    <h1>🐄 Ahır Genel Durum Raporu</h1>

    <div class="stat-card">
        <cfoutput>
            <h2>#allAnimals.recordCount#</h2>
        </cfoutput>
        <p>Toplam Kayıtlı Hayvan</p>
    </div>

    <div class="card">
        <h3 style="margin-top:0; margin-bottom:20px; border-left: 5px solid #2ecc71; padding-left: 15px;">🐄 Güncel Hayvan Listesi</h3>
        <table style="width: 100%; border-collapse: collapse; text-align: left;">
            <thead style="background: #f8f9fa;">
                <tr>
                    <th style="padding:15px; border-bottom: 2px solid #eee;">ID</th>
                    <th style="padding:15px; border-bottom: 2px solid #eee;">Küpe No</th>
                    <th style="padding:15px; border-bottom: 2px solid #eee;">Irk</th>
                    <th style="padding:15px; border-bottom: 2px solid #eee;">Doğum Tarihi</th>
                    <th style="padding:15px; border-bottom: 2px solid #eee;">Durum</th>
                </tr>
            </thead>
            <tbody>
                <cfoutput query="allAnimals">
                    <tr style="border-bottom: 1px solid ##eee;">
                        <td style="padding:15px;">#AnimalID#</td>
                        <td style="padding:15px;"><strong>#EarTagNumber#</strong></td>
                        <td style="padding:15px;">#Breed#</td>
                        <td style="padding:15px;">#dateFormat(BirthDate, "dd.mm.yyyy")#</td>
                        <td style="padding:15px;">
                            <span style="background:##3498db; color:white; padding:4px 10px; border-radius:20px; font-size:12px; font-weight:bold;">
                                #CurrentStatus#
                            </span>
                        </td>
                    </tr>
                </cfoutput>
            </tbody>