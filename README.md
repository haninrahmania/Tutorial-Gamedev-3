**Nama: Hanin Atina Rahmania NPM: 2106751234 **
**Kelas: Game Development A **
**Tutorial 3**

**Implementasi double jump**
>>Saya membuat player bisa double jump dengan cara membuat variable jump_count untuk menghitung sudah berapa kali jump, dan juga variable max_jumps untuk mengatur bahwa player hanya bisa double jump atau single jump, bukan triple atau quadruple. Kemudian pada function physics process saya menambahkan code untuk mereset jump count apabila player menyentuh lantai.
**Implementasi animasi karakter player: idle, walking, jumping**
>>Saya membuat child node baru AnimatedSprite2D pada scene Player. Kemudian pada inspectornya, saya pilih newSpriteFrames pada SpriteFrames. Kemudian saya membuat new animation pada interface sprite animations dan menamainya sesuai animasi yang ingin saya buat (contoh: "walk"), dan saya memasukkan sprites yang dibutuhkan untuk animasi tersebut dengan drag and drop dari folder assets. Setelah itu, saya memanggil animasi tersebut pada script player dengan $AnimatedSprite2D().
