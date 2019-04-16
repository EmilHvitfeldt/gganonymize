library(tidyverse)
library(rvest)

main_page <- read_html("https://a-z-animals.com/animals/")

animals <- html_nodes(main_page, 'div[class="content"] li') %>%
  html_text()

animals <- unique(animals[!grepl(" ", animals)])
use_data(animals, internal = TRUE)
