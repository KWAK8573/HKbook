package com.board.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.board.dao.BoardDAO;
import com.board.domain.RboardVO;
import com.board.domain.ReplyVO;
import com.board.service.BoardService;
import com.board.service.ReplyService;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	 @Inject
	 BoardService service;
//	 @Inject
//	 ReplyService replyService;
	
	// 게시판 목록 조회
		@RequestMapping(value = "/list", method = RequestMethod.GET)
		public String list(Model model) throws Exception{
			logger.info("list");
			
			model.addAttribute("list",service.list());
			
			
			return "board/list";
	 }
	 
	// 게시판 조회
	@RequestMapping(value = "/readView", method = RequestMethod.GET)
	public String read(RboardVO boardVO, Model model) throws Exception{
		logger.info("read");
			
		model.addAttribute("read", service.read(boardVO.getReview_id()));
		
//		List<ReplyVO> replyList = replyService.readReply(boardVO.getReview_id());
//		model.addAttribute("replyList", replyList);
			
		return "board/readView";
		}
}