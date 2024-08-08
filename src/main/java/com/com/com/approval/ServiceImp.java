package com.com.com.approval;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class ServiceImp implements ApprovalService{
	
	@Inject
	private DaoImp dao;
	
	@Override
	public MemberDto login(LoginVo vo) {
		// TODO Auto-generated method stub
		return dao.login(vo);
	}
	
	@Override
	public MemberDto loginCheck(String memId) {
		// TODO Auto-generated method stub
		return dao.loginCheck(memId);
	}

	@Override
	public int signedInsert(BoardDto dto) {
		// TODO Auto-generated method stub
		return dao.signedInsert(dto);
	}

	@Override
	public int insertNum() {
		// TODO Auto-generated method stub
		return dao.insertNum();
	}

	@Override
	public List<BoardDto> list(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.list(map);
	}

	@Override
	public BoardDto view(int bNum) {
		// TODO Auto-generated method stub
		return dao.view(bNum);
	}

	@Override
	public List<HistoryDto> history(int bNum) {
		// TODO Auto-generated method stub
		return dao.history(bNum);
	}

	@Override
	public int insertHistory(HistoryDto dto) {
		// TODO Auto-generated method stub
		return dao.insertHistory(dto);
	}

	@Override
	public int updateT(BoardDto dto, int bNum) {
		// TODO Auto-generated method stub
		return dao.updateT(dto,bNum);
	}

	@Override
	public int conditionUp(BoardDto dto, int bNum) {
		// TODO Auto-generated method stub
		return dao.conditionUp(dto, bNum);
	}

	

}
