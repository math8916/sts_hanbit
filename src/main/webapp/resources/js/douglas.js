var util = (function() {
	var _page,_directory
	var setPage = function(page) {this._page=page};
	var setDirectory = function(directory) {this._directory=directory};
	return{
		move : function(directory,page) {
			setDirectory(directory);
			setPage(page);
			location.href=
				sessionStorage.getItem('context')+'/'+getDirectory()+'.do?page='+getPage();
		},
		isNumber : function(value) {
			 return typeof value === 'number' && isFinite(value);
		}
	};
})();
var move = function(context,page) {
	location.href=context+'/douglas.do?page='+page;
}
var douglas = (function(){
	var context = sessionStorage.getItem('context');
	return{
		init:function() {
			$('#bt_bom').click(function() {move(context,'bom');},false);
			$('#bt_dom').click( function() {move(context,'dom');}, false);
			$('#bt_kaup').click(function() {move(context,'kaup');}, false);
			$('#bt_account').click( function() {move(context,'account');}, false);
			$('#bt_deposit').click( function() {move(context,'account');}, false);
			$('#bt_withdraw').click( function() {move(context,'account');}, false);
		
	}
	};
})();

var account2 = (function() {
	var _account_no, _money;
	var setAccountNo = function(account_no){this._account_no=account_no;};
	var getAccountNo = function(){return this._account_no;};
	var setMoney = function(money){this._money=money;};
	var getMoney = function(){return this._money;};
	
	return {
		 setAccountNo:setAccountNo,
		 getAccountNo:getAccountNo,
		 setMoney : setMoney,
		 getMoney : getMoney,
		init : function() {
			$('#bt_spec_show').click(function() {move(context,'spec_show');},false);
			$('#bt_make_account').click(function() {move(context,'spec');},false);
			document.querySelector('#bt_money_deposit').addEventListener(
					'click', this.deposit, false);
			document.querySelector('#bt_money_withdraw').addEventListener(
					'click', this.withdraw, false);
		},
		spec : function() {
			setMoney(0);
			setAccountNo(Math.floor((Math.random() * 899999) + 100000));
			document.querySelector('#result_account').innerHTML = getAccountNo();
		},
		deposit: function() {
			var r_acc=document.querySelector('#result_account').innerText; 
			if(r_acc ===''){
				alert ('먼저 통장을 개설 하세요');
			}else{
				var rest_money =getMoney();
				
				var input_money = Number(document.querySelector('#money').value);
				console.log('타입 체크'+(typeof rest_money ==='number'));
				setMoney(input_money+rest_money);
				document.querySelector('#rest_money').innerHTML=getMoney();
			}
			
		},
		withdraw: function() {
			var rest_money = getMoney();
			var input_money = Number(document.querySelector('#money').value);
			setMoney(rest_money-input_money);
			document.querySelector('#rest_money').innerHTML=getMoney();
		}
	};
})();

var member2 = (function() {
	var _name,_ssn,_gender,_age;
	var setAge=function(age){this.age=age;}
	var setName=function(name){this.name=name;}
	var setSsn=function(ssn){this.ssn=ssn;}
	var setGender=function(gender){this.gender=gender;}
	var getAge=function(age){this.age=age;}
	var getName=function(name){this.name=name;}
	var getSsn=function(ssn){this.ssn=ssn;}
	var getGender=function(gender){this.gender=gender;}
	return{
		spec:function () {
			
			_name = document.querySelector('#name').value;
			_ssn = document.querySelector('#ssn').value;

			console.log("name :" + _name);
			console.log("age :" + _age);
			console.log("gender :" + _gender);

			var d = new Date();
			var n = d.getFullYear();
			console.log("오늘 날짜 :" + n);
			var birth = _ssn.substring(6, 0);
			console.log("앞자리 :" + birth);
			var c = _ssn.substring(8, 7);
			console.log("성별용 :" + c);
			

			switch ((birth / 100000) % 2) {
			case 0:
				_age = n - (birth / 10000 + 2000);
				console.log("나이2000년대 :" + _age);
				break;

			default:
				_age = n - (birth / 10000 + 1900);
				console.log("나이1900년대 :" + _age);
				break;
			}
			switch (c % 2) {
			case 0:
				_gender = "여";
				break;

			default:
				_gender = "남";
				break;
			}

			document.querySelector('#result_name').innerHTML =_name;
			document.querySelector('#result_age').innerHTML =Math.floor(_age);
			document.querySelector('#result_gender').innerHTML = _gender;
		}
};




})();


var kaup = (function () {
	var _name='',_result='';
	return {
	kaup_init : function () {
		alert("init 호출 하는지 체크");
		var bt_kaup_calc = document.querySelector('#bt_kaup_calc');
		bt_kaup_calc.addEventListener('click', kaup_calc, false);
	},
	 kaup_go :function() {
		location.href = getContext() + "/douglas.do?page=kaup";
	},

	 kaup_calc:function() {
		var name = document.querySelector('#name').value;
		var height = document.getElementById('height').value;
		var weight = document.getElementById('weight').value;
		console.log('name' + name);
		console.log('height' + height);
		console.log('weight' + weight);

		var result = '';
		var kaup = weight * 10000 / (height * height);

		if (kaup < 18.5) {
			result = "저체중 ";
		} else if (kaup >= 18.5 && kaup < 22.9) {
			result = "정상체중";
		} else if (kaup >= 23.0 && kaup < 24.9) {

			result = "위험체중";
		} else if (kaup >= 25.0 && kaup < 29.9) {
			result = "비만 1단계";
		} else if (kaup >= 25.0 && kaup < 29.9) {
			result = "비만 2단계";
		} else if (kaup >= 40) {
			result = "비만 3단계";
		}

		document.getElementById('result').innerHTML = name + '  님의 카우프의 결과 '
				+ result;
		
	}
	};
})();



