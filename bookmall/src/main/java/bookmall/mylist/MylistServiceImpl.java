package bookmall.mylist;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bookmall.cart.CartDto;


@Service
public class MylistServiceImpl implements MylistService {

	@Autowired
	MylistDao mylistDao;
	
	@Override
	   public List<MylistVo> listSelect(MylistVo vo) {
	      return mylistDao.myList(vo);
	   }
	@Override
   public List<MylistVo> listMypage(MylistVo vo) {
      return mylistDao.listMypage(vo);
   }
	
	@Override
	public int delete(int listno) {
		return mylistDao.delete(listno);
	}
	
	@Override
	public int insert(MylistVo vo) {
		
		//중복 체크 
		MylistVo checkList = mylistDao.checkList(vo);
		
		if(checkList != null) {
			return 2;
		}
		//장바구니 등록 & 에러시 0 반환
		return mylistDao.insert(vo);
	}
	
	@Override
	public MylistVo checkList(MylistVo vo) {
		return mylistDao.checkList(vo);
	}
	


}
