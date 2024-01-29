package kr.bit.service;

import java.util.List;

import kr.bit.entity.BoardDTO;

public interface BoardService {

	List<BoardDTO> boardList();

	BoardDTO boardCountAndContent(int idx);
//	void boardCount(int idx);

	void boardInsert(BoardDTO board);

	void boardUpdate(BoardDTO board);

	void boardDelete(int brdIdx);

//	BoardDTO boardContent(int brdIdx);

}
