package bookmall.mylist;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class MylistServiceImpl implements MylistService {

	@Autowired
	MylistDao mylistDao;
	
	@Override
	   public List<MylistVo> listSelect(MylistVo vo) {
//		  Map map = new HashMap();
//		  map.put("searchWord", searchWord);
//		  map.put("searchType", searchType);
	      return mylistDao.myList(vo);
	   }
	@Override
   public List<MylistVo> listMypage(MylistVo vo) {
//		  Map map = new HashMap();
//		  map.put("searchWord", searchWord);
//		  map.put("searchType", searchType);
      return mylistDao.listMypage(vo);
   }
	
	@Override
	public int delete(int listno) {
		return mylistDao.delete(listno);
	}
	

	@Override
	public int insert(MylistVo vo) {
		return mylistDao.insert(vo);
	}

}
