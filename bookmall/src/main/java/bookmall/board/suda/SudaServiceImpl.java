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
		int r = sudaDao.insert(vo);
		if (r > 0) sudaDao.updateGno(vo.getNo());
		return r;
	}  
	
	@Override
	public SudaVo view(int sudano) {
		sudaDao.updateReadcount(sudano);
		SudaVo vo = sudaDao.selectOne(sudano);
		return vo;
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
	@Override
	public int reply(SudaVo vo) {
		sudaDao.updateOno(vo); // 같은 그룹이면 부모의 ono보다 큰놈들을 전부 +1
		vo.setOno(vo.getOno()+1); // 부모 ono에서 +1
		vo.setNested(vo.getNested()+1); // 부모 nested에서 +1
		return sudaDao.insertReply(vo); // 위에 다한다음에 답변 저장 
	}

	@Override
	public int getRownumn(SudaVo vo) {
		return sudaDao.getRownum(vo);
	}

	@Override
	public SudaVo getPrev(SudaVo vo) {
		return sudaDao.getPrev(vo);
	}

	@Override
	public SudaVo getNext(SudaVo vo) {
		return sudaDao.getNext(vo);
	}
	
}
