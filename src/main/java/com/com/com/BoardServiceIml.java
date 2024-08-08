package com.com.com;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class BoardServiceIml implements BoardService{
	
	@Inject
	private BoardDao dao;
	

	
	@Override
	public List<BoardDto> list(Map<String, Object> searchMap) {
		// TODO Auto-generated method stub
		return dao.list(searchMap);
	}

	@Override
	public int write(BoardDto dto) {
		// TODO Auto-generated method stub
		return dao.write(dto);
	}

	@Override
	public BoardDto view(int seq) {
		// TODO Auto-generated method stub
		return dao.view(seq);
	}

	@Override
	public int update(int seq, BoardDto dto) {
		// TODO Auto-generated method stub
		return dao.update(seq, dto);
	}

	@Override
	public int delete(Integer[] seqs) {
		// TODO Auto-generated method stub
		return dao.delete(seqs);
	}

	@Override
	public int countArticle(Map<String, Object> searchMap) {
		// TODO Auto-generated method stub
		return dao.countArticle(searchMap);
	}

	@Override
	public int fileUpload(Map<String, Object> fileMap) {
		// TODO Auto-generated method stub
		return dao.fileUpload(fileMap);
	}

	@Override
	public int selectSeq() {
		// TODO Auto-generated method stub
		return dao.selectSeq();
	}

	@Override
	public List<FileDto> fileView(int seq) {
		// TODO Auto-generated method stub
		return dao.fileView(seq);
	}

	@Override
	public Map<String, Object> downloadFile(Map<String, Object> file) {
		// TODO Auto-generated method stub
		return dao.downloadFile(file);
	}

	@Override
	public List<FoodDto> foodList() {
		// TODO Auto-generated method stub
		return dao.foodList();
	}

	

	

	


	

}
