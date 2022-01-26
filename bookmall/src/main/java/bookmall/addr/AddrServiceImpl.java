package bookmall.addr;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class AddrServiceImpl implements AddrService {

	@Autowired
	AddrDao addlistDao;
	
	@Override
	   public List<AddrVo> listSelect(AddrVo vo) {
	      return addlistDao.addList(vo);
	   }

	@Override
	public int delete(int addno) {
		return addlistDao.delete(addno);
	}
	
	@Override
	public int insert(AddrVo vo) {
		return addlistDao.insert(vo);
	}

	@Override
	public AddrVo view(int addno) {
		return addlistDao.view(addno);
	}

	@Override
	public int update(AddrVo vo) {
		return addlistDao.update(vo);
	}

}
