<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div id="container" style='width:100%' class="box">
<div class="jumbotron " >
  <h1>Hello, world!</h1>
  <img src="${img}/account/bank.png"/>
  <p><a class="btn btn-primary btn-lg" href="#" role="button">Learn more</a></p>
</div>
<h3 style='margin:0 auto;width:250px'>입출금</h3>
   금 액 : <input type="text" id="money" name="money" value="" />
   <input type = "button" id="bt_deposit" value="입금"/>
   <input type = "button" id="bt_withdraw" value="출금"/>
</div>