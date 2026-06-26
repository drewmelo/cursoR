
# Pacotes -----------------------------------------------------------------

library(tidyverse)
library(janitor)


# Importação de dados -----------------------------------------------------

url <- "https://raw.githubusercontent.com/drewmelo/cursoR/refs/heads/master/dados/endividamento.csv"
url2 <- "https://raw.githubusercontent.com/drewmelo/cursoR/refs/heads/master/dados/salarios.csv"

dados_salarios <- read_csv2(url2)


# Conhecendo a base -------------------------------------------------------

glimpse(dados_salarios)


# Preparar os dados -------------------------------------------------------

dados_salarios <- dados_salarios |> 
  clean_names() |> 
  mutate(
    grau_de_instrucao = factor(
      grau_de_instrucao, levels = c("ensino fundamental",
                                    "ensino médio",
                                    "superior")
    )
  )

glimpse(dados_salarios)


# Visualização de dados ---------------------------------------------------

ggplot(dados_salarios, aes(x = grau_de_instrucao)) +
  geom_bar(fill = "aquamarine4", col = "black") +
  labs(x = "Grau de Instrução",
       y = "Contagem de indivíduos",
       title = "Trabalhadores por grau de instrução") +
  theme_minimal(base_size = 18)

# Barras agrupadas
ggplot(dados_salarios, 
       aes(x = grau_de_instrucao, fill = estado_civil))
