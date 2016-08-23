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
		return "grade/content.tiles";
	}
}
