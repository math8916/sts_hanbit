package com.hanbit.web.bank;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/account")
public class AccountController {
	private static final Logger logger = LoggerFactory.getLogger(AccountController.class);
	@RequestMapping("/main")
	public String goMain(){
		logger.info("Welcome accountController! go Main", "디버깅 모드");
		return "account/content.tiles";
	}
	@RequestMapping("/regist")
	public String moveRegist(){
		logger.info("Welcome AccountController! go regist", "디버깅 모드");
		return "account/regist.tiles";
	}
	@RequestMapping("/deposit")
	public String moveDeposit(){
		logger.info("Welcome AccountController! go deposit", "디버깅 모드");
		return "account/deposit.tiles";
	}
	@RequestMapping("/withdraw")
	public String movewithdraw(){
		logger.info("Welcome AccountController! go withdraw", "디버깅 모드");
		return "account/withdraw.tiles";
	}
	@RequestMapping("/update")
	public String moveupdate(){
		logger.info("Welcome AccountController! go update", "디버깅 모드");
		return "account/update.tiles";
	}
	@RequestMapping("/delete")
	public String movedelete(){
		logger.info("Welcome AccountController! go delete", "디버깅 모드");
		return "account/delete.tiles";
	}
	@RequestMapping("/list")
	public String movelist(){
		logger.info("Welcome AccountController! go list", "디버깅 모드");
		return "account/list.tiles";
	}
	@RequestMapping("/search")
	public String movesearch(){
		logger.info("Welcome AccountController! go search", "디버깅 모드");
		return "account/search.tiles";
	}
	@RequestMapping("/count")
	public String movecount(){
		logger.info("Welcome AccountController! go count", "디버깅 모드");
		return "account/count.tiles";
	}
}
