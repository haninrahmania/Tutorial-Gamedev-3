**Nama: Hanin Atina Rahmania NPM: 2106751234 **
**Kelas: Game Development A **
**Tutorial 3 & 5**

**Tutorial 5 Section**

**Implementasi Animasi**
>>Saya mengimplementasi animasi pada objek player baru (SecondPlayer) dengan cara membuat animations idle(auto), walk, jump, dash, dan crouch pada SpriteFrames AnimatedSprite2D dan menggunakannya dalam script SecondPlayer dengan menggunakan $AnimatedSprite2D.play("animation_name") sesuai dengan gerakan yang dilakukan player.

**Implementasi Background Music**
>>Saya menggunakan audio 'Spacey Ambient Track' dari website orangefreesounds.com dengan cara mendownload file audio tersebut, kemudian memasukkannya ke dalam folder assets saya, dan pada root node saya membuat node AudioStreamPlayer2D dan load file audio tersebut pada stream di inspector, kemudian saya centang opsi 'autoplay' pada inspector agar audio ini langsung dimainkan saat level dimulai.

**Implementasi Objek Baru Bersuara**
>>Saya membuat objek Area2D baru pada root node level bernama Meteor, dan menambahkan node AudioStreamPlayer2D didalamnya, dan load audio file untuk sfx buatan saya sendiri yang saya masukkan ke dalam folder assets. Audio sfx ini berjudul "ouch.wav" dan saya membuat script pada objek meteor ini agar memberikan feedback suara tersebut saat player mengenai objek ini.

**Implementasi Objek Baru Fasilkom Button**
>>Saya membuat objek Area2D baru bernama FasilkomButton yang jika dikenai oleh player, akan menghilangkan objek meteor yang saya buat sebelumnya. Saya mengimplementasi fungsi ini dengan menggunakan NodePath, dan load path objek meteor untuk dihilangkan dengan queue_free() pada saat player mengenai fasilkombutton.

**Tutorial 3 Section**

**Implementasi crouch**
>>Saya membuat player bisa crouch saat tombol arrow down ditekan, sehingga pergerakan player ke kanan atau ke kiri menjadi lebih lambat. Player juga hanya bisa crouch saat berada di lantai dan tidak sedang dashing. Pertama saya set variables crouch_speed, dan boolean is_crouching. Kemudian saya membuat crouch logic dimana down arrow key ditekan, player berada di lantai, dan player tidak sedang dashing, boolean is_crouching menjadi true jika ketiga syarat ini terpenuhi. Lalu saya set movement speed player menjadi crouch speed jika sedang crouching.

**Implementasi dash**
>>Saya membuat player bisa dash ke kanan atau ke kiri ketika arrow key kanan atau kiri di tap dengan cepat dua kali, pertama saya set variable dash speed, duration, dan cooldown, kemudian boolean is_dashing (apakah player sedang dashing atau tidak), dash_timer, last_dash_time (cek apakah player sudah bisa melakukan dash lagi), last_direction, dan last_input_time (untuk handle checking double tap in one direction). Lalu saya membuat function start_dash untuk mulai dash dan set is_dashing menjadi true, set durasi dash pada dash_timer, menyimpan last dash time player untuk cooldown setelah dash selesai, dan menyesuaikan kecepatan horizontal player dengan dash speed. Setelah itu, saya membuat function try_dash untuk mengecek apakah player sudah dapat melakukan dash, atau cooldown dash masih belum selesai.

**Implementasi double jump**
>>Saya membuat player bisa double jump dengan cara membuat variable jump_count untuk menghitung sudah berapa kali jump, dan juga variable max_jumps untuk mengatur bahwa player hanya bisa double jump atau single jump, bukan triple atau quadruple. Kemudian pada function physics process saya menambahkan code untuk mereset jump count apabila player menyentuh lantai. Lalu saya membuat function untuk jump seperti ini:
>>if Input.is_action_just_pressed("ui_up") and jump_count < max_jumps:
		velocity.y = jump_speed
		jump_count += 1
>>Fungsi ini memperbolehkan karakter lompat hingga dua kali.

**Implementasi animasi karakter player: idle, walking, jumping, dashing, crouching**
>>Saya membuat child node baru AnimatedSprite2D pada scene Player. Kemudian pada inspectornya, saya pilih newSpriteFrames pada SpriteFrames. Kemudian saya membuat new animation pada interface sprite animations dan menamainya sesuai animasi yang ingin saya buat (contoh: "walk"), dan saya memasukkan sprites yang dibutuhkan untuk animasi tersebut dengan drag and drop dari folder assets. Setelah itu, saya memanggil animasi tersebut pada script player dengan $AnimatedSprite2D().



