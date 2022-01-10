package bookmall.board.faq;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

 
@Service
public class FaqServicelmpl implements FaqService{

	@Autowired
	FaqDao faqDao;
	
	@Override
	public int count(FaqVo vo) {
		return faqDao.count(vo);
	}
	
	@Override
	   public List<FaqVo> selectAll (FaqVo vo) {
	      return faqDao.selectList(vo);
	   } 
	
	@Override
	public int insert(FaqVo vo) { // 재정의 
		return faqDao.insert(vo);
	}
	
	@Override
	public FaqVo view(int faqno) {
		return faqDao.selectOne(faqno);
	}
	
	@Override
	public FaqVo edit(int faqno) {
		return faqDao.selectOne(faqno);
	}
	
	@Override
	public int update(FaqVo vo) {
		return faqDao.update(vo);  
	}
	
	@Override
	public int delete(FaqVo vo) {
		return faqDao.delete(vo);
	}
}
