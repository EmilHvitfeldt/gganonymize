single_word <- function(x) !grepl(" ", x)

#' @importFrom stats runif
lorem <- function(n) {
  rwords <- function(n) {
    words <- c("SED", "IN", "UT", "ET", "AC", "EU", "NON",
               "NEC", "AMET", "SIT", "VEL", "AT", "MAURIS", "A",
               "VITAE", "EGET", "QUIS", "NUNC", "NULLA", "ID", "VESTIBULUM",
               "PELLENTESQUE", "TINCIDUNT", "ALIQUAM", "IPSUM",
               "DONEC", "TURPIS", "LIGULA", "EGESTAS", "NIBH", "SAPIEN",
               "ANTE", "NISL", "VELIT", "ERAT", "EROS", "LEO", "MAGNA",
               "JUSTO", "ENIM", "MI", "PURUS", "EST", "LACUS", "LOREM",
               "QUAM", "DIAM", "RISUS", "DOLOR", "SEM", "AUGUE",
               "NEQUE", "TEMPOR", "DUI", "ARCU", "METUS", "TORTOR",
               "URNA", "LIBERO", "PHARETRA", "TEMPUS", "FAUCIBUS",
               "LECTUS", "SUSPENDISSE", "FELIS", "ODIO", "ORCI",
               "VARIUS", "MASSA", "TELLUS", "VOLUTPAT", "BLANDIT",
               "INTERDUM", "LOBORTIS", "MAXIMUS", "NISI", "LUCTUS",
               "PORTTITOR", "AUCTOR", "ELEMENTUM", "EX", "MAECENAS",
               "MALESUADA", "TRISTIQUE", "ULLAMCORPER", "ULTRICES",
               "NULLAM", "CONSEQUAT", "LACINIA", "PHASELLUS", "ACCUMSAN",
               "DAPIBUS", "ELEIFEND", "COMMODO", "DUIS", "EFFICITUR",
               "ELIT", "IMPERDIET", "AENEAN", "IACULIS", "NAM",
               "CONSECTETUR", "FERMENTUM", "PORTA", "SCELERISQUE",
               "SODALES", "FEUGIAT", "LAOREET", "VULPUTATE", "DICTUM",
               "QUISQUE", "FACILISIS", "FINIBUS", "ORNARE", "PULVINAR",
               "RHONCUS", "CONDIMENTUM", "MOLLIS", "PRETIUM", "ALIQUET",
               "CONGUE", "POSUERE", "SUSCIPIT", "ULTRICIES", "CURABITUR",
               "GRAVIDA", "MATTIS", "VIVERRA", "CURSUS", "EUISMOD",
               "RUTRUM", "VENENATIS", "CONVALLIS", "PROIN", "VEHICULA",
               "PLACERAT", "SAGITTIS", "CRAS", "INTEGER", "MORBI",
               "VIVAMUS", "PRAESENT", "BIBENDUM", "MOLESTIE", "SEMPER",
               "FRINGILLA", "FUSCE", "DIGNISSIM", "ETIAM", "HENDRERIT",
               "SOLLICITUDIN", "PER", "FAMES", "POTENTI", "AD",
               "APTENT", "CLASS", "CONUBIA", "HIMENAEOS", "INCEPTOS",
               "LITORA", "NOSTRA", "SOCIOSQU", "TACITI", "TORQUENT",
               "HABITANT", "NETUS", "SENECTUS", "PRIMIS", "CUM",
               "DIS", "MAGNIS", "MONTES", "MUS", "NASCETUR", "NATOQUE",
               "PARTURIENT", "PENATIBUS", "RIDICULUS", "SOCIIS",
               "ADIPISCING", "FACILISI", "CUBILIA", "CURAE", "DICTUMST",
               "HABITASSE", "HAC", "PLATEA")
    dzipf <- function(k, N, s) 1/k^s/sum(1/(1:N)^s)
    pzipf.y <- c(0, cumsum(dzipf(1:length(words), length(words),
                                 0.5)))
    robs <- findInterval(runif(n), pzipf.y)
    words[robs]
  }
  out <- rwords(floor(n / 2))
  out <- tolower(out)
  paste0(out[seq_len(min(which(cumsum(nchar(out) + 1) > n)))], collapse = " ")
}
