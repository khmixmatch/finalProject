package com.kh.mixmatch.mypage.controller;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


import com.kh.mixmatch.member.domain.MemberCommand;
import com.kh.mixmatch.member.service.MemberService;
import com.kh.mixmatch.mypage.domain.FootballCommand;
import com.kh.mixmatch.mypage.domain.MypageCommand;
import com.kh.mixmatch.mypage.domain.MypageReplyCommand;
import com.kh.mixmatch.mypage.service.MypageService;
import com.kh.mixmatch.team.domain.FootCommand;
import com.kh.mixmatch.team.service.TotalTypeService;
import com.kh.mixmatch.util.PagingUtil;


@Controller
public class MypageController {
	private Logger log = Logger.getLogger(this.getClass());
	
	private int rowCount = 6;
	private int pageCount = 10;
	
	@Resource
	private MypageService mypageService;
	@Resource
	private MemberService memberService;
	
	
	
	
	//MyPage 메인(로그인 되어있는 유저ID넘겨줘)
	@RequestMapping(value="/mypage/main.do",method=RequestMethod.GET)
	public ModelAndView process(@RequestParam(value="pageNum", defaultValue="1")int currentPage, HttpSession session){	//濡쒓렇�씤 �릺�뼱�엳�뒗 �쑀��ID
		
		String user_id = (String) session.getAttribute("user_id");
		
		MemberCommand member = memberService.selectMember(user_id);		//유저정보
		FootballCommand football = mypageService.selectFootball(user_id);	//축구기록

		Map<String,Object> map = new HashMap<String, Object>();
		map.put("user_id", user_id);
		
		//총 글의 갯수
		int count = mypageService.getRowCount(map);
		
		PagingUtil page = new PagingUtil(currentPage, count, rowCount, pageCount, "main.do");
		
		map.put("start", page.getStartCount());
		map.put("end", page.getEndCount());
		map.put("user_id", user_id);	//濡쒓렇�씤�븳 �쑀���쓽 �븘�씠�뵒濡� g_home�뀒�씠釉붿뿉�꽌 議곌굔�쓣 二쇨린�쐞�빐 �궗�슜
		
		
	
		List<MypageCommand> list = null;
		if (count > 0) {
			list = mypageService.list(map);
		}
		
		MypageCommand mypageCommand = new MypageCommand();
		mypageCommand.setId(user_id);
		
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mypageList");
		mav.addObject("member",member);
		mav.addObject("football",football);
		mav.addObject("count",count);
		mav.addObject("list",list);
		mav.addObject("pagingHtml",page.getPagingHtml());

		
		mav.addObject("mypageCommand",mypageCommand);
		
		return mav;
	} 
	
	
	
	
	
	
	
	
	
	
	
	//게시글 등록
	@RequestMapping(value="/mypage/main.do",method=RequestMethod.POST)
	public String submit(@ModelAttribute("mypageCommand")MypageCommand mypageCommand){
		
		if (log.isDebugEnabled()) {
			log.debug("<<mypageCommand1111>> : " + mypageCommand);
		}
		
		//글쓰기
		mypageService.insert(mypageCommand);

		return "redirect:/mypage/main.do?id="+mypageCommand.getId();
	}
	
	
	
	//프로필 이미지 출력
	@RequestMapping("mypage/imageView.do")
	public ModelAndView viewImage(@RequestParam("id")String id){
		
		MemberCommand member = memberService.selectMember(id);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("imageView");
		mav.addObject("imageFile", member.getProfile());
		mav.addObject("filename", member.getProfile_name());
		
		return mav;
	}
	
	//미니홈피 이미지 출력
	@RequestMapping("mypage/imageView2.do")
	public ModelAndView viewImage(@RequestParam("seq")int seq){
		
		MypageCommand mypage = mypageService.selectMypage(seq);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("imageView");
		mav.addObject("imageFile", mypage.getH_file());
		mav.addObject("filename", mypage.getH_file_name());
		
		if (log.isDebugEnabled()) {
			log.debug("<<seq>> : " + seq);
		}
		
		return mav;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//미니홈피 댓글 리스트
	@RequestMapping("/mypage/postReplyList.do")
	@ResponseBody
	public Map<String,Object> process(@RequestParam(value="pageNum", defaultValue="1")int currentPage,@RequestParam(value="h_seq")String h_seq){	//濡쒓렇�씤 �릺�뼱�엳�뒗 �쑀��ID
		int rowCount = 5;
		
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("h_seq", h_seq);
		
		if (log.isDebugEnabled()) {
			log.debug("<<1111map>> : " + map);
		}
		
		
		//총 댓글 갯수
		int count = mypageService.getRowCountReply(map);
		
		PagingUtil page = new PagingUtil(currentPage, count, rowCount, pageCount, null);
		
		map.put("start", page.getStartCount());
		map.put("end", page.getEndCount());

		if (log.isDebugEnabled()) {
			log.debug("<<currentPage>> : " + currentPage);
			log.debug("<<count>> : " + count);
			log.debug("<<h_seq>> : " + h_seq);
			log.debug("<<map>> : " + map);
		}
		
		
		List<MypageReplyCommand> list = null;
		if (count > 0) {
			list = mypageService.listReply(map);
		}else{
			list = Collections.emptyList();
		}
	
		if (log.isDebugEnabled()) {
			log.debug("<<list>> : " + list);
		}
		
		
		Map<String,Object> mapJson = new HashMap<String, Object>();
		mapJson.put("count", count);
		mapJson.put("rowCount", rowCount);
		mapJson.put("list", list);

		return mapJson;
	}
	
	
	//미니홈피 댓글 작성
	@RequestMapping("/mypage/postWriteReply.do")
	@ResponseBody
	public Map<String,String> process(MypageReplyCommand mypageReplyCommand, HttpSession session){
		
		Map<String,String> map = new HashMap<String, String>();
		
		if (log.isDebugEnabled()) {
			log.debug("<<--------mypageReplyCommand------->> : " + mypageReplyCommand);
		}
		
		
		String user_id = (String) session.getAttribute("user_id");
		if (user_id == null) {
			//로그인 되어있지 않은 상태
			map.put("result", "logout");
		}else{
			//로그인 되어있는 상태. 댓글 등록 가능
			mypageService.insertReply(mypageReplyCommand);
			map.put("result", "success");
		}
		
		if (log.isDebugEnabled()) {
			log.debug("<<map>> : " + mypageReplyCommand);
		}
		
		return map;
	}
	
}