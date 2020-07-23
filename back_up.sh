#!/bin/bash
P=$(date "+%Y-%m-%d")

#해당 폴더를 압축
tar -cvzf $P.tar.gz [FilePath]

#배열을 통해 이미 백업을 시켜둔 파일 갯수를 확인
declare -a array
array=$(ssh -p 4030 [user@ipaddress] "echo [FilePath]/*")
delete_num=0
amount=0
for A in ${array}; do
    #echo ${A};
    let amount+=1
done
echo $amount

#이미 백업해둔 압축파일이 15개 이상이라면 예전것부터 5개를 삭제
if [ $amount -ge 15 ]; then
    for A in ${array}; do
        if [ $delete_num -le 5 ]; then
            echo $A
            ssh -p [portnumber] [user@ipaddress] "rm $A"
            let delete_num+=1
        fi
    done
fi

#rsync : 파일과 디렉토리를 로컬 및 원격으로 동기화하는데 사용
# -a : archive 모드로 타임스탬프,심볼릭링,퍼미션,그룹,소유자 등의 파일 보존 
# -z : 데이터를 압축해서 전송
# -h : 읽을 수 있는 형식으로 출력 번호 표시
rsync -azh -e 'ssh -p [portnumber]' [compressed file path]/$P.tar.gz [user@ipaddress]:[Path to be moved]
rm $P.tar.gz
