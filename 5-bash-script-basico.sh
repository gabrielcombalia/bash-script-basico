#!/bin/bash
#declaração de variável
#Você pode escolher a que melhor lhe agrada ou empregar as duas nos seus scripts.
#O próximo exemplo lista as informações relativas a todos os discos e partições do sistema:

system_info=`df -h` # Também poderia ser system_info=$(df -h)
echo “$system_info”

