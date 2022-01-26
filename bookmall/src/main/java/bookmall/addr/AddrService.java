package bookmall.addr;

import java.util.List;

import bookmall.board.suda.SudaVo;

public interface AddrService {
	
	/*주소내역*/
	List<AddrVo> listSelect(AddrVo vo);
	
	/*주소 삭제*/
	int delete(int addno);

	/*주소 추가*/
	int insert(AddrVo vo);
	
	/*주소 수정을 위한 자세히보기*/
	AddrVo view(int addno);
	
	/*주소 변경*/
	int update(AddrVo vo);
}
