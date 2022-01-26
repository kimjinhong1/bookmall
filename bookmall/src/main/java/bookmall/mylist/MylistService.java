package bookmall.mylist;

import java.util.List;

import bookmall.board.suda.SudaVo;

public interface MylistService {
	
	/*마이리스트 내역*/
	List<MylistVo> listSelect(MylistVo vo);
	List<MylistVo> listMypage(MylistVo vo);
	
	/*문의내역 삭제*/
	int delete(int listno);

	/*마이리스트 추가*/
	int insert(MylistVo vo);
	
}
