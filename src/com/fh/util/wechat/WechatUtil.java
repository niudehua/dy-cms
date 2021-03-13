package com.fh.util.wechat;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.nio.charset.Charset;
import java.security.AlgorithmParameters;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;
import javax.net.ssl.HttpsURLConnection;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.lang.StringUtils;
import org.springframework.web.client.RestTemplate;
import com.alibaba.fastjson.JSONObject;
import com.fh.util.DateUtil;
import com.fh.util.Uploader;
import com.fh.util.UuidUtil;

/**
 * 发送微信消息工具类
 * @author bw
 *
 */
public class WechatUtil {
	
	/**
	 * 用于存放所有学校的access_token信息，便于统一管理，并且每2小时需要重新刷新一次
	 */
	public static Map<String, Object> allAccessTokenMap = new HashMap<String, Object>();
	
	private static final String REQUEST_TOKEN_URL = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential";
	/**
	 * 获取/刷新accessToken url地址
	 */
	private static final String REQUEST_ACCESS_TOKEN_URL = "https://api.weixin.qq.com/sns/oauth2/access_token?grant_type=authorization_code";
	
	/**
	 * 网页端引用微信js请求授权url
	 */
	private static final String REQUEST_JSAPI_TICKET_URL = "https://api.weixin.qq.com/cgi-bin/ticket/getticket?type=jsapi&access_token=";
	/**
	 * 微信发送客服消息接口url
	 */
	private static final String SEND_MSG_URL = "https://api.weixin.qq.com/cgi-bin/message/custom/send?access_token=";
	
	private static final String MENU_CREATE_URL = "https://api.weixin.qq.com/cgi-bin/menu/create?access_token=";
	
	private static final String REQUEST_WECHAT_USERINFO_URL = "https://api.weixin.qq.com/cgi-bin/user/info?lang=zh_CN";
	
	private static final String REQUEST_WECHAT_FACEINFO_URL = "https://api.weixin.qq.com/cityservice/face/identify/getinfo?access_token=";
	private static final String REQUEST_WECHAT_FACEIMG_URL = "https://api.weixin.qq.com/cityservice/face/identify/getimage?access_token=";
	/**https://api.weixin.qq.com/cityservice/face/identify/getimage?access_token=
	 * 请求微信服务器返回token信息后获取指定字符串常量
	 */
	private static final String ACCESS_TOKEN_CONST = "access_token";
	/**
	 * 用于存放指定appid的accesstoken的有效时间
	 */
	private static final String ACCESS_TOKEN_TIME_CONST = "ACCESS_TOKEN_TIME";
	/**
	 * 网页端使用微信js时用到的关键字
	 */
	private static final String JSAPI_TICKET_CONST = "ticket";
	/**
	 * js授权有效时间
	 */
	private static final String JSAPI_TICKET_TIME_CONST = "JSAPI_TICKET_TIME";
	
	/**
	 * 发送文本信息
	 * @param openId 用户openId（关注公众号后的公众平台自动生成的唯一编码）
	 * @param msgContent 消息内容
	 * @param appId 微信公众号appid
	 * @param secert 微信公众号密钥
	 * @param accessToken 发消息所需的令牌
	 * @param openIdList 要发送微信消息的人员openid
	 * @param msgContent 要发送的信息内容
	 * @return
	 */
	public static Map<String, String> sendTextMsg(String appId, String secert, String accessToken, List<String> openIdList, String msgContent){
		Map<String, String> resultMap = new HashMap<String, String>();
//		String accessToken = getToken();
//		if(accessToken == null){
//			resultMap.put(SendStatus.GET_ACCESS_TOKEN_FAILD.getCode(), SendStatus.GET_ACCESS_TOKEN_FAILD.getName());
//			return resultMap;
//		}
		// 组装文本信息
		SimplMsg sm = new SimplMsg(MsgTypeEnum.TEXT.getCode());
		sm.addData("content", msgContent);
		for (String openId : openIdList) {
			String msgBody = toSimplJson(openId, sm);
			send(accessToken, msgBody);
		}
		return null;
	}
	
	/**
	 * 发送多图文消息
	 * @param appId 微信公众号appid
	 * @param secert 微信公众号密钥
	 * @param accessToken 发消息所需的令牌
	 * @param openIdList 要发送微信消息的人员openid
	 * @param msgBody 图文消息封装类
	 * @return
	 */
	public static Map<String, String> sendPicTextMsg(String appId, String secert, String accessToken, List<String> openIdList, PicInfo msgBody){
		Map<String, String> resultMap = new HashMap<String, String>();
//		String accessToken = getToken();
//		if(accessToken == null){
//			resultMap.put(SendStatus.GET_ACCESS_TOKEN_FAILD.getCode(), SendStatus.GET_ACCESS_TOKEN_FAILD.getName());
//			return resultMap;
//		}
		/* 发送多图文消息*/
		PicWithTextMsg pics = new PicWithTextMsg(MsgTypeEnum.NEWS.getCode());
		List<Map<String, String>> bodyList = new ArrayList<Map<String,String>>();
		pics.data = bodyList;
		Map<String, String> bodyMap = new HashMap<String, String>();
		bodyList.add(bodyMap);
		
		bodyMap.put("title", msgBody.getTitle());
		bodyMap.put("description", msgBody.getDescription());
		bodyMap.put("url", msgBody.getUrl());
		bodyMap.put("picurl", msgBody.getPicurl());
		
		for (String openId : openIdList) {
			String msgBodyStr = toImagesJson(openId, pics);
			send(accessToken, msgBodyStr);
		}
		return null;
	}
	
	/**
	 * 获取指定公众号的access_token
	 * @return
	 * @throws Exception 
	 */
	public static String getAccessToken(String appId, String secert) throws Exception{
		System.out.println("开始获取wechat accessToke...."+ "&appid=" + appId + "&secret=" + secert);
        String req_token_url = REQUEST_TOKEN_URL + "&appid=" + appId + "&secret=" + secert;
        StringBuilder tokenSbd = null;
        InputStreamReader isr = null;
        HttpsURLConnection httpsConn = null;
        // 先从缓存中去token
        if(allAccessTokenMap.containsKey(ACCESS_TOKEN_CONST + appId)){
        	String effectiveTime = (String) allAccessTokenMap.get(ACCESS_TOKEN_TIME_CONST + appId);
        	if(DateUtil.compareDate(effectiveTime, DateUtil.getFormatDate(new Date(),"YYYY-MM-DD HH:mm:ss"))){
        		// 有效时间大于当前时间，则access_token有效
        		return (String) allAccessTokenMap.get(ACCESS_TOKEN_CONST + appId);
        	}
        }
        try {
            URL reqURL = new URL(req_token_url);
            httpsConn = (HttpsURLConnection) reqURL.openConnection();
            isr = new InputStreamReader(httpsConn.getInputStream());
            char[] chars = new char[1024];
            int len;
            tokenSbd = new StringBuilder();
            while ((len = isr.read(chars)) != -1) {
            	tokenSbd.append(new String(chars, 0, len));
            }
            System.out.println("获取到的tokenSbd：" + tokenSbd.toString());
            JSONObject jsonObj = JSONObject.parseObject(tokenSbd.toString());
            String accessToken = jsonObj.get(ACCESS_TOKEN_CONST).toString();
            // 将当前时间+2小时后的时间存入map中
            //allAccessTokenMap.put(ACCESS_TOKEN_TIME_CONST + appId, DateUtil.getAddMinuteDate(new Date(),120));
            allAccessTokenMap.put(ACCESS_TOKEN_TIME_CONST + appId,  DateUtil.getFormatDate(DateUtil.getAddMinuteDate(new Date(),120),"YYYY-MM-DD HH:mm:ss"));
            System.out.println("获取到公众号ACCESS_TOKEN：" + accessToken);
            allAccessTokenMap.put(ACCESS_TOKEN_CONST + appId, accessToken);
            return accessToken;
        } catch (IOException e) {

            e.printStackTrace();
        } finally{
        	if(isr != null){
        		try {
					isr.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
        	}
        	if(httpsConn != null){
        		httpsConn.disconnect();
        	}
        }
        return null;
	}
	
	/**
	 * 获取指定公众号的JsapiTicket
	 * @return
	 * @throws Exception 
	 */
	public static String getJsapiTicket(String appId, String secert) throws Exception{
        StringBuilder tokenSbd = null;
        InputStreamReader isr = null;
        HttpsURLConnection httpsConn = null;
        
        // 先从缓存中去token
        if(allAccessTokenMap.containsKey(JSAPI_TICKET_CONST + appId)){
        	System.out.println("JSAPI_TICKET_TIME_CONST="+allAccessTokenMap.get(JSAPI_TICKET_TIME_CONST + appId));
        	String effectiveTime = (String) allAccessTokenMap.get(JSAPI_TICKET_TIME_CONST + appId);
    		if(DateUtil.compareDate(effectiveTime, DateUtil.getFormatDate(new Date(),"YYYY-MM-DD HH:mm:ss"))){
        		// 有效时间大于当前时间，则access_token有效
        		return (String) allAccessTokenMap.get(JSAPI_TICKET_CONST + appId);
        	}
        }
        String accessToken = getAccessToken(appId, secert);
        try {
            URL reqURL = new URL(REQUEST_JSAPI_TICKET_URL + accessToken);
            httpsConn = (HttpsURLConnection) reqURL.openConnection();
            isr = new InputStreamReader(httpsConn.getInputStream());
            char[] chars = new char[1024];
            int len;
            tokenSbd = new StringBuilder();
            while ((len = isr.read(chars)) != -1) {
            	tokenSbd.append(new String(chars, 0, len));
            }
            JSONObject jsonObj = JSONObject.parseObject(tokenSbd.toString());
            String jsApiTicket = jsonObj.get(JSAPI_TICKET_CONST).toString();
            // 将当前时间+2小时后的时间存入map中
            allAccessTokenMap.put(ACCESS_TOKEN_TIME_CONST + appId,  DateUtil.getFormatDate(DateUtil.getAddMinuteDate(new Date(),120),"YYYY-MM-DD HH:mm:ss"));
            System.out.println("获取到公众号jsApiTicket：" + jsApiTicket);
            allAccessTokenMap.put(JSAPI_TICKET_CONST + appId, jsApiTicket);
            return jsApiTicket;
        } catch (IOException e) {

            e.printStackTrace();
        } finally{
        	if(isr != null){
        		try {
					isr.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
        	}
        	if(httpsConn != null){
        		httpsConn.disconnect();
        	}
        }
        return null;
	}
	
    /**
     * 生成微信权限验证的参数
     * @param appId
     * @param secert
     * @param url
     * @return
     * @throws Exception 
     */
    public static Map<String, String> createWXTicket(String appId, String secert, String url) throws Exception {
        Map<String, String> ret = new HashMap<String, String>();
        String nonceStr = UuidUtil.get32UUID();
        String timestamp = createTimestamp();
        
        String jsApiTicket = getJsapiTicket(appId, secert);
        //注意这里参数名必须全部小写，且必须有序
        String signature = SignUtil.createSignature(jsApiTicket, nonceStr, timestamp, url);
        
        ret.put("url", url);
        ret.put("jsapi_ticket", jsApiTicket);
        ret.put("nonceStr", nonceStr);
        ret.put("timestamp", timestamp);
        ret.put("signature", signature);
        ret.put("appid", appId);
        System.out.println("===========jsapi_ticket:" + jsApiTicket);
        System.out.println("===========signature:" + signature);
        System.out.println("===========nonceStr:" + nonceStr);
        System.out.println("===========timestamp:" + timestamp);
        System.out.println("===========appid:" + appId);
        System.out.println("===========url:" + url);
        return ret;
    }
	
    
    /**
	 * 拉取微信用户人脸验证信息
	 * @param code
	 * @return
	 * @throws Exception 
	 */
	public static Map<String, String> getWxFaceInfo(String appId, String secert, String msgBody) {
		Map<String, String> resultMap = new HashMap<String, String>();
		HttpURLConnection httpURLConnection = null;
		OutputStream os = null;
		InputStream in = null;
		try {
            //创建URL
			String accessToken = getAccessToken(appId, secert);
            URL url = new URL(REQUEST_WECHAT_FACEINFO_URL + accessToken);
            //由URL的openConnection方法得到一个HttpURLConnection（需要强转）
            httpURLConnection =
                    (HttpURLConnection) url.openConnection();
            //设置post提交
            httpURLConnection.setRequestMethod("POST");
            //设置超时时间
            httpURLConnection.setConnectTimeout(30000);
            httpURLConnection.setReadTimeout(30000);

            httpURLConnection.setDoInput(true);
            httpURLConnection.setDoOutput(true);

            //把请求正文通过OutputStream发出去
            os =httpURLConnection.getOutputStream();
            os.write(msgBody.getBytes("utf-8"));
            os.flush();

            //判断响应码  200 代表成功
            if(httpURLConnection.getResponseCode()==200){
                //由HttpURLConnection拿到输入流
                in = httpURLConnection.getInputStream();
                StringBuffer sb = new StringBuffer();
                //根据输入流做一些IO操作
                byte [] buff =new byte[1024];
                int len=-1;
                while((len=in.read(buff))!=-1){
                    sb.append(new String(buff,0,len,"utf-8"));
                }
                //System.out.println("微信消息已发送：" + msgBody);
                //System.out.println("微信平台回执：" + sb.toString());
                /*JSONObject jsonObj = JSONObject.parseObject(sb.toString());*/
                resultMap.put("obj", sb.toString());
            }else{
            	resultMap.put(SendStatus.HTTP_CONNECT_FAILD.getCode(), SendStatus.HTTP_CONNECT_FAILD.getName());
            }
            return resultMap;
        }catch (Exception e){
            e.printStackTrace();
        }finally{
    		try {
    			if(os != null){
    				os.close();
    			}
				if(in != null){
	        		in.close();
	        	}
			} catch (IOException e) {
				e.printStackTrace();
			}
        	if(httpURLConnection != null){
        		httpURLConnection.disconnect();
        	}
        }
		resultMap.put(SendStatus.HTTP_CONNECT_FAILD.getCode(), SendStatus.HTTP_CONNECT_FAILD.getName());
		return resultMap;
	}
	public static String IMGPATH = "upload/mobile";
    /**
	 * 拉取微信用户人脸验证照片
	 * @param code
	 * @return
	 * @throws Exception 
	 */
	public static Map<String, String> getWxFaceImg(String appId, String secert, String msgBody) {
		Map<String, String> resultMap = new HashMap<String, String>();
		HttpURLConnection httpURLConnection = null;
		OutputStream os = null;
		InputStream in = null;
		try {
            //创建URL
			String accessToken = getAccessToken(appId, secert);
            URL url = new URL(REQUEST_WECHAT_FACEIMG_URL + accessToken);
            //由URL的openConnection方法得到一个HttpURLConnection（需要强转）
            httpURLConnection =
                    (HttpURLConnection) url.openConnection();
            //设置post提交
            httpURLConnection.setRequestMethod("POST");
            //设置超时时间
            httpURLConnection.setConnectTimeout(30000);
            httpURLConnection.setReadTimeout(30000);

            httpURLConnection.setDoInput(true);
            httpURLConnection.setDoOutput(true);

            //把请求正文通过OutputStream发出去
            os =httpURLConnection.getOutputStream();
            os.write(msgBody.getBytes("utf-8"));
            os.flush();

            //判断响应码  200 代表成功
            if(httpURLConnection.getResponseCode()==200){
                //由HttpURLConnection拿到输入流
                in = httpURLConnection.getInputStream();
                byte[] data = readInputStream(in);  
                
                //new一个文件对象用来保存图片，默认保存当前工程根目录  
                String path = Uploader.getPhysicalPath(IMGPATH);  
                File dir = new File(path); 
                String fileFileName=new Date().getTime()+".jpg";
                System.out.println("fileFileName="+fileFileName);
                File imageFile = new File(dir,fileFileName);  
                //创建输出流  
                FileOutputStream outStream = new FileOutputStream(imageFile);  
                //写入数据  
                outStream.write(data);  
                //关闭输出流  
                outStream.close();  
                
                resultMap.put("fileFileName", fileFileName);
            }else{
            	resultMap.put(SendStatus.HTTP_CONNECT_FAILD.getCode(), SendStatus.HTTP_CONNECT_FAILD.getName());
            }
            return resultMap;
        }catch (Exception e){
            e.printStackTrace();
        }finally{
    		try {
    			if(os != null){
    				os.close();
    			}
				if(in != null){
	        		in.close();
	        	}
			} catch (IOException e) {
				e.printStackTrace();
			}
        	if(httpURLConnection != null){
        		httpURLConnection.disconnect();
        	}
        }
		resultMap.put(SendStatus.HTTP_CONNECT_FAILD.getCode(), SendStatus.HTTP_CONNECT_FAILD.getName());
		return resultMap;
	}
	
	 public static byte[] readInputStream(InputStream inStream) throws Exception{  
	        ByteArrayOutputStream outStream = new ByteArrayOutputStream();  
	        //创建一个Buffer字符串  
	        byte[] buffer = new byte[1024];  
	        //每次读取的字符串长度，如果为-1，代表全部读取完毕  
	        int len = 0;  
	        //使用一个输入流从buffer里把数据读取出来  
	        while( (len=inStream.read(buffer)) != -1 ){  
	            //用输出流往buffer里写入数据，中间参数代表从哪个位置开始读，len代表读取的长度  
	            outStream.write(buffer, 0, len);  
	        }  
	        //关闭输入流  
	        inStream.close();  
	        //把outStream里的数据写入内存  
	        return outStream.toByteArray();  
    }  
    /**
     * 生成时间戳
     * @return
     */
    private static String createTimestamp() {
        return Long.toString(System.currentTimeMillis() / 1000);
    }

	
	/**
	 * 创建菜单
	 * @param accessToken
	 * @param menuJson
	 * @throws Exception
	 */
	public static void createWechatMenu(String accessToken, String menuJson) throws Exception{
		System.out.println("开始创建微信菜单>>>");
		URL url = null;
		try {
			url = new URL(MENU_CREATE_URL + accessToken);
		} catch (MalformedURLException e) {
			throw new Exception("URL初始化失败！", e);
		}
		HttpURLConnection http = (HttpURLConnection) url.openConnection(); 
		http.setRequestMethod("POST"); 
		http.setRequestProperty("Content-Type","application/x-www-form-urlencoded"); 
		http.setDoOutput(true); 
		http.setDoInput(true);
		System.setProperty("sun.net.client.defaultConnectTimeout", "30000");//连接超时30秒
		System.setProperty("sun.net.client.defaultReadTimeout", "30000"); //读取超时30秒
		http.connect();
		OutputStream os= http.getOutputStream(); 
		os.write(menuJson.getBytes("UTF-8"));//传入参数 
		os.flush();
		os.close();
		
		System.out.println("完成创建微信菜单>>>");
	}
	
	/**
	 * 拉取微信用户信息
	 * @param code
	 * @return
	 * @throws Exception 
	 */
	public static JSONObject getWechatUserInfo(String appId, String secert, String openId) throws Exception{
        StringBuilder rstSbd = null;
        InputStreamReader isr = null;
        HttpsURLConnection httpsConn = null;
        
        String accessToken = getAccessToken(appId, secert);
        System.out.println("++++++++++++开始获取微信头像信息...");
        String reqUserInfoUrl = REQUEST_WECHAT_USERINFO_URL + "&access_token=" + accessToken + "&openid=" + openId;
        try {
            URL reqURL = new URL(reqUserInfoUrl);
            httpsConn = (HttpsURLConnection) reqURL.openConnection();
            isr = new InputStreamReader(httpsConn.getInputStream(),"UTF-8");
            char[] chars = new char[1024];
            int len;
            rstSbd = new StringBuilder();
            while ((len = isr.read(chars)) != -1) {
            	rstSbd.append(new String(chars, 0, len));
            }
            //String jsonZhcnStr = new String(rstSbd.toString().getBytes("ISO-8859-1"), "UTF-8");
            JSONObject jsonObj = JSONObject.parseObject(rstSbd.toString());
            //String nickName = jsonObj.get("nickname") == null ? "" : jsonObj.get("nickname").toString();
            //String headImgUrl = jsonObj.get("headimgurl") == null ? "" : jsonObj.get("headimgurl").toString();
            
            return jsonObj;
        } catch (IOException e) {
            e.printStackTrace();
        } finally{
        	if(isr != null){
        		try {
					isr.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
        	}
        	if(httpsConn != null){
        		httpsConn.disconnect();
        	}
        }
        return null;
	}
	
	/**
	 * 根据微信授权码获取openId等信息
	 * @param code
	 * @return
	 */
	public static String getAccessTokenByCode(String appId, String secert, String code){
        String req_token_url = REQUEST_ACCESS_TOKEN_URL + "&appid=" + appId + "&secret=" + secert + "&code=" + code;
        StringBuilder tokenSbd = null;
        InputStreamReader isr = null;
        HttpsURLConnection httpsConn = null;
        System.out.println("开始根据code获取accessToken...发送http请求。"+ "&appid=" + appId + "&secret=" + secert + "&code=" + code);
        try {
            URL reqURL = new URL(req_token_url);
            httpsConn = (HttpsURLConnection) reqURL.openConnection();
            isr = new InputStreamReader(httpsConn.getInputStream());
            char[] chars = new char[1024];
            int len;
            tokenSbd = new StringBuilder();
            while ((len = isr.read(chars)) != -1) {
            	tokenSbd.append(new String(chars, 0, len));
            }
            //System.out.println("获取到的数据信息：" + tokenSbd.toString());
            JSONObject jsonObj = JSONObject.parseObject(tokenSbd.toString());
            //System.out.println(jsonObj.toJSONString());
            System.out.println("获取openId:" + jsonObj.get("openid"));
            String openId = jsonObj.get("openid") == null ? "" : jsonObj.get("openid").toString();
            System.out.println(">>>根据code["+ code +"]获取openID["+ openId +"]");
            return openId;
        } catch (IOException e) {
            e.printStackTrace();
        } finally{
        	if(isr != null){
        		try {
					isr.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
        	}
        	if(httpsConn != null){
        		httpsConn.disconnect();
        	}
        }
        return null;
	}
	
	/**
	 * 根据微信授权码获取openId等信息
	 * @param code
	 * @return
	 */
	public static JSONObject getOpenId(String appId, String secert, String code){
        String req_token_url = "https://api.weixin.qq.com/sns/jscode2session?appid=" + appId + "&secret=" + secert + "&js_code=" + code + "&grant_type=authorization_code";
        StringBuilder tokenSbd = null;
        InputStreamReader isr = null;
        HttpsURLConnection httpsConn = null;
        System.out.println("开始发送http请求。"+ "&appid=" + appId + "&secret=" + secert + "&code=" + code);
        try {
            URL reqURL = new URL(req_token_url);
            httpsConn = (HttpsURLConnection) reqURL.openConnection();
            isr = new InputStreamReader(httpsConn.getInputStream());
            char[] chars = new char[1024];
            int len;
            tokenSbd = new StringBuilder();
            while ((len = isr.read(chars)) != -1) {
            	tokenSbd.append(new String(chars, 0, len));
            }
            System.out.println("获取到的数据信息：" + tokenSbd.toString());
            JSONObject jsonObj = JSONObject.parseObject(tokenSbd.toString());
            System.out.println(jsonObj.toJSONString());
            System.out.println("获取openId:" + jsonObj.get("openid"));
            String openId = jsonObj.get("openid") == null ? "" : jsonObj.get("openid").toString();
            System.out.println(">>>根据code["+ code +"]获取openID["+ openId +"]");
            return jsonObj;
        } catch (IOException e) {
            e.printStackTrace();
        } finally{
        	if(isr != null){
        		try {
					isr.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
        	}
        	if(httpsConn != null){
        		httpsConn.disconnect();
        	}
        }
        return null;
	}
	
	
	/**
	 * 发起http请求
	 * @param accessToken
	 * @param msgBody
	 * @return
	 */
	private static Map<String, String> send(String accessToken, String msgBody){
		Map<String, String> resultMap = new HashMap<String, String>();
		HttpURLConnection httpURLConnection = null;
		OutputStream os = null;
		InputStream in = null;
		try {
            //创建URL
            URL url = new URL(SEND_MSG_URL + accessToken);
            //由URL的openConnection方法得到一个HttpURLConnection（需要强转）
            httpURLConnection =
                    (HttpURLConnection) url.openConnection();
            //设置post提交
            httpURLConnection.setRequestMethod("POST");
            //设置超时时间
            httpURLConnection.setConnectTimeout(30000);
            httpURLConnection.setReadTimeout(30000);

            httpURLConnection.setDoInput(true);
            httpURLConnection.setDoOutput(true);

            //把请求正文通过OutputStream发出去
            os =httpURLConnection.getOutputStream();
            os.write(msgBody.getBytes("utf-8"));
            os.flush();

            //判断响应码  200 代表成功
            if(httpURLConnection.getResponseCode()==200){
                //由HttpURLConnection拿到输入流
                in = httpURLConnection.getInputStream();
                StringBuffer sb = new StringBuffer();
                //根据输入流做一些IO操作
                byte [] buff =new byte[1024];
                int len=-1;
                while((len=in.read(buff))!=-1){
                    sb.append(new String(buff,0,len,"utf-8"));
                }
                System.out.println("微信消息已发送：" + msgBody);
                System.out.println("微信平台回执：" + sb.toString());
                resultMap.put(SendStatus.SUCCESS.getCode(), SendStatus.SUCCESS.getName());
            }else{
            	resultMap.put(SendStatus.HTTP_CONNECT_FAILD.getCode(), SendStatus.HTTP_CONNECT_FAILD.getName());
            }
            return resultMap;
        }catch (Exception e){
            e.printStackTrace();
        }finally{
    		try {
    			if(os != null){
    				os.close();
    			}
				if(in != null){
	        		in.close();
	        	}
			} catch (IOException e) {
				e.printStackTrace();
			}
        	if(httpURLConnection != null){
        		httpURLConnection.disconnect();
        	}
        }
		resultMap.put(SendStatus.HTTP_CONNECT_FAILD.getCode(), SendStatus.HTTP_CONNECT_FAILD.getName());
		return resultMap;
	}
	
	/**
	 * 普通消息实体转换为json对象工具类
	 * @param openid
	 * @param msg
	 * @return
	 */
	private static String toSimplJson(String openId, SimplMsg msgContext) {
		JSONObject json = new JSONObject();
		json.put("touser", openId);
		json.put("msgtype", msgContext.getMsgtype());
		json.put(msgContext.getMsgtype(), msgContext.getData());
		return json.toString();
	}
	
	/**
	 * 多图文消息转换为json对象工具类
	 * @param openId
	 * @param msg
	 * @return
	 */
	private static String toImagesJson(String openId, PicWithTextMsg msg){
		JSONObject j = new JSONObject();
		j.put("articles", msg.getData());
		
		JSONObject json = new JSONObject();
		json.put("touser", openId);
		json.put("msgtype", msg.getMsgType());
		json.put(msg.getMsgType(), j);
		return json.toString();
	}
	
	/**
	 * 发送消息类型枚举类
	 * @author wjy
	 *
	 */
	public enum MsgTypeEnum{
		TEXT("text", "文本消息"),
		NEWS("news", "图文消息");
	
		private String code;
		private String name;
		
		MsgTypeEnum(String code, String name){
			this.code = code;
			this.name = name;
		}

		public String getCode() {
			return code;
		}

		public String getName() {
			return name;
		}

		public void setCode(String code) {
			this.code = code;
		}

		public void setName(String name) {
			this.name = name;
		}
	};
	
	/**
	 * 发送消息状态枚举内部类
	 * @author wjy
	 *
	 */
	public enum SendStatus{
		SUCCESS("1", "成功"),
		GET_ACCESS_TOKEN_FAILD("2", "获取token信息失败"),
		HTTP_CONNECT_FAILD("3", "http链接失败"),
		UNKNOW_ERROR("-1", "未知错误");
	
		private String code;
		private String name;
		
		SendStatus(String code, String name){
			this.code = code;
			this.name = name;
		}

		public String getCode() {
			return code;
		}

		public String getName() {
			return name;
		}

		public void setCode(String code) {
			this.code = code;
		}

		public void setName(String name) {
			this.name = name;
		}
	};
	
	/**
	 * 简单消息内部类
	 * @author wjy
	 *
	 */
	static class SimplMsg{
		
		/**
		 * 发送消息类型
		 */
		private String msgtype;
		
		private Map<String,String> data = new HashMap<String,String>();
		
		public Map<String,String> getData(){
			return data;
		}

		public String getMsgtype() {
			return msgtype;
		}
		
		/**
		 * 实例化指定类型的消息
		 * */
		public SimplMsg(String msgtype){
			this.msgtype = msgtype;
		}
		
		/**
		 * 添加消息内容
		 */
		public SimplMsg addData(String key,String value){
			data.put(key, value);
			return this;
		}

	}
	
	/**
	 * 图文消息内部封装类
	 * @author wjy
	 *
	 */
	static class PicWithTextMsg{
		private String msgType;
		private List<Map<String,String>> data = new ArrayList<Map<String,String>>();
		
		public List<Map<String,String>> getData(){
			return data;
		}
		
		public String getMsgType() {
			return msgType;
		}

		/**
		 * 实例化指定类型的消息
		 * */
		public PicWithTextMsg(String msgType){
			this.msgType = msgType;
		}
		
		/**
		 * 添加消息内容
		 */
		public PicWithTextMsg addData(Map<String,String> map){
			data.add(map);
			return this;
		}

	}
	
	/**
	 * 图文信息实体类
	 * @author wjy
	 *
	 */
	public static class PicInfo{
		private String title;
		private String description;
		private String url;
		private String picurl;
		public String getTitle() {
			return title;
		}
		public String getDescription() {
			return description;
		}
		public String getUrl() {
			return url;
		}
		public String getPicurl() {
			return picurl;
		}
		public void setTitle(String title) {
			this.title = title;
		}
		public void setDescription(String description) {
			this.description = description;
		}
		/**
		 * 外链url（即点击图文时的链接）
		 * @param url
		 */
		public void setUrl(String url) {
			this.url = url;
		}
		/**
		 * 要展示的图片的url
		 * @param picurl
		 */
		public void setPicurl(String picurl) {
			this.picurl = picurl;
		}
	}
	
	// ****************************************************************
	/*
	public void doSend() {
        List<CdptsArticle> toSendNewsList = new ArrayList<>();
        // 1.获取新闻列表
        toSendNewsList = getArticleListFromCdpts();
        // 再去获取一次，有时候第一次获取不到，不知道为什么
        if (toSendNewsList.size() == 0) {
            toSendNewsList = getArticleListFromCdpts();
        }
        // 2.移除已发送的新闻
        toSendNewsList = removeAlreadySentArticle(toSendNewsList);
        if (toSendNewsList.size() == 0) {
            //logger.info("----------没有文章需要群发----------");
            return;
        }
        // 最多群发8条消息
        if (toSendNewsList.size() > 8) {
            toSendNewsList = toSendNewsList.subList(0, 8);
        }
        //logger.info("----------群发的消息----------");
        for (CdptsArticle article : toSendNewsList) {
            logger.info("----------{}----------", article.getTitle());
        }
        // 3.上传并设置封面图片
        toSendNewsList = setCoverImage(toSendNewsList);
        // 4.群发图文消息json封装
        String groupSendMessageJsonStr = getGroupSendMessageJsonStr(toSendNewsList);
        // 5.上传群发图文消息
        String mediaId = uploadGroupSendMessage(groupSendMessageJsonStr);
        // 5.群发
        if (StringUtils.isNotEmpty(mediaId)) {

            String mode = prop.get("active");
            if (StringUtils.isNotBlank(mode) && mode.equals("dev")) {
                logger.info("测试环境，预览");
                String openId = "你的测试openid";
                sendToPreview(toSendNewsList, openId, mediaId);
            } else {
                logger.info("正式环境，群发");
                sendToAll(toSendNewsList, mediaId);
            }

        }
    }
	*/
	
	 /**
     * 设置图文消息的封面图片
     * 
     * @param newsList
     * @return
     */
	/*
    private List<CdptsArticle> setCoverImage(List<CdptsArticle> newsList) {
        String accessToken = accessTokenUtil.getAccessToken();
        // 3.将待发送的新闻填充
        List<CdptsArticle> detialArticleList = new ArrayList<>();
        // 4.封装新闻详情，并得到新闻列表
        for (CdptsArticle article : newsList) {
            CdptsArticle articleWithDetial = getArticleDetialAndReplaceImage(article.getUrl());
            try {
                // 下载封面图片到本地
                String localImage = imageService.saveImageToDisk(articleWithDetial.getImageUrl(), imageSavePath);
                ImageUtil.thumbImage(localImage);
                // 上传封面到微信
                String jsonStr = HttpUtil.sendPost(postImageMediaUrl.replace("ACCESS_TOKEN", accessToken),
                        new File(localImage));
                logger.info("----------上传封面图片返回结果:{}----------" + jsonStr);
                try {
                    JSONObject object = new JSONObject(jsonStr);
                    logger.info("----------得到的封面图片media_id:{}----------", object.get("media_id"));
                    articleWithDetial.setImageMediaId((String) object.get("media_id"));
                } catch (Exception e) {
                    logger.error("----------上传封面发生错误:{}", e.getMessage());
                }
            } catch (Exception e) {
                logger.error("----------下载封面,上传封面到微信过程发生错误:{}", e.getMessage());
            }
            detialArticleList.add(articleWithDetial);
        }
        logger.info("----------最终群发图文列表:{}----------", detialArticleList);
        return detialArticleList;
    }

    private String getGroupSendMessageJsonStr(List<CdptsArticle> toSendNewsList) {
        List<GroupSendMessage> groupSendMessageList = new ArrayList<>();
        for (CdptsArticle cdptsArticle : toSendNewsList) {
            GroupSendMessage groupSendMessage = new GroupSendMessage();
            groupSendMessage.setThumb_media_id(cdptsArticle.getImageMediaId());
            groupSendMessage.setAuthor(cdptsArticle.getAuthor());
            groupSendMessage.setTitle(cdptsArticle.getTitle());
            groupSendMessage.setContent_source_url(cdptsArticle.getUrl());
            groupSendMessage.setContent(cdptsArticle.getContent());
            groupSendMessage.setShow_cover_pic(0);
            groupSendMessageList.add(groupSendMessage);
        }
        logger.info("----------最终封装的图文消息列表:{}----------", groupSendMessageList);
        Map<String, Object> jsonMap = new HashMap<>();
        jsonMap.put("articles", groupSendMessageList);
        String groupSendMessageJsonStr = gson.toJson(jsonMap);
        logger.info("----------最终要发送的图文消息json数据:{}----------", groupSendMessageJsonStr);
        return groupSendMessageJsonStr;
    }

    
    private String uploadGroupSendMessage(String groupSendMessageJsonStr) {
        String accessToken = accessTokenUtil.getAccessToken();
        String postNewsResult = HttpUtil.sendPost(postNewsUrl.replace("ACCESS_TOKEN", accessToken),
                groupSendMessageJsonStr);
        logger.info("----------上传群发图文消息的返回结果:{}----------", postNewsResult);
        String mediaId = "";
        try {
            JSONObject object = new JSONObject(postNewsResult);
            mediaId = (String) object.get("media_id");
        } catch (JSONException e) {
            logger.error("上传群发图文消息发生错误{}", postNewsResult);
        }
        return mediaId;
    }

    
    public void sendToPreview(List<CdptsArticle> toSendNewsList, String openId, String mediaId) {
        String accessToken = accessTokenUtil.getAccessToken();
        SendToOpenIdPreview sendToPreview = new SendToOpenIdPreview(openId, mediaId);
        String sendToPreviewJsonStr = gson.toJson(sendToPreview);
        logger.info("----------预览的的json:{}----------", sendToPreviewJsonStr);
        String sentToPreviewResult = HttpUtil.sendPost(sendToPreviewUrl.replace("ACCESS_TOKEN", accessToken),
                sendToPreviewJsonStr);
        logger.info("----------预览发送结果:{}----------", sentToPreviewResult);
        checkSendResult(toSendNewsList, sentToPreviewResult);
    }
	*/
	
	/**
     * 根据openid 获取Unionid
     *
     * @param token
     * @param openid
     * @return
     */
    public static String getUnionid(String token, String openid) {
    	System.out.println(token+"----------"+openid);
        String url = "https://api.weixin.qq.com/cgi-bin/user/info?access_token=" + token + "&openid=" + openid + "&lang=zh_CN";
        RestTemplate restTemplate = new RestTemplate();
        String result = restTemplate.getForObject(url, String.class);
        if (StringUtils.isNotBlank(result)) {
            return JSONObject.parseObject(result).getString("unionid");
        }
        return null;
    }
    
    private static final Charset CHARSET = Charset.forName("utf-8");
    private static final int BLOCK_SIZE = 32;
    
	public static String decrypt(String data, String key, String iv, String encodingFormat,Integer type) throws Exception {
        //被加密的数据
        byte[] dataByte = Base64.decodeBase64(data);
        //加密秘钥
        byte[] keyByte = Base64.decodeBase64(key);
        //偏移量
        byte[] ivByte = Base64.decodeBase64(iv);
 
 
        try {
            Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
 
            SecretKeySpec spec = new SecretKeySpec(keyByte, "AES");
 
            AlgorithmParameters parameters = AlgorithmParameters.getInstance("AES");
            parameters.init(new IvParameterSpec(ivByte));
 
            cipher.init(Cipher.DECRYPT_MODE, spec, parameters);// 初始化
 
            byte[] resultByte = cipher.doFinal(dataByte);
            if (null != resultByte && resultByte.length > 0) {
            	if (type==1){
					return  new String(decode(resultByte));

				}else {
					return  new String(resultByte, encodingFormat);

				}
            }
            return null;
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        } catch (IllegalBlockSizeException e) {
			e.printStackTrace();
		} catch (BadPaddingException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	 /**
     * 获得对明文进行补位填充的字节.
     *
     * @param count
     *            需要进行填充补位操作的明文字节个数
     * @return 补齐用的字节数组
     */
    public static byte[] encode(int count) {
        // 计算需要填充的位数
        int amountToPad = BLOCK_SIZE - (count % BLOCK_SIZE);
        if (amountToPad == 0) {
            amountToPad = BLOCK_SIZE;
        }
        // 获得补位所用的字符
        char padChr = chr(amountToPad);
        String tmp = new String();
        for (int index = 0; index < amountToPad; index++) {
            tmp += padChr;
        }
        return tmp.getBytes(CHARSET);
    }
 
    /**
     * 删除解密后明文的补位字符
     *
     * @param decrypted
     *            解密后的明文
     * @return 删除补位字符后的明文
     */
    public static byte[] decode(byte[] decrypted) {
        int pad = decrypted[decrypted.length - 1];
        if (pad < 1 || pad > 32) {
            pad = 0;
        }
        return Arrays.copyOfRange(decrypted, 0, decrypted.length - pad);
    }
 
    /**
     * 将数字转化成ASCII码对应的字符，用于对明文进行补码
     *
     * @param a
     *            需要转化的数字
     * @return 转化得到的字符
     */
    public static char chr(int a) {
        byte target = (byte) (a & 0xFF);
        return (char) target;
    }
}
