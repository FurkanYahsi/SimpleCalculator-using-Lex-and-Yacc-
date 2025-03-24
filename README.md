# SimpleCalculator-using-Lex-and-Yacc-
Implementation of a simple interpreter for arithmetic and assignment operations using Lex and Yacc.

Bu proje, Lex ve Yacc kullanılarak geliştirilmiş basit bir hesap makinesidir. Temel aritmetik işlemleri (toplama(+), çıkarma(-), çarpma(*), bölme(/)) ve üs alma(** ya da ^) işlemlerini destekler. Parantez önceliği kuralını bilir. Whitespace'leri görmezden gelir('\n' hariç). Hem tam sayı hem de ondalıklı sayı girdileri için uygun sonuçlar üretir (Ondalıklı sonuçlar için virgülden sonraki ilk üç basamak gösterilir.). Hesap makinesi, girdilerdeki sözdizimi hatalarını ve sıfıra bölme gibi hataları da raporlar.


- **calculator.l:**
- Tam sayılar için 'NUMBER' token’ı ve ondalıklı sayılar için 'FLOAT' token’ı oluşturur.

- **calculator.y:**
  Yacc spesifikasyon dosyası; Lex tarafından üretilen tokenları kullanarak ifadeyi parse eder ve hesaplar.
  - Aritmetik işlemler ve üstel işlem kuralları tanımlıdır.
  - Hesaplanan sonuç, tam sayı ise integer, değilse ondalıklı olarak biçimlendirilir.
  - 'yerror' fonksiyonu ile hata raporlaması yapılır.
 

## Gereksinimler
- **Flex (Lex):** Token üretimi için.
- **Bison (Yacc):** Sözdizimi analizi için.
- **GCC:** Üretilen C kodunu derlemek için.
- **Math Kütüphanesi:** Üstel işlemde kullanılan 'pow()' fonksiyonu için (derleme sırasında '-lm2 bayrağı gerekmektedir).


Bash üzerinden çalıştırılması önerilmektedir. Geçerli dizine gittikten ve gereksinimler sağlandıktan sonra sırayla şu satırlar bash'e girilir:
-lex calculator.l
-yacc -d calculator.y
-gcc lex.yy.c y.tab.c -o calculator -lfl -lm
-./calculator

Hesaplanmak istenen işlem yazıldıktan sonra Enter tuşu ile sonuç görüntülenebilir. CTRL+D ile çıkış yapılabilir.
