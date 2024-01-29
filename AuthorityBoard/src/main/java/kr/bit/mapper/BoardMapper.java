package kr.bit.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.bit.entity.BoardDTO;

@Mapper 
public interface BoardMapper {
	
//	게시물 리스트 조회
    public List<BoardDTO> boardList();
    
//  **DB에 조회수 증가시킨 직후, 조회수 증가된 그 게시물을 조회
//	게시물 조회수 1 증가 
	public void boardCount(int brdIdx);
//	특정 게시물 조회
	public BoardDTO boardContent(int brdIdx);
    
//	게시물 등록
	public void boardInsert(BoardDTO board);

//	게시물 수정
	public void boardUpdate(BoardDTO board);

//	게시물 삭제
	public void boardDelete(int brdIdx);

}
