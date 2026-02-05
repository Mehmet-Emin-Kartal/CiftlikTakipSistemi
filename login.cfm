<!DOCTYPE html>
<html lang="tr">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Çiftlik ERP | Giriş</title>

<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<style>
:root{
    --green:#27ae60;
    --dark:#2c3e50;
}

*{box-sizing:border-box}

html,body{
    margin:0;
    height:100%;
    font-family:'Inter',sans-serif;
}

/* TAM ARKA PLAN */
body{
    background:
        linear-gradient(rgba(0,0,0,.35),rgba(0,0,0,.35)),
        url("https://images.unsplash.com/photo-1500595046743-cd271d694d30?auto=format&fit=crop&w=1800&q=80");
    background-size:cover;
    background-position:center;
}

/* SOL METİN */
.hero-text{
    position:absolute;
    left:80px;
    bottom:120px;
    color:#fff;
    max-width:520px;
}

.hero-text h1{
    font-size:48px;
    line-height:1.15;
    margin-bottom:20px;
}

.hero-text p{
    font-size:17px;
    opacity:.95;
}

/* SAĞ LOGIN KART */
.login-card{
    position:absolute;
    right:80px;
    top:50%;
    transform:translateY(-50%);
    width:420px;
    padding:45px 40px;
    background:rgba(255,255,255,.9);
    backdrop-filter:blur(14px);
    border-radius:26px;
    box-shadow:0 25px 60px rgba(0,0,0,.15);
}

/* LOGO */
.logo{
    text-align:center;
    font-size:34px;
    margin-bottom:18px;
}

/* BAŞLIK */
.login-card h2{
    text-align:center;
    color:var(--dark);
    margin-bottom:6px;
}

.login-card p{
    text-align:center;
    color:#7f8c8d;
    font-size:14px;
    margin-bottom:26px;
}

/* ROL SEÇİMİ */
.roles{
    display:flex;
    gap:12px;
    margin-bottom:22px;
}

.role{
    flex:1;
    padding:14px;
    border-radius:14px;
    border:2px solid #e5e9ee;
    text-align:center;
    cursor:pointer;
    font-weight:600;
    color:#34495e;
    transition:.25s;
    background:#f9fafb;
}

.role i{
    display:block;
    margin-bottom:6px;
}

.role.active{
    border-color:var(--green);
    color:var(--green);
    background:#ecf9f1;
}

/* INPUT */
.group{
    margin-bottom:20px;
}

.group label{
    font-size:13px;
    font-weight:600;
    color:var(--dark);
    margin-bottom:6px;
    display:block;
}

.input-wrap{
    position:relative;
}

.group input{
    width:100%;
    padding:14px 44px 14px 16px;
    border-radius:12px;
    border:2px solid #edf2f7;
    background:#f8fafc;
}

.group input:focus{
    outline:none;
    border-color:var(--green);
    background:#fff;
}

/* ŞİFRE GÖSTER */
.toggle{
    position:absolute;
    right:14px;
    top:50%;
    transform:translateY(-50%);
    color:#95a5a6;
    cursor:pointer;
}

/* BUTON */
button{
    width:100%;
    padding:15px;
    border:none;
    border-radius:14px;
    background:linear-gradient(135deg,#27ae60,#2ecc71);
    color:#fff;
    font-weight:700;
    cursor:pointer;
    box-shadow:0 10px 25px rgba(39,174,96,.35);
}

button:hover{
    background:#219150;
}

/* MOBİL */
@media(max-width:900px){
    .hero-text{
        position:static;
        padding:40px;
    }
    .login-card{
        position:static;
        transform:none;
        margin:40px auto;
    }
}
</style>
</head>

<body>

<div class="hero-text">
    <h1>Çiftliğinizi<br>Dijitalle Yönetin</h1>
    <p>
        Hayvan takibi, süt verimi ve personel yönetimini
        tek bir platformdan, gerçek zamanlı verilerle
        kontrol edin.
    </p>
</div>

<div class="login-card">

    <div class="logo">🚜</div>
    <h2>Hoş Geldiniz</h2>
    <p>Lütfen kurumsal bilgilerinizle giriş yapın.</p>

    <!-- ROL -->
    <div class="roles">
        <div class="role active" onclick="selectRole(this)">
            <i class="fa-solid fa-user-shield"></i> Admin
        </div>
        <div class="role" onclick="selectRole(this)">
            <i class="fa-solid fa-user"></i> Personel
        </div>
    </div>

    <form>
        <div class="group">
            <label>Kullanıcı Adı</label>
            <input type="text" placeholder="admin">
        </div>

        <div class="group">
            <label>Şifre</label>
            <div class="input-wrap">
                <input type="password" id="password" placeholder="••••••••">
                <i class="fa-solid fa-eye toggle" onclick="togglePassword()"></i>
            </div>
        </div>

        <button>Sisteme Giriş Yap</button>
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
