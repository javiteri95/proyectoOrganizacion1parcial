
def persistenciaAditiva(numero):
    contador = 0
    acumulador = 0
    while (numero > 10):
        while (numero  != 0):
            acumulador += (numero %10)
            numero //= 10
        contador+=1
        numero = acumulador
        acumulador = 0
    return contador

print(persistenciaAditiva(7865))
