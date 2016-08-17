function gohome(context) {
	location.href = context+"/home.do";
}
function start(aaa) {
	document.getElementById('atag')
	.onclick = gohome(aaa);
}

/*function showAlert() {
	alert('로딩되자 마자 팝업이 뜬다!!');
}
function clickme() {
	document.getElementsByTagName('button')[0].onclick=showAlert();
	
}*/