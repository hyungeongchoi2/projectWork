package com.com.com.approval;

import java.util.List;
import java.util.Map;

public interface ApprovalService {
	
	MemberDto login(LoginVo vo);
	
	MemberDto loginCheck(String memId);
	
	int signedInsert(BoardDto dto);
	
	int insertNum();
	
	List<BoardDto> list(Map<String, Object> map);
	
	BoardDto view(int bNum);
	
	List<HistoryDto> history(int bNum);
	
	int insertHistory(HistoryDto dto);

	int updateT(BoardDto dto, int bNum);
	
	int conditionUp(BoardDto dto, int bNum);
}
