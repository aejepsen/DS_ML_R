base = read.csv("credit_data.csv")
base$clientid = NULL
summary(base)

idade_invalida = base[base$age < 0 & !is.na(base$age), ]

# apagar a coluna inteira
# base$age = NULL

# apagar dados negativos
# base = base[base$age > 0, ]

# preencher dados manualmente
mean(base$age)
mean(base$age, na.rm = TRUE)
mean(base$age[base$age > 0], na.rm = TRUE)
base$age = ifelse(base$age < 0, 40.92, base$age )



# tratar valore faltantes
base[is.na(base$age), ]
base$age = ifelse(is.na(base$age), mean(base$age, na.rm = TRUE), base$age)

# escalonamento por padronização, excluindo no escalonamento a columa 4 default

base[, 1:3] = scale(base[, 1:3])
