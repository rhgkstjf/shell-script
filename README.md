Shell-Script Lab
================
shell script 기본
------------------
##### shell script 파일을 만든 후 실행이 안되는 경우 chmod +x file 퍼미션 변경
##### Ex) vim print.sh;  chmod +x print.sh; sh print.sh

##### 출력 - 문장을 출력해보자
* 첫번째 줄에 #!/bin/bash 추가 파일 확장자는.sh
  * Echo - 문장을 출력하면서 자동으로 줄바꿈 c언어의 printf + \n
```sh
#!/bin/bash
echo "처음 해보는 스크립트짜기"
printf "Hello"
printf "%s %s" Hello hanseol
```
##### 주석은 '#'
```sh
#!/bin/bash
#echo "이부분은 주석이예요"
echo "이부분은 주석이 아니예요"
```
##### 변수 - 변수를 생성해서 이름을 출력해보자
* Shell Script 에서 변수 사용시 "=" 기호 앞뒤로 공백이 없어야 대입연산자
* 변수를 사용할때에는 $변수명
* 기본적으로 선언된 변수는 전역변수이며 지역변수를 사용하려면 변수명 앞에 local을 붙여주어야함
```sh
#!/bin/bash
name="Han seol"
echo $name
```

##### 함수 - 함수를 만들어서 이름을 출력해보자
* 함수는 c언어의 함수와 비슷하며 function 을 생략해도 생성가능
* c언어와 마찬가지로 함수 호출보다 함수 선언이 먼저 되어야함
* $@ 뜻은 전체 인자값 $* 뜻 또한 전체 인자값
```sh
#!/bin/bash
function my_name(){
        echo "${@}"
        echo $*
}
my_name "My name is" "Han Seol"
```

##### 배열 - 파일명들을 가져와서 출력해보자
* 배열 변수 사용시 반드시 괄호를 사용 Ex)${array[1]}
* 1차원 배열만 지원함

```sh
#!/bin/bash
declare -a array


```

