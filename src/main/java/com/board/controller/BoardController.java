package com.board.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.board.domain.RboardVO;
import com.board.domain.ReplyVO;
import com.board.domain.UserVO;
import com.board.service.BoardService;
import com.board.service.ReplyService;
import com.board.service.UserService;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	 @Inject
	 BoardService service;
	 
	 @Inject
	 ReplyService replyService;
	 
	 @Inject
	 UserService userService;
	
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
		
		List<ReplyVO> replyList = replyService.readReply(boardVO.getReview_id());
		model.addAttribute("replyList", replyList);
			
		return "board/readView";
		}
	
	// 게시판 글 작성 화면
		@RequestMapping(value = "/board/writeView", method = RequestMethod.GET)
		public void writeView() throws Exception{
			logger.info("writeView");
			
		}
		
		// 게시판 글 작성
		@RequestMapping(value = "/board/write", method = RequestMethod.POST)
		public String write(RboardVO boardVO, HttpSession session) throws Exception{
			logger.info("write");
			
			UserVO login = (UserVO)session.getAttribute("login");
			boardVO.setUser_id(login.getUserId());
			
			service.write(boardVO);
			
			return "redirect:/board/list";
		}
		
		// 게시판 수정뷰
		@RequestMapping(value = "/updateView", method = RequestMethod.GET)
		public String updateView(RboardVO boardVO, Model model) throws Exception{
			logger.info("updateView");
			
			model.addAttribute("update", service.read(boardVO.getReview_id()));
			
			return "board/updateView";
		}
		
		// 게시판 수정
		@RequestMapping(value = "/update", method = RequestMethod.POST)
		public String update(RboardVO boardVO) throws Exception{
			logger.info("update");
			
			service.update(boardVO);
			
			return "redirect:/board/list";
		}

		// 게시판 삭제
		@RequestMapping(value = "/delete", method = RequestMethod.POST)
		public String delete(RboardVO boardVO) throws Exception{
			logger.info("delete");
			
			service.delete(boardVO.getReview_id());
			
			return "redirect:/board/list";
		}
		
		//댓글 작성
		@RequestMapping(value="/replyWrite", method = RequestMethod.POST)
		public String replyWrite(ReplyVO vo, RedirectAttributes rttr) throws Exception {
			logger.info("reply Write");
			
			replyService.writeReply(vo);
			
			rttr.addAttribute("review_id", vo.getReview_id());
			
			
			return "redirect:/board/readView";
		}
		
		//댓글 수정 GET
		@RequestMapping(value="/replyUpdateView", method = RequestMethod.GET)
		public String replyUpdateView(ReplyVO vo, Model model) throws Exception {
			logger.info("reply Write");
			
			model.addAttribute("replyUpdate", replyService.selectReply(vo.getComment_id()));
		
			
			return "board/replyUpdateView";
		}
		
		//댓글 수정 POST
		@RequestMapping(value="/replyUpdate", method = RequestMethod.POST)
		public String replyUpdate(ReplyVO vo, RedirectAttributes rttr) throws Exception {
			logger.info("reply Write");
			
			replyService.updateReply(vo);
			
			rttr.addAttribute("Review_id", vo.getReview_id());
			
			
			return "redirect:/board/readView";
		}
		
		//댓글 삭제 GET
		@RequestMapping(value="/replyDeleteView", method = RequestMethod.GET)
		public String replyDeleteView(ReplyVO vo, Model model) throws Exception {
			logger.info("reply Write");
			
			model.addAttribute("replyDelete", replyService.selectReply(vo.getComment_id()));

			return "board/replyDeleteView";
		}
		
		//댓글 삭제
		@RequestMapping(value="/replyDelete", method = RequestMethod.POST)
		public String replyDelete(ReplyVO vo, RedirectAttributes rttr) throws Exception {
			logger.info("reply Write");
			
			replyService.deleteReply(vo);
			
			rttr.addAttribute("Review_id", vo.getReview_id());
			
			
			return "redirect:/board/readView";
		}
}