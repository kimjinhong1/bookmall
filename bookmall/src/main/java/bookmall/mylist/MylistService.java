package bookmall.mylist;

import java.util.List;

import bookmall.board.suda.SudaVo;
import bookmall.cart.CartDto;

public interface MylistService {
	
	/*마이리스트 내역*/
	List<MylistVo> listSelect(MylistVo vo);
	List<MylistVo> listMypage(MylistVo vo);
	
	/*마이리스트 삭제*/
	int delete(int listno);

	/*마이리스트 추가*/
	int insert(MylistVo vo);
	
	/*리스트 확인*/
	public MylistVo checkList(MylistVo vo);
	
}
