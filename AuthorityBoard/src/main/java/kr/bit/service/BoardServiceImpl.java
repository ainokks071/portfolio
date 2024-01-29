package kr.bit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.bit.entity.BoardDTO;
import kr.bit.mapper.BoardMapper;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	BoardMapper boardMapper;

	@Override
	public List<BoardDTO> boardList() {
		List<BoardDTO> boardList = boardMapper.boardList();
		return boardList;
	}

	@Override
	public BoardDTO boardCountAndContent(int brdIdx) {
//		1. 조회수 1 증가시킨 후,
		boardMapper.boardCount(brdIdx);
//		2. 조회수 1 증가된 게시물 조회
		BoardDTO board = boardMapper.boardContent(brdIdx);
		return board;
	}

	@Override
	public void boardInsert(BoardDTO board) {
		boardMapper.boardInsert(board);
	}
	
	@Override
	public void boardUpdate(BoardDTO board) {
		boardMapper.boardUpdate(board);
	}

	@Override
	public void boardDelete(int brdIdx) {
		boardMapper.boardDelete(brdIdx);
	}
	
}
