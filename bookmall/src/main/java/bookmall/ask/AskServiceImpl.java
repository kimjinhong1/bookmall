package bookmall.ask;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AskServiceImpl implements AskService {

	@Autowired
	AskDao askDao;
	
	
	@Override
	   public List<AskVo> askList(AskVo vo) {
//		  Map map = new HashMap();
//		  map.put("searchWord", searchWord);
//		  map.put("searchType", searchType);
	      return askDao.askList(vo);
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

	@Override
	public int reply(AskVo vo) {
		askDao.updateOno(vo); // 같은 그룹이면 부모의 ono보다 큰놈들을 전부 +1
		vo.setOno(vo.getOno()+1); // 부모 ono에서 +1
		vo.setNested(vo.getNested()+1); // 부모 nested에서 +1
		return askDao.insertReply(vo); // 위에 다한다음에 답변 저장 
	}
	
}
