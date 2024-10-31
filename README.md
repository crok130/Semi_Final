## 중고 서적 거래 플랫폼 (세미 프로젝트) - baskin31

### 📚 프로젝트 개요

**baskin31**는 국비 교육 과정에서 학습한 웹 개발 기술을 활용하여 실제 서비스와 유사한 중고 서적 거래 플랫폼을 구축하는 것을 목표로 하는 세미 프로젝트입니다. 사용자 친화적인 인터페이스와 다양한 기능을 통해 중고 서적 거래를 활성화하고, 편리한 온라인 경험을 제공하고자 합니다.

### ✨ 주요 기능

* **회원 관리:**
    * 안전한 이메일 인증을 통한 회원 가입
    * 아이디/비밀번호 기반 로그인 및 로그아웃
    * 개인 정보 수정 및 비밀번호 변경
    * 회원 탈퇴 기능 제공

* **도서 관리:**
    * 판매자가 중고 도서 정보를 등록 (도서명, 저자, 출판사, 가격, 이미지, 도서 상태 등)
    * 다양한 검색 조건 (도서명, 저자, 출판사, ISBN, 카테고리)으로 도서 검색
    * 상세 정보 페이지 제공 (판매자 정보, 도서 상태, 가격, 상세 이미지)
    * 구매자가 원하는 도서를 장바구니에 담거나 즉시 구매

* **장바구니:**
    * 구매할 도서를 장바구니에 추가
    * 장바구니에 담긴 도서 목록 확인 및 수량 변경
    * 장바구니 전체 비우기 기능

* **주문 관리:**
    * 장바구니에 담긴 도서를 주문
    * 주문 내역 확인 (주문일자, 상품 정보, 결제 금액, 배송 상태 등)
    * 주문 취소 기능 제공

* **게시판:**
    * 자유 게시판, Q&A 게시판 제공
    * 게시글 및 댓글 작성/수정/삭제 기능

* **관리자 페이지:**
    * 회원 목록 조회, 회원 정보 수정, 회원 탈퇴 처리
    * 도서 목록 조회, 도서 정보 수정, 도서 삭제
    * 주문 목록 조회, 주문 상태 변경, 주문 취소 처리
    * 게시글 및 댓글 관리 기능

### 🛠️ 개발 환경

* **언어:** Java 1.8
* **프레임워크:** Servlet/JSP
* **데이터베이스:** MySQL 5.7
* **서버:** Tomcat 9.0
* **개발 도구:** Eclipse
* **라이브러리:** Bootstrap 3.3.7
* **형상 관리:** Git & GitHub

### ⚙️ 시스템 아키텍처

* MVC (Model-View-Controller) 패턴 적용


### 💻 실행 방법

1. **MySQL 설치 및 데이터베이스 생성:** MySQL을 설치하고 `test.sql` 파일을 이용하여 데이터베이스를 생성합니다.
2. **프로젝트 import:** Eclipse IDE에 프로젝트를 import 합니다.
3. **Tomcat 서버 설정:** Tomcat 서버를 설정하고 프로젝트를 배포합니다.
4. **웹 브라우저 실행:** 웹 브라우저에서 `http://localhost:8080/프로젝트명` 에 접속합니다.


### 🤔 어려웠던 점 & 해결 과정

* **AJAX를 이용한 비동기 통신 구현:** AJAX 기술 학습 및 코드 분석, Stack Overflow 등 온라인 커뮤니티 활용, 팀원과의 코드 리뷰를 통해 해결
* **복잡한 SQL 쿼리 작성:** 데이터베이스 관련 전문 자료 및 온라인 튜토리얼 참고, 팀원과의 협력 및 코드 리뷰를 통해 최적화된 쿼리 작성

### 😊 느낀 점

* 웹 개발의 전반적인 흐름을 이해하고 실제 프로젝트를 경험하며 실무 능력 향상
* 팀 협업 및 문제 해결 능력, 의사소통 능력 향상
* 웹 개발에 대한 흥미와 열정 증진

### 🚀 개선 방향

* 반응형 웹 디자인 적용하여 다양한 기기에서 최적화된 사용자 경험 제공
* 결제 시스템 연동, 소셜 로그인 등 더욱 다양한 기능 추가
* 코드 리팩토링 및 성능 최적화를 통해 시스템 안정성 및 효율성 향상
* 사용자 피드백을 반영하여 UI/UX 개선

**감사합니다.** 🙏
