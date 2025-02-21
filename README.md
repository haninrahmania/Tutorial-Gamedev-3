**Nama: Hanin Atina Rahmania NPM: 2106751234 **
**Kelas: Game Development A **
**Tutorial 3**

**Implementasi dash**
>>Saya membuat player bisa dash ke kanan atau ke kiri ketika arrow key kanan atau kiri di tap dengan cepat dua kali, 

**Implementasi double jump**
>>Saya membuat player bisa double jump dengan cara membuat variable jump_count untuk menghitung sudah berapa kali jump, dan juga variable max_jumps untuk mengatur bahwa player hanya bisa double jump atau single jump, bukan triple atau quadruple. Kemudian pada function physics process saya menambahkan code untuk mereset jump count apabila player menyentuh lantai. Lalu saya membuat function untuk jump seperti ini:
>>if Input.is_action_just_pressed("ui_up") and jump_count < max_jumps:
		velocity.y = jump_speed
		jump_count += 1
>>Fungsi ini memperbolehkan karakter lompat hingga dua kali.

**Implementasi animasi karakter player: idle, walking, jumping**
>>Saya membuat child node baru AnimatedSprite2D pada scene Player. Kemudian pada inspectornya, saya pilih newSpriteFrames pada SpriteFrames. Kemudian saya membuat new animation pada interface sprite animations dan menamainya sesuai animasi yang ingin saya buat (contoh: "walk"), dan saya memasukkan sprites yang dibutuhkan untuk animasi tersebut dengan drag and drop dari folder assets. Setelah itu, saya memanggil animasi tersebut pada script player dengan $AnimatedSprite2D().



