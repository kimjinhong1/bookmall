package bookmall.board.notice;

import java.util.List;


public interface NoticeService {
	
	List<NoticeVo> selectAll(NoticeVo vo);
	int count(NoticeVo vo);
	int insert(NoticeVo vo);
	NoticeVo view(int noticeno);
	int delete(NoticeVo vo);
	NoticeVo edit(int noticeno);
	int update(NoticeVo vo);
}