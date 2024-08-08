package com.com.com.approval;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class DaoImp implements ApprovalDao{
	
	@Inject
	private SqlSessionTemplate sqlSession;
	
	@Override
	public MemberDto login(LoginVo vo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("board.login", vo);
	}
	
	@Override
		public MemberDto loginCheck(String memId) {
			// TODO Auto-generated method stub
			return sqlSession.selectOne("board.loginCheck", memId);
		}
	@Override
	public int signedInsert(BoardDto dto) {
		// TODO Auto-generated method stub
		return sqlSession.insert("board.signedInsert", dto);
	}

	@Override
	public int insertNum() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("board.insertNum");
	}

	@Override
	public List<BoardDto> list(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("board.boardSelect", map);
	}

	@Override
	public BoardDto view(int bNum) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("board.viewSelect", bNum);
	}

	@Override
	public List<HistoryDto> history(int bNum) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("board.selectHistory", bNum);
	}

	@Override
	public int insertHistory(HistoryDto dto) {
		// TODO Auto-generated method stub
		return sqlSession.insert("board.insertHistory", dto);
	}

	@Override
	public int updateT(BoardDto dto, int bNum) {
		// TODO Auto-generated method stub
		return sqlSession.update("board.updateT", dto);
	}

	@Override
	public int conditionUp(BoardDto dto, int bNum) {
		// TODO Auto-generated method stub
		return sqlSession.update("board.conditionUpdate", dto);
	}

	

}
