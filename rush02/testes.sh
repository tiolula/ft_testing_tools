
echo "compilando..."
gcc -Wall -Werror -Wextra *.c\
&& echo "sucesso!"

echo "norminette..."
norminette -R CheckForbiddenSourceHeader

test(){
	parameter=$1
	expected=$2
	RED='\033[0;31m'
	GREEN='\033[0;32m'
	NC='\033[0m' # No Color
	bold=$(tput bold)
	normal=$(tput sgr0)
	result=`./a.out $parameter`
	if [[ "$result" == "$expected" ]]
	then
		printf "${GREEN}OK${NC}: passando $parameter deve retornar $expected$ e retorna $result$\n"
	else
		printf "${RED}!!ERRO!!${NC} passando ${bold}$parameter${normal} deveria retornar ${bold}$expected${normal}$ mas retorna ${bold}$result${normal}$\n"
	fi
}

echo "------ iniciando os testes ------"
test 1 "one"
test 5 "five"
test 19 "nineteen"
test 20 "twenty"
test 15 "fifteen"
test 40 "forty"
test 30 "thirty"
test 31 "thirty one"
test 0 "zero"
test 99 "ninety nine"
test 10 "ten"
test 42 "forty two"
test 23 "twenty three"
test 69 "sixty nine"
test 21 "twenty one"
test 100 "one hundred"
test 101 "one hundred one"
test 1000 "one thousand"
test 1111 "one thousand one hundred eleven"
test 150 "one hundred fifty"
test 1001 "one thousand one"
test 1154 "one thousand one hundred fifty four"
test 200 "two hundred"
test 242 "two hundred forty two"
test 142 "one hundred forty two"
test 399 "three hundred ninety nine"
test 981 "nine hundred eighty one"
test 2442 "two thousand four hundred forty two"
test 5201 "five thousand two hundred one"
test 01 "one"
test 03 "three"
test 003 "three"
test 007 "seven"
test 042 "forty two"
test 000000042 "forty two"
test 00 "zero"
test 000000 "zero"
test 999 "nine hundred ninety nine"
test 9999 "nine thousand nine hundred ninety nine"
test 99999 "ninety nine thousand nine hundred ninety nine"
test 21500 "twenty one thousand five hundred"
test 38120 "thirty eight thousand one hundred twenty"
test 11500 "eleven thousand five hundred"
test 999999 "nine hundred ninety nine thousand nine hundred ninety nine"
test 11000 "eleven thousand"
test 10000 "ten thousand"
test 21042 "twenty one thousand forty two"
test 1000000 "one million"