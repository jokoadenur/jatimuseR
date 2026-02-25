![Build Status](https://img.shields.io/badge/build-passing-brightgreen.svg)
![CRAN Version](https://img.shields.io/badge/CRAN-3.6.0-brightgreen)
![Open Issues](https://img.shields.io/badge/open%20issues-0-brightgreen)
![License](https://img.shields.io/badge/License-MIT-blue)
<img width="1024" height="1024" alt="ChatGPT Image Feb 25, 2026, 01_31_16 PM" src="https://github.com/user-attachments/assets/2f798f9a-db75-4c2e-abde-2935f4c871ce" />

# jatimuseR

`jatimuseR` adalah package R untuk mengakses dataset publik Provinsi Jawa Timur yang bersumber dari Badan Pusat Statistik Provinsi Jawa Timur (https://jatim.bps.go.id/) dan disediakan dalam format siap pakai untuk analisis dan pemodelan di R. Package ini dirancang sebagai data access layer yang memudahkan pengguna memperoleh data resmi tanpa perlu mengunduh dan membersihkan data secara manual dari spreadsheet. Tujuan dari pembuatan package ini adalah memperluas jangkauan pemanfaatan data BPS Provinsi Jawa Timur bagi pengambil kebijakan, peneliti, mahasiswa, atau masyarakat peminat data dan analisis indikator terkini Jawa Timur.

### Fitur Utama

- Akses dataset sosial dan ekonomi Jawa Timur

- Format data sudah rapi dan siap analisis

- Mudah diintegrasikan dengan package lain untuk Data Mining, misalkan package `sarimasnap`, `segmonR`, `numspellR`, atau lainnya

### Instalasi

Install langsung dari GitHub:
```r
remotes::install_github("jokoadenur/jatimuseR", upgrade = "never")
```
Gunakan fungsi berikut untuk melihat daftar dataset:
```r
library(jatimuseR)
list_datasets()
```
Contoh _output_:

```r
pdrb_Triwulanan

pertumbuhan_ekonomi_QtQ

pertumbuhan_ekonomi_YoY

pertumbuhan_ekonomi_CtC

indeks_harga_konsumen

inflasi_mtm

inflasi_YoY

TPT

Kemiskinan_Jumlah

Kemiskinan_Persen

Rasio_Gini
```

### Cara Menggunakan Package jatimuseR
```r
# Memanggil Dataset
library(jatimuseR)
# Membentuk data frame
x <- get_dataset("Kemiskinan_Jumlah")
# sekilas data
head(x)
```
### Visualisasi Sederhana
```r
# Visualisasi jumlah penduduk miskin Jawa Timur
# Aktivasi package pendukung
library(dplyr)
library(tidyr)
library(ggplot2)
# Membuat Pivot Long
data_long <- x %>%
  filter(Wilayah == "Jawa Timur") %>%
  pivot_longer(
    cols = starts_with("Kemis_"),
    names_to = "tahun",
    values_to = "jumlah"
  ) %>%
  mutate(
    tahun = as.numeric(gsub("Kemis_", "", tahun))
  )
# Visualisasi hasilnya dengan ggplot2
ggplot(data_long, aes(tahun, jumlah)) +
  geom_line() +
  geom_point() +
  theme_minimal()
```
### Author

Joko Ade Nursiyono (Data Analyst BPS Provinsi Jawa Timur)
