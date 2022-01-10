package bookmall.board.faq.category;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class FaqCategoryServiceImpl implements FaqCategoryService {

	@Autowired
	FaqCategoryDao faqcategoryDao;
	
	
	@Override
	   public List<FaqCategoryVo> selectAll (FaqCategoryVo vo) {
	      return faqcategoryDao.selectList(vo);
	   } 
	
	@Override
	public int insert(FaqCategoryVo vo) { // 재정의 
		return faqcategoryDao.insert(vo);
	}
	
	@Override
	public int update(FaqCategoryVo vo) {
		return faqcategoryDao.update(vo);  
	}
	
	@Override
	public int delete(FaqCategoryVo vo) {
		return faqcategoryDao.delete(vo);
	}
	

}
