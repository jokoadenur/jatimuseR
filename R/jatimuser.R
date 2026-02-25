#' jatimuseR: Akses Dataset Badan Pusat Statistik Provinsi Jawa Timur Siap Pakai
#'
#' Kumpulan fungsi untuk mengambil dataset dari Google Spreadsheet
#' secara read-only (tanpa autentikasi) untuk keperluan analisis data
#' Badan Pusat Statistik Provinsi Jawa Timur.
#'
#' @keywords internal
"_PACKAGE"


# URL spreadsheet utama
.jatim_sheet_url <- "https://docs.google.com/spreadsheets/d/14Cz_G0quhpbJU277Wy2xLoxAWJnXsRQn8U1zLFsq2sU"


# Internal: Nonaktifkan autentikasi (read-only publik)
.jatim_deauth <- function() {
  googlesheets4::gs4_deauth()
}


#' Menampilkan Daftar Dataset (Nama Sheet)
#'
#' Mengembalikan daftar nama sheet yang tersedia
#' pada Google Spreadsheet jatimuseR.
#'
#' @return Character vector berisi nama dataset.
#' @export
list_datasets <- function() {

  .jatim_deauth()

  ss <- suppressMessages(suppressWarnings(
    googlesheets4::gs4_get(.jatim_sheet_url)
  ))

  ss$sheets$name
}


#' Mengambil Dataset Berdasarkan Nama
#'
#' Mengambil dataset dari Google Spreadsheet berdasarkan
#' nama sheet.
#'
#' @param dataset_name Character. Nama sheet (dataset) yang ingin diambil.
#'
#' @return Data frame.
#' @export
get_dataset <- function(dataset_name) {

  .jatim_deauth()

  data <- suppressMessages(suppressWarnings(
    googlesheets4::read_sheet(.jatim_sheet_url, sheet = dataset_name)
  ))

  return(as.data.frame(data))
}
