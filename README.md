Shell-Script Lab
================
shell script 기본
------------------
##### shell script 파일을 만든 후 실행이 안되는 경우 chmod +x file 퍼미션 변경
##### EX) vim print.sh;  chmod +x print.sh; sh print.sh

##### 문장을 출력해보자
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
##### 변수를 생성해서 이름을 출력해보자
###### Shell Script 에서 변수 사용시 "=" 기호 앞뒤로 공백이 없어야 대입연산자
###### 변수를 출력하고 싶다면 $변수명
```sh
#!/bin/bash
name="Han seol"
echo $name
```
