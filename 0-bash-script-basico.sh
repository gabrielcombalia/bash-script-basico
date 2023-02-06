primeiro script

Se você tiver salvo o seu arquivo no diretório atual, basta executá-lo digitando no prompt: ./exemplo1.sh
Se você tiver salvo o seu arquivo em outro diretório qualquer, você precisará informar o path completo até ele. Considerando que ele esteja em /tmp/scripts: /tmp/scripts/exemplo1.sh
lembrar de fazer chmod +x <nomedoarquivo>


#!/bin/bash
#Este é um comentário
#Este é outro comentário
  echo "Este script contém comentários."

segundo arquivo

#!/bin/bash
echo "Seu nome de usuário é:"
whoami
echo "Info de hora atual e tempo que o computador está ligado:"
uptime
echo "O script está executando do diretório:"
pwd

terceiro arquivo

Para utilizarmos o valor da variável coloca-se o $ (cifrão) na frente de seu nome, como mostra o exemplo da Listagem 3.
#!/bin/bash
site=www.campuscode.com.br
meu_numero_favorito=13
_cidade=”Rio de Janeiro”
echo “Um ótimo site para você aprender a programar e se manter atualizado é: $site”
echo “Meu número favorito é: $meu_numero_favorito”
echo “Minha cidade natal é: $_cidade”

quarto arquivo

Agora, se você deseja printar o nome da própria variável, basta colocar uma barra invertida \ antes do $, assim, ela nega o caractere seguinte e normalmente é utilizada para caracteres de scape (ou seja, caracteres que já tem uma função específica, mas que você deseja somente utilizar em um nome ou valor, sem executá-los). Vejamos um exemplo na Listagem 4.
#!/bin/bash
nome=fernanda
echo “O nome da variável é \$nome”

quinto arquivo - declaração de variável

Você pode escolher a que melhor lhe agrada ou empregar as duas nos seus scripts.
O próximo exemplo lista as informações relativas a todos os discos e partições do sistema:
#!/bin/bash
system_info=`df -h` # Também poderia ser system_info=$(df -h)
echo “$system_info”

sexto arquivo - Capturando a entrada de dados do usuário

#!/bin/bash
echo “Qual o nome de uma de suas músicas favoritas?”
read nome_musica;
echo “Você gosta de ouvir $nome_musica!”

Comandos de seleção ou de tomada de decisão

if [ CONDICAO ];
then
  AÇÕES
Fi

ou 


if test CONDICAO;
then
     AÇÕES
Fi

sexto arquivo

#!/bin/bash
echo “Digite um número qualquer:”
read numero;
if [ “$numero” -gt 20 ];
then
  echo “Este número é maior que 20!”
fi

Veja a seguir os parâmetros mais comuns utilizados com o comando test:
n string1: o comprimento de string1 é diferente de 0;
z string1: o comprimento de string1 é zero;
 string1 = string2: string1 e string2 são idênticas;
 string1 != string2: string1 e string2 são diferentes;
 inteiro1 -eq inteiro2: inteiro1 possui o mesmo valor que inteiro2;
 inteiro1 -ne inteiro2: inteiro1 não possui o mesmo valor que inteiro2;
 inteiro1 -gt inteiro2: inteiro1 é maior que inteiro2;
 inteiro1 -ge inteiro2: inteiro1 é maior ou igual a inteiro2;
 inteiro1 -lt inteiro2: inteiro1 é menor que inteiro2;
 inteiro1 -le inteiro2: inteiro1 é menor ou igual a inteiro2;
e nome_do_arquivo: verifica se nome_do_arquivo existe;
d nome_do_arquivo: verifica se nome_do_arquivo é um diretório;
f nome_do_arquivo: verifica se nome_do_arquivo é um arquivo regular (texto, imagem, programa, docs, planilhas).


O comando else

if [ CONDICAO ];
   then
       AÇÕES_1
  else
      AÇÕES_2
fi

sétimo arquivo

#!/bin/bash
  echo “Digite um número qualquer:”
  read numero;
  if [ “$numero” -ge 0 ];
   then
    echo “O número $numero é positivo!”
  else
   echo “O número $numero é negativo!”
fi


O comando elif

if [ CONDICAO_1 ];
 then
  AÇÕES_1
 elif [ CONDICAO_2 ];
 then
   AÇÕES_2
 elif [ CONDICAO_3 ];
 then
   AÇÕES_3
              .
              .
              .
              .
 elif [ CONDICAO_N ];
 then
  AÇÕES_N
Fi


oitavo arquivo 

#!/bin/bash
echo "Selecione uma opção:"
echo "1 - Exibir data e hora do sistema"
echo "2 - Exibir o resultado da divisão 10/2"
echo "3 - Exibir uma mensagem”
read opcao;
if [ $opcao == "1" ];
then
  data=$(date +"%T, %d/%m/%y, %A")
  echo "$data"
elif [ $opcao == "2" ];
then
   result=$((10/2))
   echo "divisao de 10/2 = $result"
elif [ $opcao == "3" ];
 then
 echo "Informe o seu nome:"
 read nome;
 echo "Bem-vindo ao mundo do shell script, $nome!"
fi


O comando case

case VARIAVEL in
  CASO_1)
    AÇÕES_1
  ;;
  CASO_2)
     AÇÕES_2
  ;;
  CASO_N)
    AÇÕES_N
;;
esac

nono arquivo

#!/bin/bash
  echo "Selecione uma opção:"
  echo "1 - Exibir data e hora do sistema"
  echo "2 - Exibir o resultado da divisão 10/2"
  echo "3 - Exibir uma mensagem”
 read opcao;
  case $opcao in
   “1”)
      data=$(date +"%T, %d/%m/%y, %A")
      echo "$data"
      ;;
   “2”)
     result=$((10/2))
     echo "divisao de 10/2 = $result"
   ;;
   “3”)
    echo "Informe o seu nome:"
    read nome;
    echo "Bem-vindo ao mundo do shell script, $nome!"
  ;;
esac


decimo arquivo

#!/bin/bash
 echo “Testando o loop for”
 for i in {10..0};
 do
   echo “$i”
 done


decimo primeiro arquivo


#!/bin/bash
 echo “Testando o comando seq pulando de 5 em 5”
 for i in $(seq 1 5 100);
 do

  echo “$i”
done


decimo segundo arquivo


#!/bin/bash
 echo “Testando o comando seq normal”
 for i in $(seq 1 100);
 do
  echo “$i”
done

decimo terceiro arquivo

#!/bin/bash
  echo “Informe o que você quiser, -1 para sair”
  read dado;
  while [ $dado != “-1” ];
  do
    echo “Você digitou $dado”
  read dado;
done


decimo quarto arquivo

#!/bin/bash
echo “Informe até que valor positivo e maior que zero contar:”
read valor;
i=1
while [ $i -le $valor ];
 do
  echo “$i”
  ((i=$i+1))
done

decimo quinto arquivo - exemplo de uso de funções

#!/bin/bash
 main()
 {
   echo "Escolha uma opção:"
   echo "1 - Esvaziar a lixeira"
   echo "2 - Calcular fatorial"
   read opcao;
   case $opcao in
   "1")
    esvaziar_lixeira
    ;;
   "2")
    calcular_fatorial
    ;;
 esac
}
esvaziar_lixeira()
{
  echo "Esvaziando a lixeira..."
  path="${HOME}/local/share/Trash/files"
  cd "$path"
  for file in *
  do
  rm -rf "$file"
  done
  echo "Done!"
}
calcular_fatorial()
{
  echo "Informe um número:"
  read numero;
  i=1
  fat=1
  while [ $i -le $numero ]
  do
  fat=$(($fat*$i))
  i=$(($i+1))
  done
  echo "fatorial de $numero é $fat"
}
main


Argumentos

Normalmente um programa recebe argumentos como entrada, ou seja, dados fornecidos pelo usuário ou por outro programa, os quais devem ser “consumidos” para produzir as saídas desejadas.
Em shell script não poderia ser diferente: temos nomes especiais para designar os argumentos recebidos por um script:
$0 – contém o nome do script que foi executado;
$1 … $n – contêm os argumentos na ordem em que foram passados (1º argumento em $1, 2º argumento em $2, etc.).
$# - contém o número de argumentos que foi passado (ou seja, não considera o nome do script em $0);
$* - retorna todos os argumentos de uma vez só.

#!/bin/bash

  if [ $# -lt 1 ];
  then
   echo "Precisa fornecer pelo menos 1 argumento!"
   exit 1
 fi
 echo "Número de argumentos passados: $#"
i=0
for argumento in $*
 do
 i=$(($i+1))
  echo "Argumento $i passado: $argumento"
 done








