package com.example.semiproject3.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.semiproject3.constant.SessionConstant;
import com.example.semiproject3.entity.CartDto;
import com.example.semiproject3.entity.CustomerLikeDto;
import com.example.semiproject3.entity.ImageDto;
import com.example.semiproject3.entity.ItemDto;
import com.example.semiproject3.error.TargetNotFoundException;
import com.example.semiproject3.repository.AddressDao;
import com.example.semiproject3.repository.CartDao;
import com.example.semiproject3.repository.CustomerDao;
import com.example.semiproject3.repository.CustomerLikeDao;
import com.example.semiproject3.repository.ImageDao;
import com.example.semiproject3.repository.InvenDao;
import com.example.semiproject3.repository.ItemDao;
import com.example.semiproject3.repository.OrdersDao;
import com.example.semiproject3.repository.ReviewDao;
import com.example.semiproject3.repository.ReviewLikeDao;
import com.example.semiproject3.vo.ItemListSearchVO;

@Controller
@RequestMapping("/item")
public class ItemController {
	
	@Autowired
	private OrdersDao ordersDao;
	
	@Autowired
	private ItemDao itemDao;
	
	@Autowired
	private ImageDao imageDao;
	
	@Autowired
	private InvenDao invenDao;
	
	@Autowired
	private CustomerLikeDao customerLikeDao;
	
	@Autowired
	private CustomerDao customerDao;

	@Autowired
	private CartDao cartDao;
	
	@Autowired
	private ReviewDao reviewDao;
	@Autowired
	private ReviewLikeDao reviewLikeDao;
	@Autowired
	private AddressDao addressDao;
	

//	맥북용
//	private final File directory = new File(System.getProperty("user.home")+"/upload/itemImage");
//	화니꼬
//	private final File directory = new File("C:/study/itemImage");
//	D드라이브용
	private final File directory = new File("D:/study/itemImage");
	
	//이미지 저장소 폴더 생성
	@PostConstruct
	public void prepare() {//최소 실행시 딱 한번만 실행되는 코드
		directory.mkdirs();
	}

	
	//상품 등록
	@GetMapping("/insert")
	public String insert() {
		return "item/insert";
	}
	
	@PostMapping("/insert")
	public String insert(
			@ModelAttribute ItemDto itemDto,
			@RequestParam MultipartFile mainImage,
			@RequestParam List<MultipartFile> itemImage) throws IllegalStateException, IOException {
		
		//등록 아이템에 미리 번호 생성
		int itemNo = itemDao.sequence();
		itemDto.setItemNo(itemNo);
		
		itemDao.insert(itemDto);
		
		
		if(!mainImage.isEmpty()) {
			//이미지 DB에 저장
			//번호 생성
			int imageNo = imageDao.sequence();
			String imageMain = "1";
			
			imageDao.insert(ImageDto.builder()
							.imageNo(imageNo)
							.imageName(mainImage.getOriginalFilename())
							.imageType(mainImage.getContentType())
							.imageSize(mainImage.getSize())
							.imageMain(imageMain)
					.build());
			//파일 저장
			File target = new File(directory, String.valueOf(imageNo));
			mainImage.transferTo(target);
			
			//+ 연결 테이블에 연결 정보를 저장(아이템 번호, 이미지 번호)
			itemDao.connectImage(itemNo,imageNo);
		}
		
		//아이템을 등록한 후 이미지를 등록 및 연결
		//아이템 이미지 등록
		for(MultipartFile image : itemImage) {
			if(!image.isEmpty()) {//이미지가 있다면
				//이미지 DB에 저장
				//번호 생성
				int imageNo = imageDao.sequence();
				String imageMain = "0";
				
				imageDao.insert(ImageDto.builder()
								.imageNo(imageNo)
								.imageName(image.getOriginalFilename())
								.imageType(image.getContentType())
								.imageSize(image.getSize())
								.imageMain(imageMain)
						.build());
				//파일 저장
				File target = new File(directory, String.valueOf(imageNo));
				image.transferTo(target);
				
				//+ 연결 테이블에 연결 정보를 저장(아이템 번호, 이미지 번호)
				itemDao.connectImage(itemNo,imageNo);
			}
		}
		
		return "redirect:list";
	}
	
	//상품 목록(관리자)
	@GetMapping("/list")
	public String list(Model model, 
			@ModelAttribute(name="vo") ItemListSearchVO vo) {

		//페이지 네비게이터를 위한 게시글 수를 전달
		int count = itemDao.count(vo);
		vo.setCount(count);
		
		model.addAttribute("list", itemDao.selectList(vo));
		
		return "item/list";
	}
	
	//상품 정보(관리자)
	@GetMapping("/detail")
	public String detail(Model model, 
			@RequestParam int itemNo,
			HttpSession session) {
		model.addAttribute("itemDto", itemDao.selectOne(itemNo));
		//상품 정보에 이미지 불러오기
		model.addAttribute("itemImageList", imageDao.selectItemImageList(itemNo));
		return "item/detail";
	}
	
	//상품 수정
	@GetMapping("/update")
	public String update(Model model, @RequestParam int itemNo) {
		model.addAttribute("itemDto", itemDao.selectOne(itemNo));
		return "item/update";
	}
	
	@PostMapping("/update")
	public String update(@ModelAttribute ItemDto itemDto, RedirectAttributes attr) {
		boolean result = itemDao.update(itemDto);
		if(result) {
			attr.addAttribute("itemNo",itemDto.getItemNo());
			return "redirect:detail";
		}
		else {
			throw new TargetNotFoundException("아이템 번호없음");
		}
	}
	
	//상품 삭제
	@GetMapping("/delete")
	public String delete(@RequestParam int itemNo) {
		boolean result = itemDao.delete(itemNo);
		if(result) {
			return "redirect:list";
		}
		else {
			throw new TargetNotFoundException("아이템 번호없음");
		}
		
	}
	
	//카트
	@GetMapping("/cart")
	public String cart(
			@RequestParam int itemNo,
			HttpSession session
			) {
		String loginId = (String) session.getAttribute(SessionConstant.ID);
		//하나의아이템 정보가지고오기 
		ItemDto itemDto=itemDao.selectOne(itemNo);
		//cartDto에 정보 삽입
		CartDto cartDto=new CartDto();
		cartDto.setCustomerId(loginId);
		cartDto.setItemNo(itemNo);
		cartDto.setCartItemName(itemDto.getItemName());
		cartDto.setCartItemPrice(itemDto.getItemPrice());
		cartDto.setCartItemColor(itemDto.getItemColor());
		cartDto.setCartItemSize(itemDto.getItemSize());
		
		//db에 있으면 지움 없으면 추가
		return "redirect:buydetail?itemNo="+itemNo;
	};
	
	
	//상품 리스트(회원)
	@GetMapping("/buylist")
	public String buylist(Model model, 
			@ModelAttribute(name="vo") ItemListSearchVO vo) {
		
		int count = itemDao.count(vo);
		vo.setCount(count);
		
		model.addAttribute("buylist", itemDao.selectBuyList(vo));
		
		return "item/buylist";
	}
	
	//상품 구매(회원)
	@GetMapping("/buydetail")
	public String buy(Model model, 
			@RequestParam int itemNo, HttpSession session) {
		
		//상품 정보 불러오는 값
		model.addAttribute("itemDto", itemDao.selectBuyOne(itemNo));
		
		//상품 이미지 불러오는 list
		model.addAttribute("buyImageList", itemDao.selectBuyList(itemNo));
		
		//상품 옵션 불러오는 list
		model.addAttribute("buylist", itemDao.selectItemList(itemNo));
		
		//장바구니 기록있는 조회하여 첨부 
		String loginId = (String) session.getAttribute(SessionConstant.ID);
		if(loginId !=null) {
		CartDto cartDto = new CartDto();
		cartDto.setCustomerId(loginId);
		cartDto.setItemNo(itemNo);
		//model.addAttribute("isCart", cartDao.check(cartDto));
		}

		//(+추가) 찜 기록이 있는지 조회하여 첨부

		if(loginId != null) {//회원이라면 좋아요 기록을 조회하여 model에 추가
			CustomerLikeDto customerLikeDto = new CustomerLikeDto();
			customerLikeDto.setCustomerId(loginId);
			customerLikeDto.setItemNo(itemNo);
			model.addAttribute("isLike", customerLikeDao.check(customerLikeDto));
		}
		
		 model.addAttribute("reviewList",reviewDao.selectList2(itemNo));
		//model.addAttribute("reviewList",reviewDao.selectList(itemNo));
		//model.addAttribute("imageList",imageDao.selectReviewImageList(reviewNo));

		return "item/buydetail";
	}
	
	//찜
	@GetMapping("/like")
	public String customerLike(@RequestParam int itemNo,
			HttpSession session, RedirectAttributes attr) {
		String loginId = (String)session.getAttribute(SessionConstant.ID);
		CustomerLikeDto customerLikeDto = new CustomerLikeDto();
		customerLikeDto.setCustomerId(loginId);
		customerLikeDto.setItemNo(itemNo);
		
		if(customerLikeDao.check(customerLikeDto)) {//좋아요를 한 생태면
			customerLikeDao.delete(customerLikeDto);//지우세요
		}
		else {//좋아요를 한 적이 없는 상태면
			customerLikeDao.insert(customerLikeDto);//추가하세요
		}
		
		customerLikeDao.refresh(itemNo);//좋아요 조회수 갱신
		customerLikeDao.likeRefresh(loginId);
		
		attr.addAttribute("itemNo",itemNo);
		return "redirect:/item/buydetail";
		
	}
}