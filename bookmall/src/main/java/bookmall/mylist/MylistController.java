package bookmall.mylist;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.xml.stream.events.Comment;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import bookmall.board.suda.SudaVo;
import bookmall.cart.CartDto;
import bookmall.user.UserVo;
import bookmall.util.CommonUtil;

@Controller
public class MylistController {
	
	@Autowired
	MylistService mylistService;
	
	@GetMapping("/user/mylist.do") // 매핑된경로 
	public String index(Model model, MylistVo vo, HttpSession sess) {
		vo.setUserno(((UserVo)sess.getAttribute("userInfo")).getUserno());
		System.out.println("세션no:"+vo.getUserno());
		model.addAttribute("dibsList", mylistService.listSelect(vo));
		return "/user/mylist"; // 리턴되는 jsp경로   
	}
	
		@PostMapping("/mylist/insert.do")
		@ResponseBody //메소드에서 리턴되는 값은 View 를 통해서 출력되지 않고 HTTP Response Body 에 직접 쓰여지게 됨
		public String insertPOST(MylistVo vo, HttpServletRequest req) { //등록할 데이터를 전달받아야 하기 때문에 CartDto 타입의 파라미터 변수를 선언, 추가로 로그인 여부를 확인하기 위해 session 객체가 필요로 하기 때문에 HttpservletRequest 타입의 파라미터 변수선언
			//로그인체크
			HttpSession session = req.getSession();
			UserVo uvo = (UserVo)session.getAttribute("userInfo");
			if (uvo == null) {
				return "0";
			}
			
			//카트등록
			vo.setUserno(uvo.getUserno());
			int result = mylistService.insert(vo);
			return result + "";
		}

	@PostMapping("/mylist/deleteAjax.do")
	public String deleteAjax(Model model, HttpServletRequest req) {
		String[] listno = req.getParameterValues("listno"); // 배열로 전송된 listno
		
		int cnt = 0;
		for (int i=0; i<listno.length; i++) {
			cnt += mylistService.delete(Integer.parseInt(listno[i])); // 배열의 개수만큼 반복하면서 삭제
		}
		// 반복이 끝나면 cnt변수에는 삭제된 개수가 담김
		model.addAttribute("result", cnt);
		return "include/result";
	}
}
