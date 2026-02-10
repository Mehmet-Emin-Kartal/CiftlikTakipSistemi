<!DOCTYPE html>
<html lang="tr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Çiftlik ERP | Giriş</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <style>
        /* ... Senin CSS kodların aynen burada kalıyor (değiştirmiyorum) ... */
        :root{ --green:#27ae60; --dark:#2c3e50; }
        *{box-sizing:border-box}
        html,body{ margin:0; height:100%; font-family:'Inter',sans-serif; }
        body{ background: linear-gradient(rgba(0,0,0,.35),rgba(0,0,0,.35)), url("https://images.unsplash.com/photo-1500595046743-cd271d694d30?auto=format&fit=crop&w=1800&q=80"); background-size:cover; background-position:center; }
        .hero-text{ position:absolute; left:80px; bottom:120px; color:#fff; max-width:520px; }
        .hero-text h1{ font-size:48px; line-height:1.15; margin-bottom:20px; }
        .hero-text p{ font-size:17px; opacity:.95; }
        .login-card{ position:absolute; right:80px; top:50%; transform:translateY(-50%); width:420px; padding:45px 40px; background:rgba(255,255,255,.9); backdrop-filter:blur(14px); border-radius:26px; box-shadow:0 25px 60px rgba(0,0,0,.15); }
        .logo{ text-align:center; font-size:34px; margin-bottom:18px; }
        .login-card h2{ text-align:center; color:var(--dark); margin-bottom:6px; }
        .login-card p{ text-align:center; color:#7f8c8d; font-size:14px; margin-bottom:26px; }
        .roles{ display:flex; gap:12px; margin-bottom:22px; }
        .role{ flex:1; padding:14px; border-radius:14px; border:2px solid #e5e9ee; text-align:center; cursor:pointer; font-weight:600; color:#34495e; transition:.25s; background:#f9fafb; }
        .role i{ display:block; margin-bottom:6px; }
        .role.active{ border-color:var(--green); color:var(--green); background:#ecf9f1; }
        .group{ margin-bottom:20px; }
        .group label{ font-size:13px; font-weight:600; color:var(--dark); margin-bottom:6px; display:block; }
        .input-wrap{ position:relative; }
        .group input{ width:100%; padding:14px 44px 14px 16px; border-radius:12px; border:2px solid #edf2f7; background:#f8fafc; }
        .group input:focus{ outline:none; border-color:var(--green); background:#fff; }
        .toggle{ position:absolute; right:14px; top:50%; transform:translateY(-50%); color:#95a5a6; cursor:pointer; }
        button{ width:100%; padding:15px; border:none; border-radius:14px; background:linear-gradient(135deg,#27ae60,#2ecc71); color:#fff; font-weight:700; cursor:pointer; box-shadow:0 10px 25px rgba(39,174,96,.35); }
        button:hover{ background:#219150; }
        @media(max-width:900px){ .hero-text{ position:static; padding:40px; } .login-card{ position:static; transform:none; margin:40px auto; } }
    </style>
</head>
<body>

<div class="hero-text">
    <h1>Çiftliğinizi<br>Dijitalle Yönetin</h1>
    <p>Hayvan takibi, süt verimi ve personel yönetimini tek bir platformdan kontrol edin.</p>
</div>

<div class="login-card">
    <div class="logo">🚜</div>
    <h2>Hoş Geldiniz</h2>
    <p>Lütfen kurumsal bilgilerinizle giriş yapın.</p>

    <cfif structKeyExists(url, "error")>
        <div style="background:#f8d7da; color:#721c24; padding:10px; border-radius:8px; margin-bottom:15px; text-align:center; font-size:13px;">
            ❌ Kullanıcı adı veya şifre hatalı!
        </div>
    </cfif>

    <div class="roles">
        <div class="role active" onclick="selectRole(this)">
            <i class="fa-solid fa-user-shield"></i> Yönetici
        </div>
        <div class="role" onclick="selectRole(this)">
            <i class="fa-solid fa-user"></i> Personel
        </div>
    </div>

    <form action="login_action.cfm" method="POST">
        <div class="group">
            <label>Kullanıcı Adı</label>
            <input type="text" name="username" placeholder="admin" required>
        </div>

        <div class="group">
            <label>Şifre</label>
            <div class="input-wrap">
                <input type="password" name="password" id="password" placeholder="••••••••" required>
                <i class="fa-solid fa-eye toggle" onclick="togglePassword()"></i>
            </div>
        </div>

        <button type="submit">Sisteme Giriş Yap</button>
    </form>
</div>

<script>
function togglePassword(){
    const p=document.getElementById("password");
    p.type = p.type==="password" ? "text" : "password";
}
function selectRole(el){
    document.querySelectorAll(".role").forEach(r=>r.classList.remove("active"));
    el.classList.add("active");
}
</script>
</body>
</html>