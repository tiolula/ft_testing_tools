
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
	result=`./a.out $parameter`
	if [[ "$result" == "$expected" ]]
	then
		printf "${GREEN}OK${NC}: passando $parameter deve retornar $expected e retorna $result\n"
	else
		printf "${RED}!!ERRO!!${NC} passando $parameter deveria retornar $expected mas retorna $result\n"
	fi
}

echo "------ iniciando os testes ------"
test 1 one
test 5 five
test 100 hundred
test 19 nineteen
test 21 "twenty one"
