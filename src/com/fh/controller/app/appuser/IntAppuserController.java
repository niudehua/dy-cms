package com.fh.controller.app.appuser;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fh.controller.base.BaseController;
import com.fh.entity.system.User;
import com.fh.service.system.appuser.AppuserManager;
import com.fh.service.system.fhlog.FHlogManager;
import com.fh.util.AppUtil;
import com.fh.util.Const;
import com.fh.util.DateUtil;
import com.fh.util.Jurisdiction;
import com.fh.util.PageData;
import com.fh.util.Tools;


/**
  * 会员-接口类 
  * 相关参数协议：
  * 00	请求失败
  * 01	请求成功
  * 02	返回空值
  * 03	请求协议参数不完整    
  * 04  用户名或密码错误
  * 05  FKEY验证失败
 */
/**
 * 说明：接口类例子
 * 
 * 
 */
@Controller
@RequestMapping(value="/appuser")
public class IntAppuserController extends BaseController {
    
	@Resource(name="appuserService")
	private AppuserManager appuserService;
	
	@Resource(name="fhlogService")
	private FHlogManager FHLOG;
	
	/**根据用户名获取会员信息
	 * @return
	 */
	@RequestMapping(value="/registerAppuser")
	@ResponseBody
	public Object registerAppuser(){
		logBefore(logger, "会员注册接口");
		Map<String,Object> map = new HashMap<String,Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		String result = "00";
		try{
			//if(Tools.checkKey("USERNAME", pd.getString("FKEY"))){	//检验请求key值是否合法
				//if(AppUtil.checkParam("registerSysUser", pd)){		//检查参数
					
					/*Session session = Jurisdiction.getSession();
					String sessionCode = (String)session.getAttribute(Const.SESSION_SECURITY_CODE);		//获取session中的验证码
					String rcode = pd.getString("rcode");
					if(Tools.notEmpty(sessionCode) && sessionCode.equalsIgnoreCase(rcode)){	*/			//判断登录验证码
						pd.put("USER_ID", this.get32UUID());	//ID 主键
						pd.put("ROLE_ID", "1b67fc82ce89457a8347ae53e43a347e");					//角色ID 初级会员
						pd.put("NUMBER", "");					//编号
						pd.put("BZ", "注册用户");				//备注
						pd.put("LAST_LOGIN", "");				//最后登录时间
						pd.put("IP", "");						//IP
						pd.put("STATUS", "0");					//状态
						pd.put("PASSWORD", new SimpleHash("SHA-1", pd.getString("USERNAME"), pd.getString("PASSWORD")).toString());	//密码加密
						if(null == appuserService.findByUsername(pd)){	//判断用户名是否存在
							appuserService.saveU(pd); 					//执行保存
							map.put("USER_ID", pd.getString("USER_ID"));
							FHLOG.save(pd.getString("USERNAME"), "会员注册");
						}else{
							result = "04"; 	//用户名已存在
						}
					/*}else{
						result = "06"; 		//验证码错误
					}*/
					/*}else {
					result = "03";
				}
			}else{
				result = "05";
			}*/
		}catch (Exception e){
			logger.error(e.toString(), e);
		}finally{
			map.put("result", result);
			logAfter(logger);
		}
		return AppUtil.returnObject(new PageData(), map);
	}
	
	/**请求登录，验证用户
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/login" ,produces="application/json;charset=UTF-8")
	@ResponseBody
	public Object login()throws Exception{
		Map<String,String> map = new HashMap<String,String>();
		PageData pd = new PageData();
		pd = this.getPageData();
		String errInfo = "";
			Session session = Jurisdiction.getSession();
			String USERNAME = pd.getString("USERNAME");;	//登录过来的用户名
			String PASSWORD  = pd.getString("PASSWORD");;	//登录过来的密码
			String passwd = new SimpleHash("SHA-1", USERNAME, PASSWORD).toString();	//密码加密
			pd.put("PASSWORD", passwd);
			pd = appuserService.findByUsername(pd);	//根据用户名和密码去读取用户信息
			if(pd != null){
				pd.put("LAST_LOGIN",DateUtil.getTime().toString());
				appuserService.updateLastLogin(pd);
				User user = new User();
				user.setUSER_ID(pd.getString("USER_ID"));
				user.setUSERNAME(pd.getString("USERNAME"));
				user.setPASSWORD(pd.getString("PASSWORD"));
				user.setNAME(pd.getString("NAME"));
				user.setRIGHTS(pd.getString("RIGHTS"));
				user.setROLE_ID(pd.getString("ROLE_ID"));
				user.setLAST_LOGIN(pd.getString("LAST_LOGIN"));
				user.setIP(pd.getString("IP"));
				user.setSTATUS(pd.getString("STATUS"));
				map.put("USER_ID", pd.getString("USER_ID"));
				session.setAttribute(Const.SESSION_USER, user);			//把用户信息放session中
				session.removeAttribute(Const.SESSION_SECURITY_CODE);	//清除登录验证码的session
				//shiro加入身份验证
				Subject subject = SecurityUtils.getSubject(); 
			    UsernamePasswordToken token = new UsernamePasswordToken(USERNAME, PASSWORD); 
			    try { 
			        subject.login(token); 
			    } catch (AuthenticationException e) { 
			    	errInfo = "身份验证失败！";
			    }
			}else{
				errInfo = "usererror"; 				//用户名或密码有误
				logBefore(logger, USERNAME+"登录系统密码或用户名错误");
				FHLOG.save(USERNAME, "登录系统密码或用户名错误");
			}
			if(Tools.isEmpty(errInfo)){
				errInfo = "success";					//验证成功
				logBefore(logger, USERNAME+"登录会员系统");
				FHLOG.save(USERNAME, "登录会员系统");
			}
		map.put("result", errInfo);
		return AppUtil.returnObject(new PageData(), map);
	}
	
	/**根据用户名获取会员信息
	 * @return
	 */
	@RequestMapping(value="/getAppuserByUm")
	@ResponseBody
	public Object getAppuserByUsernmae(){
		logBefore(logger, "根据用户名获取会员信息");
		Map<String,Object> map = new HashMap<String,Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		String result = "00";
		try{
			if(Tools.checkKey("USERNAME", pd.getString("FKEY"))){	//检验请求key值是否合法
				if(AppUtil.checkParam("getAppuserByUsernmae", pd)){	//检查参数
					pd = appuserService.findByUsername(pd);
					map.put("pd", pd);
					result = (null == pd) ?  "02" :  "01";
				}else {
					result = "03";
				}
			}else{
				result = "05";
			}
		}catch (Exception e){
			logger.error(e.toString(), e);
		}finally{
			map.put("result", result);
			logAfter(logger);
		}
		return AppUtil.returnObject(new PageData(), map);
	}
	
	 /**根据id获取会员信息
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/getAppuser")
	@ResponseBody
	public Object getAppuser()throws Exception{
		Map<String,Object> map = new HashMap<String,Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = appuserService.findByUiId(pd);	//根据ID读取
		map.put("pd", pd);
		map.put("msg","success");
		return AppUtil.returnObject(pd, map);
	}
	
}
	
 