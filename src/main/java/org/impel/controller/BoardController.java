package org.impel.controller;

import java.util.List;

import javax.inject.Inject;

import org.apache.log4j.Logger;
import org.impel.domain.BoardVO;
import org.impel.domain.Criteria;
import org.impel.domain.PageMaker;
import org.impel.service.BoardService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/board/*")
public class BoardController {

	public static Logger logger = Logger.getLogger(BoardController.class);
	
	
	@Inject
	BoardService service;
	
	@GetMapping("/listAll")
	public void getListAll(@ModelAttribute("cri") Criteria cri, Model model) throws Exception{
		logger.info("컨트롤러 1차 접속완료!!");	
		
		List<BoardVO> list = service.listAll(cri);
		int listSize = service.listAll(cri).size();
		model.addAttribute("listSize", listSize);
		model.addAttribute("list", list);
		model.addAttribute("pageMaker", new PageMaker(cri, service.getCountList(cri)));
	
	
	}//end getlistAll
	
	@GetMapping("/regist")
	public void getRegist(BoardVO vo, Model model) throws Exception{

		logger.info("등록됨!!!");
		
	} //end getRegist
	
	@PostMapping("/regist")
	public String PostRegist(BoardVO vo, RedirectAttributes rttr) throws Exception{
		
		service.regist(vo);
		
//		model.addAttribute("msg", "등록완료!");
		
		rttr.addFlashAttribute("msg", "SUCCESS");
		
		
		return "redirect:/board/listAll";
		
	} //end PostRegist
	
	@GetMapping("/read")
	public void getRead(@RequestParam("bno") int bno, Model model, Criteria cri) throws Exception{
		
		model.addAttribute(service.read(bno));
		logger.info("읽는 화면 출력");
		model.addAttribute("cri", cri);
		
		
	} //end getRead
	
	@PostMapping("/delete")
	public String delete(@RequestParam("bno") int bno, RedirectAttributes rttr) throws Exception{
		logger.info("삭제 전!!");
		service.remove(bno);
		logger.info("삭제 후!!");
		rttr.addFlashAttribute("msg", "SUCCESS");
		return "redirect:/board/listAll";
	}
	@GetMapping("/update")
	public void getUpdate(int bno, Model model) throws Exception{
		
		model.addAttribute(service.read(bno));
	}
	
	@PostMapping("/update")
	public String postUpdate(BoardVO vo, Criteria cri, RedirectAttributes rttr)throws Exception{
		
		service.modify(vo);
		
		rttr.addFlashAttribute("msg", "SUCCESS");
		
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		return "redirect:/board/listAll";
	}
	
}
