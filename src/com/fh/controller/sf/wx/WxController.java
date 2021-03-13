package com.fh.controller.sf.wx;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.util.AppUtil;
import com.fh.util.DateUtil;
import com.fh.util.ObjectExcelView;
import com.fh.util.PageData;
import com.fh.util.Jurisdiction;
import com.fh.util.Tools;
import com.fh.util.wechat.WechatUtil;
import com.fh.service.sf.activity.ActivityManager;
import com.fh.service.sf.useractivity.UserActivityManager;
import com.fh.service.sf.wxuser.WxuserManager;

/** 
 * 说明：微信接口
 * 创建人：BW
 * 创建时间：2020-11-30
 */
@Controller
@RequestMapping(value="/wx")
public class WxController extends BaseController {
	
	String menuUrl = "wx/list.do"; //菜单地址(权限用)
	
	@Resource(name="activityService")
	private ActivityManager activityService;
	
	@Resource(name="useractivityService")
	private UserActivityManager useractivityService;
	
	@Resource(name="wxuserService")
	private WxuserManager wxuserService;
	
	@RequestMapping(value="/getActivity")
	@ResponseBody
	public Object getActivity(){
		Map<String,Object> map = new HashMap<String,Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		PageData upd = new PageData();
		upd = this.getPageData();
		String result = "00";
		try{
			
			pd = activityService.findById(pd);	//根据ID读取
			
			upd.put("ACTIVITYID", pd.get("ACTIVITY_ID"));
			//upd.put("newsnumber", 10);
			upd.put("newsnumber", Integer.valueOf(upd.getString("newsnumber")));
			upd.put("start", Integer.valueOf(upd.getString("start")));
			List<PageData> listUa = useractivityService.listAll(upd);
			//System.out.println("listUa.size()="+listUa.size());
			if(listUa.size() == 10){
				map.put("hasNext", "yes");
			}else{
				map.put("hasNext", "no");
			}
			map.put("pd", pd);
			map.put("listUa", listUa);
		}catch (Exception e){
			logger.error(e.toString(), e);
		}finally{
			map.put("result", result);
			logAfter(logger);
		}
		return AppUtil.returnObject(new PageData(), map);
	}
	
	@RequestMapping(value="/getOpenId")
	@ResponseBody
	public Object getOpenId(){
		Map<String,Object> map = new HashMap<String,Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		String result = "00";
		try{
			JSONObject jsonObj=WechatUtil.getOpenId("wx8e87cab2f3002c63", "21b46dec296d6d6b466cd72b0a7c9ae8", pd.getString("code"));
			String openId = jsonObj.get("openid") == null ? "" : jsonObj.get("openid").toString();
			pd.put("OPENID", openId);
			pd.put("newsnumber", 1);
			pd.put("start", 0);
			List<PageData> listUa = useractivityService.listAll(pd);
			//System.out.println("listUa.size()="+listUa.size());
			if(listUa.size() >0){
				map.put("hasNext", "yes");
				map.put("USERACTIVITY_ID", listUa.get(0).get("USERACTIVITY_ID"));
			}else{
				map.put("hasNext", "no");
			}
			map.put("openId", openId);
			map.put("pd", pd);
		}catch (Exception e){
			logger.error(e.toString(), e);
		}finally{
			map.put("result", result);
			logAfter(logger);
		}
		return AppUtil.returnObject(new PageData(), map);
	}
	
	
	@RequestMapping(value="/decrypt")
	@ResponseBody
	public Object decrypt(){
		Map<String,Object> map = new HashMap<String,Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		String result = "00";
		try{
			JSONObject jsonObj=WechatUtil.getOpenId("wx8e87cab2f3002c63", "21b46dec296d6d6b466cd72b0a7c9ae8", pd.getString("code"));
			String openId = jsonObj.get("openid") == null ? "" : jsonObj.get("openid").toString();
			String sessionKey = jsonObj.get("session_key") == null ? "" : jsonObj.get("session_key").toString();
			
			pd.put("OPENID", openId);
			pd.put("newsnumber", 1);
			pd.put("start", 0);
			List<PageData> listUa = useractivityService.listAll(pd);
			System.out.println("listUa.size()="+listUa.size());
			if(listUa.size() >0){
				PageData ua = listUa.get(0);
				map.put("hasNext", "yes");
				map.put("USERACTIVITY_ID", ua.get("USERACTIVITY_ID"));
				
				//System.out.println("sessionKey="+sessionKey);
				String obj = WechatUtil.decrypt(pd.getString("encryptedData"), sessionKey,pd.getString("iv"), "UTF-8",1);
				//System.out.println("obj="+obj);
				//System.out.println("obj111="+listUa.get(0).getString("SIGNTIME"));
				JSONObject bcount = JSONObject.parseObject(obj);
				JSONArray jsonArray =bcount.getJSONArray("stepInfoList");
				int COUNT=0;
		        for (int i = 0; i < jsonArray.size(); i++) {
		            JSONObject jsonObject1 = jsonArray.getJSONObject(i);
		            String timestamp = DateUtil.timeStamp2Date(jsonObject1.getString("timestamp"),"yyyy-MM-dd");
		            //System.out.println("timestamp="+timestamp);
		            if(DateUtil.compareDate(timestamp,ua.getString("SIGNTIME"))){
		            	int step = (int) jsonObject1.get("step");
		            	COUNT=COUNT+step;
		            }
		        }
		        //System.out.println("COUNT="+COUNT);
		        
		        String KMCOUNT=Tools.formatDouble3(COUNT*0.4/1000);
		        
		        String TIMES=DateUtil.getDatePoor(DateUtil.strToDateLong(ua.getString("SIGNTIME")),new Date());
		        ua.put("TIMES", TIMES);
		        ua.put("KMCOUNT", KMCOUNT);
		        ua.put("COUNT", COUNT);
		        useractivityService.edit(ua);
			}else{
				map.put("hasNext", "no");
			}
		}catch (Exception e){
			logger.error(e.toString(), e);
		}finally{
			map.put("result", result);
			logAfter(logger);
		}
		return AppUtil.returnObject(new PageData(), map);
	}
	
	@RequestMapping(value="/singup")
	@ResponseBody
	public Object singup(){
		Map<String,Object> map = new HashMap<String,Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		String result = "00";
		try{
			JSONObject jsonObj=WechatUtil.getOpenId("wx8e87cab2f3002c63", "21b46dec296d6d6b466cd72b0a7c9ae8", pd.getString("code"));
			String openId = jsonObj.get("openid") == null ? "" : jsonObj.get("openid").toString();
			String sessionKey = jsonObj.get("session_key") == null ? "" : jsonObj.get("session_key").toString();
			//System.out.println("sessionKey="+sessionKey);
			String obj = WechatUtil.decrypt(pd.getString("encryptedData"), sessionKey,pd.getString("iv"), "UTF-8",1);
			System.out.println("obj="+obj);
			JSONObject bcount = JSONObject.parseObject(obj);
			JSONArray jsonArray =bcount.getJSONArray("stepInfoList");
			pd.put("OPENID", openId);
			pd.put("newsnumber", 1);
			pd.put("start", 0);
			List<PageData> listUa = useractivityService.listAll(pd);
			//System.out.println("listUa.size()="+listUa.size());
			PageData ua = new PageData();
			if(listUa.size() >0){
				ua = listUa.get(0);
		        map.put("hasNext", "yes");
				map.put("USERACTIVITY_ID", ua.get("USERACTIVITY_ID"));
			}else{
				String SIGNTIME=DateUtil.getTime();
				ua.put("SIGNTIME", SIGNTIME);
				map.put("hasNext", "no");
			}

			int COUNT=0;
	        for (int i = 0; i < jsonArray.size(); i++) {
	            JSONObject jsonObject1 = jsonArray.getJSONObject(i);
	            String timestamp = DateUtil.timeStamp2Date(jsonObject1.getString("timestamp"),"yyyy-MM-dd");
	            //System.out.println("timestamp="+timestamp);
	            if(DateUtil.compareDate(timestamp,ua.getString("SIGNTIME"))){
	            	int step = (int) jsonObject1.get("step");
	            	COUNT=COUNT+step;
	            }
	        }
	        //System.out.println("COUNT="+COUNT);
	        String KMCOUNT=Tools.formatDouble3(COUNT*0.4/1000);
	        String TIMES=DateUtil.getDatePoor(DateUtil.strToDateLong(ua.getString("SIGNTIME")),new Date());
	        
	        ua.put("TIMES", TIMES);
	        ua.put("KMCOUNT", KMCOUNT);
	        ua.put("COUNT", COUNT);
	        if(listUa.size() >0){
	        	useractivityService.edit(ua);
	        }else{
	        	ua.put("USERACTIVITY_ID", this.get32UUID());	//主键
				
				
				PageData wxu = new PageData();
				JSONObject userinfo = JSONObject.parseObject(pd.getString("userinfo"));
				//System.out.println("userinfo"+userinfo);
				wxu.put("WXUSER_ID", this.get32UUID());	//主键
				wxu.put("NAME", pd.get("name"));	//微信昵称
				wxu.put("PHONE", pd.get("phone"));	//微信昵称
				wxu.put("WXNAME", userinfo.get("nickName").toString());	//微信昵称
				wxu.put("WXATT", userinfo.get("avatarUrl").toString());	//头像
				wxu.put("OPENID", pd.get("OPENID"));	//微信唯一标识
				wxu.put("WXSEX", userinfo.get("gender").toString());	//性别
				wxu.put("WXADDRESS", userinfo.get("country").toString()+userinfo.get("province").toString()+userinfo.get("city").toString());	//地区
				wxuserService.save(wxu);
				ua.put("ACTIVITYID", wxu.get("47fb7b2ece9a400d995eac95016d155a"));
				ua.put("WXUSERID", wxu.get("WXUSER_ID"));
				useractivityService.save(ua);
	        }
		}catch (Exception e){
			logger.error(e.toString(), e);
		}finally{
			map.put("result", result);
			logAfter(logger);
		}
		return AppUtil.returnObject(new PageData(), map);
	}
	
	@RequestMapping(value="/my")
	@ResponseBody
	public Object my(){
		Map<String,Object> map = new HashMap<String,Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		String result = "00";
		try{
			JSONObject jsonObj=WechatUtil.getOpenId("wx8e87cab2f3002c63", "21b46dec296d6d6b466cd72b0a7c9ae8", pd.getString("code"));
			String openId = jsonObj.get("openid") == null ? "" : jsonObj.get("openid").toString();
			pd.put("OPENID", openId);
			pd.put("newsnumber", 1);
			pd.put("start", 0);
			List<PageData> listUa = useractivityService.listAll(pd);
			//System.out.println("listUa.size()="+listUa.size());
			PageData ua = new PageData();
			if(listUa.size() >0){
				ua = listUa.get(0);
			}
			PageData count = useractivityService.getRANKING(ua);
			ua.put("RANKING", Integer.valueOf(count.get("COUNT").toString())+1);
			map.put("pd", ua);
		}catch (Exception e){
			logger.error(e.toString(), e);
		}finally{
			map.put("result", result);
			logAfter(logger);
		}
		return AppUtil.returnObject(new PageData(), map);
	}
	
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"列表Activity");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData>	varList = activityService.list(page);	//列出Activity列表
		mv.setViewName("sf/activity/activity_list");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	
	
	 /**去修改页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goEdit")
	public ModelAndView goEdit()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = activityService.findById(pd);	//根据ID读取
		pd.put("BEGTIME", pd.get("BEGTIME").toString().replaceAll(" ", "T"));	//创建时间
		pd.put("ENDTIME", pd.get("ENDTIME").toString().replaceAll(" ", "T"));	//创建时间
		mv.setViewName("sf/activity/activity_edit");
		mv.addObject("msg", "edit");
		mv.addObject("pd", pd);
		return mv;
	}	
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
}
