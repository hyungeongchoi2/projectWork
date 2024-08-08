package com.com.com;

import java.util.List;
import java.util.Map;

public interface BoardDao {
	
	List<BoardDto> list(Map<String, Object> searchMap);
	
	List<FoodDto> foodList();
	
	int write(BoardDto dto);
	
	BoardDto view(int seq);
	
	int update(int seq, BoardDto dto);
	
	int delete(Integer[] seqs);
	
	int countArticle(Map<String, Object> searchMap);
	
	int fileUpload(Map<String, Object> fileMap);
	
	int selectSeq();
	
	List<FileDto> fileView(int seq);
	
	Map<String, Object> downloadFile(Map<String, Object> file);
	
	

}
