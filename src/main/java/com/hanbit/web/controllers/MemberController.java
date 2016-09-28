package com.hanbit.web.controllers;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.hanbit.web.constants.Values;
import com.hanbit.web.domains.Command;
import com.hanbit.web.domains.MemberDTO;
import com.hanbit.web.domains.Retval;
import com.hanbit.web.serviceImpl.MemberServiceImpl;
import com.hanbit.web.util.Pagination;

@Controller
@SessionAttributes({"user","context","js","css","img"})
@RequestMapping("/member")
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	public static int PG_SIZE=5;
	@Autowired MemberServiceImpl service;
	@Autowired Command command;
	@Autowired MemberDTO member;
	@Autowired Retval retval;
	@RequestMapping("/search/(option)/{keyword}")
	public MemberDTO find(@RequestParam("option")String keyword,
			@PathVariable("keyword")String option,
			Model model){
	
		MemberDTO member= service.findById(keyword);
		logger.info("MemberController   findByID");
		System.out.println("name" + member.getName());
		System.out.println("이미지:"+member.getProfileImg());
		command.setKeyword(keyword);
		command.setOption(option);
		
		return service.findOne(command);
		
	}
	@RequestMapping(value="/count/{all}",method=RequestMethod.GET,
			consumes = "application/json")
	public Model count(@PathVariable("option")String option,Model model){
		logger.info("MemberController   findByID");
	
		logger.info("MemberController   findByID");
		model.addAttribute("count",service.count());
		return model;
		
	}
	@RequestMapping(value="/login" ,method=RequestMethod.POST)
	public @ResponseBody MemberDTO login(@RequestParam("id") String id,
	         @RequestParam("pw") String pw, HttpSession session){ 
	      logger.info("TO LOGIN ID :: {}",id);
	      logger.info("TO LOGIN PW :: {}",pw);
	      member.setId(id);
	      member.setPw(pw);
	      MemberDTO user = service.login(member);
	      if(user.getId().equals("NONE")){
				logger.info("Controller LOGIN ","FAIL");
				return user;
			}else{
				logger.info("Controller LOGIN ","SUCCESS");
				session.setAttribute("user",user);
				/*model.addAttribute("user",member);
				model.addAttribute("context",context);
				model.addAttribute("js", context+"/resources/js");
				model.addAttribute("css", context+"/resources/css");
				model.addAttribute("img", context+"/resources/img");*/
				return user;
			}
		}
	/////  move /////////
	@RequestMapping ("/main")
	public String goMain() {
		logger.info("go to {}", "main");
		return "admin:member/content.tiles";
	}
	@RequestMapping(value="/signup",method=RequestMethod.POST)
	public @ResponseBody Retval signup(@RequestBody MemberDTO param) {
		logger.info("SIGN UP {}","EXEUTE");
		logger.info("SIGN UP ID = {}",param.getId());
		logger.info("SIGN UP PW = {}",param.getPw());
		logger.info("SIGN UP NAME = {}",param.getName());
		logger.info("SIGN UP SSN = {}",param.getSsn());
		logger.info("SIGN UP EMAIL = {}",param.getEmail());
		logger.info("SIGN UP PHONE = {}",param.getPhone());
		retval.setMessage("success");
		service.regist(param);
		logger.info("SIGN UP REVAL = {}",retval.getMessage());
		return retval;
	}
	@RequestMapping(value="/update",method=RequestMethod.POST,
			consumes="application/JSON")
	public @ResponseBody Retval moveUpdate(@RequestBody MemberDTO param , HttpSession session) {
		logger.info("Go to! {}", "update");
		logger.info("update ID = {}",param.getId());
		logger.info("update PW = {}",param.getPw());
		logger.info("update EMAIL = {}",param.getEmail());
		logger.info("update Major = {}",param.getMajor());
		logger.info("update Subject = {}",param.getSubject());
		MemberDTO temp = (MemberDTO) session.getAttribute("user");
		temp.setPw(param.getPw());
		temp.setEmail(param.getEmail());
	
		retval.setMessage(service.update(temp));
		
		return retval;
	}
	   @RequestMapping(value="/unregist", method=RequestMethod.POST)
	   public @ResponseBody Retval moveUnregist(@RequestParam("pw") String pw, HttpSession session){
	      logger.info("GO:: {}","unregist");
	      member.setPw(pw);
	      if (pw.equals(session.getAttribute("pw"))) {
	         retval.setMessage("success");
	         service.delete(member);
	         session.invalidate();
	      }else{
	         retval.setMessage("fail");
	      }
	      return retval;
	   }
	@RequestMapping("/check_dup/{id}")
	public @ResponseBody Retval CheckDup(@PathVariable String id) {
		logger.info("Go to 중복체크! {}", "EXECUTE");
		int result =service.existId(id);
		if (service.existId(id)==1) {
			retval.setFlag("TRUE");
			retval.setMessage("입력하신 ID는 이미 존재합니다");
			logger.info("Go to 중복체크 값! {}", retval.getFlag());
			logger.info("Go to 중복체크 값! {}", retval.getMessage());

		} else {
			retval.setFlag("NO");
			retval.setMessage("사용 가능한 아이디 입니다.");
			retval.setTemp(id);
			logger.info("Go to 중복체크 값! {}", retval.getFlag());
			logger.info("Go to 중복체크 값! {}", retval.getMessage());
		}
		logger.info("RETVAL IS {}",retval.getFlag());
		logger.info("RETVAL IS {}",retval.getMessage());
		return retval;
	}
	@RequestMapping("/list/{pgNum}")
	public @ResponseBody HashMap<String,Object> list(@PathVariable String pgNum,ModelMap model){
		logger.info("LIST pgNum is {}",pgNum);
		
		int[]pages = new int[3];
		int[]rows = new int[2];
		HashMap<String,Object> map = new HashMap<String,Object>();
		Retval r = service.count();
		int totCount = r.getCount();
		pages = Pagination.getPages(totCount, Integer.parseInt(pgNum));
		rows = Pagination.getRows(totCount, Integer.parseInt(pgNum), Values.PG_SIZE); 
		command.setStart(rows[0]);
		command.setEnd(rows[1]);
		logger.info("LIST totCount {}",totCount);
		logger.info("LIST pgSize {}",Values.PG_SIZE);
		logger.info("LIST totCount {}",totCount);
		logger.info("LIST totPg {}",pages[2]);
		logger.info("LIST pgNum {}",pgNum);
		logger.info("LIST startPg {}",pages[0]);
		logger.info("LIST lastPg {}",pages[1]);
	/*	model.addAttribute("list", service.list(command));
		model.addAttribute("pgSize", Values.PG_SIZE);
		model.addAttribute("totCount", totCount);
		model.addAttribute("totPg", pages[2]);
		model.addAttribute("pgNum", Integer.parseInt(pgNum));
		model.addAttribute("startPg", pages[0]);
		model.addAttribute("lastPg", pages[1]);*/
		map.put("list", service.list(command));
		map.put("pgSize", Values.PG_SIZE);
		map.put("totCount", totCount);
		map.put("totPg", pages[2]);
		map.put("pgNum", Integer.parseInt(pgNum));
		map.put("startPg", pages[0]);
		map.put("lastPg", pages[1]);
		map.put("groupSize", Values.GROUP_SIZE);
		
		return map;
	}
	@RequestMapping("/search")
	public String search(
		@RequestParam(value="keyField") String keyField,
		@RequestParam(value="keyword") String keyword,
		@RequestParam(value="pgNum") String startPgNum,
			Model model){
		List<MemberDTO> list = new ArrayList<MemberDTO>();
	/*	service.list();*/
		model.addAttribute("list",list);
		return "admin:member/list.tiles";
	}
	@RequestMapping("/find_by_id")
	public String moveFind_by_id() {
		logger.info("Go to! {}", "find_by_id");
		return "user:member/find_by_id.tiles";
	}
	
	

	
	@RequestMapping("/logout")
	public String Logout(SessionStatus status) {
		logger.info("Go to!{}", "logout");
		status.setComplete();
		logger.info("session !{}", "clear");
		return "redirect:/";
	}
	
	@RequestMapping("/find_by")
	public String moveFind_by() {
		logger.info("Go to!{}", "find_by");
		return "admin:member/find_by.tiles";
	}
	@RequestMapping("/kaup")
	public String moveKaup() {
		logger.info("Go to!{}", "kaup");
		return "user:user/kaup.tiles";
	}
	@RequestMapping("/rock")
	public String moveRock() {
		logger.info("Go to!{}", "rock");
		return "user:user/rock.tiles";
	}
	@RequestMapping("/lotto")
	public String moveLotto() {
		logger.info("Go to!{}", "lotto");
		return "user:user/rock.tiles";
	}
	@RequestMapping("/content")
	public String moveContent() {
		logger.info("Go to!{}", "content");
		return "user:user/content.tiles";
	}
	@RequestMapping("/detail")
	   public @ResponseBody MemberDTO moveDetail(HttpSession session) {
	      logger.info("GO TO {}","detail");
	      return (MemberDTO) session.getAttribute("user");
	 }
	@RequestMapping("/delete")
	public @ResponseBody MemberDTO moveDelete(HttpSession session) {
		logger.info("Go to! go delete", "delete");
		return (MemberDTO) session.getAttribute("user");
	}
	@RequestMapping("/admin_detail")
	public String moveA_detail(@RequestParam("key")String key) {
		
		logger.info("Go to!{}", "admin_detail");
		logger.info("key is {}", key);
		return "admin:member/a_detail.tiles";
	}
	 @RequestMapping("logined/header")
	   public String loginedHearder(){
	      logger.info("THIS PATH IS {}", "LOGINED_HEADER");
	      return "user/header.jsp";
	   }
}
