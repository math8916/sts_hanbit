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
		return "admin:account/content.tiles";
	}
	@RequestMapping("/b_regist")
	public String moveRegist(){
		logger.info("Welcome AccountController! go regist", "디버깅 모드");
		return "admin:account/regist.tiles";
	}
	@RequestMapping("/b_deposit")
	public String moveDeposit(){
		logger.info("Welcome AccountController! go deposit", "디버깅 모드");
		return "account/deposit.tiles";
	}
	@RequestMapping("/b_withdraw")
	public String movewithdraw(){
		logger.info("Welcome AccountController! go withdraw", "디버깅 모드");
		return "account/withdraw.tiles";
	}
	@RequestMapping("/b_update")
	public String moveupdate(){
		logger.info("Welcome AccountController! go update", "디버깅 모드");
		return "account/update.tiles";
	}
	@RequestMapping("/b_delete")
	public String movedelete(){
		logger.info("Welcome AccountController! go delete", "디버깅 모드");
		return "admin:account/delete.tiles";
	}
	@RequestMapping("/b_list")
	public String movelist(){
		logger.info("Welcome AccountController! go list", "디버깅 모드");
		return "admin:account/list.tiles";
	}
	@RequestMapping("/b_search")
	public String movesearch(){
		logger.info("Welcome AccountController! go search", "디버깅 모드");
		return "admin:account/search.tiles";
	}
	@RequestMapping("/b_count")
	public String movecount(){
		logger.info("Welcome AccountController! go count", "디버깅 모드");
		return "admin:account/count.tiles";
	}
}
