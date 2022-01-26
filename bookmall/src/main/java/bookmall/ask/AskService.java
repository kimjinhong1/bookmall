package bookmall.ask;

import java.util.List;

import bookmall.board.suda.SudaVo;

public interface AskService {
	
	/*문의내역 리스트*/
	List<AskVo> askList(AskVo vo);
	
	/*문의보기*/
	AskVo view(int askno);
	
	/*문의내역 수정*/
	AskVo edit(int askno);
	
	/*문의내역 답글*/
	int update(AskVo vo);
	
	/*문의내역 삭제*/
	int delete(int askno);
	
	/*문의하기*/
	int insert(AskVo vo);
	
	/*답글*/
	int reply(AskVo vo);
	
	
}
