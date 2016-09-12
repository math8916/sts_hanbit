package com.hanbit.web.controllers;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
@RequestMapping("/grade")
public class GradeController {
	private static final Logger logger = LoggerFactory.getLogger(GradeController.class);
	@RequestMapping("/main")
	public String goMain() {
		logger.info(" go Main", "디버깅 모드");
		return "admin:grade/content.tiles";
	}
	@RequestMapping("/g_regist")
	public String moveRegist(@RequestParam("key")String key){
		logger.info(" go to {}", "g_regist");
		logger.info(" key is {}", key);
		return "admin:grade/regist.tiles";
	}
	@RequestMapping("/g_detail")
	public String moveDetail(){
		logger.info(" go to {}", "g_detail");
		return "user:grade/detail.tiles";
	}
	@RequestMapping("/g_update")
	public String moveupdate(){
		logger.info("go to {}", "g_update");
		return "admin:grade/update.tiles";
	}
	@RequestMapping("/g_delete")
	public String movedelete(){
		logger.info(" go delete {}", "g_delete");
		return "admin:grade/delete.tiles";
	}
	@RequestMapping("/g_list")
	public String movelist(){
		logger.info(" go list {}", "g_list");
		return "admin:grade/list.tiles";
	}
	@RequestMapping("/g_search")
	public String movesearch(){
		logger.info(" go search {}", "g_search");
		return "user:grade/search.tiles";
	}
	@RequestMapping("/g_count")
	public String movecount(){
		logger.info(" go count {}", "g_count");
		return "user:grade/count.tiles";
	}
}
