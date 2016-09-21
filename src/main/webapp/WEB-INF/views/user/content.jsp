<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

	<section id="user_content_service" class="box section-padded">
		<div>
			<div class="row text-center title">
				<h2>Services</h2>
				<h4 class="light muted">Achieve the best results with our wide variety of training options!</h4>
			</div>
			<div  class="row services">
				<div id="kaup" class="col-md-4">
					<div class="service">
						<div class="icon-holder">
							<img src="${img}/icons/kaup.png" alt="" class="icon">
						</div>
						<h4 class="heading">KAUP</h4>
						<p class="description">A elementum ligula lacus ac quam ultrices a scelerisque praesent vel suspendisse scelerisque a aenean hac montes.</p>
					</div>
				</div>
				<div id="rock" class="col-md-4">
					<div class="service">
						<div class="icon-holder">
							<img src="${img}/icons/rsp.png" alt="" class="icon">
						</div>
						<h4 class="heading">MIX ROCK</h4>
						<p class="description">A elementum ligula lacus ac quam ultrices a scelerisque praesent vel suspendisse scelerisque a aenean hac montes.</p>
					</div>
				</div>
				<div id="lotto" class="col-md-4">
					<div class="service">
						<div class="icon-holder">
							<img src="${img}/icons/lotto.png" alt="" class="icon">
						</div>
						<h4 class="heading">LOTTO DRAWING</h4>
						<p class="description">A elementum ligula lacus ac quam ultrices a scelerisque praesent vel suspendisse scelerisque a aenean hac montes.</p>
					</div>
				</div>
			</div>
		</div>
		<div class="cut cut-bottom"></div>
	</section>
	<section id="user_content_subject" class="section gray-bg">
		<div class="container">
			<div class="row title text-center">
				<h2 class="margin-top">MAJOR SUBJECT</h2>
				<h4 class="light muted">TOP3</h4>
			</div>
			<div class="row">
				<div class="col-md-4">
					<div id ="major_subject_1" class="team text-center" value="java">
						<div class="cover" style="background:url('${img}/team/team-cover1.jpg'); background-size:cover;">
							<div class="overlay text-center">
								<h3 class="white">수업료</h3>
								<h5 class="light light-white">1 - 5 sessions / month</h5>
							</div>
						</div>
						<img src="${img}/team/team3.jpg" alt="Team Image" class="avatar">
						<div class="title">
							<h4>JAVA</h4>
							<h5 class="muted regular">Server programming </h5>
						</div>
						<input type="hidden" name="major_subject_1" value="java">
						<input  type="button" data-toggle="modal" data-target="#modal1" class="btn btn-blue-fill" value="과목정보"/>
					</div>
				</div>
				<div class="col-md-4">
					<div id ="major_subject_2" class="team text-center">
						<div class="cover" style="background:url('${img}/team/team-cover2.jpg'); background-size:cover;">
							<div class="overlay text-center">
								<h3 class="white">$수업료.00</h3>
								<h5 class="light light-white">1 - 5 sessions / month</h5>
							</div>
						</div>
						<img src="${img}/team/team1.jpg" alt="Team Image" class="avatar">
						<div class="title">
							<h4>Javascript</h4>
							<h5 class="muted regular">Server programming</h5>
						</div>
						<input type="hidden" name="major_subject_2">
						<input  type="button" data-toggle="modal" data-target="#modal1" class="btn btn-blue-fill" value="과목정보"/>
					</div>
				</div>
				<div class="col-md-4">
					<div id ="major_subject_3" class="team text-center">
						<div class="cover" style="background:url('${img}/team/team-cover3.jpg'); background-size:cover;">
							<div class="overlay text-center">
								<h3 class="white">수업료</h3>
								<h5 class="light light-white">1 - 5 sessions / month</h5>
							</div>
						</div>
						<img src="${img}/team/team2.jpg" alt="Team Image" class="avatar">
						<div class="title">
							<h4>SQL</h4>
							<h5 class="muted regular">Data </h5>
						</div>
						<input type="hidden" name="major_subject_3">
						<input type="button" data-toggle="modal" data-target="#modal1" class="btn btn-blue-fill" value="과목정보"/>
					</div>
				</div>
			</div>
		</div>
	</section>
	


