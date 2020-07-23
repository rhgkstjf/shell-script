Shell-Script Lab
================
shell script 기본
------------------
##### shell script 파일을 만든 후 실행이 안되는 경우 chmod +x file 퍼미션 변경
##### EX) vim print.sh;  chmod +x print.sh; sh print.sh

###### 문장을 출력해보자
* 첫번째 줄에 #!/bin/bash 추가 파일 확장자는.sh
  * Echo - 문장을 출력하면서 자동으로 줄바꿈 c언어의 printf + \n
```sh
#!/bin/bash
echo "처음 해보는 스크립트짜기"
printf "Hello"
printf "%s %s" Hello hanseol
```
