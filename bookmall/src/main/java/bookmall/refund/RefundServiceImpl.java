package bookmall.refund;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bookmall.board.notice.NoticeVo;


@Service
public class RefundServiceImpl implements RefundService {

	@Autowired
	RefundDao refundDao;
	
	@Override
	   public List<RefundVo> refundList(RefundVo vo) {
	      return refundDao.refundList(vo);
	   }
	
	@Override
	public int insert(RefundVo vo) {
		int r = refundDao.insert(vo);
		return r;
	}
	@Override
	public int insertEx(RefundVo vo) {
		int r = refundDao.insertEx(vo);
		return r;
	}

	@Override
	public RefundVo view(int refundno) {
		return refundDao.view(refundno);
	}

	@Override
	public int count(RefundVo vo) {
		return refundDao.count(vo);
	}
	
}
