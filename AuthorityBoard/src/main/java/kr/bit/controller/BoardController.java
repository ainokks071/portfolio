package kr.bit.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import kr.bit.entity.BoardDTO;
import kr.bit.entity.MemberDTO;
import kr.bit.service.BoardService;

@RequestMapping("/board")
@Controller
public class BoardController{
	
	@Autowired
	private BoardService boardService;
	
//	게시물 리스트 조회
	@ResponseBody
	@GetMapping("/list")
	public List<BoardDTO> boardList() {
		List<BoardDTO> boardList = boardService.boardList();
		return boardList; //JSON 응답
	}
	
//	게시글 등록
	@ResponseBody
	@PostMapping("/new")
	public void boardInsert(@RequestBody BoardDTO board) {
		boardService.boardInsert(board);
	}
	
//  게시글 상세보기 + 조회수 증가	
	@ResponseBody
	@RequestMapping("/count/content/{brdIdx}")
	public BoardDTO boardCountAndContent(@PathVariable int brdIdx) {
		return boardService.boardCountAndContent(brdIdx); 
	}

//	게시글 수정
	@ResponseBody
	@PutMapping("/update")
	public void boardUpdate(@RequestBody BoardDTO board) {
		boardService.boardUpdate(board);
	}
	
//	게시글 삭제
	@ResponseBody
	@DeleteMapping("/{brdIdx}")
	public void boardDelete(@PathVariable("brdIdx") int brdIdx) {
		boardService.boardDelete(brdIdx);
	}
	
}