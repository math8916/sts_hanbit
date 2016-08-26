package com.hanbit.web.grade;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/grade")
public class GradeController {
	private static final Logger logger = LoggerFactory.getLogger(GradeController.class);
	@RequestMapping("/main")
	public String goMain() {
		logger.info("Welcome gradeController! go Main", "디버깅 모드");
		return "admin:grade/content.tiles";
	}
	@RequestMapping("/regist")
	public String moveRegist(){
		logger.info("Welcome gradeController! go regist", "디버깅 모드");
		return "grade/regist.tiles";
	}
	
	@RequestMapping("/update")
	public String moveupdate(){
		logger.info("Welcome gradeController! go update", "디버깅 모드");
		return "grade/update.tiles";
	}
	@RequestMapping("/delete")
	public String movedelete(){
		logger.info("Welcome gradeController! go delete", "디버깅 모드");
		return "grade/delete.tiles";
	}
	@RequestMapping("/list")
	public String movelist(){
		logger.info("Welcome gradeController! go list", "디버깅 모드");
		return "grade/list.tiles";
	}
	@RequestMapping("/search")
	public String movesearch(){
		logger.info("Welcome gradeController! go search", "디버깅 모드");
		return "grade/search.tiles";
	}
	@RequestMapping("/count")
	public String movecount(){
		logger.info("Welcome gradeController! go count", "디버깅 모드");
		return "grade/count.tiles";
	}
}
