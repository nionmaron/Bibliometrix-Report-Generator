
# Instale e carregue os pacotes necessários
#install.packages(c("httr", "countrycode"))
library(httr)
library(countrycode)

# Crie um dataframe com a lista de países
df_countries <- data.frame(Country = countrycode::codelist$country.name.en)

# Crie uma pasta para salvar as bandeiras, se ela ainda não existir
if (!dir.exists("Bandeiras")) {
  dir.create("Bandeiras")
}

# Baixe a bandeira de cada país
for (country in df_countries$Country) {
  # Substitua espaços e caracteres especiais no nome do país
  country_name <- gsub(" ", "-", country)
  country_name <- gsub("[^a-zA-Z0-9\\-]", "", country_name)
  country_name <- gsub("--", "-", country_name)  # Substituir "--" por "-"
  
  # Transformar em maiúsculas
  country_name <- toupper(country_name)
  
  # Crie o URL da bandeira
  flag_url <- paste0("https://img.icons8.com/color/48/null/", tolower(country_name), "-circular.png")
  
  # Tente baixar a bandeira e salvar na pasta Bandeiras
  try({
    GET(flag_url, write_disk(paste0("Flags/", country_name, ".png"), overwrite = TRUE))
  }, silent = TRUE)
}
