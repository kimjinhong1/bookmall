package bookmall.board.suda;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class SudaServiceImpl implements SudaService {

	@Autowired
	SudaDao sudaDao;
	
	@Override
	public int count(SudaVo vo) {
		return sudaDao.count(vo);
	}
	
	@Override
	   public List<SudaVo> selectAll (SudaVo vo) {
	      return sudaDao.selectList(vo);
	   } 
	
	@Override
	public int insert(SudaVo vo) { // 재정의 
		return sudaDao.insert(vo);
	}  
	
	@Override
	public SudaVo view(int sudano) {
		sudaDao.updateReadcount(sudano);
		return sudaDao.selectOne(sudano);
	}
	
	@Override
	public int delete(SudaVo vo) {
		return sudaDao.delete(vo);
	}
	
	@Override
	public SudaVo edit(int sudano) {
		return sudaDao.selectOne(sudano);
	}
	
	@Override
	public int update(SudaVo vo) {
		return sudaDao.update(vo);
	}
}
