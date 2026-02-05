component {
    this.name = "CiftlikTakipSistemi";
    this.datasource = "cıftlık1"; // SQL'deki veritabanı adın
    this.sessionManagement = true;
    
    // Uygulama başladığında yapılacaklar
    public boolean function onApplicationStart() {
        return true;
    }
}