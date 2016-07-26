package common.controller;


import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;

import common.vo.AttachVo;

@Controller
public class CommonController{
	
	@SuppressWarnings("unused")
	private static final Logger logger = LoggerFactory.getLogger(CommonController.class);
	
	@RequestMapping(value = "/common/header")
    public String header() {
        return "/common/header";
    }
	@RequestMapping(value = "/common/left")
	public String left() {
		return "/common/left";
	}
	@RequestMapping(value = "/common/footer")
	public String footer() {
		return "/common/footer";
	}
	@RequestMapping(value = "/common/paging")
	public String paging() {
		return "/common/paging";
	}

	
	@RequestMapping(value = "/common/admin_header")
    public String admin_header() {
        return "/common/admin_header";
    }
	@RequestMapping(value = "/common/admin_topList")
	public String admin_topList() {
		return "/common/admin_topList";
	}
	@RequestMapping(value = "/common/admin_footer")
	public String admin_footer() {
		return "/common/admin_footer";
	}

	
	
	/** 내용 등록시 이미지가 저장되는 위치 */
	public static final String FILE_PATH_EDITOR_IMAGE = "/upload/editor/";

	@RequestMapping(value = "/common/photo_uploader")
	public String photo_uploader() {
		return "/common/photo_uploader";
	}
	
	/**
	 * 안씀
	 * */
	@RequestMapping(value = "/common/editorImgUp")
	public ModelAndView editorImgUp(HttpServletRequest req, HttpServletResponse res) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		try{
			MultipartHttpServletRequest mreq = (MultipartHttpServletRequest) req;
			@SuppressWarnings("unchecked")
			Collection<MultipartFile> fileList =  mreq.getFileMap().values();
			
			if(fileList != null){	

				AttachVo attach = null;
				List<AttachVo> tempList = new ArrayList<AttachVo>();
				
				String path = FILE_PATH_EDITOR_IMAGE;
				ServletContext context = req.getSession().getServletContext();
				String absPath = context.getRealPath(path);
				
				for (final MultipartFile mf : fileList){			        
					if(!mf.isEmpty()){
						UUID uuid = UUID.randomUUID();
				        String tempFileName = uuid.toString();
				        attach = new AttachVo();
				        attach.setAttach_name(mf.getOriginalFilename());
				        attach.setAttach_re_name(tempFileName);
				        attach.setAttach_size(Long.toString(mf.getSize()));
						tempList.add(attach);
						path = path+tempFileName;
						absPath = context.getRealPath(path);
						System.out.println(absPath);
						mf.transferTo(new File(absPath));
						resultMap.put("result", path);
					}
				}
			}
		}catch (Exception e){
			System.out.println("=====================================================");
			System.out.println("Class : NoticeController function : addNotice  Error");
			System.out.println("=====================================================");
			e.printStackTrace();
		}

		return new ModelAndView("result",resultMap); 
	}
	
	/**
	 * 파일업로드(에디터용)
	 * //SmartEditor 이미지업로드부분 수정
	 * @param fileData
	 * @param path
	 * @param fileName
	 * @throws IOException
	 */
	@RequestMapping(value = "/smartFileUpload", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject fileUpload(Model model, MultipartRequest multipartRequest, HttpServletRequest request) throws IOException{
		
		logger.info("fileUploadfileUploadfileUploadfileUploadfileUploadfileUploadfileUpload");
		
		JSONObject json = new JSONObject();
		MultipartFile imgfile = multipartRequest.getFile("Filedata");
		Calendar cal = Calendar.getInstance();
		String fileName = imgfile.getOriginalFilename();
		String fileType = fileName.substring(fileName.lastIndexOf("."), fileName.length());
		
		Calendar calendar = Calendar.getInstance();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		SimpleDateFormat dateFormat2 = new SimpleDateFormat("yyyy");
		//파일명 = 초초 까지 + 시퀀스 + 확장자
		String replaceName = dateFormat.format(calendar.getTime()) + "_" + SequenceUtil.getSeqNumberFile(); 		
		
		String root = request.getSession().getServletContext().getRealPath("/");
		
		//월별로 디렉토리 생성
		String dateDirectory = dateFormat2.format(calendar.getTime());
		//파일업로드시 root 있어야함
		String path = root + "upload" + File.separator + "smartEdit" + File.separator + dateDirectory + File.separator;
		//에디터에 경로 전달시 root 없어야함
		String editPath = File.separator + "upload" + File.separator + "smartEdit" + File.separator + dateDirectory + File.separator;
		logger.info("File Upload Path:::"+path);

		//제한 10M
		long maxFileSize = 100000000;
		long fileSize = imgfile.getSize();
		
		if(fileSize >= maxFileSize){
			CommonUtil.getReturnCodeFail(json);
			CommonUtil.getReturnCodeFailFileSize(json);
			return json;
		}else{
			FilesUtil.fileUpload(imgfile, path, replaceName+fileType);
		}
		
		//에디터에 응답주는 내용
		json.put("path", editPath);
		json.put("filename", replaceName+fileType);
		
		return json;
	}
	
	public static String htmlToText(String pStr) {
		if (pStr == null) {
			pStr = "";
		} 
		else {
			pStr = pStr.trim();
//			pStr = pStr.replaceAll("&", "&amp;");
//			pStr = pStr.replaceAll("<", "&lt;");
//			pStr = pStr.replaceAll(">", "&gt;");
//			pStr = pStr.replaceAll("\"", "&quot;");
//			pStr = pStr.replaceAll("'", "&#39;");
//			pStr = pStr.replaceAll("\"", "&#34;");
			pStr = pStr.replaceAll("\"","\'");
		}
		return pStr;
	}


	
}

