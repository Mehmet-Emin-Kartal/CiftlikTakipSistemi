<cfset structClear(session)> <cflocation url="login.cfm" addtoken="false"> ```



### Mevzu Neden Çözülecek?
* Sen sidebar'daki "Oturumu Kapat"a bastığında sistem bu dosyayı arayacak.
* Dosyayı bulunca içindeki `structClear` komutuyla senin "Giriş yaptı" mührünü silecek.
* Sonra da seni o güzel giriş ekranına (`login.cfm`) geri gönderecek.

