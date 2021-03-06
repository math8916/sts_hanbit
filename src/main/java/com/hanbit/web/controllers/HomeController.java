package com.hanbit.web.controllers;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hanbit.web.controllers.HomeController;

@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		Date date = new Date();
	      DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
	      String formattedDate = dateFormat.format(date);
	      logger.info("server Start serverTime {}", formattedDate);
	      return "public:public/content.tiles";
	   }
	@RequestMapping("/public/school_info")
	public String schoolInfo() {
		return "public:public/school_info.tiles";
	}
	@RequestMapping("/public/school_map")
	public String schoolMap() {
		return "public:public/school_map.tiles";
	}
	@RequestMapping("/public/free_board")
	public String freeBoard() {
		return "public:public/free_board.tiles";
	}
	
}
