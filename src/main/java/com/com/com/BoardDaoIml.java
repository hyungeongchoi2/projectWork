package com.com.com;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDaoIml implements BoardDao{
	
	@Inject
	private SqlSessionTemplate sqlSession;

	@Override
	public List<BoardDto> list(Map<String, Object> searchMap) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("board.select", searchMap);
	}

	@Override
	public int write(BoardDto dto) {
		// TODO Auto-generated method stub
		return sqlSession.insert("board.insert", dto);
	}

	@Override
	public BoardDto view(int seq) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("board.view", seq);
	}

	@Override
	public int update(int seq, BoardDto dto) {
		// TODO Auto-generated method stub
		return sqlSession.update("board.update", dto);
	}

	@Override
	public int delete(Integer[] seqs) {
		// TODO Auto-generated method stub
		return sqlSession.delete("board.delete", seqs);
	}

	@Override
	public int countArticle(Map<String, Object> searchMap) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("board.count", searchMap);
	}

	@Override
	public int fileUpload(Map<String, Object> fileMap) {
		// TODO Auto-generated method stub
		return sqlSession.insert("board.fileUplode", fileMap);
	}
	
	//파일이 첨부된 게시글의 번호
	@Override
	public int selectSeq() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("board.selectSeq");
	}

	@Override
	public List<FileDto> fileView(int seq) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("board.fileSelect", seq);
	}

	@Override
	public Map<String, Object> downloadFile(Map<String, Object> file) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("board.download", file);
	}

	@Override
	public List<FoodDto> foodList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("board.foodSelect");
	}

	

	

	

	

	
	

}
