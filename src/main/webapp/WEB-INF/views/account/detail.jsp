<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${css}/public.css" />
<link rel="stylesheet" href="${css}/member.css" />
<div class="box table">
	<h1>회원상세정보</h1>

	<table id="subject_detail" class="table">
				<tr>
				<td rowspan="4" style="width:30%">
				<img src="${img}/account/bank_logo.gif" alt="bank" width="104"
			height="142"> </td>
				<td style="width:20%" class="font_bold bg_color_yellow">ID</td>
				<td style="width:40%">Java</td>
			</tr>
			<tr>
				<td class="font_bold bg_color_yellow">이름</td>
				<td>최강</td>
			</tr>
			<tr>
				<td class="font_bold bg_color_yellow">계좌번호</td>
				<td>124334-12234</td>
			</tr>
			<tr>
				<td class="font_bold bg_color_yellow">잔액</td>
				<td>900000000</td>
			</tr>
		</table>
	</div>
<div class="container" style="text-align:center">
  <h2>거래 상세내역</h2>
  <a>저희 최강 은행을 이용해 주셔서 감사합니다.</a>
  <table class="table box">
    <thead>
      <tr>
        <th>일자</th>
        <th>입금</th>
        <th>출금</th>
        <th>잔액</th>
      </tr>
    </thead>
    <tbody>
      <tr class="success">
        <td>2000-01-01</td>
        <td>1,000,000</td>
        <td>0</td>
        <td>1,000,000</td>
      </tr>
      <tr class="danger">
        <td>2000-01-01</td>
        <td>1,000,000</td>
        <td>0</td>
        <td>1,000,000</td>
      </tr>
      <tr class="info">
        <td>2000-01-01</td>
        <td>1,000,000</td>
        <td>0</td>
        <td>1,000,000</td>
      </tr>
    </tbody>
  </table>
</div>
<nav class="box" aria-label="Page navigation">
  <ul class="pagination ">
    <li>
      <a href="#" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
    <li><a href="#">1</a></li>
    <li><a href="#">2</a></li>
    <li><a href="#">3</a></li>
    <li><a href="#">4</a></li>
    <li><a href="#">5</a></li>
    <li>
      <a href="#" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
  </ul>
</nav>
	<br />
	<p></p>

</div>