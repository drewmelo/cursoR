
# Pacotes -----------------------------------------------------------------

library(tidyverse)
library(janitor)


# Importar os dados -------------------------------------------------------

url <- "https://raw.githubusercontent.com/drewmelo/cursoR/refs/heads/master/dados/salarios.csv"

dados <- read_csv2(url)


# Conhecer a base ---------------------------------------------------------

glimpse(dados)

# Preparar a base
dados <- dados |> 
  clean_names() |> 
  mutate(
    estado_civil = factor(estado_civil),
    grau_de_instrucao = factor(grau_de_instrucao,
                               levels = c("ensino fundamental", "ensino médio", "superior"))
  )

glimpse(dados)


# Tabela de dupla entrada ou contigência ----------------------------------

dados_salarios <- dados |> 
  mutate(
    classe_salario = cut(
      salario_x_sal_min,
      breaks = c(0, 5, 10, 15, 20, 25),
      right = TRUE,
      include.lowest = TRUE
    )
  )

tab_abs <- with(data = dados_salarios,
                table(classe_salario, grau_de_instrucao))

# Adicionar total
tab_abs_total <- addmargins(tab_abs)
