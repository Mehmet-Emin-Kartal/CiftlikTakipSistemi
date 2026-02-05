<cfset cowService = createObject("component", "com.CowService")>
<cfset allAnimals = cowService.getAnimals()>

<!DOCTYPE html>
<html lang="tr">
<head>
    <meta charset="UTF-8">
    <title>Çiftlik ERP | Dashboard</title>
    <style>
        body { font-family: sans-serif; background: #f4f4f4; padding: 20px; }
        table { width: 100%; border-collapse: collapse; background: white; }
        th, td { padding: 12px; border: 1px solid #ddd; text-align: left; }
        th { background: #2c3e50; color: white; }
        tr:nth-child(even) { background: #f9f9f9; }
    </style>
</head>
<body>
    <h1>🐄 Ahır Durum Raporu</h1>
    <p>Toplam Kayıtlı Hayvan: <cfoutput>#allAnimals.recordCount#</cfoutput></p>

    <table>
    <thead>
        <tr>
            <th>ID</th>
            <th>Küpe No (Ear Tag)</th>
            <th>Irk (Breed)</th>
            <th>Doğum Tarihi</th>
            <th>Mevcut Durum</th>
        </tr>
    </thead>
    <tbody>
        <cfoutput query="allAnimals">
            <tr>
                <td>#AnimalID#</td>
                <td>#EarTagNumber#</td>
                <td>#Breed#</td>
                <td>#dateFormat(BirthDate, "dd.mm.yyyy")#</td>
                <td>#CurrentStatus#</td>
            </tr>
        </cfoutput>
    </tbody>
</table>
</body>
</html>