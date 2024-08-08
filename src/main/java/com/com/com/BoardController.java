package com.com.com;


import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

/**
 * Handles requests for the application home page.
 */
@Controller
public class BoardController {
	
	@Inject
	private BoardService service;
	
	
	//글 목록
	@RequestMapping("list")
	public String home(Model model, @RequestParam Map<String, Object> searchMap) {
		
		//searchMap 기본값
		if(searchMap.isEmpty()) {
			searchMap.put("curPage", 1);
			searchMap.put("listSize", 10);
		} 
		
		 // 
	    int count = service.countArticle(searchMap);
	    int curPage = Integer.parseInt(searchMap.get("curPage").toString());
	    int PAGE_SCALE = Integer.parseInt(searchMap.get("listSize").toString());
		
	    // 
	    BoardPager boardPager = new BoardPager(count, curPage, PAGE_SCALE);
	    
	    //list 
		List<BoardDto> list = new ArrayList<BoardDto>();
				
		list = service.list(searchMap);
		System.out.println(list);
		
		model.addAttribute("list", list);
		model.addAttribute("searchMap", searchMap);
		model.addAttribute("boardPager", boardPager);
		
		
		return "list";
	}
	
	//ajax이용한 목록출력 방법1
	@RequestMapping("serachList")
	@ResponseBody
	public Map<String, Object> search(@RequestParam Map<String, Object> searchMap) {
		
		  
		 //객체생성
		List<BoardDto> list = new ArrayList<BoardDto>();
		
		//list
		list = service.list(searchMap);
		System.out.println(list);
		
		 //
	    int count = service.countArticle(searchMap); //
	    int curPage = Integer.parseInt(searchMap.get("curPage").toString()); // 
	    int PAGE_SCALE = Integer.parseInt(searchMap.get("listSize").toString()); // 
		
	    //
	    BoardPager boardPager = new BoardPager(count, curPage, PAGE_SCALE);
	    
	    Map<String, Object> resMap = new HashMap<String, Object>();
	    
	    resMap.put("list", list);
	    resMap.put("boardPager", boardPager);
	    
		
		return resMap;
	}
	
	//ajax2
	@RequestMapping("seachList2")
	public String searchList2(Model model, @RequestParam Map<String, Object> searchMap) {
		 // 
	    int count = service.countArticle(searchMap);
	    int curPage = Integer.parseInt(searchMap.get("curPage").toString());
	    int PAGE_SCALE = Integer.parseInt(searchMap.get("listSize").toString());
		
	    // 
	    BoardPager boardPager = new BoardPager(count, curPage, PAGE_SCALE);
	    
	    //list 
		List<BoardDto> list = new ArrayList<BoardDto>();
				
		list = service.list(searchMap);
		
		model.addAttribute("list", list);
		model.addAttribute("boardPager", boardPager);
		
		
		return "searchList2";
	}
	
	@RequestMapping(value = "food", method= RequestMethod.GET,  produces="application/json;charset=utf-8;")
	@ResponseBody
	public Map<String, Object> food(){
		
		List<FoodDto> list = service.foodList();

		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("list", list);

		return map;
	}
	
	
	@RequestMapping("insert")
	public String insert() {
		return "write";
	}

	public static final String savepath = "C:/Users/user/Desktop/upload/";
	//insert 및 파일 업로드
	@RequestMapping("write")
	private String write(BoardDto dto, MultipartHttpServletRequest mRequest) throws IOException, ServletException{
		
		int insert = service.write(dto);
		
		if(insert == 0) {
			System.out.println("fail");
		} else {
			System.out.println("success");
		}
		//listSeq 구하기
		int listSeq = service.selectSeq();
		System.out.println(listSeq);
		//파일 가져오기(name들로)-name을 여러가지써서/ input이 여러개이기때문
		Iterator<String> itr = mRequest.getFileNames();
		
		//순서대로 값이 있는거 반복
		while(itr.hasNext()) {
			//itr 파일 집어넣기(true만)
			MultipartFile file = mRequest.getFile(itr.next());
			//originalName 구하기
			String realName = file.getOriginalFilename();
			//UUID 이용하여 저장할 임시 이름 만들기
			String saveName = UUID.randomUUID()+ "-" + realName;
			//경로와 저장명을 파일에 저장
			file.transferTo(new File(savepath + saveName));
			
			Map<String, Object> files = new HashMap<String, Object>();
			
			files.put("realName", realName);
			files.put("saveName", saveName);
			files.put("listSeq", listSeq);
			files.put("savePath", savepath);
			
			int upload = service.fileUpload(files);
			
			if(upload == 0) {
				System.out.println("fail");
			} else {
				System.out.println("success");
			}
		}

		return "redirect:list";
	}
	
	//상세페이지 뷰와 파일 정보
	@RequestMapping("view")
	private String view(Model model, int seq) {
		
		BoardDto view = service.view(seq);
		List<FileDto> fileview = service.fileView(seq);
		
		model.addAttribute("view", view);
		model.addAttribute("fileview", fileview);
		
		return "write";
	}
	
	@RequestMapping("download")
	private void fileDown(@RequestParam Map<String,Object> map, HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		Map<String, Object> resultMap = service.downloadFile(map);
		
		String storedFileName = (String) resultMap.get("SAVE_NAME");
		String originalFileName =(String) resultMap.get("REAL_NAME"); 
		//파일 업로드할때 저장한 파일이름을 가지고 디렉토리를 가져온다
		File downloadFile = new File(savepath + storedFileName);
		//가져온 파일 정보를 byte로 변환한다
		byte fileByte[] = FileUtils.readFileToByteArray(downloadFile);
		
		response.setContentType("application/octet-stream");
		response.setContentLength(fileByte.length);
		
		response.setHeader("Content-Disposition", "attachment; fileName=\"" + URLEncoder.encode(originalFileName, "UTF-8") +"\";");
		response.setHeader("Content-Transfer-Encoding", "binary");
		
		response.getOutputStream().write(fileByte);
		response.getOutputStream().flush();
		response.getOutputStream().close();
		
		System.out.println("완료");
		
	}
	
	//update
	@RequestMapping("update")
	private String update(@RequestParam("seq") int seq, BoardDto dto, MultipartHttpServletRequest mRequest) throws IllegalStateException, IOException {
		
		int update = service.update(seq, dto);
		
		if(update == 0) {
			System.out.println("update fail");
		} else {
			System.out.println("update seccess ");
		}

		Iterator<String> itr = mRequest.getFileNames();
		
		//순서대로 값이 있는거 반복
		while(itr.hasNext()) {
			//itr 파일 집어넣기
			MultipartFile file = mRequest.getFile(itr.next());
			//originalName 구하기
			String realName = file.getOriginalFilename();
			//UUID 이용하여 저장할 임시 이름 만들기
			String saveName = UUID.randomUUID()+ "-" + realName;
			//경로와 저장명을 파일에 저장
			file.transferTo(new File(savepath + saveName));
			
			Map<String, Object> files = new HashMap<String, Object>();
			
			files.put("realName", realName);
			files.put("saveName", saveName);
			files.put("savePath", savepath);
			files.put("listSeq", seq);
			
			int upload = service.fileUpload(files);
			
			if(upload == 0) {
				System.out.println("실패");
			} else {
				System.out.println("성공");
			}
		}

		return "redirect:list";
	}
	
	//delete
	@RequestMapping("delete")
	private String delete(Integer[] seqs) {
		
		
		int delete = service.delete(seqs);
		
		if(delete == 0) {
			System.out.println("fail");
		} else {
			System.out.println("success");
		}
		
		return "redirect:list";
	}
	
	
	
}
