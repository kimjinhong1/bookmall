package bookmall.board.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	NoticeDao noticeDao;
	
	@Override
	public int count(NoticeVo vo) {
		return noticeDao.count(vo);
	}
	
	@Override
	   public List<NoticeVo> selectAll (NoticeVo vo) {
	      return noticeDao.selectList(vo);
	   } 
	
	@Override
	public int insert(NoticeVo vo) { // 재정의 
		return noticeDao.insert(vo);
	}

	@Override
	public NoticeVo view(int noticeno) {
		noticeDao.updateReadcount(noticeno);
		return noticeDao.selectOne(noticeno);
	}
	@Override
	public int delete(NoticeVo vo) {
		return noticeDao.delete(vo);
	}
	
	@Override
	public NoticeVo edit(int boardno) {
		return noticeDao.selectOne(boardno);
	}
	
	@Override
	public int update(NoticeVo vo) {
		return noticeDao.update(vo);
	}
}
