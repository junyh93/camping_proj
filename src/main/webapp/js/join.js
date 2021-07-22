/*변수 선언*/
$(function(){

var code = "";

var id = document.querySelector('#id');

var pw1 = document.querySelector('#pswd1');
var pwMsg = document.querySelector('#alertTxt');
var pwImg1 = document.querySelector('#pswd1_img1');

var pw2 = document.querySelector('#pswd2');
var pwImg2 = document.querySelector('#pswd2_img1');
var pwMsgArea = document.querySelector('.int_pass');

var userName = document.querySelector('#name');

var email = document.querySelector('#email');

var mobile = document.querySelector('#mobile');

var error = document.querySelectorAll('.error_next_box');

var mailCheck = false; //이메일

var mailnumCheck = false; 	//이메일 인증번호 확인 



/*이벤트 핸들러 연결*/
/* addEventListener - 이벤트 등록  */
/* focusout되면 두번째 인자 함수 실행 */
id.addEventListener("change", checkId); /* 아이디*/
pw1.addEventListener("change", checkPw);/* 비번 */
pw2.addEventListener("change", comparePw);/* 비번 확인 */
userName.addEventListener("change", checkName);/* 이름 */
email.addEventListener("change", isEmailCorrect);/* 이메일 */
mobile.addEventListener("change", checkPhoneNum);/* 휴대폰 */


/*콜백 함수*/



function checkPw() {
    var pwPattern = /[a-zA-Z0-9~!@#$%^&*()_+|<>?:{}]{8,16}/;
    if(pw1.value === "") {
        error[1].innerHTML = "필수 정보입니다.";
        error[1].style.display = "block";
    } else if(!pwPattern.test(pw1.value)) {
        error[1].innerHTML = "8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.";
        pwMsg.innerHTML = "사용불가";
        pwMsgArea.style.paddingRight = "93px";
        error[1].style.display = "block";
        pwMsg.style.color = "red";
        pwMsg.style.display = "block"; 
        pwImg1.src = "/camping/img/m_icon_not_use.png";
    } else {
        error[1].style.display = "none";
        pwMsg.innerHTML = "안전";
        pwMsg.style.display = "block";
        pwMsg.style.color = "#03c75a";
        pwImg1.src = "/camping/img/m_icon_safe.png";
    }
}

function comparePw() {
    if(pw2.value === pw1.value && pw2.value != "") { /* 일치 */
        pwImg2.src = "/camping/img/m_icon_check_enable.png";
        error[2].style.display = "none";
    } else if(pw2.value !== pw1.value) {
        pwImg2.src = "/camping/img/m_icon_check_disable.png";
        error[2].innerHTML = "비밀번호가 일치하지 않습니다.";
        error[2].style.display = "block";
    } 

    if(pw2.value === "") { /* 공백 */
        error[2].innerHTML = "필수 정보입니다."; 
        error[2].style.display = "block";
    }
}

function checkName() {
    var namePattern = /[a-zA-Z가-힣]/;
    if(userName.value === "") {
        error[3].innerHTML = "필수 정보입니다.";
        error[3].style.display = "block";
    } else if(!namePattern.test(userName.value) || userName.value.indexOf(" ") > -1) {
        error[3].innerHTML = "한글과 영문 대 소문자를 사용하세요. (특수기호, 공백 사용 불가)";
        error[3].style.display = "block";
    } else {
        error[3].style.display = "none";
    }
}



function isEmailCorrect() {
    var emailPattern = /[a-z0-9]{2,}@[a-z0-9-]{2,}\.[a-z0-9]{2,}/;

    if(email.value === ""){ 
        error[4].style.display = "none"; 
    } else if(!emailPattern.test(email.value)) {
        error[4].style.display = "block";
    } else {
        error[4].style.display = "none"; 
    }

}

function checkPhoneNum() {
    var isPhoneNum = /([01]{2})([01679]{1})([0-9]{3,4})([0-9]{4})/;

    if(mobile.value === "") {
        error[5].innerHTML = "필수 정보입니다.";
        error[5].style.display = "block";
    } else if(!isPhoneNum.test(mobile.value)) {
        error[5].innerHTML = "형식에 맞지 않는 번호입니다.";
        error[5].style.display = "block";
    } else {
        error[5].style.display = "none";
    }

    }


});

 