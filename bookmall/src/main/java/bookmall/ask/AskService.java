package bookmall.ask;

import java.util.List;

public interface AskService {
	
	/*문의내역 리스트*/
	List<AskVo> selectList(AskVo vo);
	
	/*문의보기*/
	AskVo view(int boardno);
	
	/*문의내역 수정*/
	AskVo edit(int boardno);
	
	/*문의내역 삭제*/
	int delete(AskVo vo);
	
	/*문의하기*/
	int insert(AskVo vo);
}
