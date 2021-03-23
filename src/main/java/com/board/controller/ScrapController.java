package com.board.controller;

import java.util.ArrayList;


import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.board.domain.ScrapVO;
import com.board.service.ScrapService;



@Controller
@RequestMapping("/scrap")
public class ScrapController {
	
	
	ScrapService scrapService;
	
		public ScrapController() {
		scrapService = new ScrapService();
	}
	
	@RequestMapping("/reg")
	public String registerScrap(Model model) {
		
		return "scrap/registerScrap";
	}
	
	@RequestMapping("/regCon")
	public String registerConfirmScrap(Model model, HttpServletRequest request) {
		
		int scrap_Id = Integer.parseInt(request.getParameter("scrap_Id"));
		String scrap_Title = request.getParameter("scrap_Title");
		String user_Id = request.getParameter("user_Id");
		
		
		//현재 페이지의 URL과 쿼리문자열까지 모두 구하기 
		String scrap_Address= request.getRequestURL().toString();
			if ( request.getQueryString() != null )
			scrap_Address = scrap_Address + "?" + request.getQueryString();
		
		
		scrapService.registerScrap(scrap_Id,scrap_Title, scrap_Address, user_Id);
		
		return "redirect:/scrap/readScraps";
	}
	
	@RequestMapping("/readScraps")
	public String readScraps(Model model, HttpServletRequest request) {
		
		ArrayList<ScrapVO> dbList = scrapService.readScraps();
		model.addAttribute("list", dbList);
		
		return "scrap/readScraps";
	}
	
	@RequestMapping("/mod")
	public String modifyScrap(Model model, HttpServletRequest request) {
		
		String scrap_Title= request.getParameter("scrap_Title");
		ScrapVO scrap = scrapService.readScrap(scrap_Title);
		model.addAttribute("b", scrap);
		
		return "scrap/modifyScrap";
	}
	
	@RequestMapping("/modCon")
	public String modifyConfirmScrap(Model model, HttpServletRequest request) {
		
		int scrap_Id = Integer.parseInt(request.getParameter("scrap_Id"));
		String scrap_Title = request.getParameter("scrap_Title");
		String user_Id= request.getParameter("user_Id");
		
		String scrap_Address= request.getParameter("scrap_Address");
			
		
		
		scrapService.modifyScrap(scrap_Id, scrap_Title , scrap_Address, user_Id);
		
		return "redirect:/scrap/readScraps";
	}
	
	@RequestMapping("/del")
	public String deleteScrap(Model model, HttpServletRequest request) {
		
		String scrap_Title = request.getParameter("scrap_Title");
		
		scrapService.deleteScrap(scrap_Title);
		
		return "redirect:/scrap/readScraps";
	}
	
	
	

	
		
	
	
	
	
}
