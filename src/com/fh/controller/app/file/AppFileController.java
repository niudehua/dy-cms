package com.fh.controller.app.file;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fh.controller.base.BaseController;
import com.fh.util.Const;
import com.fh.util.DateUtil;
import com.fh.util.FileUpload;
import com.fh.util.PathUtil;

/**
 * 说明：文件管理
 * 
 * 
 */
@Controller
@RequestMapping(value="/appfile")
public class AppFileController extends BaseController {

	/**上传文件
	  * @throws Exception
	  */
	@RequestMapping(value="/upFile",method = RequestMethod.POST)
	@ResponseBody
	public Object upFile(HttpServletRequest request,@RequestParam(value="file",required=false) MultipartFile file) throws Exception{
		System.out.println("=====upFile======");
		logBefore(logger, "app删除upFile");
		Map<String,Object> map = new HashMap<String,Object>();
		String  ffile = DateUtil.getDays(), fileName = "";
		if (null != file && !file.isEmpty()) {
			String filePath = PathUtil.getClasspath() + Const.FILEPATHIMG + ffile; //文件上传路径
			fileName = FileUpload.fileUp(file, filePath, this.get32UUID());   //执行上传 
			map.put("filePath",Const.FILEPATHIMG + ffile + "/" + fileName);
			map.put("msg","success");
		}else{
			map.put("msg","上传失败");
		}
		return map;
	}
	
}
