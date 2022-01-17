package bookmall.ask;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AskServiceImpl implements AskService {

	@Autowired
	AskDao askDao;
	
	
	@Override
	   public List<AskVo> selectList(AskVo vo) {
//		  Map map = new HashMap();
//		  map.put("searchWord", searchWord);
//		  map.put("searchType", searchType);
	      return askDao.selectList(vo);
	   }
	
	@Override
	public AskVo view(int askno) {
		return askDao.selectOne(askno);
	}
	
	@Override
	public AskVo edit(int askno) {
		return askDao.selectOne(askno);
	}
	@Override
	public int delete(AskVo vo) {
		return askDao.delete(vo);
	}

	@Override
	public int insert(AskVo vo) {
		return askDao.insert(vo);
	}
	
}
