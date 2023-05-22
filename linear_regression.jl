### A Pluto.jl notebook ###
# v0.19.26

using Markdown
using InteractiveUtils

# ╔═╡ fc13b945-abc6-40b7-ba49-35b32d13a7b2
using Plots, PlutoUI, Images, DataFrames, Statistics, NamedArrays

# ╔═╡ f42ad2ad-9ee7-47ff-8e53-6b37dd68741c
using ScikitLearn

# ╔═╡ f72009f5-9b4d-49e0-9461-5676365ed5eb
using RDatasets

# ╔═╡ ac47a770-f596-11ed-2044-7f241fac7297
md"""
# Pendahuluan
!!! catatan
	Modul ini berisi tentang pengenalan machine learning dasar dengan model `Linear Regression` menggunakan paket `ScikitLearn.jl` dalam Julia. Materi yang tertulis di sini merupakan hasil terjemahan dan penyesuaian dari modul [Data Science](https://www.sololearn.com/learning/1093) dengan Python di [Sololearn](https://sololearn.com). Proses penerjemahan dan penyesuaian kode dari Python ke Julia dibantu oleh [ChatGPT](https://chat.openai.com/).

## Apa itu Machine Learning?

Nah, Machine Learning itu sebenernya bagian kecil dari data science yang lagi ngetrend banget, guys. Jadi, intinya Machine Learning tuh tentang cara ilmiah yang ngoprek algoritma komputasi dan model statistik buat ngelakuin tugas-tugas tertentu berdasarkan pola dan inferensi, bukan dari instruksi jelas. Jadi, kayak punya alat-alat khusus buat bikin model dari data. Para ilmuwan data tuh tuh kece abis, mereka eksplorasi data, pilih-pilih, dan bikin model (machine), trus sesuaiin parameter biar modelnya cocok dengan pengamatan (learning), abis itu dipake buat nebak dan ngertiin hal-hal baru dari data yang belum pernah diliat sebelumnya. 

Jadi, Machine Learning itu sebenernya kumpulan alat yang digunain buat bangun model dari data. Bangun model buat ngertiin data dan nebak-nebak itu jadi bagian penting dari kerjaan para ilmuwan data yang keren abis.
"""

# ╔═╡ c11dbd97-7f3a-405d-ab24-ae569f43a17f
md"""
## Supervised dan Unsupervised Learning
Dalam Machine Learning, ada yang namanya "supervised" dan "unsupervised learning". Supervised learning itu ketika kita punya target yang udah diketahui (disebut juga label) berdasarkan data-data masa lalu (misalnya, prediksi harga jual sebuah rumah), sedangkan unsupervised learning itu ketika gak ada jawaban masa lalu yang diketahui (misalnya, menentukan topik-topik yang dibahas dalam ulasan restoran).

Di modul ini, kita bakal bahas tentang Linear Regression (Regresi Linier), salah satu algoritme dalam supervised machine learning. Di modul-modul berikutnya, kita juga bakal bahas algoritme supervised machine learning lainnya, yaitu classification, dan juga algoritme unsupervised machine learning, yaitu clustering.
"""

# ╔═╡ 4b816ac2-9e46-42b2-ae8e-0c2867df76f2
md"""
## Scikit-learn
Bro and Sis!, di modul ini kita bakal pake Scikit-learn, salah satu library machine learning terkenal di Python. Di sini, banyak banget algoritma yang udah siap pakai. Gak peduli jenis algoritmanya apa, syntax-nya mengikuti langkah yang sama: **import > instantiate > fit > predict**. Setelah lo paham dasar penggunaan dan syntax Scikit-learn untuk satu model, gampang banget beralih ke algoritma baru. Jadi, buat sisanya kursus ini, kita bakal pake Scikit-learn buat bikin model machine learning dalam berbagai kasus penggunaan.

Di modul ini, kita bakal belajar cara prediksi harga rumah di Boston, USA pake linear regression.
"""

# ╔═╡ 20a764db-863b-46d9-b6d3-bd9baa002fb6
md""" 
## Linear Regression
Kita mulai dengan linear regression, model supervised learning yang sederhana abis. Linear regression ini pasangin garis lurus ke data, secara matematika kayak gini:
* $y = b + mx$
di mana $b$ itu intercept-nya dan $m$ itu kemiringan garisnya, $x$ itu fitur atau input-nya, sementara $y$ itu label atau output-nya. Tugas kita adalah nemuin nilai $m$ dan $b$ yang bikin kesalahan sekecil-kecilnya. Jadi, kita cari $m$ dan $b$ yang pas banget biar error-nya minim.
"""

# ╔═╡ 63103494-3b91-4457-a3e1-2f44bb09de24
load(download("https://api.sololearn.com/DownloadFile?id=3808"))

# ╔═╡ 766a54d9-3fc4-4cdd-b64c-4d6e654a7cb0
load(download("https://api.sololearn.com/DownloadFile?id=3809"))

# ╔═╡ 1ca23bcd-e476-4bbf-92de-33d9d37eb6f6
md"""
Nih, buat bikin gambaran, kita mulai dari lima titik data nih, bro/sis. Titik pertama (1.5, 2.8), titik kedua (2, 5.3), titik ketiga (2.5, 5.5), titik keempat (3, 7), dan titik kelima (3.5, 8.8).
"""

# ╔═╡ dc403f5a-8cb0-4755-9dfb-072e02a7d083
load(download("https://api.sololearn.com/DownloadFile?id=3901"))

# ╔═╡ d9c287dd-3eb8-43d6-808a-fe655f41e924
md"""
Kita mau pasang garis lurus buat ngelewatin kelima titik data ini, tapi, meskipun kita lihat dengan mata telanjang, ga ada garis lurus yang bisa ngelewatin semua lima titik ini, jadi kita usahain yang terbaik deh. Ini artinya, kita bakal cari garis yang paling deket sama titik-titik datanya.

Dari tiga garis yang ditunjukkan di bawah ini, menurut pendapat lu, garis mana yang paling pas dengan datanya? Garis hijau y = 10 + (-2)X, garis biru y = 5.5 + 0X, atau garis merah y = 1 + 2*X?
"""

# ╔═╡ d2bcbe32-717b-4ad0-b581-e465bc5102e7
load(download("https://api.sololearn.com/DownloadFile?id=3902"))

# ╔═╡ e3a02941-3d83-4e82-a5ef-7794313d20c1
md"""
Garis merah kan, bro! Kenapa hayoo? Karena garis merah itu yang paling nyangkutin hubungan linear antara X dan y, dan juga paling deket sama titik-titiknya. Secara matematis, jarak antara garis yang dipasang dengan titik-titik datanya dihitung pake yang namanya residu, yang ditandai dengan garis hitam putus-putus vertikal di gambar di bawah ini:
"""

# ╔═╡ fdebdfa1-3cf5-46f9-82b4-77f4e2be70c9
load(download("https://api.sololearn.com/DownloadFile?id=3903"))

# ╔═╡ 17093bef-b292-42be-866a-1080314b293c
md"""
Nah, jadi garis merah itu yang punya residu paling kecil, alias paling deket sama titik-titik datanya. Makanya garis merah adalah yang paling pas dengan datanya, bro!

Jadi, intinya linear regression itu pada dasarnya adalah mencari garis yang meminimalkan jumlah residu kuadrat, nanti kita bahas lebih lanjut, bro!

Dalam linear regression, tujuannya adalah mencari garis yang bisa mengestimasi atau memprediksi hubungan linear antara dua variabel. Nah, salah satu cara untuk menentukan garis yang paling cocok adalah dengan meminimalkan jumlah residu kuadrat antara garis tersebut dengan titik-titik data yang ada.

Residu sendiri itu adalah selisih antara nilai sebenarnya (y) dengan nilai yang diprediksi oleh garis (y') untuk setiap titik data. Nah, buat ngukur sejauh mana garis kita nyangkutin data, kita bisa kuadratin residu ini, jadi semuanya positif dan jaraknya lebih jelas.

Jadi, dalam linear regression, kita cari garis yang menghasilkan jumlah residu kuadrat yang paling kecil, yang artinya garis itu paling mendekati titik-titik data secara keseluruhan.

Model regresi linear populer karena mereka dapat melakukan fitting dengan cepat dan mudah diinterpretasikan. Memprediksi nilai kontinu dengan regresi linear adalah titik awal yang bagus, bro/sis!

Salah satu keunggulan dari regresi linear adalah kemampuannya untuk dengan cepat menyesuaikan model dengan data dan memberikan hasil yang mudah dipahami. Dengan regresi linear, kita dapat melakukan prediksi terhadap nilai kontinu berdasarkan hubungan linear antara variabel-variabel yang ada.

Gimana, mantap kan? Regresi linear ini jadi pilihan yang bagus buat memulai memprediksi nilai-nilai kontinu, bro/sis!
"""

# ╔═╡ fe02d821-9cee-42ac-bdf0-f94e517b6313
md"""
# Exploratory Data Analysis
## Boston Housing Dataset
Dataset yang kita pake adalah Boston housing dataset, bro/sis. Dataset ini berisi nilai median rumah di berbagai daerah di sekitar Boston. Selain nilai median rumah dalam ribuan dolar (MEDV), juga ada data tentang tingkat kejahatan (CRIM), konsentrasi nitrogen dioksida (NOX), jumlah rata-rata kamar (RM), persentase status sosial rendah dari populasi (LSTAT), dan fitur-fitur lainnya.

Tujuan kita di sini adalah memprediksi harga median rumah (MEDV), yang jadi target dalam skenario ini, menggunakan beberapa fitur yang disediakan.
"""

# ╔═╡ 032ca44c-e9b9-4119-b632-2f4143c3768a
md"""
Sebelum kita load datasetnya, pastikan dulu kalo package-nya udah diinstal, ya!

Di terminal Julia, masukkan perintah:
> using Pkg\
> Pkg.add("RDatasets")
"""

# ╔═╡ 228425b5-a9bf-4ca8-8202-1c3a2f0576c9
md"""
Boston housing dataset udah disiapin di package RDatasets dan kita bakal pake fungsi `RDatasets.datasets()` untuk ngeload objek yang berisi semua informasi yang kita butuhin
"""

# ╔═╡ 1a799c68-d080-4f48-8f31-1877e131c070
boston = dataset("MASS", "Boston")

# ╔═╡ adc558ef-8b28-425b-be44-d87c100ff983
md"""
Keterangan Data:
- CRIM - per capita crime rate by town
- ZN - proportion of residential land zoned for lots over 25,000 sq.ft.
- INDUS - proportion of non-retail business acres per town.
- CHAS - Charles River dummy variable (1 if tract bounds river; 0 otherwise)
- NOX - nitric oxides concentration (parts per 10 million)
- RM - average number of rooms per dwelling
- AGE - proportion of owner-occupied units built prior to 1940
- DIS - weighted distances to five Boston employment centres
- RAD - index of accessibility to radial highways
- TAX - full-value property-tax rate per $10,000
- PTRATIO - pupil-teacher ratio by town
- BLACK - 1000(Bk - 0.63)^2 where Bk is the proportion of blacks by town
- LSTAT - % lower status of the population
- MEDV - Median value of owner-occupied homes in $1000's
"""

# ╔═╡ 0341a92c-0372-4272-8f4e-d12334c90a0e
md"""
Kita jadikan kolom MedV sebagai target.
"""

# ╔═╡ a9b4c35c-bd72-4f4e-ad3b-0cfb947b5c05
boston_target = boston[!,:MedV]  # Menetapkan kolom 'MEDV' sebagai variabel target

# ╔═╡ 879120e2-3b91-4720-928b-5ff6113ad691
md"""
Kita bisa ngecek berapa banyak baris dan kolom dari data tersebut dengan perintah berikut:
"""

# ╔═╡ 87269da1-c826-4546-8d44-0ee2a146bcb6
size(boston)

# ╔═╡ 2b134f85-29b5-4ed2-88b3-903b77252467
md"""
Yow, ini berguna banget buat cek-cek apakah DataFrame-nya udah berisi data yang tepat, nih. Biar kita bisa lihat beberapa baris pertama dari DataFrame, kita pake `first(boston, n)`, di mana lo bisa tentuin nilai n buat jumlah baris yang mau dipilih. Kalo n ga diisi, secara default, dia bakal pilih baris pertama.

Coba lo bayangin, kita punya DataFrame namanya boston, nah kita bisa pake first() ini buat lihat beberapa baris pertama dari DataFrame tersebut. Kalo lo mau pilih berapa banyak baris yang mau ditampilin, tinggal lo tentuin nilai n di argumen first(n). Kalo n ga diisi, secara otomatis dia pilih satu baris pertama.
"""

# ╔═╡ b1613e37-8ef0-4cdd-89b2-61e4166af51d
first(boston,5)

# ╔═╡ 6e5b6008-b550-4303-97d8-c09269f33425
md"""
Kalo cuma mau nampilin kolom tertentu aja, bisa pake perintah:
"""

# ╔═╡ 5469aa3f-bdbe-4b84-be9f-d85c030c12c5
first(boston[:, [:Chas, :Rm, :Age, :Rad, :MedV]], 5)

# ╔═╡ 2e75eac5-3b55-4b8d-a90a-2889f6a230b9
md"""
Seringkali dataset di-load dari format file lainnya (misalnya csv, teks), dan ini adalah praktik yang bagus untuk ngecek beberapa baris pertama dan terakhir dari DataFrame serta memastikan data-nya dalam format yang konsisten menggunakan fungsi `first` dan `last`, bro.

Misalnya, kita udah ngeload dataset dari format file tertentu jadi DataFrame, kita bisa pake `first` buat lihat beberapa baris pertama dari DataFrame dan memastikan formatnya konsisten. Selain itu, kita juga bisa pake `last` buat lihat beberapa baris terakhir dan memastikan data di situ juga dalam format yang diharapkan.

Contohnya:
```julia
# Melihat beberapa baris pertama dari DataFrame
first(boston)

# Melihat beberapa baris terakhir dari DataFrame
last(boston)
```

Dengan pake `first` dan `last`, kita bisa dengan gampang cek beberapa baris pertama dan terakhir dari DataFrame buat memastikan data kita dalam format yang konsisten sebelum dilakukan analisis lebih lanjut, bro!
"""

# ╔═╡ eaf357b4-721e-461f-873e-9c03f5499a2e
last(boston)

# ╔═╡ 69123bf3-ece3-4cd1-a826-fe361e2f8798
md"""
## Ringkasan Statistika
Ingat, bro, kalo mencetak seluruh dataset dengan ukuran sampel yang besar itu gak praktis. Sebaliknya, kita pengen merangkum dan mengkarakterisasi data sampel dengan hanya beberapa nilai saja. Buat ngecek statistik ringkasan dari dataset, kita bisa pake:

```julia
# Menghitung statistik ringkasan dari dataset
describe(boston)
```

Dengan menggunakan `describe`, kita bisa dapetin statistik ringkasan dari dataset, termasuk jumlah observasi, rata-rata, standar deviasi, nilai minimum dan maksimum, serta kuartil-kuartilnya.
"""

# ╔═╡ 4fceacfc-f711-469a-9833-c7788f461a3b
describe(boston, :detailed)

# ╔═╡ 33985122-edd4-4215-8020-827c0aa3a37c
md"""
CHAS yang bernilai biner memiliki rata-rata 0.07, dan kuartil ketiga-nya adalah 0. Ini menunjukkan bahwa sebagian besar nilai di CHAS adalah 0. Jumlah rata-rata kamar per hunian berkisar antara 3.56 hingga 8.78, dengan rata-rata 6.28 dan median 6.21. Distribusi RM terlihat simetris.

Jika DataFrame berisi lebih dari hanya nilai numerik, secara default, `describe()` akan menghasilkan statistik deskriptif untuk kolom-kolom numerik. Untuk menampilkan statistik ringkasan dari semua kolom, kita bisa menambahkan `:all` dalam method-nya.

Contoh penggunaan:
```julia
# Menampilkan statistik ringkasan untuk semua kolom
describe(boston, :all)
```

Dengan menggunakan `:all`, kita dapat melihat statistik ringkasan untuk semua kolom dalam DataFrame, termasuk kolom non-numerik.
"""

# ╔═╡ 64708a63-1009-44b1-980d-d84ca9c6bcf6
# Menampilkan statistik ringkasan untuk semua kolom
describe(boston, :all)

# ╔═╡ 69e9a67d-2d81-4e17-a649-ded73d0757ff
md"""
## Visualisasi
Buanyak banget manfaat yang kita dapat dari visualisasi dan periksa distribusi tiap kolom, bro. Biar lebih jelas, kita bisa pake plot yang berbeda-beda, kayak histogram, box plot, atau scatter plot, tergantung karakteristik datanya.

Misalnya, buat lihat distribusi CHAS, kita bisa pake histogram atau bar plot buat lihat sebaran nilai 0 dan 1, bro.
"""

# ╔═╡ 66754cae-9c41-440f-bdfd-1ea16096f021
# Nampilin distribusi CHAS pake histogram
histogram(boston.Chas, legend = false, xlabel = "CHAS", ylabel = "Frequency")

# ╔═╡ 834d295f-d7a6-462c-961c-6526dad98ebb
md"""
CHAS cuma ada dua nilai, yaitu 0 dan 1, dengan sebagian besar nilainya 0. Ini konsisten dengan apa yang dilaporkan oleh `describe()`, khususnya, kuartil ketiga dari CHAS adalah 0.

Kalo buat liat distribusi RM, kita juga bisa pake histogram buat liat sebaran nilai rata-rata jumlah kamar per hunian, bro.
"""

# ╔═╡ 90f0f3fb-d19d-44fa-9acb-5492579c3b14
# Nampilin distribusi RM pake histogram
histogram(boston.Rm, legend = false, xlabel = "RM", ylabel = "Frequency")

# ╔═╡ c89696b0-942c-431a-8dd9-7e9b5791d55c
md"""
Distribusi RM terlihat normal dan simetris. Simetri ini sejalan dengan apa yang kita amati dari output `describe()`, karena rata-rata RM 6.28 mendekati median 6.21.

Visualisasi data yang informatif tidak hanya mengungkap wawasan, tetapi juga sangat berharga untuk mengkomunikasikan temuan kepada pemangku kepentingan.

Dengan cara visualisasinya ini, kita bisa ngecek distribusi CHAS dan RM dengan lebih jelas dan memverifikasi kesimpulan yang udah kita buat sebelumnya, bro.
"""

# ╔═╡ 028580e4-37a6-4c09-807a-ce5b0c9ead3d
md"""
## Correlation Matrix
Nah, buat ngertiin hubungan antara fitur-fitur (kolom-kolom), matriks korelasi itu penting banget dalam analisis data awal. Korelasi itu mengukur hubungan linear antara variabel-variabel, bro. Kita bisa bikin matriks korelasi buat nunjukin koefisien korelasi antara variabel-variabel itu. Matriks korelasi itu simetris, setiap elemennya itu koefisien korelasi yang nilainya antara -1 dan 1. Kalo nilai-nya deket banget sama 1 (atau -1), itu berarti ada korelasi positif yang kuat (atau negatif) antara variabel-variabel tersebut, bro. Buat bikin matriks korelasi, kita bisa pake fungsi "corr" ini:

```julia
correlation_matrix = round.(cor(Matrix(boston)), digits=2)
```

Dengan pake fungsi "cor" ini, kita bisa bikin matriks korelasi dan liat gimana hubungan antara variabel-variabel dalam dataset kita, bro.
"""

# ╔═╡ 1da7e318-472f-4ebe-8f45-5fd4b8568664
# Bikin matriks korelasi
correlation_matrix = round.(cor(Matrix(boston)), digits=2)

# ╔═╡ a13128b2-7895-4527-9558-a9c790a49d7c
md"""
Versi dengan nama kolom:
"""

# ╔═╡ c4b9acdd-1184-4897-91e1-e08d7f8f74dc
NamedArray(cor(Matrix(boston)), (names(boston), names(boston)))

# ╔═╡ f4eb55c0-00e1-422d-ba70-18e3c6d6edd8
md"""
Nah, yang paling terakhir itu baris atau kolom yang dipake buat nyari fitur yang paling nyambung sama target MEDV (harga rumah median dalam ribuan dolar). LSTAT (persentase orang dengan status rendah) adalah yang paling negatif nyambung sama target (-0.74), artinya kalo persentase orang dengan status rendah turun, harga rumah median naik; sementara RM (jumlah rata-rata kamar per hunian) adalah yang paling positif nyambung sama MEDV (0.70), artinya harga rumah naik kalo jumlah kamarnya bertambah.
"""

# ╔═╡ a7fcac44-3030-4f78-8d5c-46627f1f83a8
md"""
Ngertiin data lewat analisis data eksploratori itu langkah penting sebelum bikin model, bro. Dari ukuran sampel dan distribusinya sampe korelasi antara fitur-fitur dan target, kita dapet pemahaman lebih di setiap langkah yang bantu kita pilih fitur-fitur dan algoritma yang pas.
"""

# ╔═╡ 38d3d8b9-26e5-42ad-9fcb-ef3856fe579c
md"""
## Data Preparation - Feature Selection
Di atas udah kita bahas, kita perhatikan bahwa RM dan MEDV memiliki korelasi positif. Ingat ya, scatter plot itu alat yang berguna buat nampilin hubungan antara dua fitur; yuk, kita liat scatter plot-nya:
"""

# ╔═╡ 9596b6e8-03a7-4fea-94a2-d49cf0c2fb96
scatter(boston.Rm, boston.MedV, xlabel="RM (Room Mean - Rerata Jumlah Ruangan per Rumah)", ylabel="MEDV (Median Value - Nilai Tengah Harga Rumah", legend=false, title="Scatter Plot", size=(800, 600))

# ╔═╡ c48d27b4-604d-45b5-8f97-9146aafadabb
md"""
Harga rumah naik seiring dengan bertambahnya nilai RM secara linear. Tapi ada beberapa outliers yang kelihatan di luar pola secara keseluruhan. Misalnya, satu titik di tengah kanan itu menunjuukan rumah dengan hampir 9 kamar tapi nilai median sedikit di atas $20K. Biasanya, rumah-rumah dengan nilai serupa punya sekitar 6 kamar. Selain itu, data ini tampaknya ada batas maksimum; nilai median maksimumnya terbatas di 50.

Di sisi lain, harga cenderung turun dengan peningkatan LSTAT (% lower status of the population); dan trennya gak se-linear itu.
"""

# ╔═╡ 9f93425c-867a-447f-b6f9-285eaa18ee49
scatter(boston.LStat, boston.MedV, xlabel="LSTAT", ylabel="MEDV", legend=false, title="Scatter Plot", size=(800, 600))

# ╔═╡ f93f2e5a-4362-4d32-b51e-6138585df368
md"""
Dari dua fitur itu, RM keliatan lebih oke buat nebak MEDV. Jadi kita mulai aja sama regresi linear univariat: MEDV = b + m * RM.

Di scikit-learn, model-modelnya butuh matriks fitur dua dimensi (X, 2darray atau DataFrame pandas) sama array target satu dimensi (Y).

Di sini kita tentuin matriks fitur sebagai kolom RM dalam boston dan kita kasih nama X.
"""

# ╔═╡ c576c594-985b-4e5b-97ca-ed8d3a913d55
X = reshape(convert(Array, boston.Rm), (506, 1))

# ╔═╡ ef63b9a1-ab98-41f1-a5a5-dc82c0ca59b6
size(X)

# ╔═╡ 957663d1-b79d-4069-9201-49854c5c9399
md"""
Nah, dengan bikin matriks fitur kaya gitu, kita udah siap buat lanjutin regresi linear univariatnya, bro.
"""

# ╔═╡ ba95503e-c2fb-4df2-9dd4-c50391fc1c9e
md"""
Buat variabel baru dengan isi kolom MedV yang akan dijadikan sebagai target.
"""

# ╔═╡ 6926f834-fe32-4140-853d-8363a6ee8449
y = boston.MedV

# ╔═╡ 2a5cccaa-59a3-4e89-b5bd-7cca2dfa5445
begin
	# Import the required package
	using ScikitLearn.CrossValidation

	# Splitting the data into training and testing sets
	X_train, X_test, Y_train, Y_test = train_test_split(X, y, test_size=0.3, random_state=42)
end

# ╔═╡ a1e8edd3-1ffe-479b-a589-aacb1ca79281
size(y)

# ╔═╡ 9014e76e-437c-4260-b50a-2db747c7fcdb
md"""
## Fitting a Univariate Linear Regression
Jadi, dalam scikit-learn, setiap kelas model itu direpresentasikan oleh sebuah kelas dalam Python. Kelas model itu beda banget sama objek modelnya, bro. Nah, kita mulai dengan mengimpor kelas regresi linear, terus bikin objek modelnya dengan cara bikin sebuah instansi dari kelas LinearRegression:

```julia
# Impor kelas regresi linear
using ScikitLearn
@sk_import linear_model: LinearRegression

# Bikin objek model
model = LinearRegression()
```

Dengan kode di atas, kita mengimpor kelas LinearRegression dari modul linear_model di ScikitLearn dan bikin objek modelnya dengan cara bikin sebuah instansi dari kelas LinearRegression.
"""

# ╔═╡ e750e5dc-a7bc-4371-9c1e-1f053b0d4e50
@sk_import linear_model: LinearRegression

# ╔═╡ 59373c9f-52f4-46d1-9441-c35ca1ddf6cd
# Bikin objek model
model = LinearRegression()

# ╔═╡ 4fd490db-63f4-4842-a36e-bf606b1ff524
md"""
Sekarang modelnya udah dibuat, tapi belum diaplikasikan ke data. Scikit-learn membedakan antara pemilihan model dan pengaplikasian model ke data dengan sangat jelas, bro.
"""

# ╔═╡ f84f57fd-efa0-485b-a712-60be2f77e6ff
md"""
Sekarang kita bagi data menjadi set pelatihan (training set) dan set pengujian (testing set). Kenapa? Supaya kita bisa mengevaluasi performa model pada data yang belum pernah dilihat sebelumnya. Kita melatih model menggunakan set pelatihan, dan menyimpan set pengujian untuk evaluasi.

Aturan praktis yang bagus adalah membagi data menjadi 70-30, artinya 70% data digunakan untuk pelatihan dan 30% untuk pengujian. Kita akan menggunakan fungsi train_test_split dari paket ScikitLearn untuk membagi data menjadi dua subset secara acak. Kita juga akan mengatur random_state agar hasilnya dapat direproduksi.

Dengan kode di atas, kita menggunakan fungsi `train_test_split` dari paket ScikitLearn untuk membagi fitur dan target menjadi set pelatihan dan set pengujian. Kita menggunakan fitur RM sebagai `X` dan target MEDV sebagai `y`. Kemudian kita membagi data dengan memilih ukuran set pengujian sebesar 30% menggunakan `test_size=0.3` dan mengatur `random_state` menjadi 42 agar hasilnya dapat direproduksi.
"""

# ╔═╡ 59acc995-91f4-424d-8381-3a2bb1b9ca87
size(X_train)

# ╔═╡ 43a31297-dafe-402d-98cf-68723d70eb72
size(X_test)

# ╔═╡ 56a1298a-241b-4bfd-92cf-cd7adc337b43
size(Y_train)

# ╔═╡ 6a772572-95c8-48c2-b184-c1fed7e0b34b
typeof(Y_train)

# ╔═╡ 52e987c0-81fd-45a5-8e1c-7945ccb54997
size(Y_test)

# ╔═╡ e39eccf4-7c75-4647-92b8-d7f15f8918b6
md"""
## Fitting the Model
Yoi, jadi fitting itu sama aja kayak training. Proses ini melibatkan melatih model menggunakan data training dan menemukan koefisien yang ditentukan dalam model regresi linear, yaitu intercept dan slope. Setelah dilatih, model bisa digunakan untuk melakukan prediksi.

Sekarang kita akan mengaplikasikan model ke data. Ingat ya, kita simpan data testing untuk melihat performa model dan hanya menggunakan data training untuk membangun model. Ini sintaksnya:
"""

# ╔═╡ 14ee429e-2c57-4ac4-877f-95506b08af13
# Fitting/training the model
fit!(model, X_train, Y_train)

# ╔═╡ 9614cd5d-1f61-4def-8e09-5d6945b7f888
md"""
Perintah fit!() memicu komputasi dan hasilnya disimpan dalam objek model.

Proses fitting adalah seberapa baik model machine learning cocok dengan data yang digunakan untuk melatihnya. Dengan melatih model menggunakan data tersebut, model belajar menyesuaikan diri dengan pola dan hubungan dalam data tersebut.
"""

# ╔═╡ 278d7a0b-0f1f-4958-b5ab-a9c6146128b2
md"""
## Parameter Estimates
Bro, jadi model regresi linear udah di-fitin, artinya kedua parameter, yaitu intercept dan slope, udah dipelajari. Nah, di Scikit-learn, konvensinya semua parameter model punya trailing underscores, misalnya buat ngakses nilai estimasi intercept dari model, dibulatin ke 2 desimal angka di belakang koma biar lebih enak dilihat, kita bisa pake kode berikut:
"""

# ╔═╡ 8d000943-f1d1-4e2c-b7cc-9af25ac4b553
intercept = round(model.intercept_, digits=2)

# ╔═╡ b216e132-ed19-44fa-b966-5d2081e4c534
md"""
Sama juga untuk memperkirakan nilai coefficient dari `Rm`:
"""

# ╔═╡ 34fe2a25-0b84-46b3-9bf7-979036dbc4d3
coef = round(model.coef_[1], digits=2)

# ╔═╡ 47edcba4-4904-4bfa-9182-4cfd7495b327
md"""
Dua parameter tersebut mewakili intercept dan slope dari garis yang cocok dengan data. Model yang telah kita fitkan memiliki persamaan 
* $MedV = -34.66 + 9.12 * Rm$
Untuk setiap peningkatan satu unit pada Rm, harga rumah median akan meningkat sebesar \$9120.
"""

# ╔═╡ 5735b6c1-61ea-4ece-b957-96a69502ff54
md"""
## Prediction
Setelah model dilatih, supervised machine learning akan mengevaluasi data uji berdasarkan prediksi sebelumnya untuk data yang tidak terlihat sebelumnya. Kita dapat membuat prediksi menggunakan metode predict().
"""

# ╔═╡ 392261c3-290b-47c3-8504-9a1a70861e51
new_RM = [[6.5]] # 2d array

# ╔═╡ 92ff3f53-6e51-4593-bf50-fe42a77dc072
prediction = predict(model, new_RM)

# ╔═╡ 3b2b5553-878f-4941-9046-b5b652e78342
md"""
Ketika jumlah rata-rata kamar per hunian adalah 6.5, model memprediksi nilai rumah sebesar $24,605.4.

Perlu dicatat bahwa input harus berupa 2 dimensi, baik itu 2darray atau DataFrame akan berfungsi dalam kasus ini.

Nilai ini sama dengan saat kita memasukkan nilai ke dalam persamaan `b + m*x` di mana `b` adalah intercept yang diestimasi dari model, dan `m` adalah slope yang diestimasi.
"""

# ╔═╡ 636bdcbb-33dd-4b10-8940-4fb417c0eefb
intercept + coef*6.5 # Nah, looh, kok beda...?

# ╔═╡ 57fed991-3bfe-460b-9540-9e6fa3f43396
y_test_predicted = predict(model, X_test)

# ╔═╡ cd380bc1-4c00-4f75-994e-3b2fc3bf61c2
size(y_test_predicted)

# ╔═╡ 01e66068-00bb-4ea1-b08b-d100d7dca6f6
size(Y_test)

# ╔═╡ d54e30f4-66b2-4ac0-a35c-e118602b985b
typeof(y_test_predicted)

# ╔═╡ 5741f048-d756-4582-ba1e-8667468f4a27
md"""
# Evaluating The Model
## Residuals
Kita mau ngecek seberapa bagus prediksi kita, nih. Kita bisa liat dari gambaran visual antara garis yang kita perkirakan dengan observasi yang sebenarnya dalam set data uji.
"""

# ╔═╡ 7e2c6e93-7c82-437f-a9ee-6fc66b436b7c
begin
	scatter(X_test, Y_test, label="testing data")
	plot!(X_test, y_test_predicted, label="prediction", linewidth=3)
	xlabel!("RM")
	ylabel!("MEDV")
end

# ╔═╡ 3586d834-fa0b-45f0-9666-f951d365e867
md"""
Nah, bisa kita lihat bahwa ada beberapa titik yang ada di sepanjang garis, tapi ada juga yang agak jauh dari garisnya. Kita bisa ukur jarak antara titik-titik tersebut ke garis dengan menggunakan garis vertikal, dan jarak ini disebut sebagai residual atau error. Residual adalah selisih antara nilai yang diamati dengan nilai yang diprediksi. Semakin kecil nilai residualnya mendekati 0, berarti model kita semakin baik.

Kita bisa menghitung residual dan menggambarkannya dalam scatter plot.
"""

# ╔═╡ b9df89e4-36c3-4cb8-9cfc-6db0fb7c9aa4
residuals = Y_test - y_test_predicted

# ╔═╡ 7947f77a-e2a8-4631-b00f-cdf1bf5e3473
begin
	scatter(X_test, residuals, xlabel="RM", ylabel="residuals")
	hline!([0], linestyle=:dash)
	xlims!(4, 9)
end

# ╔═╡ 3f6c0a6a-61c5-4603-88ab-d8c396607e19
md"""
Residualnya tuh bertebaran nggak karuan di sekitar garis horizontal y = 0, nggak ada pola khusus. Distribusinya yang kelihatan acak menandakan modelnya oke banget. Sebenernya, idealnya residual itu harus tersebar simetris dan acak di sekitar sumbu horizontal; kalo plot residualnya nunjukin pola tertentu, baik yang linear atau non-linear, itu tandanya model kita masih bisa diperbaiki.
Plot residual ini bisa nunjukin kalo modelnya punya bias dan ukuran statistik bisa nunjukin seberapa bagus modelnya nge-fit data.
"""

# ╔═╡ bd4d151e-5bff-4e35-8a7e-62a2c8908a75
md"""
## Mean Squared Error
Sebelumnya, kita udah tau kalo kalo tiap-tiap residualnya mendekati 0 itu menandakan model yang bagus. Misalnya, untuk lima residual pertama dalam model kita:
"""

# ╔═╡ e39faef2-b5e4-4285-9f05-1d93597132ea
residuals[1:5]

# ╔═╡ 7d8c02d8-782a-48e1-ad7f-d309fecc1d78
md"""
Nah, itu hanya sejumlah titik data individual. Bagaimana dengan performa model untuk semua titik data? Kita butuh cara untuk menggabungkan semua residual dan melaporkan satu angka sebagai metriknya. Nah, biasanya kita menggunakan rata-rata dari semua residual:
"""

# ╔═╡ 86b3944f-db81-4d1d-85aa-0c12ac8c3174
mean(residuals)

# ╔═╡ 593531a2-5680-4297-9b2b-aea3c6c74b39
md"""
Iya, -0.36 memang cukup dekat dengan 0, tapi ada masalah: residual bisa positif atau negatif, jadi jika kita hanya mengambil rata-ratanya, maka akan saling menghapus satu sama lain. Itu bukan metrik yang akurat. Untuk mengatasinya, kita mengambil kuadrat dari masing-masing residual, kemudian mengambil rata-rata dari kuadrat-kuadrat tersebut. Ini disebut mean squared error (MSE):
"""

# ╔═╡ fc2f17f7-38d2-44e2-abd0-ab44a3ab58ad
mean(residuals.^2)

# ╔═╡ 45c741c7-e2f1-419c-a9da-12c3c65aa94e
md"""
Bisa juga pake fungsi mean_squared_error yang disediakan oleh ScikitLearn.
"""

# ╔═╡ a33eb768-41f3-48c7-af83-ff775b866f9e
@sk_import metrics: mean_squared_error

# ╔═╡ ca5d782f-2f09-4bf7-b892-d9e3ed09a3be
mse = mean_squared_error(Y_test, y_test_predicted)

# ╔═╡ dab50c21-43e3-4003-8ad8-dd3c9ab8a2eb
md"""
Secara umum, semakin kecil nilai MSE, semakin baik, namun tidak ada ambang batas yang mutlak untuk menentukan baik atau buruknya. Kita bisa mendefinisikannya berdasarkan variabel dependen, yaitu MEDV dalam data uji. Y_test berkisar antara 6.3 hingga 50 dengan varians 92.26. Dibandingkan dengan varians total, MSE sebesar 36.52 sudah tidak buruk.

Untuk membuat skala dari kesalahan sama dengan skala dari target, sering digunakan root mean squared error (RMSE). Ini adalah akar kuadrat dari MSE.
"""

# ╔═╡ 5af8cac9-0aeb-4a84-b088-ca9789173a98
md"""
## R-squared
Ada satu cara lagi buat ngecek kinerja model, yaitu pake R-squared. Cek nilai R-squarednya pake `model.score()`:
"""

# ╔═╡ 152d36fd-17a1-461c-a7ea-b84a13daab70
model.score(X_test, Y_test)

# ╔═╡ 044746c3-6b7b-482e-98aa-e4a812a19b86
md"""
R-squared itu nunjukin proporsi variasi total yang bisa dijelasin sama model. Di sini, sekitar 60% variasi di data pengujian bisa dijelasin sama model kita.

Variasi total diitung dari jumlah kuadrat selisih antara respons sama rata-ratanya, di contoh data pengujian:
"""

# ╔═╡ 399c968a-af6d-489e-9ee4-4f0846a5d432
sum((Y_test .- mean(Y_test)) .^ 2)

# ╔═╡ a6fcb8ed-2f05-41ee-b5b5-1087681b2c24
md"""
Terus variasi yang ga bisa dijelasin sama model diitung dari jumlah kuadrat residu:
"""

# ╔═╡ 02156f5e-3d32-40e7-b7e2-f9049e193497
sum(residuals .^ 2)

# ╔═╡ 8836d109-bc50-4505-8765-e1de70cc6e9c
md"""
Trus proporsi variasi total dari data diitung pake rumus:
"""

# ╔═╡ 2bcd900c-45b5-48d3-929e-e64eb6413696
1 - sum(residuals .^ 2) / sum((Y_test .- mean(Y_test)) .^ 2)

# ╔═╡ 39afe3a6-e99a-45e0-8bb6-07820fdd7944
md"""
Kalo modelnya sempurna, dia bisa jelasin semua variasi dalam data. Tapi inget, R-squarednya berada antara 0 dan 100%: 0% artinya modelnya ga jelasin variasi apa-apa di data respons sekitar rata-ratanya, sedangkan 100% artinya modelnya jelasin semua variasinya.
Evaluasi nilai R-squared ini barengan sama plot residu bisa nunjukin kinerja modelnya.
"""

# ╔═╡ 2cf82e63-a3c4-427a-bd2f-4b6f99d7079f
md"""
# Multivariate Linear Regression
## Overview
Lu inget ga, LSTAT (% status rendah di populasi) itu paling negatif korelasinya sama harga rumah. Kita bisa nambahin fitur ini dan bikin model regresi linear multivariat di mana harga rumah bergantung pada RM dan LSTAT secara linear:

* $MEDV = b0 + b1 * RM + b2 * LSTAT$
Buat nyari intercept b0, dan koefisien b1 dan b2, semua langkahnya sama kecuali bagian persiapan datanya, sekarang kita lagi urusin dua fitur:
"""

# ╔═╡ 20359032-5fd6-4e7a-8402-e2cee856af34
X2 = reshape(convert(Array, [boston.Rm boston.LStat]), (506, 2))

# ╔═╡ 54f77479-8eb0-496c-8a18-9330f05c698f
# Train-Test Split
X2_train, X2_test, Y2_train, Y2_test = train_test_split(X2, y, test_size=0.3, random_state=1)

# ╔═╡ 42322d7d-238b-48a0-9e60-d77304415012
model2 = LinearRegression()

# ╔═╡ f6249407-c163-4396-ae54-cda1e07aaf8d
# Fitting/training the model
fit!(model2, X2_train, Y2_train)

# ╔═╡ 4125f6d7-f926-4dde-adc3-3d4b79999f13
round(model2.intercept_, digits=2)

# ╔═╡ ea32a24b-656a-48bd-9346-c66b590bfa7d
round.(model2.coef_, digits=2)

# ╔═╡ 4bd19e01-61c4-4df6-9a62-e0030657b84f
md"""
Catet ya, koefisiennya disimpan dalam 1darray dengan bentuk (2,). Model kedua ini jadinya:
MEDV = 5.32 + 4.13 * RM + (-0.68) * LSTAT.
Nah, sekarang bisa dipake buat prediksi nih:
"""

# ╔═╡ 30b62ccc-577b-4584-8040-274495c02755
y_test_predicted2 = model2.predict(X2_test)

# ╔═╡ a5409e24-d891-44d2-a578-3e4718cf27be
md"""
Nah, ekstensi dari regresi linear univariat ke multivariat di scikit-learn memang cukup sederhana. Instansiasi model, proses fitting, dan prediksi sama persis, yang beda cuma persiapan datanya aja.
"""

# ╔═╡ d4cb55da-16b9-463a-843c-149ff001edc1
md"""
## Comparing Models
Manakah model yang lebih baik? Salah satu metrik yang umum digunakan untuk regresi linear adalah **mean squared error (MSE)** pada data pengujian. Model yang lebih baik memiliki MSE yang lebih rendah. Ingat ya, MSE dari model pertama pada data pengujian adalah:
"""

# ╔═╡ f4e9dc2c-ab44-481f-aeab-96fd86c15e2c
mean_squared_error(Y_test, y_test_predicted)

# ╔═╡ 5e930ec8-7784-415e-8425-5884f1f0b705
md"""MSE dari model kedua adalah:"""

# ╔═╡ 7f0d7eef-7d93-4794-a58f-9a4013d9719d
mean_squared_error(Y2_test, y_test_predicted2)

# ╔═╡ ba29b86f-aeb2-492f-ad78-d4a00ec4b6bb
md"""
Model kedua memiliki MSE yang lebih rendah, secara khusus mengalami penurunan sebesar 21% ((36.52-28.93)/36.52 = 21%); sehingga model tersebut lebih baik dalam memprediksi nilai rumah median dibandingkan dengan model univariat.

!!! warning

	Secara umum, semakin banyak fitur yang dimasukkan ke dalam model, MSE akan semakin rendah. Namun, perlu berhati-hati dalam menyertakan terlalu banyak fitur. Beberapa fitur bisa saja hanya berupa noise acak, yang pada akhirnya akan merusak interpretabilitas model.
"""

# ╔═╡ d0a323e1-2b5c-41bf-9ca4-49bba2bc9156
md"""
## More Variate
"""

# ╔═╡ 14bca17f-921b-4f19-839a-8334ca634afc
X3 = reshape(convert(Array, [boston.Rm boston.LStat boston.Crim boston.Zn boston.Indus boston.Chas boston.NOx boston.Age boston.Dis boston.Rad boston.Tax boston.PTRatio boston.Black]), (506, 13))

# ╔═╡ 3227a0e3-e022-47e7-8ccb-6837c99e0aab
# Train-Test Split
X3_train, X3_test, Y3_train, Y3_test = train_test_split(X3, y, test_size=0.3, random_state=1)

# ╔═╡ 13b84ba3-7f1e-452c-8883-6d9ba71f60d6
model3 = LinearRegression()

# ╔═╡ 5d68092e-f665-496b-b28f-cf808bdbee2f
fit!(model3, X3_train, Y3_train)

# ╔═╡ 2f330afa-9596-401c-8ce8-1fd60ac87aa6
round(model3.intercept_, digits=2)

# ╔═╡ 557ffb3f-8371-4220-8243-5bd682075e40
round.(model3.coef_, digits=2)

# ╔═╡ 7f805c0e-fbf7-4221-b225-ab9439330b9e
y_test_predicted3 = model3.predict(X3_test)

# ╔═╡ 0562d4c6-22d7-49dd-9453-f270befba8b8
mean_squared_error(Y_test, y_test_predicted)

# ╔═╡ 6f08d98e-837e-42c1-9d46-f0a7765a388d
mean_squared_error(Y2_test, y_test_predicted2)

# ╔═╡ e2a47d3d-e3e3-4eec-b173-190136e15a4d
mean_squared_error(Y3_test, y_test_predicted3)

# ╔═╡ 537ee379-a38e-40f6-b4c1-4c3464898d27
md"""
Bisa dilihat bahwa saat kita menambahkan variasi (dalam kasus model 3 adalah semua kolom kecuali MedV), maka MSE-nya semakin kecil. Akan tetapi lebih baik jika ditinjau kembali variasi yang mesti dipilih.
"""

# ╔═╡ 491d22b7-35b3-47b8-933f-eafb0f8b3080
model.score(X_test, Y_test)

# ╔═╡ 11ddb12f-7081-4d14-93ab-6deeafdcd123
model2.score(X2_test, Y2_test)

# ╔═╡ 1f555f4d-59be-4450-a2a1-f03172e91b2f
model3.score(X3_test, Y3_test)

# ╔═╡ d5b5b98a-c379-4e47-8aeb-6d2e83691fe7
md"""
Model 3 juga memiliki score yang lebih tinggi. Semakin mendekati nilai 1, semakin tinggi akurasinya.
"""

# ╔═╡ dbcf484f-1cc8-4c1f-a20b-0b8a7a2a701e
md"""
# Appendix
"""

# ╔═╡ 0f32850b-9cba-48f3-b9f4-e72ab6b3a9ce
TableOfContents(title="📚 Table of Contents", indent=true, depth=4, aside=true)

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
DataFrames = "a93c6f00-e57d-5684-b7b6-d8193f3e46c0"
Images = "916415d5-f1e6-5110-898d-aaa5f9f070e0"
NamedArrays = "86f7a689-2022-50b4-a561-43c23ac3c673"
Plots = "91a5bcdd-55d7-5caf-9e0b-520d859cae80"
PlutoUI = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
RDatasets = "ce6b1742-4840-55fa-b093-852dadbb1d8b"
ScikitLearn = "3646fa90-6ef7-5e7e-9f22-8aca16db6324"
Statistics = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"

[compat]
DataFrames = "~1.5.0"
Images = "~0.25.2"
NamedArrays = "~0.9.8"
Plots = "~1.38.12"
PlutoUI = "~0.7.51"
RDatasets = "~0.7.7"
ScikitLearn = "~0.7.0"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.9.0"
manifest_format = "2.0"
project_hash = "6cb0df712984e2c760f6637c93a577b73ddea367"

[[deps.AbstractFFTs]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "16b6dbc4cf7caee4e1e75c49485ec67b667098a0"
uuid = "621f4979-c628-5d54-868e-fcf4e3e8185c"
version = "1.3.1"
weakdeps = ["ChainRulesCore"]

    [deps.AbstractFFTs.extensions]
    AbstractFFTsChainRulesCoreExt = "ChainRulesCore"

[[deps.AbstractPlutoDingetjes]]
deps = ["Pkg"]
git-tree-sha1 = "8eaf9f1b4921132a4cff3f36a1d9ba923b14a481"
uuid = "6e696c72-6542-2067-7265-42206c756150"
version = "1.1.4"

[[deps.Adapt]]
deps = ["LinearAlgebra", "Requires"]
git-tree-sha1 = "76289dc51920fdc6e0013c872ba9551d54961c24"
uuid = "79e6a3ab-5dfb-504d-930d-738a2a938a0e"
version = "3.6.2"
weakdeps = ["StaticArrays"]

    [deps.Adapt.extensions]
    AdaptStaticArraysExt = "StaticArrays"

[[deps.ArgTools]]
uuid = "0dad84c5-d112-42e6-8d28-ef12dabb789f"
version = "1.1.1"

[[deps.ArnoldiMethod]]
deps = ["LinearAlgebra", "Random", "StaticArrays"]
git-tree-sha1 = "62e51b39331de8911e4a7ff6f5aaf38a5f4cc0ae"
uuid = "ec485272-7323-5ecc-a04f-4719b315124d"
version = "0.2.0"

[[deps.Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"

[[deps.AxisAlgorithms]]
deps = ["LinearAlgebra", "Random", "SparseArrays", "WoodburyMatrices"]
git-tree-sha1 = "66771c8d21c8ff5e3a93379480a2307ac36863f7"
uuid = "13072b0f-2c55-5437-9ae7-d433b7a33950"
version = "1.0.1"

[[deps.AxisArrays]]
deps = ["Dates", "IntervalSets", "IterTools", "RangeArrays"]
git-tree-sha1 = "1dd4d9f5beebac0c03446918741b1a03dc5e5788"
uuid = "39de3d68-74b9-583c-8d2d-e117c070f3a9"
version = "0.4.6"

[[deps.Base64]]
uuid = "2a0f44e3-6c83-55bd-87e4-b1978d98bd5f"

[[deps.BitFlags]]
git-tree-sha1 = "43b1a4a8f797c1cddadf60499a8a077d4af2cd2d"
uuid = "d1d4a3ce-64b1-5f1a-9ba4-7e7e69966f35"
version = "0.1.7"

[[deps.Bzip2_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "19a35467a82e236ff51bc17a3a44b69ef35185a2"
uuid = "6e34b625-4abd-537c-b88f-471c36dfa7a0"
version = "1.0.8+0"

[[deps.CEnum]]
git-tree-sha1 = "eb4cb44a499229b3b8426dcfb5dd85333951ff90"
uuid = "fa961155-64e5-5f13-b03f-caf6b980ea82"
version = "0.4.2"

[[deps.CSV]]
deps = ["CodecZlib", "Dates", "FilePathsBase", "InlineStrings", "Mmap", "Parsers", "PooledArrays", "PrecompileTools", "SentinelArrays", "Tables", "Unicode", "WeakRefStrings", "WorkerUtilities"]
git-tree-sha1 = "ed28c86cbde3dc3f53cf76643c2e9bc11d56acc7"
uuid = "336ed68f-0bac-5ca0-87d4-7b16caf5d00b"
version = "0.10.10"

[[deps.Cairo_jll]]
deps = ["Artifacts", "Bzip2_jll", "CompilerSupportLibraries_jll", "Fontconfig_jll", "FreeType2_jll", "Glib_jll", "JLLWrappers", "LZO_jll", "Libdl", "Pixman_jll", "Pkg", "Xorg_libXext_jll", "Xorg_libXrender_jll", "Zlib_jll", "libpng_jll"]
git-tree-sha1 = "4b859a208b2397a7a623a03449e4636bdb17bcf2"
uuid = "83423d85-b0ee-5818-9007-b63ccbeb887a"
version = "1.16.1+1"

[[deps.CatIndices]]
deps = ["CustomUnitRanges", "OffsetArrays"]
git-tree-sha1 = "a0f80a09780eed9b1d106a1bf62041c2efc995bc"
uuid = "aafaddc9-749c-510e-ac4f-586e18779b91"
version = "0.2.2"

[[deps.CategoricalArrays]]
deps = ["DataAPI", "Future", "Missings", "Printf", "Requires", "Statistics", "Unicode"]
git-tree-sha1 = "1568b28f91293458345dabba6a5ea3f183250a61"
uuid = "324d7699-5711-5eae-9e2f-1d82baa6b597"
version = "0.10.8"

    [deps.CategoricalArrays.extensions]
    CategoricalArraysJSONExt = "JSON"
    CategoricalArraysRecipesBaseExt = "RecipesBase"
    CategoricalArraysSentinelArraysExt = "SentinelArrays"
    CategoricalArraysStructTypesExt = "StructTypes"

    [deps.CategoricalArrays.weakdeps]
    JSON = "682c06a0-de6a-54ab-a142-c8b1cf79cde6"
    RecipesBase = "3cdcf5f2-1ef4-517c-9805-6587b60abb01"
    SentinelArrays = "91c51154-3ec4-41a3-a24f-3f23e20d615c"
    StructTypes = "856f2bd8-1eba-4b0a-8007-ebc267875bd4"

[[deps.ChainRulesCore]]
deps = ["Compat", "LinearAlgebra", "SparseArrays"]
git-tree-sha1 = "e30f2f4e20f7f186dc36529910beaedc60cfa644"
uuid = "d360d2e6-b24c-11e9-a2a3-2a2ae2dbcce4"
version = "1.16.0"

[[deps.Clustering]]
deps = ["Distances", "LinearAlgebra", "NearestNeighbors", "Printf", "Random", "SparseArrays", "Statistics", "StatsBase"]
git-tree-sha1 = "a6e6ce44a1e0a781772fc795fb7343b1925e9898"
uuid = "aaaa29a8-35af-508c-8bc3-b662a17a0fe5"
version = "0.15.2"

[[deps.CodecZlib]]
deps = ["TranscodingStreams", "Zlib_jll"]
git-tree-sha1 = "9c209fb7536406834aa938fb149964b985de6c83"
uuid = "944b1d66-785c-5afd-91f1-9de20f533193"
version = "0.7.1"

[[deps.ColorSchemes]]
deps = ["ColorTypes", "ColorVectorSpace", "Colors", "FixedPointNumbers", "PrecompileTools", "Random"]
git-tree-sha1 = "be6ab11021cd29f0344d5c4357b163af05a48cba"
uuid = "35d6a980-a343-548e-a6ea-1d62b119f2f4"
version = "3.21.0"

[[deps.ColorTypes]]
deps = ["FixedPointNumbers", "Random"]
git-tree-sha1 = "eb7f0f8307f71fac7c606984ea5fb2817275d6e4"
uuid = "3da002f7-5984-5a60-b8a6-cbb66c0b333f"
version = "0.11.4"

[[deps.ColorVectorSpace]]
deps = ["ColorTypes", "FixedPointNumbers", "LinearAlgebra", "SpecialFunctions", "Statistics", "TensorCore"]
git-tree-sha1 = "600cc5508d66b78aae350f7accdb58763ac18589"
uuid = "c3611d14-8923-5661-9e6a-0046d554d3a4"
version = "0.9.10"

[[deps.Colors]]
deps = ["ColorTypes", "FixedPointNumbers", "Reexport"]
git-tree-sha1 = "fc08e5930ee9a4e03f84bfb5211cb54e7769758a"
uuid = "5ae59095-9a9b-59fe-a467-6f913c188581"
version = "0.12.10"

[[deps.Combinatorics]]
git-tree-sha1 = "08c8b6831dc00bfea825826be0bc8336fc369860"
uuid = "861a8166-3701-5b0c-9a16-15d98fcdc6aa"
version = "1.0.2"

[[deps.Compat]]
deps = ["UUIDs"]
git-tree-sha1 = "7a60c856b9fa189eb34f5f8a6f6b5529b7942957"
uuid = "34da2185-b29b-5c13-b0c7-acf172513d20"
version = "4.6.1"
weakdeps = ["Dates", "LinearAlgebra"]

    [deps.Compat.extensions]
    CompatLinearAlgebraExt = "LinearAlgebra"

[[deps.CompilerSupportLibraries_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "e66e0078-7015-5450-92f7-15fbd957f2ae"
version = "1.0.2+0"

[[deps.ComputationalResources]]
git-tree-sha1 = "52cb3ec90e8a8bea0e62e275ba577ad0f74821f7"
uuid = "ed09eef8-17a6-5b46-8889-db040fac31e3"
version = "0.3.2"

[[deps.ConcurrentUtilities]]
deps = ["Serialization", "Sockets"]
git-tree-sha1 = "96d823b94ba8d187a6d8f0826e731195a74b90e9"
uuid = "f0e56b4a-5159-44fe-b623-3e5288b988bb"
version = "2.2.0"

[[deps.Conda]]
deps = ["Downloads", "JSON", "VersionParsing"]
git-tree-sha1 = "e32a90da027ca45d84678b826fffd3110bb3fc90"
uuid = "8f4d0f93-b110-5947-807f-2305c1781a2d"
version = "1.8.0"

[[deps.Contour]]
git-tree-sha1 = "d05d9e7b7aedff4e5b51a029dced05cfb6125781"
uuid = "d38c429a-6771-53c6-b99e-75d170b6e991"
version = "0.6.2"

[[deps.CoordinateTransformations]]
deps = ["LinearAlgebra", "StaticArrays"]
git-tree-sha1 = "f9d7112bfff8a19a3a4ea4e03a8e6a91fe8456bf"
uuid = "150eb455-5306-5404-9cee-2592286d6298"
version = "0.6.3"

[[deps.Crayons]]
git-tree-sha1 = "249fe38abf76d48563e2f4556bebd215aa317e15"
uuid = "a8cc5b0e-0ffa-5ad4-8c14-923d3ee1735f"
version = "4.1.1"

[[deps.CustomUnitRanges]]
git-tree-sha1 = "1a3f97f907e6dd8983b744d2642651bb162a3f7a"
uuid = "dc8bdbbb-1ca9-579f-8c36-e416f6a65cce"
version = "1.0.2"

[[deps.DataAPI]]
git-tree-sha1 = "8da84edb865b0b5b0100c0666a9bc9a0b71c553c"
uuid = "9a962f9c-6df0-11e9-0e5d-c546b8b5ee8a"
version = "1.15.0"

[[deps.DataFrames]]
deps = ["Compat", "DataAPI", "Future", "InlineStrings", "InvertedIndices", "IteratorInterfaceExtensions", "LinearAlgebra", "Markdown", "Missings", "PooledArrays", "PrettyTables", "Printf", "REPL", "Random", "Reexport", "SentinelArrays", "SnoopPrecompile", "SortingAlgorithms", "Statistics", "TableTraits", "Tables", "Unicode"]
git-tree-sha1 = "aa51303df86f8626a962fccb878430cdb0a97eee"
uuid = "a93c6f00-e57d-5684-b7b6-d8193f3e46c0"
version = "1.5.0"

[[deps.DataStructures]]
deps = ["Compat", "InteractiveUtils", "OrderedCollections"]
git-tree-sha1 = "d1fff3a548102f48987a52a2e0d114fa97d730f0"
uuid = "864edb3b-99cc-5e75-8d2d-829cb0a9cfe8"
version = "0.18.13"

[[deps.DataValueInterfaces]]
git-tree-sha1 = "bfc1187b79289637fa0ef6d4436ebdfe6905cbd6"
uuid = "e2d170a0-9d28-54be-80f0-106bbe20a464"
version = "1.0.0"

[[deps.Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"

[[deps.DelimitedFiles]]
deps = ["Mmap"]
git-tree-sha1 = "9e2f36d3c96a820c678f2f1f1782582fcf685bae"
uuid = "8bb1440f-4735-579b-a4ab-409b98df4dab"
version = "1.9.1"

[[deps.Distances]]
deps = ["LinearAlgebra", "SparseArrays", "Statistics", "StatsAPI"]
git-tree-sha1 = "49eba9ad9f7ead780bfb7ee319f962c811c6d3b2"
uuid = "b4f34e82-e78d-54a5-968a-f98e89d6e8f7"
version = "0.10.8"

[[deps.Distributed]]
deps = ["Random", "Serialization", "Sockets"]
uuid = "8ba89e20-285c-5b6f-9357-94700520ee1b"

[[deps.DocStringExtensions]]
deps = ["LibGit2"]
git-tree-sha1 = "2fb1e02f2b635d0845df5d7c167fec4dd739b00d"
uuid = "ffbed154-4ef7-542d-bbb7-c09d3a79fcae"
version = "0.9.3"

[[deps.Downloads]]
deps = ["ArgTools", "FileWatching", "LibCURL", "NetworkOptions"]
uuid = "f43a241f-c20a-4ad4-852c-f6b1247861c6"
version = "1.6.0"

[[deps.Expat_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "bad72f730e9e91c08d9427d5e8db95478a3c323d"
uuid = "2e619515-83b5-522b-bb60-26c02a35a201"
version = "2.4.8+0"

[[deps.ExprTools]]
git-tree-sha1 = "c1d06d129da9f55715c6c212866f5b1bddc5fa00"
uuid = "e2ba6199-217a-4e67-a87a-7c52f15ade04"
version = "0.1.9"

[[deps.FFMPEG]]
deps = ["FFMPEG_jll"]
git-tree-sha1 = "b57e3acbe22f8484b4b5ff66a7499717fe1a9cc8"
uuid = "c87230d0-a227-11e9-1b43-d7ebe4e7570a"
version = "0.4.1"

[[deps.FFMPEG_jll]]
deps = ["Artifacts", "Bzip2_jll", "FreeType2_jll", "FriBidi_jll", "JLLWrappers", "LAME_jll", "Libdl", "Ogg_jll", "OpenSSL_jll", "Opus_jll", "PCRE2_jll", "Pkg", "Zlib_jll", "libaom_jll", "libass_jll", "libfdk_aac_jll", "libvorbis_jll", "x264_jll", "x265_jll"]
git-tree-sha1 = "74faea50c1d007c85837327f6775bea60b5492dd"
uuid = "b22a6f82-2f65-5046-a5b2-351ab43fb4e5"
version = "4.4.2+2"

[[deps.FFTViews]]
deps = ["CustomUnitRanges", "FFTW"]
git-tree-sha1 = "cbdf14d1e8c7c8aacbe8b19862e0179fd08321c2"
uuid = "4f61f5a4-77b1-5117-aa51-3ab5ef4ef0cd"
version = "0.3.2"

[[deps.FFTW]]
deps = ["AbstractFFTs", "FFTW_jll", "LinearAlgebra", "MKL_jll", "Preferences", "Reexport"]
git-tree-sha1 = "f9818144ce7c8c41edf5c4c179c684d92aa4d9fe"
uuid = "7a1cc6ca-52ef-59f5-83cd-3a7055c09341"
version = "1.6.0"

[[deps.FFTW_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "c6033cc3892d0ef5bb9cd29b7f2f0331ea5184ea"
uuid = "f5851436-0d7a-5f13-b9de-f02708fd171a"
version = "3.3.10+0"

[[deps.FileIO]]
deps = ["Pkg", "Requires", "UUIDs"]
git-tree-sha1 = "299dc33549f68299137e51e6d49a13b5b1da9673"
uuid = "5789e2e9-d7fb-5bc7-8068-2c6fae9b9549"
version = "1.16.1"

[[deps.FilePathsBase]]
deps = ["Compat", "Dates", "Mmap", "Printf", "Test", "UUIDs"]
git-tree-sha1 = "e27c4ebe80e8699540f2d6c805cc12203b614f12"
uuid = "48062228-2e41-5def-b9a4-89aafe57970f"
version = "0.9.20"

[[deps.FileWatching]]
uuid = "7b1f6079-737a-58dc-b8bc-7a2ca5c1b5ee"

[[deps.FixedPointNumbers]]
deps = ["Statistics"]
git-tree-sha1 = "335bfdceacc84c5cdf16aadc768aa5ddfc5383cc"
uuid = "53c48c17-4a7d-5ca2-90c5-79b7896eea93"
version = "0.8.4"

[[deps.Fontconfig_jll]]
deps = ["Artifacts", "Bzip2_jll", "Expat_jll", "FreeType2_jll", "JLLWrappers", "Libdl", "Libuuid_jll", "Pkg", "Zlib_jll"]
git-tree-sha1 = "21efd19106a55620a188615da6d3d06cd7f6ee03"
uuid = "a3f928ae-7b40-5064-980b-68af3947d34b"
version = "2.13.93+0"

[[deps.Formatting]]
deps = ["Printf"]
git-tree-sha1 = "8339d61043228fdd3eb658d86c926cb282ae72a8"
uuid = "59287772-0a20-5a39-b81b-1366585eb4c0"
version = "0.4.2"

[[deps.FreeType2_jll]]
deps = ["Artifacts", "Bzip2_jll", "JLLWrappers", "Libdl", "Pkg", "Zlib_jll"]
git-tree-sha1 = "87eb71354d8ec1a96d4a7636bd57a7347dde3ef9"
uuid = "d7e528f0-a631-5988-bf34-fe36492bcfd7"
version = "2.10.4+0"

[[deps.FriBidi_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "aa31987c2ba8704e23c6c8ba8a4f769d5d7e4f91"
uuid = "559328eb-81f9-559d-9380-de523a88c83c"
version = "1.0.10+0"

[[deps.Future]]
deps = ["Random"]
uuid = "9fa8497b-333b-5362-9e8d-4d0656e87820"

[[deps.GLFW_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Libglvnd_jll", "Pkg", "Xorg_libXcursor_jll", "Xorg_libXi_jll", "Xorg_libXinerama_jll", "Xorg_libXrandr_jll"]
git-tree-sha1 = "d972031d28c8c8d9d7b41a536ad7bb0c2579caca"
uuid = "0656b61e-2033-5cc2-a64a-77c0f6c09b89"
version = "3.3.8+0"

[[deps.GR]]
deps = ["Artifacts", "Base64", "DelimitedFiles", "Downloads", "GR_jll", "HTTP", "JSON", "Libdl", "LinearAlgebra", "Pkg", "Preferences", "Printf", "Random", "Serialization", "Sockets", "TOML", "Tar", "Test", "UUIDs", "p7zip_jll"]
git-tree-sha1 = "d014972cd6f5afb1f8cd7adf000b7a966d62c304"
uuid = "28b8d3ca-fb5f-59d9-8090-bfdbd6d07a71"
version = "0.72.5"

[[deps.GR_jll]]
deps = ["Artifacts", "Bzip2_jll", "Cairo_jll", "FFMPEG_jll", "Fontconfig_jll", "GLFW_jll", "JLLWrappers", "JpegTurbo_jll", "Libdl", "Libtiff_jll", "Pixman_jll", "Qt5Base_jll", "Zlib_jll", "libpng_jll"]
git-tree-sha1 = "f670f269909a9114df1380cc0fcaa316fff655fb"
uuid = "d2c73de3-f751-5644-a686-071e5b155ba9"
version = "0.72.5+0"

[[deps.Gettext_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "JLLWrappers", "Libdl", "Libiconv_jll", "Pkg", "XML2_jll"]
git-tree-sha1 = "9b02998aba7bf074d14de89f9d37ca24a1a0b046"
uuid = "78b55507-aeef-58d4-861c-77aaff3498b1"
version = "0.21.0+0"

[[deps.Ghostscript_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "43ba3d3c82c18d88471cfd2924931658838c9d8f"
uuid = "61579ee1-b43e-5ca0-a5da-69d92c66a64b"
version = "9.55.0+4"

[[deps.Glib_jll]]
deps = ["Artifacts", "Gettext_jll", "JLLWrappers", "Libdl", "Libffi_jll", "Libiconv_jll", "Libmount_jll", "PCRE2_jll", "Pkg", "Zlib_jll"]
git-tree-sha1 = "d3b3624125c1474292d0d8ed0f65554ac37ddb23"
uuid = "7746bdde-850d-59dc-9ae8-88ece973131d"
version = "2.74.0+2"

[[deps.Graphics]]
deps = ["Colors", "LinearAlgebra", "NaNMath"]
git-tree-sha1 = "d61890399bc535850c4bf08e4e0d3a7ad0f21cbd"
uuid = "a2bd30eb-e257-5431-a919-1863eab51364"
version = "1.1.2"

[[deps.Graphite2_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "344bf40dcab1073aca04aa0df4fb092f920e4011"
uuid = "3b182d85-2403-5c21-9c21-1e1f0cc25472"
version = "1.3.14+0"

[[deps.Graphs]]
deps = ["ArnoldiMethod", "Compat", "DataStructures", "Distributed", "Inflate", "LinearAlgebra", "Random", "SharedArrays", "SimpleTraits", "SparseArrays", "Statistics"]
git-tree-sha1 = "1cf1d7dcb4bc32d7b4a5add4232db3750c27ecb4"
uuid = "86223c79-3864-5bf0-83f7-82e725a168b6"
version = "1.8.0"

[[deps.Grisu]]
git-tree-sha1 = "53bb909d1151e57e2484c3d1b53e19552b887fb2"
uuid = "42e2da0e-8278-4e71-bc24-59509adca0fe"
version = "1.0.2"

[[deps.HTTP]]
deps = ["Base64", "CodecZlib", "ConcurrentUtilities", "Dates", "Logging", "LoggingExtras", "MbedTLS", "NetworkOptions", "OpenSSL", "Random", "SimpleBufferStream", "Sockets", "URIs", "UUIDs"]
git-tree-sha1 = "41f7dfb2b20e7e8bf64f6b6fae98f4d2df027b06"
uuid = "cd3eb016-35fb-5094-929b-558a96fad6f3"
version = "1.9.4"

[[deps.HarfBuzz_jll]]
deps = ["Artifacts", "Cairo_jll", "Fontconfig_jll", "FreeType2_jll", "Glib_jll", "Graphite2_jll", "JLLWrappers", "Libdl", "Libffi_jll", "Pkg"]
git-tree-sha1 = "129acf094d168394e80ee1dc4bc06ec835e510a3"
uuid = "2e76f6c2-a576-52d4-95c1-20adfe4de566"
version = "2.8.1+1"

[[deps.Hyperscript]]
deps = ["Test"]
git-tree-sha1 = "8d511d5b81240fc8e6802386302675bdf47737b9"
uuid = "47d2ed2b-36de-50cf-bf87-49c2cf4b8b91"
version = "0.0.4"

[[deps.HypertextLiteral]]
deps = ["Tricks"]
git-tree-sha1 = "c47c5fa4c5308f27ccaac35504858d8914e102f9"
uuid = "ac1192a8-f4b3-4bfe-ba22-af5b92cd3ab2"
version = "0.9.4"

[[deps.IOCapture]]
deps = ["Logging", "Random"]
git-tree-sha1 = "d75853a0bdbfb1ac815478bacd89cd27b550ace6"
uuid = "b5f81e59-6552-4d32-b1f0-c071b021bf89"
version = "0.2.3"

[[deps.ImageAxes]]
deps = ["AxisArrays", "ImageBase", "ImageCore", "Reexport", "SimpleTraits"]
git-tree-sha1 = "c54b581a83008dc7f292e205f4c409ab5caa0f04"
uuid = "2803e5a7-5153-5ecf-9a86-9b4c37f5f5ac"
version = "0.6.10"

[[deps.ImageBase]]
deps = ["ImageCore", "Reexport"]
git-tree-sha1 = "b51bb8cae22c66d0f6357e3bcb6363145ef20835"
uuid = "c817782e-172a-44cc-b673-b171935fbb9e"
version = "0.1.5"

[[deps.ImageContrastAdjustment]]
deps = ["ImageCore", "ImageTransformations", "Parameters"]
git-tree-sha1 = "0d75cafa80cf22026cea21a8e6cf965295003edc"
uuid = "f332f351-ec65-5f6a-b3d1-319c6670881a"
version = "0.3.10"

[[deps.ImageCore]]
deps = ["AbstractFFTs", "ColorVectorSpace", "Colors", "FixedPointNumbers", "Graphics", "MappedArrays", "MosaicViews", "OffsetArrays", "PaddedViews", "Reexport"]
git-tree-sha1 = "acf614720ef026d38400b3817614c45882d75500"
uuid = "a09fc81d-aa75-5fe9-8630-4744c3626534"
version = "0.9.4"

[[deps.ImageDistances]]
deps = ["Distances", "ImageCore", "ImageMorphology", "LinearAlgebra", "Statistics"]
git-tree-sha1 = "b1798a4a6b9aafb530f8f0c4a7b2eb5501e2f2a3"
uuid = "51556ac3-7006-55f5-8cb3-34580c88182d"
version = "0.2.16"

[[deps.ImageFiltering]]
deps = ["CatIndices", "ComputationalResources", "DataStructures", "FFTViews", "FFTW", "ImageBase", "ImageCore", "LinearAlgebra", "OffsetArrays", "Reexport", "SnoopPrecompile", "SparseArrays", "StaticArrays", "Statistics", "TiledIteration"]
git-tree-sha1 = "c3630289f3591711f5add6ef1347bc20f1bb8d27"
uuid = "6a3955dd-da59-5b1f-98d4-e7296123deb5"
version = "0.7.4"

[[deps.ImageIO]]
deps = ["FileIO", "IndirectArrays", "JpegTurbo", "LazyModules", "Netpbm", "OpenEXR", "PNGFiles", "QOI", "Sixel", "TiffImages", "UUIDs"]
git-tree-sha1 = "342f789fd041a55166764c351da1710db97ce0e0"
uuid = "82e4d734-157c-48bb-816b-45c225c6df19"
version = "0.6.6"

[[deps.ImageMagick]]
deps = ["FileIO", "ImageCore", "ImageMagick_jll", "InteractiveUtils", "Libdl", "Pkg", "Random"]
git-tree-sha1 = "5bc1cb62e0c5f1005868358db0692c994c3a13c6"
uuid = "6218d12a-5da1-5696-b52f-db25d2ecc6d1"
version = "1.2.1"

[[deps.ImageMagick_jll]]
deps = ["Artifacts", "Ghostscript_jll", "JLLWrappers", "JpegTurbo_jll", "Libdl", "Libtiff_jll", "Pkg", "Zlib_jll", "libpng_jll"]
git-tree-sha1 = "124626988534986113cfd876e3093e4a03890f58"
uuid = "c73af94c-d91f-53ed-93a7-00f77d67a9d7"
version = "6.9.12+3"

[[deps.ImageMetadata]]
deps = ["AxisArrays", "ImageAxes", "ImageBase", "ImageCore"]
git-tree-sha1 = "36cbaebed194b292590cba2593da27b34763804a"
uuid = "bc367c6b-8a6b-528e-b4bd-a4b897500b49"
version = "0.9.8"

[[deps.ImageMorphology]]
deps = ["ImageCore", "LinearAlgebra", "Requires", "TiledIteration"]
git-tree-sha1 = "e7c68ab3df4a75511ba33fc5d8d9098007b579a8"
uuid = "787d08f9-d448-5407-9aad-5290dd7ab264"
version = "0.3.2"

[[deps.ImageQualityIndexes]]
deps = ["ImageContrastAdjustment", "ImageCore", "ImageDistances", "ImageFiltering", "LazyModules", "OffsetArrays", "PrecompileTools", "Statistics"]
git-tree-sha1 = "bcc2f0db769e5d42a67f501ec6781401a4389e8f"
uuid = "2996bd0c-7a13-11e9-2da2-2f5ce47296a9"
version = "0.3.5"

[[deps.ImageSegmentation]]
deps = ["Clustering", "DataStructures", "Distances", "Graphs", "ImageCore", "ImageFiltering", "ImageMorphology", "LinearAlgebra", "MetaGraphs", "RegionTrees", "SimpleWeightedGraphs", "StaticArrays", "Statistics"]
git-tree-sha1 = "44664eea5408828c03e5addb84fa4f916132fc26"
uuid = "80713f31-8817-5129-9cf8-209ff8fb23e1"
version = "1.8.1"

[[deps.ImageShow]]
deps = ["Base64", "ColorSchemes", "FileIO", "ImageBase", "ImageCore", "OffsetArrays", "StackViews"]
git-tree-sha1 = "ce28c68c900eed3cdbfa418be66ed053e54d4f56"
uuid = "4e3cecfd-b093-5904-9786-8bbb286a6a31"
version = "0.3.7"

[[deps.ImageTransformations]]
deps = ["AxisAlgorithms", "ColorVectorSpace", "CoordinateTransformations", "ImageBase", "ImageCore", "Interpolations", "OffsetArrays", "Rotations", "StaticArrays"]
git-tree-sha1 = "8717482f4a2108c9358e5c3ca903d3a6113badc9"
uuid = "02fcd773-0e25-5acc-982a-7f6622650795"
version = "0.9.5"

[[deps.Images]]
deps = ["Base64", "FileIO", "Graphics", "ImageAxes", "ImageBase", "ImageContrastAdjustment", "ImageCore", "ImageDistances", "ImageFiltering", "ImageIO", "ImageMagick", "ImageMetadata", "ImageMorphology", "ImageQualityIndexes", "ImageSegmentation", "ImageShow", "ImageTransformations", "IndirectArrays", "IntegralArrays", "Random", "Reexport", "SparseArrays", "StaticArrays", "Statistics", "StatsBase", "TiledIteration"]
git-tree-sha1 = "03d1301b7ec885b266c0f816f338368c6c0b81bd"
uuid = "916415d5-f1e6-5110-898d-aaa5f9f070e0"
version = "0.25.2"

[[deps.Imath_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "3d09a9f60edf77f8a4d99f9e015e8fbf9989605d"
uuid = "905a6f67-0a94-5f89-b386-d35d92009cd1"
version = "3.1.7+0"

[[deps.IndirectArrays]]
git-tree-sha1 = "012e604e1c7458645cb8b436f8fba789a51b257f"
uuid = "9b13fd28-a010-5f03-acff-a1bbcff69959"
version = "1.0.0"

[[deps.Inflate]]
git-tree-sha1 = "5cd07aab533df5170988219191dfad0519391428"
uuid = "d25df0c9-e2be-5dd7-82c8-3ad0b3e990b9"
version = "0.1.3"

[[deps.InlineStrings]]
deps = ["Parsers"]
git-tree-sha1 = "9cc2baf75c6d09f9da536ddf58eb2f29dedaf461"
uuid = "842dd82b-1e85-43dc-bf29-5d0ee9dffc48"
version = "1.4.0"

[[deps.IntegralArrays]]
deps = ["ColorTypes", "FixedPointNumbers", "IntervalSets"]
git-tree-sha1 = "be8e690c3973443bec584db3346ddc904d4884eb"
uuid = "1d092043-8f09-5a30-832f-7509e371ab51"
version = "0.1.5"

[[deps.IntelOpenMP_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "0cb9352ef2e01574eeebdb102948a58740dcaf83"
uuid = "1d5cc7b8-4909-519e-a0f8-d0f5ad9712d0"
version = "2023.1.0+0"

[[deps.InteractiveUtils]]
deps = ["Markdown"]
uuid = "b77e0a4c-d291-57a0-90e8-8db25a27a240"

[[deps.Interpolations]]
deps = ["Adapt", "AxisAlgorithms", "ChainRulesCore", "LinearAlgebra", "OffsetArrays", "Random", "Ratios", "Requires", "SharedArrays", "SparseArrays", "StaticArrays", "WoodburyMatrices"]
git-tree-sha1 = "721ec2cf720536ad005cb38f50dbba7b02419a15"
uuid = "a98d9a8b-a2ab-59e6-89dd-64a1c18fca59"
version = "0.14.7"

[[deps.IntervalSets]]
deps = ["Dates", "Random", "Statistics"]
git-tree-sha1 = "16c0cc91853084cb5f58a78bd209513900206ce6"
uuid = "8197267c-284f-5f27-9208-e0e47529a953"
version = "0.7.4"

[[deps.InvertedIndices]]
git-tree-sha1 = "0dc7b50b8d436461be01300fd8cd45aa0274b038"
uuid = "41ab1584-1d38-5bbf-9106-f11c6c58b48f"
version = "1.3.0"

[[deps.IrrationalConstants]]
git-tree-sha1 = "630b497eafcc20001bba38a4651b327dcfc491d2"
uuid = "92d709cd-6900-40b7-9082-c6be49f344b6"
version = "0.2.2"

[[deps.IterTools]]
git-tree-sha1 = "fa6287a4469f5e048d763df38279ee729fbd44e5"
uuid = "c8e1da08-722c-5040-9ed9-7db0dc04731e"
version = "1.4.0"

[[deps.IteratorInterfaceExtensions]]
git-tree-sha1 = "a3f24677c21f5bbe9d2a714f95dcd58337fb2856"
uuid = "82899510-4779-5014-852e-03e436cf321d"
version = "1.0.0"

[[deps.JLD2]]
deps = ["FileIO", "MacroTools", "Mmap", "OrderedCollections", "Pkg", "Printf", "Reexport", "Requires", "TranscodingStreams", "UUIDs"]
git-tree-sha1 = "42c17b18ced77ff0be65957a591d34f4ed57c631"
uuid = "033835bb-8acc-5ee8-8aae-3f567f8a3819"
version = "0.4.31"

[[deps.JLFzf]]
deps = ["Pipe", "REPL", "Random", "fzf_jll"]
git-tree-sha1 = "f377670cda23b6b7c1c0b3893e37451c5c1a2185"
uuid = "1019f520-868f-41f5-a6de-eb00f4b6a39c"
version = "0.1.5"

[[deps.JLLWrappers]]
deps = ["Preferences"]
git-tree-sha1 = "abc9885a7ca2052a736a600f7fa66209f96506e1"
uuid = "692b3bcd-3c85-4b1f-b108-f13ce0eb3210"
version = "1.4.1"

[[deps.JSON]]
deps = ["Dates", "Mmap", "Parsers", "Unicode"]
git-tree-sha1 = "31e996f0a15c7b280ba9f76636b3ff9e2ae58c9a"
uuid = "682c06a0-de6a-54ab-a142-c8b1cf79cde6"
version = "0.21.4"

[[deps.JpegTurbo]]
deps = ["CEnum", "FileIO", "ImageCore", "JpegTurbo_jll", "TOML"]
git-tree-sha1 = "106b6aa272f294ba47e96bd3acbabdc0407b5c60"
uuid = "b835a17e-a41a-41e7-81f0-2f016b05efe0"
version = "0.1.2"

[[deps.JpegTurbo_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "6f2675ef130a300a112286de91973805fcc5ffbc"
uuid = "aacddb02-875f-59d6-b918-886e6ef4fbf8"
version = "2.1.91+0"

[[deps.LAME_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "f6250b16881adf048549549fba48b1161acdac8c"
uuid = "c1c5ebd0-6772-5130-a774-d5fcae4a789d"
version = "3.100.1+0"

[[deps.LERC_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "bf36f528eec6634efc60d7ec062008f171071434"
uuid = "88015f11-f218-50d7-93a8-a6af411a945d"
version = "3.0.0+1"

[[deps.LZO_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "e5b909bcf985c5e2605737d2ce278ed791b89be6"
uuid = "dd4b983a-f0e5-5f8d-a1b7-129d4a5fb1ac"
version = "2.10.1+0"

[[deps.LaTeXStrings]]
git-tree-sha1 = "f2355693d6778a178ade15952b7ac47a4ff97996"
uuid = "b964fa9f-0449-5b57-a5c2-d3ea65f4040f"
version = "1.3.0"

[[deps.Latexify]]
deps = ["Formatting", "InteractiveUtils", "LaTeXStrings", "MacroTools", "Markdown", "OrderedCollections", "Printf", "Requires"]
git-tree-sha1 = "099e356f267354f46ba65087981a77da23a279b7"
uuid = "23fbe1c1-3f47-55db-b15f-69d7ec21a316"
version = "0.16.0"

    [deps.Latexify.extensions]
    DataFramesExt = "DataFrames"
    SymEngineExt = "SymEngine"

    [deps.Latexify.weakdeps]
    DataFrames = "a93c6f00-e57d-5684-b7b6-d8193f3e46c0"
    SymEngine = "123dc426-2d89-5057-bbad-38513e3affd8"

[[deps.LazyArtifacts]]
deps = ["Artifacts", "Pkg"]
uuid = "4af54fe1-eca0-43a8-85a7-787d91b784e3"

[[deps.LazyModules]]
git-tree-sha1 = "a560dd966b386ac9ae60bdd3a3d3a326062d3c3e"
uuid = "8cdb02fc-e678-4876-92c5-9defec4f444e"
version = "0.3.1"

[[deps.LibCURL]]
deps = ["LibCURL_jll", "MozillaCACerts_jll"]
uuid = "b27032c2-a3e7-50c8-80cd-2d36dbcbfd21"
version = "0.6.3"

[[deps.LibCURL_jll]]
deps = ["Artifacts", "LibSSH2_jll", "Libdl", "MbedTLS_jll", "Zlib_jll", "nghttp2_jll"]
uuid = "deac9b47-8bc7-5906-a0fe-35ac56dc84c0"
version = "7.84.0+0"

[[deps.LibGit2]]
deps = ["Base64", "NetworkOptions", "Printf", "SHA"]
uuid = "76f85450-5226-5b5a-8eaa-529ad045b433"

[[deps.LibSSH2_jll]]
deps = ["Artifacts", "Libdl", "MbedTLS_jll"]
uuid = "29816b5a-b9ab-546f-933c-edad1886dfa8"
version = "1.10.2+0"

[[deps.Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"

[[deps.Libffi_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "0b4a5d71f3e5200a7dff793393e09dfc2d874290"
uuid = "e9f186c6-92d2-5b65-8a66-fee21dc1b490"
version = "3.2.2+1"

[[deps.Libgcrypt_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Libgpg_error_jll", "Pkg"]
git-tree-sha1 = "64613c82a59c120435c067c2b809fc61cf5166ae"
uuid = "d4300ac3-e22c-5743-9152-c294e39db1e4"
version = "1.8.7+0"

[[deps.Libglvnd_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libX11_jll", "Xorg_libXext_jll"]
git-tree-sha1 = "6f73d1dd803986947b2c750138528a999a6c7733"
uuid = "7e76a0d4-f3c7-5321-8279-8d96eeed0f29"
version = "1.6.0+0"

[[deps.Libgpg_error_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "c333716e46366857753e273ce6a69ee0945a6db9"
uuid = "7add5ba3-2f88-524e-9cd5-f83b8a55f7b8"
version = "1.42.0+0"

[[deps.Libiconv_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "c7cb1f5d892775ba13767a87c7ada0b980ea0a71"
uuid = "94ce4f54-9a6c-5748-9c1c-f9c7231a4531"
version = "1.16.1+2"

[[deps.Libmount_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "9c30530bf0effd46e15e0fdcf2b8636e78cbbd73"
uuid = "4b2f31a3-9ecc-558c-b454-b3730dcb73e9"
version = "2.35.0+0"

[[deps.Libtiff_jll]]
deps = ["Artifacts", "JLLWrappers", "JpegTurbo_jll", "LERC_jll", "Libdl", "Pkg", "Zlib_jll", "Zstd_jll"]
git-tree-sha1 = "3eb79b0ca5764d4799c06699573fd8f533259713"
uuid = "89763e89-9b03-5906-acba-b20f662cd828"
version = "4.4.0+0"

[[deps.Libuuid_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "7f3efec06033682db852f8b3bc3c1d2b0a0ab066"
uuid = "38a345b3-de98-5d2b-a5d3-14cd9215e700"
version = "2.36.0+0"

[[deps.LinearAlgebra]]
deps = ["Libdl", "OpenBLAS_jll", "libblastrampoline_jll"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"

[[deps.LogExpFunctions]]
deps = ["DocStringExtensions", "IrrationalConstants", "LinearAlgebra"]
git-tree-sha1 = "0a1b7c2863e44523180fdb3146534e265a91870b"
uuid = "2ab3a3ac-af41-5b50-aa03-7779005ae688"
version = "0.3.23"

    [deps.LogExpFunctions.extensions]
    LogExpFunctionsChainRulesCoreExt = "ChainRulesCore"
    LogExpFunctionsChangesOfVariablesExt = "ChangesOfVariables"
    LogExpFunctionsInverseFunctionsExt = "InverseFunctions"

    [deps.LogExpFunctions.weakdeps]
    ChainRulesCore = "d360d2e6-b24c-11e9-a2a3-2a2ae2dbcce4"
    ChangesOfVariables = "9e997f8a-9a97-42d5-a9f1-ce6bfc15e2c0"
    InverseFunctions = "3587e190-3f89-42d0-90ee-14403ec27112"

[[deps.Logging]]
uuid = "56ddb016-857b-54e1-b83d-db4d58db5568"

[[deps.LoggingExtras]]
deps = ["Dates", "Logging"]
git-tree-sha1 = "cedb76b37bc5a6c702ade66be44f831fa23c681e"
uuid = "e6f89c97-d47a-5376-807f-9c37f3926c36"
version = "1.0.0"

[[deps.MIMEs]]
git-tree-sha1 = "65f28ad4b594aebe22157d6fac869786a255b7eb"
uuid = "6c6e2e6c-3030-632d-7369-2d6c69616d65"
version = "0.1.4"

[[deps.MKL_jll]]
deps = ["Artifacts", "IntelOpenMP_jll", "JLLWrappers", "LazyArtifacts", "Libdl", "Pkg"]
git-tree-sha1 = "2ce8695e1e699b68702c03402672a69f54b8aca9"
uuid = "856f044c-d86e-5d09-b602-aeab76dc8ba7"
version = "2022.2.0+0"

[[deps.MacroTools]]
deps = ["Markdown", "Random"]
git-tree-sha1 = "42324d08725e200c23d4dfb549e0d5d89dede2d2"
uuid = "1914dd2f-81c6-5fcd-8719-6d5c9610ff09"
version = "0.5.10"

[[deps.MappedArrays]]
git-tree-sha1 = "2dab0221fe2b0f2cb6754eaa743cc266339f527e"
uuid = "dbb5928d-eab1-5f90-85c2-b9b0edb7c900"
version = "0.4.2"

[[deps.Markdown]]
deps = ["Base64"]
uuid = "d6f4376e-aef5-505a-96c1-9c027394607a"

[[deps.MbedTLS]]
deps = ["Dates", "MbedTLS_jll", "MozillaCACerts_jll", "Random", "Sockets"]
git-tree-sha1 = "03a9b9718f5682ecb107ac9f7308991db4ce395b"
uuid = "739be429-bea8-5141-9913-cc70e7f3736d"
version = "1.1.7"

[[deps.MbedTLS_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "c8ffd9c3-330d-5841-b78e-0817d7145fa1"
version = "2.28.2+0"

[[deps.Measures]]
git-tree-sha1 = "c13304c81eec1ed3af7fc20e75fb6b26092a1102"
uuid = "442fdcdd-2543-5da2-b0f3-8c86c306513e"
version = "0.3.2"

[[deps.MetaGraphs]]
deps = ["Graphs", "JLD2", "Random"]
git-tree-sha1 = "1130dbe1d5276cb656f6e1094ce97466ed700e5a"
uuid = "626554b9-1ddb-594c-aa3c-2596fe9399a5"
version = "0.7.2"

[[deps.Missings]]
deps = ["DataAPI"]
git-tree-sha1 = "f66bdc5de519e8f8ae43bdc598782d35a25b1272"
uuid = "e1d29d7a-bbdc-5cf2-9ac0-f12de2c33e28"
version = "1.1.0"

[[deps.Mmap]]
uuid = "a63ad114-7e13-5084-954f-fe012c677804"

[[deps.Mocking]]
deps = ["Compat", "ExprTools"]
git-tree-sha1 = "782e258e80d68a73d8c916e55f8ced1de00c2cea"
uuid = "78c3b35d-d492-501b-9361-3d52fe80e533"
version = "0.7.6"

[[deps.MosaicViews]]
deps = ["MappedArrays", "OffsetArrays", "PaddedViews", "StackViews"]
git-tree-sha1 = "7b86a5d4d70a9f5cdf2dacb3cbe6d251d1a61dbe"
uuid = "e94cdb99-869f-56ef-bcf0-1ae2bcbe0389"
version = "0.3.4"

[[deps.MozillaCACerts_jll]]
uuid = "14a3606d-f60d-562e-9121-12d972cd8159"
version = "2022.10.11"

[[deps.NaNMath]]
deps = ["OpenLibm_jll"]
git-tree-sha1 = "0877504529a3e5c3343c6f8b4c0381e57e4387e4"
uuid = "77ba4419-2d1f-58cd-9bb1-8ffee604a2e3"
version = "1.0.2"

[[deps.NamedArrays]]
deps = ["Combinatorics", "DataStructures", "DelimitedFiles", "InvertedIndices", "LinearAlgebra", "Random", "Requires", "SparseArrays", "Statistics"]
git-tree-sha1 = "b84e17976a40cb2bfe3ae7edb3673a8c630d4f95"
uuid = "86f7a689-2022-50b4-a561-43c23ac3c673"
version = "0.9.8"

[[deps.NearestNeighbors]]
deps = ["Distances", "StaticArrays"]
git-tree-sha1 = "2c3726ceb3388917602169bed973dbc97f1b51a8"
uuid = "b8a86587-4115-5ab1-83bc-aa920d37bbce"
version = "0.4.13"

[[deps.Netpbm]]
deps = ["FileIO", "ImageCore", "ImageMetadata"]
git-tree-sha1 = "5ae7ca23e13855b3aba94550f26146c01d259267"
uuid = "f09324ee-3d7c-5217-9330-fc30815ba969"
version = "1.1.0"

[[deps.NetworkOptions]]
uuid = "ca575930-c2e3-43a9-ace4-1e988b2c1908"
version = "1.2.0"

[[deps.OffsetArrays]]
deps = ["Adapt"]
git-tree-sha1 = "82d7c9e310fe55aa54996e6f7f94674e2a38fcb4"
uuid = "6fe1bfb0-de20-5000-8ca7-80f57d26f881"
version = "1.12.9"

[[deps.Ogg_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "887579a3eb005446d514ab7aeac5d1d027658b8f"
uuid = "e7412a2a-1a6e-54c0-be00-318e2571c051"
version = "1.3.5+1"

[[deps.OpenBLAS_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Libdl"]
uuid = "4536629a-c528-5b80-bd46-f80d51c5b363"
version = "0.3.21+4"

[[deps.OpenEXR]]
deps = ["Colors", "FileIO", "OpenEXR_jll"]
git-tree-sha1 = "327f53360fdb54df7ecd01e96ef1983536d1e633"
uuid = "52e1d378-f018-4a11-a4be-720524705ac7"
version = "0.3.2"

[[deps.OpenEXR_jll]]
deps = ["Artifacts", "Imath_jll", "JLLWrappers", "Libdl", "Zlib_jll"]
git-tree-sha1 = "a4ca623df1ae99d09bc9868b008262d0c0ac1e4f"
uuid = "18a262bb-aa17-5467-a713-aee519bc75cb"
version = "3.1.4+0"

[[deps.OpenLibm_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "05823500-19ac-5b8b-9628-191a04bc5112"
version = "0.8.1+0"

[[deps.OpenSSL]]
deps = ["BitFlags", "Dates", "MozillaCACerts_jll", "OpenSSL_jll", "Sockets"]
git-tree-sha1 = "51901a49222b09e3743c65b8847687ae5fc78eb2"
uuid = "4d8831e6-92b7-49fb-bdf8-b643e874388c"
version = "1.4.1"

[[deps.OpenSSL_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "9ff31d101d987eb9d66bd8b176ac7c277beccd09"
uuid = "458c3c95-2e84-50aa-8efc-19380b2a3a95"
version = "1.1.20+0"

[[deps.OpenSpecFun_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "13652491f6856acfd2db29360e1bbcd4565d04f1"
uuid = "efe28fd5-8261-553b-a9e1-b2916fc3738e"
version = "0.5.5+0"

[[deps.Opus_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "51a08fb14ec28da2ec7a927c4337e4332c2a4720"
uuid = "91d4177d-7536-5919-b921-800302f37372"
version = "1.3.2+0"

[[deps.OrderedCollections]]
git-tree-sha1 = "d321bf2de576bf25ec4d3e4360faca399afca282"
uuid = "bac558e1-5e72-5ebc-8fee-abe8a469f55d"
version = "1.6.0"

[[deps.PCRE2_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "efcefdf7-47ab-520b-bdef-62a2eaa19f15"
version = "10.42.0+0"

[[deps.PNGFiles]]
deps = ["Base64", "CEnum", "ImageCore", "IndirectArrays", "OffsetArrays", "libpng_jll"]
git-tree-sha1 = "f809158b27eba0c18c269cf2a2be6ed751d3e81d"
uuid = "f57f5aa1-a3ce-4bc8-8ab9-96f992907883"
version = "0.3.17"

[[deps.PaddedViews]]
deps = ["OffsetArrays"]
git-tree-sha1 = "0fac6313486baae819364c52b4f483450a9d793f"
uuid = "5432bcbf-9aad-5242-b902-cca2824c8663"
version = "0.5.12"

[[deps.Parameters]]
deps = ["OrderedCollections", "UnPack"]
git-tree-sha1 = "34c0e9ad262e5f7fc75b10a9952ca7692cfc5fbe"
uuid = "d96e819e-fc66-5662-9728-84c9c7592b0a"
version = "0.12.3"

[[deps.Parsers]]
deps = ["Dates", "PrecompileTools", "UUIDs"]
git-tree-sha1 = "a5aef8d4a6e8d81f171b2bd4be5265b01384c74c"
uuid = "69de0a69-1ddd-5017-9359-2bf0b02dc9f0"
version = "2.5.10"

[[deps.Pipe]]
git-tree-sha1 = "6842804e7867b115ca9de748a0cf6b364523c16d"
uuid = "b98c9c47-44ae-5843-9183-064241ee97a0"
version = "1.3.0"

[[deps.Pixman_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "b4f5d02549a10e20780a24fce72bea96b6329e29"
uuid = "30392449-352a-5448-841d-b1acce4e97dc"
version = "0.40.1+0"

[[deps.Pkg]]
deps = ["Artifacts", "Dates", "Downloads", "FileWatching", "LibGit2", "Libdl", "Logging", "Markdown", "Printf", "REPL", "Random", "SHA", "Serialization", "TOML", "Tar", "UUIDs", "p7zip_jll"]
uuid = "44cfe95a-1eb2-52ea-b672-e2afdf69b78f"
version = "1.9.0"

[[deps.PkgVersion]]
deps = ["Pkg"]
git-tree-sha1 = "f6cf8e7944e50901594838951729a1861e668cb8"
uuid = "eebad327-c553-4316-9ea0-9fa01ccd7688"
version = "0.3.2"

[[deps.PlotThemes]]
deps = ["PlotUtils", "Statistics"]
git-tree-sha1 = "1f03a2d339f42dca4a4da149c7e15e9b896ad899"
uuid = "ccf2f8ad-2431-5c83-bf29-c5338b663b6a"
version = "3.1.0"

[[deps.PlotUtils]]
deps = ["ColorSchemes", "Colors", "Dates", "PrecompileTools", "Printf", "Random", "Reexport", "Statistics"]
git-tree-sha1 = "f92e1315dadf8c46561fb9396e525f7200cdc227"
uuid = "995b91a9-d308-5afd-9ec6-746e21dbc043"
version = "1.3.5"

[[deps.Plots]]
deps = ["Base64", "Contour", "Dates", "Downloads", "FFMPEG", "FixedPointNumbers", "GR", "JLFzf", "JSON", "LaTeXStrings", "Latexify", "LinearAlgebra", "Measures", "NaNMath", "Pkg", "PlotThemes", "PlotUtils", "PrecompileTools", "Preferences", "Printf", "REPL", "Random", "RecipesBase", "RecipesPipeline", "Reexport", "RelocatableFolders", "Requires", "Scratch", "Showoff", "SparseArrays", "Statistics", "StatsBase", "UUIDs", "UnicodeFun", "Unzip"]
git-tree-sha1 = "d03ef538114b38f89d66776f2d8fdc0280f90621"
uuid = "91a5bcdd-55d7-5caf-9e0b-520d859cae80"
version = "1.38.12"

    [deps.Plots.extensions]
    FileIOExt = "FileIO"
    GeometryBasicsExt = "GeometryBasics"
    IJuliaExt = "IJulia"
    ImageInTerminalExt = "ImageInTerminal"
    UnitfulExt = "Unitful"

    [deps.Plots.weakdeps]
    FileIO = "5789e2e9-d7fb-5bc7-8068-2c6fae9b9549"
    GeometryBasics = "5c1252a2-5f33-56bf-86c9-59e7332b4326"
    IJulia = "7073ff75-c697-5162-941a-fcdaad2a7d2a"
    ImageInTerminal = "d8c32880-2388-543b-8c61-d9f865259254"
    Unitful = "1986cc42-f94f-5a68-af5c-568840ba703d"

[[deps.PlutoUI]]
deps = ["AbstractPlutoDingetjes", "Base64", "ColorTypes", "Dates", "FixedPointNumbers", "Hyperscript", "HypertextLiteral", "IOCapture", "InteractiveUtils", "JSON", "Logging", "MIMEs", "Markdown", "Random", "Reexport", "URIs", "UUIDs"]
git-tree-sha1 = "b478a748be27bd2f2c73a7690da219d0844db305"
uuid = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
version = "0.7.51"

[[deps.PooledArrays]]
deps = ["DataAPI", "Future"]
git-tree-sha1 = "a6062fe4063cdafe78f4a0a81cfffb89721b30e7"
uuid = "2dfb63ee-cc39-5dd5-95bd-886bf059d720"
version = "1.4.2"

[[deps.PrecompileTools]]
deps = ["Preferences"]
git-tree-sha1 = "259e206946c293698122f63e2b513a7c99a244e8"
uuid = "aea7be01-6a6a-4083-8856-8a6e6704d82a"
version = "1.1.1"

[[deps.Preferences]]
deps = ["TOML"]
git-tree-sha1 = "7eb1686b4f04b82f96ed7a4ea5890a4f0c7a09f1"
uuid = "21216c6a-2e73-6563-6e65-726566657250"
version = "1.4.0"

[[deps.PrettyTables]]
deps = ["Crayons", "Formatting", "LaTeXStrings", "Markdown", "Reexport", "StringManipulation", "Tables"]
git-tree-sha1 = "213579618ec1f42dea7dd637a42785a608b1ea9c"
uuid = "08abe8d2-0d0c-5749-adfa-8a2ac140af0d"
version = "2.2.4"

[[deps.Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"

[[deps.ProgressMeter]]
deps = ["Distributed", "Printf"]
git-tree-sha1 = "d7a7aef8f8f2d537104f170139553b14dfe39fe9"
uuid = "92933f4c-e287-5a05-a399-4b506db050ca"
version = "1.7.2"

[[deps.PyCall]]
deps = ["Conda", "Dates", "Libdl", "LinearAlgebra", "MacroTools", "Serialization", "VersionParsing"]
git-tree-sha1 = "62f417f6ad727987c755549e9cd88c46578da562"
uuid = "438e738f-606a-5dbb-bf0a-cddfbfd45ab0"
version = "1.95.1"

[[deps.QOI]]
deps = ["ColorTypes", "FileIO", "FixedPointNumbers"]
git-tree-sha1 = "18e8f4d1426e965c7b532ddd260599e1510d26ce"
uuid = "4b34888f-f399-49d4-9bb3-47ed5cae4e65"
version = "1.0.0"

[[deps.Qt5Base_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Fontconfig_jll", "Glib_jll", "JLLWrappers", "Libdl", "Libglvnd_jll", "OpenSSL_jll", "Pkg", "Xorg_libXext_jll", "Xorg_libxcb_jll", "Xorg_xcb_util_image_jll", "Xorg_xcb_util_keysyms_jll", "Xorg_xcb_util_renderutil_jll", "Xorg_xcb_util_wm_jll", "Zlib_jll", "xkbcommon_jll"]
git-tree-sha1 = "0c03844e2231e12fda4d0086fd7cbe4098ee8dc5"
uuid = "ea2cea3b-5b76-57ae-a6ef-0a8af62496e1"
version = "5.15.3+2"

[[deps.Quaternions]]
deps = ["LinearAlgebra", "Random", "RealDot"]
git-tree-sha1 = "da095158bdc8eaccb7890f9884048555ab771019"
uuid = "94ee1d12-ae83-5a48-8b1c-48b8ff168ae0"
version = "0.7.4"

[[deps.RData]]
deps = ["CategoricalArrays", "CodecZlib", "DataFrames", "Dates", "FileIO", "Requires", "TimeZones", "Unicode"]
git-tree-sha1 = "19e47a495dfb7240eb44dc6971d660f7e4244a72"
uuid = "df47a6cb-8c03-5eed-afd8-b6050d6c41da"
version = "0.8.3"

[[deps.RDatasets]]
deps = ["CSV", "CodecZlib", "DataFrames", "FileIO", "Printf", "RData", "Reexport"]
git-tree-sha1 = "2720e6f6afb3e562ccb70a6b62f8f308ff810333"
uuid = "ce6b1742-4840-55fa-b093-852dadbb1d8b"
version = "0.7.7"

[[deps.REPL]]
deps = ["InteractiveUtils", "Markdown", "Sockets", "Unicode"]
uuid = "3fa0cd96-eef1-5676-8a61-b3b8758bbffb"

[[deps.Random]]
deps = ["SHA", "Serialization"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"

[[deps.RangeArrays]]
git-tree-sha1 = "b9039e93773ddcfc828f12aadf7115b4b4d225f5"
uuid = "b3c3ace0-ae52-54e7-9d0b-2c1406fd6b9d"
version = "0.3.2"

[[deps.Ratios]]
deps = ["Requires"]
git-tree-sha1 = "6d7bb727e76147ba18eed998700998e17b8e4911"
uuid = "c84ed2f1-dad5-54f0-aa8e-dbefe2724439"
version = "0.4.4"
weakdeps = ["FixedPointNumbers"]

    [deps.Ratios.extensions]
    RatiosFixedPointNumbersExt = "FixedPointNumbers"

[[deps.RealDot]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "9f0a1b71baaf7650f4fa8a1d168c7fb6ee41f0c9"
uuid = "c1ae055f-0cd5-4b69-90a6-9a35b1a98df9"
version = "0.1.0"

[[deps.RecipesBase]]
deps = ["PrecompileTools"]
git-tree-sha1 = "5c3d09cc4f31f5fc6af001c250bf1278733100ff"
uuid = "3cdcf5f2-1ef4-517c-9805-6587b60abb01"
version = "1.3.4"

[[deps.RecipesPipeline]]
deps = ["Dates", "NaNMath", "PlotUtils", "PrecompileTools", "RecipesBase"]
git-tree-sha1 = "45cf9fd0ca5839d06ef333c8201714e888486342"
uuid = "01d81517-befc-4cb6-b9ec-a95719d0359c"
version = "0.6.12"

[[deps.Reexport]]
git-tree-sha1 = "45e428421666073eab6f2da5c9d310d99bb12f9b"
uuid = "189a3867-3050-52da-a836-e630ba90ab69"
version = "1.2.2"

[[deps.RegionTrees]]
deps = ["IterTools", "LinearAlgebra", "StaticArrays"]
git-tree-sha1 = "4618ed0da7a251c7f92e869ae1a19c74a7d2a7f9"
uuid = "dee08c22-ab7f-5625-9660-a9af2021b33f"
version = "0.3.2"

[[deps.RelocatableFolders]]
deps = ["SHA", "Scratch"]
git-tree-sha1 = "90bc7a7c96410424509e4263e277e43250c05691"
uuid = "05181044-ff0b-4ac5-8273-598c1e38db00"
version = "1.0.0"

[[deps.Requires]]
deps = ["UUIDs"]
git-tree-sha1 = "838a3a4188e2ded87a4f9f184b4b0d78a1e91cb7"
uuid = "ae029012-a4dd-5104-9daa-d747884805df"
version = "1.3.0"

[[deps.Rotations]]
deps = ["LinearAlgebra", "Quaternions", "Random", "StaticArrays"]
git-tree-sha1 = "54ccb4dbab4b1f69beb255a2c0ca5f65a9c82f08"
uuid = "6038ab10-8711-5258-84ad-4b1120ba62dc"
version = "1.5.1"

[[deps.SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"
version = "0.7.0"

[[deps.ScikitLearn]]
deps = ["Compat", "Conda", "DataFrames", "Distributed", "IterTools", "LinearAlgebra", "MacroTools", "Parameters", "Printf", "PyCall", "Random", "ScikitLearnBase", "SparseArrays", "StatsBase", "VersionParsing"]
git-tree-sha1 = "3df098033358431591827bb86cada0bed744105a"
uuid = "3646fa90-6ef7-5e7e-9f22-8aca16db6324"
version = "0.7.0"

[[deps.ScikitLearnBase]]
deps = ["LinearAlgebra", "Random", "Statistics"]
git-tree-sha1 = "7877e55c1523a4b336b433da39c8e8c08d2f221f"
uuid = "6e75b9c4-186b-50bd-896f-2d2496a4843e"
version = "0.5.0"

[[deps.Scratch]]
deps = ["Dates"]
git-tree-sha1 = "30449ee12237627992a99d5e30ae63e4d78cd24a"
uuid = "6c6a2e73-6563-6170-7368-637461726353"
version = "1.2.0"

[[deps.SentinelArrays]]
deps = ["Dates", "Random"]
git-tree-sha1 = "77d3c4726515dca71f6d80fbb5e251088defe305"
uuid = "91c51154-3ec4-41a3-a24f-3f23e20d615c"
version = "1.3.18"

[[deps.Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"

[[deps.SharedArrays]]
deps = ["Distributed", "Mmap", "Random", "Serialization"]
uuid = "1a1011a3-84de-559e-8e89-a11a2f7dc383"

[[deps.Showoff]]
deps = ["Dates", "Grisu"]
git-tree-sha1 = "91eddf657aca81df9ae6ceb20b959ae5653ad1de"
uuid = "992d4aef-0814-514b-bc4d-f2e9a6c4116f"
version = "1.0.3"

[[deps.SimpleBufferStream]]
git-tree-sha1 = "874e8867b33a00e784c8a7e4b60afe9e037b74e1"
uuid = "777ac1f9-54b0-4bf8-805c-2214025038e7"
version = "1.1.0"

[[deps.SimpleTraits]]
deps = ["InteractiveUtils", "MacroTools"]
git-tree-sha1 = "5d7e3f4e11935503d3ecaf7186eac40602e7d231"
uuid = "699a6c99-e7fa-54fc-8d76-47d257e15c1d"
version = "0.9.4"

[[deps.SimpleWeightedGraphs]]
deps = ["Graphs", "LinearAlgebra", "Markdown", "SparseArrays"]
git-tree-sha1 = "4b33e0e081a825dbfaf314decf58fa47e53d6acb"
uuid = "47aef6b3-ad0c-573a-a1e2-d07658019622"
version = "1.4.0"

[[deps.Sixel]]
deps = ["Dates", "FileIO", "ImageCore", "IndirectArrays", "OffsetArrays", "REPL", "libsixel_jll"]
git-tree-sha1 = "8fb59825be681d451c246a795117f317ecbcaa28"
uuid = "45858cf5-a6b0-47a3-bbea-62219f50df47"
version = "0.1.2"

[[deps.SnoopPrecompile]]
deps = ["Preferences"]
git-tree-sha1 = "e760a70afdcd461cf01a575947738d359234665c"
uuid = "66db9d55-30c0-4569-8b51-7e840670fc0c"
version = "1.0.3"

[[deps.Sockets]]
uuid = "6462fe0b-24de-5631-8697-dd941f90decc"

[[deps.SortingAlgorithms]]
deps = ["DataStructures"]
git-tree-sha1 = "a4ada03f999bd01b3a25dcaa30b2d929fe537e00"
uuid = "a2af1166-a08f-5f64-846c-94a0d3cef48c"
version = "1.1.0"

[[deps.SparseArrays]]
deps = ["Libdl", "LinearAlgebra", "Random", "Serialization", "SuiteSparse_jll"]
uuid = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"

[[deps.SpecialFunctions]]
deps = ["IrrationalConstants", "LogExpFunctions", "OpenLibm_jll", "OpenSpecFun_jll"]
git-tree-sha1 = "ef28127915f4229c971eb43f3fc075dd3fe91880"
uuid = "276daf66-3868-5448-9aa4-cd146d93841b"
version = "2.2.0"
weakdeps = ["ChainRulesCore"]

    [deps.SpecialFunctions.extensions]
    SpecialFunctionsChainRulesCoreExt = "ChainRulesCore"

[[deps.StackViews]]
deps = ["OffsetArrays"]
git-tree-sha1 = "46e589465204cd0c08b4bd97385e4fa79a0c770c"
uuid = "cae243ae-269e-4f55-b966-ac2d0dc13c15"
version = "0.1.1"

[[deps.StaticArrays]]
deps = ["LinearAlgebra", "Random", "StaticArraysCore", "Statistics"]
git-tree-sha1 = "8982b3607a212b070a5e46eea83eb62b4744ae12"
uuid = "90137ffa-7385-5640-81b9-e52037218182"
version = "1.5.25"

[[deps.StaticArraysCore]]
git-tree-sha1 = "6b7ba252635a5eff6a0b0664a41ee140a1c9e72a"
uuid = "1e83bf80-4336-4d27-bf5d-d5a4f845583c"
version = "1.4.0"

[[deps.Statistics]]
deps = ["LinearAlgebra", "SparseArrays"]
uuid = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"
version = "1.9.0"

[[deps.StatsAPI]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "45a7769a04a3cf80da1c1c7c60caf932e6f4c9f7"
uuid = "82ae8749-77ed-4fe6-ae5f-f523153014b0"
version = "1.6.0"

[[deps.StatsBase]]
deps = ["DataAPI", "DataStructures", "LinearAlgebra", "LogExpFunctions", "Missings", "Printf", "Random", "SortingAlgorithms", "SparseArrays", "Statistics", "StatsAPI"]
git-tree-sha1 = "d1bf48bfcc554a3761a133fe3a9bb01488e06916"
uuid = "2913bbd2-ae8a-5f71-8c99-4fb6c76f3a91"
version = "0.33.21"

[[deps.StringManipulation]]
git-tree-sha1 = "46da2434b41f41ac3594ee9816ce5541c6096123"
uuid = "892a3eda-7b42-436c-8928-eab12a02cf0e"
version = "0.3.0"

[[deps.SuiteSparse_jll]]
deps = ["Artifacts", "Libdl", "Pkg", "libblastrampoline_jll"]
uuid = "bea87d4a-7f5b-5778-9afe-8cc45184846c"
version = "5.10.1+6"

[[deps.TOML]]
deps = ["Dates"]
uuid = "fa267f1f-6049-4f14-aa54-33bafae1ed76"
version = "1.0.3"

[[deps.TableTraits]]
deps = ["IteratorInterfaceExtensions"]
git-tree-sha1 = "c06b2f539df1c6efa794486abfb6ed2022561a39"
uuid = "3783bdb8-4a98-5b6b-af9a-565f29a5fe9c"
version = "1.0.1"

[[deps.Tables]]
deps = ["DataAPI", "DataValueInterfaces", "IteratorInterfaceExtensions", "LinearAlgebra", "OrderedCollections", "TableTraits", "Test"]
git-tree-sha1 = "1544b926975372da01227b382066ab70e574a3ec"
uuid = "bd369af6-aec1-5ad0-b16a-f7cc5008161c"
version = "1.10.1"

[[deps.Tar]]
deps = ["ArgTools", "SHA"]
uuid = "a4e569a6-e804-4fa4-b0f3-eef7a1d5b13e"
version = "1.10.0"

[[deps.TensorCore]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "1feb45f88d133a655e001435632f019a9a1bcdb6"
uuid = "62fd8b95-f654-4bbd-a8a5-9c27f68ccd50"
version = "0.1.1"

[[deps.Test]]
deps = ["InteractiveUtils", "Logging", "Random", "Serialization"]
uuid = "8dfed614-e22c-5e08-85e1-65c5234f0b40"

[[deps.TiffImages]]
deps = ["ColorTypes", "DataStructures", "DocStringExtensions", "FileIO", "FixedPointNumbers", "IndirectArrays", "Inflate", "Mmap", "OffsetArrays", "PkgVersion", "ProgressMeter", "UUIDs"]
git-tree-sha1 = "8621f5c499a8aa4aa970b1ae381aae0ef1576966"
uuid = "731e570b-9d59-4bfa-96dc-6df516fadf69"
version = "0.6.4"

[[deps.TiledIteration]]
deps = ["OffsetArrays"]
git-tree-sha1 = "5683455224ba92ef59db72d10690690f4a8dc297"
uuid = "06e1c1a7-607b-532d-9fad-de7d9aa2abac"
version = "0.3.1"

[[deps.TimeZones]]
deps = ["Dates", "Downloads", "InlineStrings", "LazyArtifacts", "Mocking", "Printf", "RecipesBase", "Scratch", "Unicode"]
git-tree-sha1 = "a5404eddfee0cf451cabb8ea8846413323712e25"
uuid = "f269a46b-ccf7-5d73-abea-4c690281aa53"
version = "1.9.2"

[[deps.TranscodingStreams]]
deps = ["Random", "Test"]
git-tree-sha1 = "9a6ae7ed916312b41236fcef7e0af564ef934769"
uuid = "3bb67fe8-82b1-5028-8e26-92a6c54297fa"
version = "0.9.13"

[[deps.Tricks]]
git-tree-sha1 = "aadb748be58b492045b4f56166b5188aa63ce549"
uuid = "410a4b4d-49e4-4fbc-ab6d-cb71b17b3775"
version = "0.1.7"

[[deps.URIs]]
git-tree-sha1 = "074f993b0ca030848b897beff716d93aca60f06a"
uuid = "5c2747f8-b7ea-4ff2-ba2e-563bfd36b1d4"
version = "1.4.2"

[[deps.UUIDs]]
deps = ["Random", "SHA"]
uuid = "cf7118a7-6976-5b1a-9a39-7adc72f591a4"

[[deps.UnPack]]
git-tree-sha1 = "387c1f73762231e86e0c9c5443ce3b4a0a9a0c2b"
uuid = "3a884ed6-31ef-47d7-9d2a-63182c4928ed"
version = "1.0.2"

[[deps.Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"

[[deps.UnicodeFun]]
deps = ["REPL"]
git-tree-sha1 = "53915e50200959667e78a92a418594b428dffddf"
uuid = "1cfade01-22cf-5700-b092-accc4b62d6e1"
version = "0.4.1"

[[deps.Unzip]]
git-tree-sha1 = "ca0969166a028236229f63514992fc073799bb78"
uuid = "41fe7b60-77ed-43a1-b4f0-825fd5a5650d"
version = "0.2.0"

[[deps.VersionParsing]]
git-tree-sha1 = "58d6e80b4ee071f5efd07fda82cb9fbe17200868"
uuid = "81def892-9a0e-5fdd-b105-ffc91e053289"
version = "1.3.0"

[[deps.Wayland_jll]]
deps = ["Artifacts", "Expat_jll", "JLLWrappers", "Libdl", "Libffi_jll", "Pkg", "XML2_jll"]
git-tree-sha1 = "ed8d92d9774b077c53e1da50fd81a36af3744c1c"
uuid = "a2964d1f-97da-50d4-b82a-358c7fce9d89"
version = "1.21.0+0"

[[deps.Wayland_protocols_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "4528479aa01ee1b3b4cd0e6faef0e04cf16466da"
uuid = "2381bf8a-dfd0-557d-9999-79630e7b1b91"
version = "1.25.0+0"

[[deps.WeakRefStrings]]
deps = ["DataAPI", "InlineStrings", "Parsers"]
git-tree-sha1 = "b1be2855ed9ed8eac54e5caff2afcdb442d52c23"
uuid = "ea10d353-3f73-51f8-a26c-33c1cb351aa5"
version = "1.4.2"

[[deps.WoodburyMatrices]]
deps = ["LinearAlgebra", "SparseArrays"]
git-tree-sha1 = "de67fa59e33ad156a590055375a30b23c40299d3"
uuid = "efce3f68-66dc-5838-9240-27a6d6f5f9b6"
version = "0.5.5"

[[deps.WorkerUtilities]]
git-tree-sha1 = "cd1659ba0d57b71a464a29e64dbc67cfe83d54e7"
uuid = "76eceee3-57b5-4d4a-8e66-0e911cebbf60"
version = "1.6.1"

[[deps.XML2_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Libiconv_jll", "Pkg", "Zlib_jll"]
git-tree-sha1 = "93c41695bc1c08c46c5899f4fe06d6ead504bb73"
uuid = "02c8fc9c-b97f-50b9-bbe4-9be30ff0a78a"
version = "2.10.3+0"

[[deps.XSLT_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Libgcrypt_jll", "Libgpg_error_jll", "Libiconv_jll", "Pkg", "XML2_jll", "Zlib_jll"]
git-tree-sha1 = "91844873c4085240b95e795f692c4cec4d805f8a"
uuid = "aed1982a-8fda-507f-9586-7b0439959a61"
version = "1.1.34+0"

[[deps.Xorg_libX11_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libxcb_jll", "Xorg_xtrans_jll"]
git-tree-sha1 = "5be649d550f3f4b95308bf0183b82e2582876527"
uuid = "4f6342f7-b3d2-589e-9d20-edeb45f2b2bc"
version = "1.6.9+4"

[[deps.Xorg_libXau_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "4e490d5c960c314f33885790ed410ff3a94ce67e"
uuid = "0c0b7dd1-d40b-584c-a123-a41640f87eec"
version = "1.0.9+4"

[[deps.Xorg_libXcursor_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libXfixes_jll", "Xorg_libXrender_jll"]
git-tree-sha1 = "12e0eb3bc634fa2080c1c37fccf56f7c22989afd"
uuid = "935fb764-8cf2-53bf-bb30-45bb1f8bf724"
version = "1.2.0+4"

[[deps.Xorg_libXdmcp_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "4fe47bd2247248125c428978740e18a681372dd4"
uuid = "a3789734-cfe1-5b06-b2d0-1dd0d9d62d05"
version = "1.1.3+4"

[[deps.Xorg_libXext_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libX11_jll"]
git-tree-sha1 = "b7c0aa8c376b31e4852b360222848637f481f8c3"
uuid = "1082639a-0dae-5f34-9b06-72781eeb8cb3"
version = "1.3.4+4"

[[deps.Xorg_libXfixes_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libX11_jll"]
git-tree-sha1 = "0e0dc7431e7a0587559f9294aeec269471c991a4"
uuid = "d091e8ba-531a-589c-9de9-94069b037ed8"
version = "5.0.3+4"

[[deps.Xorg_libXi_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libXext_jll", "Xorg_libXfixes_jll"]
git-tree-sha1 = "89b52bc2160aadc84d707093930ef0bffa641246"
uuid = "a51aa0fd-4e3c-5386-b890-e753decda492"
version = "1.7.10+4"

[[deps.Xorg_libXinerama_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libXext_jll"]
git-tree-sha1 = "26be8b1c342929259317d8b9f7b53bf2bb73b123"
uuid = "d1454406-59df-5ea1-beac-c340f2130bc3"
version = "1.1.4+4"

[[deps.Xorg_libXrandr_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libXext_jll", "Xorg_libXrender_jll"]
git-tree-sha1 = "34cea83cb726fb58f325887bf0612c6b3fb17631"
uuid = "ec84b674-ba8e-5d96-8ba1-2a689ba10484"
version = "1.5.2+4"

[[deps.Xorg_libXrender_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libX11_jll"]
git-tree-sha1 = "19560f30fd49f4d4efbe7002a1037f8c43d43b96"
uuid = "ea2f1a96-1ddc-540d-b46f-429655e07cfa"
version = "0.9.10+4"

[[deps.Xorg_libpthread_stubs_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "6783737e45d3c59a4a4c4091f5f88cdcf0908cbb"
uuid = "14d82f49-176c-5ed1-bb49-ad3f5cbd8c74"
version = "0.1.0+3"

[[deps.Xorg_libxcb_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "XSLT_jll", "Xorg_libXau_jll", "Xorg_libXdmcp_jll", "Xorg_libpthread_stubs_jll"]
git-tree-sha1 = "daf17f441228e7a3833846cd048892861cff16d6"
uuid = "c7cfdc94-dc32-55de-ac96-5a1b8d977c5b"
version = "1.13.0+3"

[[deps.Xorg_libxkbfile_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libX11_jll"]
git-tree-sha1 = "926af861744212db0eb001d9e40b5d16292080b2"
uuid = "cc61e674-0454-545c-8b26-ed2c68acab7a"
version = "1.1.0+4"

[[deps.Xorg_xcb_util_image_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_xcb_util_jll"]
git-tree-sha1 = "0fab0a40349ba1cba2c1da699243396ff8e94b97"
uuid = "12413925-8142-5f55-bb0e-6d7ca50bb09b"
version = "0.4.0+1"

[[deps.Xorg_xcb_util_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libxcb_jll"]
git-tree-sha1 = "e7fd7b2881fa2eaa72717420894d3938177862d1"
uuid = "2def613f-5ad1-5310-b15b-b15d46f528f5"
version = "0.4.0+1"

[[deps.Xorg_xcb_util_keysyms_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_xcb_util_jll"]
git-tree-sha1 = "d1151e2c45a544f32441a567d1690e701ec89b00"
uuid = "975044d2-76e6-5fbe-bf08-97ce7c6574c7"
version = "0.4.0+1"

[[deps.Xorg_xcb_util_renderutil_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_xcb_util_jll"]
git-tree-sha1 = "dfd7a8f38d4613b6a575253b3174dd991ca6183e"
uuid = "0d47668e-0667-5a69-a72c-f761630bfb7e"
version = "0.3.9+1"

[[deps.Xorg_xcb_util_wm_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_xcb_util_jll"]
git-tree-sha1 = "e78d10aab01a4a154142c5006ed44fd9e8e31b67"
uuid = "c22f9ab0-d5fe-5066-847c-f4bb1cd4e361"
version = "0.4.1+1"

[[deps.Xorg_xkbcomp_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libxkbfile_jll"]
git-tree-sha1 = "4bcbf660f6c2e714f87e960a171b119d06ee163b"
uuid = "35661453-b289-5fab-8a00-3d9160c6a3a4"
version = "1.4.2+4"

[[deps.Xorg_xkeyboard_config_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_xkbcomp_jll"]
git-tree-sha1 = "5c8424f8a67c3f2209646d4425f3d415fee5931d"
uuid = "33bec58e-1273-512f-9401-5d533626f822"
version = "2.27.0+4"

[[deps.Xorg_xtrans_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "79c31e7844f6ecf779705fbc12146eb190b7d845"
uuid = "c5fb5394-a638-5e4d-96e5-b29de1b5cf10"
version = "1.4.0+3"

[[deps.Zlib_jll]]
deps = ["Libdl"]
uuid = "83775a58-1f1d-513f-b197-d71354ab007a"
version = "1.2.13+0"

[[deps.Zstd_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "49ce682769cd5de6c72dcf1b94ed7790cd08974c"
uuid = "3161d3a3-bdf6-5164-811a-617609db77b4"
version = "1.5.5+0"

[[deps.fzf_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "868e669ccb12ba16eaf50cb2957ee2ff61261c56"
uuid = "214eeab7-80f7-51ab-84ad-2988db7cef09"
version = "0.29.0+0"

[[deps.libaom_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "3a2ea60308f0996d26f1e5354e10c24e9ef905d4"
uuid = "a4ae2306-e953-59d6-aa16-d00cac43593b"
version = "3.4.0+0"

[[deps.libass_jll]]
deps = ["Artifacts", "Bzip2_jll", "FreeType2_jll", "FriBidi_jll", "HarfBuzz_jll", "JLLWrappers", "Libdl", "Pkg", "Zlib_jll"]
git-tree-sha1 = "5982a94fcba20f02f42ace44b9894ee2b140fe47"
uuid = "0ac62f75-1d6f-5e53-bd7c-93b484bb37c0"
version = "0.15.1+0"

[[deps.libblastrampoline_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850b90-86db-534c-a0d3-1478176c7d93"
version = "5.7.0+0"

[[deps.libfdk_aac_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "daacc84a041563f965be61859a36e17c4e4fcd55"
uuid = "f638f0a6-7fb0-5443-88ba-1cc74229b280"
version = "2.0.2+0"

[[deps.libpng_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Zlib_jll"]
git-tree-sha1 = "94d180a6d2b5e55e447e2d27a29ed04fe79eb30c"
uuid = "b53b4c65-9356-5827-b1ea-8c7a1a84506f"
version = "1.6.38+0"

[[deps.libsixel_jll]]
deps = ["Artifacts", "JLLWrappers", "JpegTurbo_jll", "Libdl", "Pkg", "libpng_jll"]
git-tree-sha1 = "d4f63314c8aa1e48cd22aa0c17ed76cd1ae48c3c"
uuid = "075b6546-f08a-558a-be8f-8157d0f608a5"
version = "1.10.3+0"

[[deps.libvorbis_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Ogg_jll", "Pkg"]
git-tree-sha1 = "b910cb81ef3fe6e78bf6acee440bda86fd6ae00c"
uuid = "f27f6e37-5d2b-51aa-960f-b287f2bc3b7a"
version = "1.3.7+1"

[[deps.nghttp2_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850ede-7688-5339-a07c-302acd2aaf8d"
version = "1.48.0+0"

[[deps.p7zip_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "3f19e933-33d8-53b3-aaab-bd5110c3b7a0"
version = "17.4.0+0"

[[deps.x264_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "4fea590b89e6ec504593146bf8b988b2c00922b2"
uuid = "1270edf5-f2f9-52d2-97e9-ab00b5d0237a"
version = "2021.5.5+0"

[[deps.x265_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "ee567a171cce03570d77ad3a43e90218e38937a9"
uuid = "dfaa095f-4041-5dcd-9319-2fabd8486b76"
version = "3.5.0+0"

[[deps.xkbcommon_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Wayland_jll", "Wayland_protocols_jll", "Xorg_libxcb_jll", "Xorg_xkeyboard_config_jll"]
git-tree-sha1 = "9ebfc140cc56e8c2156a15ceac2f0302e327ac0a"
uuid = "d8fb68d0-12a3-5cfd-a85a-d49703b185fd"
version = "1.4.1+0"
"""

# ╔═╡ Cell order:
# ╟─ac47a770-f596-11ed-2044-7f241fac7297
# ╟─c11dbd97-7f3a-405d-ab24-ae569f43a17f
# ╟─4b816ac2-9e46-42b2-ae8e-0c2867df76f2
# ╟─20a764db-863b-46d9-b6d3-bd9baa002fb6
# ╟─63103494-3b91-4457-a3e1-2f44bb09de24
# ╟─766a54d9-3fc4-4cdd-b64c-4d6e654a7cb0
# ╟─1ca23bcd-e476-4bbf-92de-33d9d37eb6f6
# ╟─dc403f5a-8cb0-4755-9dfb-072e02a7d083
# ╟─d9c287dd-3eb8-43d6-808a-fe655f41e924
# ╟─d2bcbe32-717b-4ad0-b581-e465bc5102e7
# ╟─e3a02941-3d83-4e82-a5ef-7794313d20c1
# ╟─fdebdfa1-3cf5-46f9-82b4-77f4e2be70c9
# ╟─17093bef-b292-42be-866a-1080314b293c
# ╟─fe02d821-9cee-42ac-bdf0-f94e517b6313
# ╟─032ca44c-e9b9-4119-b632-2f4143c3768a
# ╟─228425b5-a9bf-4ca8-8202-1c3a2f0576c9
# ╠═1a799c68-d080-4f48-8f31-1877e131c070
# ╟─adc558ef-8b28-425b-be44-d87c100ff983
# ╟─0341a92c-0372-4272-8f4e-d12334c90a0e
# ╠═a9b4c35c-bd72-4f4e-ad3b-0cfb947b5c05
# ╟─879120e2-3b91-4720-928b-5ff6113ad691
# ╠═87269da1-c826-4546-8d44-0ee2a146bcb6
# ╟─2b134f85-29b5-4ed2-88b3-903b77252467
# ╠═b1613e37-8ef0-4cdd-89b2-61e4166af51d
# ╟─6e5b6008-b550-4303-97d8-c09269f33425
# ╠═5469aa3f-bdbe-4b84-be9f-d85c030c12c5
# ╟─2e75eac5-3b55-4b8d-a90a-2889f6a230b9
# ╠═eaf357b4-721e-461f-873e-9c03f5499a2e
# ╟─69123bf3-ece3-4cd1-a826-fe361e2f8798
# ╠═4fceacfc-f711-469a-9833-c7788f461a3b
# ╟─33985122-edd4-4215-8020-827c0aa3a37c
# ╠═64708a63-1009-44b1-980d-d84ca9c6bcf6
# ╟─69e9a67d-2d81-4e17-a649-ded73d0757ff
# ╠═66754cae-9c41-440f-bdfd-1ea16096f021
# ╟─834d295f-d7a6-462c-961c-6526dad98ebb
# ╠═90f0f3fb-d19d-44fa-9acb-5492579c3b14
# ╟─c89696b0-942c-431a-8dd9-7e9b5791d55c
# ╟─028580e4-37a6-4c09-807a-ce5b0c9ead3d
# ╠═1da7e318-472f-4ebe-8f45-5fd4b8568664
# ╟─a13128b2-7895-4527-9558-a9c790a49d7c
# ╠═c4b9acdd-1184-4897-91e1-e08d7f8f74dc
# ╟─f4eb55c0-00e1-422d-ba70-18e3c6d6edd8
# ╟─a7fcac44-3030-4f78-8d5c-46627f1f83a8
# ╟─38d3d8b9-26e5-42ad-9fcb-ef3856fe579c
# ╠═9596b6e8-03a7-4fea-94a2-d49cf0c2fb96
# ╟─c48d27b4-604d-45b5-8f97-9146aafadabb
# ╠═9f93425c-867a-447f-b6f9-285eaa18ee49
# ╟─f93f2e5a-4362-4d32-b51e-6138585df368
# ╠═c576c594-985b-4e5b-97ca-ed8d3a913d55
# ╠═ef63b9a1-ab98-41f1-a5a5-dc82c0ca59b6
# ╟─957663d1-b79d-4069-9201-49854c5c9399
# ╟─ba95503e-c2fb-4df2-9dd4-c50391fc1c9e
# ╠═6926f834-fe32-4140-853d-8363a6ee8449
# ╠═a1e8edd3-1ffe-479b-a589-aacb1ca79281
# ╟─9014e76e-437c-4260-b50a-2db747c7fcdb
# ╠═e750e5dc-a7bc-4371-9c1e-1f053b0d4e50
# ╠═59373c9f-52f4-46d1-9441-c35ca1ddf6cd
# ╟─4fd490db-63f4-4842-a36e-bf606b1ff524
# ╟─f84f57fd-efa0-485b-a712-60be2f77e6ff
# ╠═2a5cccaa-59a3-4e89-b5bd-7cca2dfa5445
# ╠═59acc995-91f4-424d-8381-3a2bb1b9ca87
# ╠═43a31297-dafe-402d-98cf-68723d70eb72
# ╠═56a1298a-241b-4bfd-92cf-cd7adc337b43
# ╠═6a772572-95c8-48c2-b184-c1fed7e0b34b
# ╠═52e987c0-81fd-45a5-8e1c-7945ccb54997
# ╟─e39eccf4-7c75-4647-92b8-d7f15f8918b6
# ╠═14ee429e-2c57-4ac4-877f-95506b08af13
# ╟─9614cd5d-1f61-4def-8e09-5d6945b7f888
# ╟─278d7a0b-0f1f-4958-b5ab-a9c6146128b2
# ╠═8d000943-f1d1-4e2c-b7cc-9af25ac4b553
# ╟─b216e132-ed19-44fa-b966-5d2081e4c534
# ╠═34fe2a25-0b84-46b3-9bf7-979036dbc4d3
# ╟─47edcba4-4904-4bfa-9182-4cfd7495b327
# ╟─5735b6c1-61ea-4ece-b957-96a69502ff54
# ╠═392261c3-290b-47c3-8504-9a1a70861e51
# ╠═92ff3f53-6e51-4593-bf50-fe42a77dc072
# ╟─3b2b5553-878f-4941-9046-b5b652e78342
# ╠═636bdcbb-33dd-4b10-8940-4fb417c0eefb
# ╠═57fed991-3bfe-460b-9540-9e6fa3f43396
# ╠═cd380bc1-4c00-4f75-994e-3b2fc3bf61c2
# ╠═01e66068-00bb-4ea1-b08b-d100d7dca6f6
# ╠═d54e30f4-66b2-4ac0-a35c-e118602b985b
# ╟─5741f048-d756-4582-ba1e-8667468f4a27
# ╠═7e2c6e93-7c82-437f-a9ee-6fc66b436b7c
# ╟─3586d834-fa0b-45f0-9666-f951d365e867
# ╠═b9df89e4-36c3-4cb8-9cfc-6db0fb7c9aa4
# ╠═7947f77a-e2a8-4631-b00f-cdf1bf5e3473
# ╟─3f6c0a6a-61c5-4603-88ab-d8c396607e19
# ╟─bd4d151e-5bff-4e35-8a7e-62a2c8908a75
# ╠═e39faef2-b5e4-4285-9f05-1d93597132ea
# ╟─7d8c02d8-782a-48e1-ad7f-d309fecc1d78
# ╠═86b3944f-db81-4d1d-85aa-0c12ac8c3174
# ╟─593531a2-5680-4297-9b2b-aea3c6c74b39
# ╠═fc2f17f7-38d2-44e2-abd0-ab44a3ab58ad
# ╟─45c741c7-e2f1-419c-a9da-12c3c65aa94e
# ╠═a33eb768-41f3-48c7-af83-ff775b866f9e
# ╠═ca5d782f-2f09-4bf7-b892-d9e3ed09a3be
# ╟─dab50c21-43e3-4003-8ad8-dd3c9ab8a2eb
# ╟─5af8cac9-0aeb-4a84-b088-ca9789173a98
# ╠═152d36fd-17a1-461c-a7ea-b84a13daab70
# ╟─044746c3-6b7b-482e-98aa-e4a812a19b86
# ╠═399c968a-af6d-489e-9ee4-4f0846a5d432
# ╟─a6fcb8ed-2f05-41ee-b5b5-1087681b2c24
# ╠═02156f5e-3d32-40e7-b7e2-f9049e193497
# ╟─8836d109-bc50-4505-8765-e1de70cc6e9c
# ╠═2bcd900c-45b5-48d3-929e-e64eb6413696
# ╟─39afe3a6-e99a-45e0-8bb6-07820fdd7944
# ╟─2cf82e63-a3c4-427a-bd2f-4b6f99d7079f
# ╠═20359032-5fd6-4e7a-8402-e2cee856af34
# ╠═54f77479-8eb0-496c-8a18-9330f05c698f
# ╠═42322d7d-238b-48a0-9e60-d77304415012
# ╠═f6249407-c163-4396-ae54-cda1e07aaf8d
# ╠═4125f6d7-f926-4dde-adc3-3d4b79999f13
# ╠═ea32a24b-656a-48bd-9346-c66b590bfa7d
# ╟─4bd19e01-61c4-4df6-9a62-e0030657b84f
# ╠═30b62ccc-577b-4584-8040-274495c02755
# ╟─a5409e24-d891-44d2-a578-3e4718cf27be
# ╟─d4cb55da-16b9-463a-843c-149ff001edc1
# ╠═f4e9dc2c-ab44-481f-aeab-96fd86c15e2c
# ╟─5e930ec8-7784-415e-8425-5884f1f0b705
# ╠═7f0d7eef-7d93-4794-a58f-9a4013d9719d
# ╟─ba29b86f-aeb2-492f-ad78-d4a00ec4b6bb
# ╟─d0a323e1-2b5c-41bf-9ca4-49bba2bc9156
# ╠═14bca17f-921b-4f19-839a-8334ca634afc
# ╠═3227a0e3-e022-47e7-8ccb-6837c99e0aab
# ╠═13b84ba3-7f1e-452c-8883-6d9ba71f60d6
# ╠═5d68092e-f665-496b-b28f-cf808bdbee2f
# ╠═2f330afa-9596-401c-8ce8-1fd60ac87aa6
# ╠═557ffb3f-8371-4220-8243-5bd682075e40
# ╠═7f805c0e-fbf7-4221-b225-ab9439330b9e
# ╠═0562d4c6-22d7-49dd-9453-f270befba8b8
# ╠═6f08d98e-837e-42c1-9d46-f0a7765a388d
# ╠═e2a47d3d-e3e3-4eec-b173-190136e15a4d
# ╟─537ee379-a38e-40f6-b4c1-4c3464898d27
# ╠═491d22b7-35b3-47b8-933f-eafb0f8b3080
# ╠═11ddb12f-7081-4d14-93ab-6deeafdcd123
# ╠═1f555f4d-59be-4450-a2a1-f03172e91b2f
# ╟─d5b5b98a-c379-4e47-8aeb-6d2e83691fe7
# ╟─dbcf484f-1cc8-4c1f-a20b-0b8a7a2a701e
# ╠═fc13b945-abc6-40b7-ba49-35b32d13a7b2
# ╠═f42ad2ad-9ee7-47ff-8e53-6b37dd68741c
# ╠═f72009f5-9b4d-49e0-9461-5676365ed5eb
# ╠═0f32850b-9cba-48f3-b9f4-e72ab6b3a9ce
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
