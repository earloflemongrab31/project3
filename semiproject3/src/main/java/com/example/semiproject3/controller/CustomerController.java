package com.example.semiproject3.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.semiproject3.constant.SessionConstant;
import com.example.semiproject3.entity.CustomerDto;
import com.example.semiproject3.repository.AddressDao;
import com.example.semiproject3.repository.CartDao;
import com.example.semiproject3.repository.CenterDao;
import com.example.semiproject3.repository.CustomerDao;
import com.example.semiproject3.repository.OrdersDao;
import com.example.semiproject3.vo.CustomerListSearchVO;

@Controller
@RequestMapping("/customer")
public class CustomerController {

	@Autowired
	private CustomerDao customerDao;

	@Autowired
	private CenterDao centerDao;
	
	@Autowired
	private CartDao cartDao;
	
	@Autowired
	private AddressDao addressDao;
	
	@GetMapping("/insert")
	public String insert() {
		return "customer/insert";
	}

	@PostMapping("/insert")
	public String insert(@ModelAttribute CustomerDto customerDto) {
		customerDao.insert(customerDto);
		return "redirect:insert_success";
	}
	
	@GetMapping("/insert_success")
	public String insertSuccess() {
		return "customer/insertSuccess";
	}
	
	@GetMapping("/login")
	public String login() {
		return "customer/login";
	}
	
	@PostMapping("/login")
	public String login(HttpSession session,
			@RequestParam String customerId,
			@RequestParam String customerPw) {
		CustomerDto findDto = customerDao.selectOne(customerId);
		
		if(findDto == null) {
			return "redirect:login?error";
		}
		
		boolean isLogin = customerPw.equals(findDto.getCustomerPw());
		if(isLogin) {
			session.setAttribute(SessionConstant.ID, customerId);
			session.setAttribute(SessionConstant.GRADE, findDto.getCustomerGrade());
			
			//로그인 시간을 갱신시키는 작업
			customerDao.updateLoginTime(findDto.getCustomerId());
			
			return "redirect:/";
		}
		else {
			return "redirect:login?error";
		}
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute(SessionConstant.ID);
		session.removeAttribute(SessionConstant.GRADE);
		session.removeAttribute("blockAd");
		session.removeAttribute("blockSurvey");
		session.removeAttribute("countCart");
		return "redirect:login";
	}
	
	@GetMapping("/mypage")
	public String mypage(Model model, HttpSession session) {
		String loginId = (String)session.getAttribute(SessionConstant.ID);
		model.addAttribute("customerDto", customerDao.selectOne(loginId));
		
		
		CustomerDto customerDto = customerDao.selectOne(loginId);
		
		model.addAttribute("customerDto", customerDto);
		
		model.addAttribute("selectAddressList", addressDao.selectAddressList(loginId, 1, 10));
	
		//장바구니 개수
		model.addAttribute("cartCount",cartDao.cartCount(loginId));
		
		return "customer/detail";
	}
	
	@GetMapping("/list")
	public String list(Model model, 
			@ModelAttribute(name="vo") CustomerListSearchVO vo) {

		//페이지 네비게이터를 위한 게시글 수를 전달
		int count = customerDao.count(vo);
		vo.setCount(count);
		
		model.addAttribute("param",vo);
		model.addAttribute("list", customerDao.selectList(vo));
		
		return "customer/list";
	}
	
	@GetMapping("/edit")
	public String edit(Model model,@RequestParam String customerId, HttpSession session) {
		CustomerDto customerDto = customerDao.selectOne(customerId);
		model.addAttribute("customerDto", customerDto);
		
		//장바구니 개수
		String loginId = (String) session.getAttribute(SessionConstant.ID);
		model.addAttribute("cartCount",cartDao.cartCount(loginId));
		
		return "customer/edit";
	}

	@PostMapping("/edit")
	public String edit(@ModelAttribute CustomerDto customerDto, RedirectAttributes attr)  {
		boolean result = customerDao.update(customerDto);
		if(result) {
			attr.addAttribute("customerId", customerDto.getCustomerId());
			return "redirect:list";
		}
		else {
			return "redirect:edit?error";
		}
	}
	
	
	@GetMapping("/delete")
	public String delete(@RequestParam String customerId) {
		boolean result = customerDao.delete(customerId);
		if(result) {
			return "redirect:list";
		}
		else {
			return "customer/editFail";
		}
	}
	
	
	@GetMapping("/checkPassword")
	public String checkPassword(Model model, HttpSession session) {
		//장바구니 개수
		String loginId = (String) session.getAttribute(SessionConstant.ID);
		model.addAttribute("cartCount",cartDao.cartCount(loginId));
		return"customer/checkPassword";
	}
	
	@PostMapping("/checkPassword")
	public String checkPassword(
			@RequestParam String customerId,
			@RequestParam String customerPwsearch,
			HttpSession session) {
		boolean checkPassword=customerDao.checkPassword(customerId, customerPwsearch);
		if(checkPassword) {
			session.setAttribute("customerId", customerId);
			
			return "redirect:changePassword";
		}else {
			return "redirect:checkPassword?error";
		}
	}
	@GetMapping("/changePassword")
	public String changePassword(Model model, HttpSession session) {
		//장바구니 개수
		String loginId = (String) session.getAttribute(SessionConstant.ID);
		model.addAttribute("cartCount",cartDao.cartCount(loginId));
		return "customer/changePassword";
	}
	@PostMapping("/changePassword")
	public String changePassword(
			@RequestParam String customerPw,
			
			HttpSession session) {
		String checkId = (String)session.getAttribute("customerId");
		try {
		CustomerDto dto = customerDao.selectOne(checkId);
		customerDao.changePassword(customerPw, dto.getCustomerId());
		session.removeAttribute(checkId);
		return "redirect:login";
		}
		catch(Exception e) {
			return "redirect:changePassword?error";
		}
	
	}
	
	
	// 마이페이지 비밀번호 변경
	@GetMapping("/changePw")
	public String changePw(Model model, HttpSession session) {
		//장바구니 개수
		String loginId = (String) session.getAttribute(SessionConstant.ID);
		model.addAttribute("cartCount",cartDao.cartCount(loginId));
		return "customer/changePw";
	}
	@PostMapping("/changePw")
	public String changePw(
			@RequestParam String customerPw,
			HttpSession session) {

		String loginId = (String)session.getAttribute(SessionConstant.ID);

		customerDao.changePassword(customerPw, loginId);
		
		return "redirect:mypage";
	}


	//개인정보 변경!
	@GetMapping("/information")
	public String information(HttpSession session, Model model) {
		String customerId = (String) session.getAttribute(SessionConstant.ID);
		CustomerDto customerDto = customerDao.selectOne(customerId);
		model.addAttribute("customerDto", customerDto);
		
		//장바구니 개수
		String loginId = (String) session.getAttribute(SessionConstant.ID);
		model.addAttribute("cartCount",cartDao.cartCount(loginId));
		return "customer/information";
	}
	
	@PostMapping("/information")
	public String information(
			HttpSession session, 
			@ModelAttribute CustomerDto inputDto) {
		
		String customerId = (String)session.getAttribute(SessionConstant.ID);
		inputDto.setCustomerId(customerId);
		
		
		//(1) 비밀번호를 검사
		CustomerDto findDto = customerDao.selectOne(customerId);
		boolean passwordMatch = 
				inputDto.getCustomerPw().equals(findDto.getCustomerPw());
		
		if(passwordMatch) {
			//(2) 비밀번호 검사를 통과했다면 정보를 변경하도록 처리
			customerDao.changeInformation(inputDto);
			return "redirect:mypage";
		}
		else {//비밀번호가 틀린 경우
			return "redirect:information?error";
		}
	}
	
	//회원 탈퇴 기능
	@GetMapping("/goodbye")
	public String goodbye(Model model, HttpSession session) {
		//장바구니 개수
		String loginId = (String) session.getAttribute(SessionConstant.ID);
		model.addAttribute("cartCount",cartDao.cartCount(loginId));
		return "customer/goodbye";
	}
	
	@PostMapping("/goodbye")
	public String goodbye(HttpSession session, 
						@RequestParam String customerPw) {
		String customerId = (String)session.getAttribute(SessionConstant.ID);
		CustomerDto customerDto = customerDao.selectOne(customerId);
		boolean passwordMatch = 
				customerPw.equals(customerDto.getCustomerPw());
		if(passwordMatch) {
			//회원 탈퇴
			customerDao.delete(customerId);
			
			//로그 아웃
			session.removeAttribute(SessionConstant.ID);
			session.removeAttribute(SessionConstant.GRADE);
			return "redirect:goodbye_result";
		}
		else {
			return "redirect:goodbye?error";
		}
	}
	
	@GetMapping("/goodbye_result")
	public String goodbyeResult() {
		return "customer/goodbyeResult";
	}

}