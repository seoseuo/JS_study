###  Colima 설치
```
brew install colima
```

```
colima version
```
설치가 잘 되었는지 확인하기 위하여 버전을 확인해준다.
![](https://velog.velcdn.com/images/seuo/post/feafc305-c75a-4b95-b337-f0a27b93f5ff/image.png)

```
colima start --memory 4 --arch x86_64
```

해당 코드를 통해 Docker 컨테이너를 띄워줄 가상 환경을 구축한다.
> 4GB의 메모리를 할당한 x86_64 아키텍쳐의 Colima VM 를 시작하겠다는 뜻이다.

### Docker 설치
Docker 공식 사이트에서 
https://www.docker.com/products/docker-desktop/
![](https://velog.velcdn.com/images/seuo/post/0687d0b5-031a-4ab8-bd93-91fe0bad3326/image.png)

For Macwith Apple silicon 을 클릭하여 설치해준다.
![](https://velog.velcdn.com/images/seuo/post/9e3a9dc7-8ddd-4ecd-a8e1-e6e66de6b2af/image.png)

![](https://velog.velcdn.com/images/seuo/post/069cddc5-1b69-41f4-be80-367308f2a040/image.png)

 설치 완료 후 해당 화면이 나오면 완료.
  해당 GUI 화면을 Docker Desktop 이라고도 한다.


  ### 이미지와 컨테이너 설정
  ```
docker ps
docker ps -a
```

> 현재 실행 중인 컨테이너 확인
> 전체 컨테이너 확인



입력 시, 현재 처음 Docker를 설치하게 되었고 그렇다면 아무 컨테이너가 없는 것이 맞다, 고로 해당 명령어를 입력하여도 나타나는 것이 없는게 정상이다.
 ![](https://velog.velcdn.com/images/seuo/post/8e6f46b0-9479-4a49-be64-cbc0ae8c1d08/image.png)

 #### 이미 컨테이너가 있다면 GUI에서 통제할 것

 #### gvenzl/oracle-xe 이미지 설치

```
docker pull genzl/oracle xe:11
```

![](https://velog.velcdn.com/images/seuo/post/739d682a-2310-45ef-8c33-6cee5c1ae577/image.png)

```
docker run --restart unless-stopped --name oracle11g -e ORACLE_PASSWORD=1234 -p 1521:1521 -d gvenzl/oracle-xe:11
```

> **_--restart unless-stopped_** : 컨테이너가 자동을 재시작되도록 설정한다. 수동으로 컨테이너를 중지한 경우에는 재시작 하지 않는다.
_**--name oracle11g**_ : 컨테이너의 이름을 설정한다.
_**-e ORACLE_PASSWORD=1234**_ : 컨테이너의 비밀번호를 설정한다.
_**-p 1521:1521**_ : 포트 매핑을 설정한다. 호스트 시스템의 포트 1521을 통해 컨테이너 내부의 Oracle 데이터베이스에 접근할 수 있다.
_**-d**_ : 컨테이너가 백그라운드에서 실행되며, 로그를 출력하지 않는다.
_**gvenzl/oracle-xe:11**_ : 우리가 실행할 이미지 이름:태그 이고, Oracle XE의 11g 버전을 나타낸다.

 ![](https://velog.velcdn.com/images/seuo/post/f550347e-2316-495e-9efd-fc046644a740/image.png)

 ```
docker logs -f oracle11g
```

> 실시간으로 oracle11g 컨테이너의 로그를 확인하겠다는 뜻.

![](https://velog.velcdn.com/images/seuo/post/6c419ad8-7713-4805-bc52-613609685aef/image.png)
