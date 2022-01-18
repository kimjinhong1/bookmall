package bookmall.board.suda;

import java.util.List;


public interface SudaService {
	
	public int count(SudaVo vo);
	List<SudaVo> selectAll(SudaVo vo);
	int insert(SudaVo vo);
	SudaVo view(int sudano);
	int delete(SudaVo vo);
	SudaVo edit(int sudano);
	int update(SudaVo vo);
	public int reply(SudaVo vo);
}