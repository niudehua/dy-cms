package com.fh.util.wechat;


public class WechatTemplateUtil {
	public static String getTemplateMsg(String eventType, String reqServerPath, String fromUsername, String toUsername, String time, String keyword, String eventKey){
        try{
            if(eventType != null && "subscribe".equals(eventType)){
                // 关注公众号事件，返回图文消息
				 String Title = "关联校园卡";
				 String Description = "绑定学生，接收打卡推送";
				 String url = "" + reqServerPath + "/weixin/bindUser.jsp?openid="+fromUsername;
				 String turl = "" + reqServerPath + "/images/hbbd.jpg";
				 String template = getTemplate(WechatUtil.MsgTypeEnum.NEWS.getCode());
				 return template.format(template, fromUsername, toUsername, time, WechatUtil.MsgTypeEnum.NEWS.getCode(), 1,Title, Description, turl, url);
            }
            
            if(eventType != null && "CLICK".equals(eventType)){
            	//String eventKey = root.elementText("EventKey");
                if(eventKey.equals("dybd")){
                	String Title = "党员报到";
   				 	String Description = "绑定学生，接收打卡推送";
	   				 //String url = "" + reqServerPath + "/wechat/mobile.jsp?openid="+fromUsername;
   				 	 String url = "" + reqServerPath + "/wechat/toRegisterView.do?openid="+fromUsername;
	   				 String turl = "" + reqServerPath + "/images/hbbd.jpg";
	   				 String template = getTemplate(WechatUtil.MsgTypeEnum.NEWS.getCode());
	   				 return template.format(template, fromUsername, toUsername, time, WechatUtil.MsgTypeEnum.NEWS.getCode(), 1,Title, Description, turl, url);
				 } 
            }
            
            if(keyword == null || "".equals(keyword)){
            	/*
            	WxSendMsgUtil.PicInfo picInfo = new WxSendMsgUtil.PicInfo();
    			picInfo.setTitle("绑定微信");
    			picInfo.setDescription("绑定微信后可接收孩子打卡信息");
    			picInfo.setUrl(picUrl);
    			picInfo.setPicurl(picUrl);
                WxSendMsgUtil.sendMsg(WxSendMsgUtil.MsgTypeEnum.NEWS.getCode(), fromUsername, null, picInfo);
                */
            }else if(keyword != null && "党员报到".equals(keyword)){
            	String Title = "关联校园卡";
				 String Description = "绑定学生，接收打卡推送";
				 String url = "" + reqServerPath + "/weixin/bindUser.jsp?openid="+fromUsername;
				 String turl = "https://jingyan.baidu.com/album/8cdccae927391e315513cd44.html?picindex=1";
				 String template = getTemplate(WechatUtil.MsgTypeEnum.NEWS.getCode());
				 return template.format(template, fromUsername, toUsername, time, WechatUtil.MsgTypeEnum.NEWS.getCode(), 2,Title, Description, turl, url);
            }else if(keyword != null && !"".equals(keyword)){
            	String msgContent = "您的消息已收到，您还可以通过输入关键字执行操作。如“关联校园卡”";
            	String Title = "关联校园卡";
				 String Description = "绑定学生，接收打卡推送";
				String url = "" + reqServerPath + "/weixin/bindUser.jsp?openid="+fromUsername;
			    String turl = "" + reqServerPath + "/images/hbbd.jpg";
				String template = getTemplate(WechatUtil.MsgTypeEnum.TEXT.getCode());
				return template.format(template, fromUsername, toUsername, time, WechatUtil.MsgTypeEnum.TEXT.getCode(), msgContent);
            }
        }catch(Exception e){  
            e.printStackTrace();  
        }
        return null;
    }
	
	public static String getTemplate(String templateType){
    	if(WechatUtil.MsgTypeEnum.TEXT.getCode().equals(templateType)){
    		//返回文本消息模板
    		String textTpl = "<xml>"+  
                    "<ToUserName><![CDATA[%1$s]]></ToUserName>"+  
                    "<FromUserName><![CDATA[%2$s]]></FromUserName>"+  
                    "<CreateTime>%3$s</CreateTime>"+  
                    "<MsgType><![CDATA[%4$s]]></MsgType>"+  
                    "<Content><![CDATA[%5$s]]></Content>"+  
                    "<FuncFlag>0</FuncFlag>"+  
                    "</xml>";
    		return textTpl;
    	}else if(WechatUtil.MsgTypeEnum.NEWS.getCode().equals(templateType)){
    		//返回图文消息模板
    		/**
        	 * 图文模板
        	 */
        	String newsTpl = "<xml>"+    
                    "<ToUserName><![CDATA[%1$s]]></ToUserName>"+  
                    "<FromUserName><![CDATA[%2$s]]></FromUserName>"+  
                    "<CreateTime>%3$s</CreateTime>"+  
                    "<MsgType><![CDATA[%4$s]]></MsgType>"+  
                    "<ArticleCount>%5$s</ArticleCount>"+  
                    "<Articles>"+  
                    "<item>"+  
                    "<Title><![CDATA[%6$s]]></Title>"+   
                    "<Description><![CDATA[%7$s]]></Description>"+  
                    "<PicUrl><![CDATA[%8$s]]></PicUrl>"+  
                    "<Url><![CDATA[%9$s]]></Url>"+  
                    "</item>"+  
                    "<item>"+  
                    "<Title><![CDATA[%6$s]]></Title>"+   
                    "<Description><![CDATA[%7$s]]></Description>"+  
                    "<PicUrl><![CDATA[%8$s]]></PicUrl>"+  
                    "<Url><![CDATA[%9$s]]></Url>"+  
                    "</item>"+
                    "</Articles>"+  
                        "</xml>";
        	return newsTpl;
    	}
    	return null;
    }
}
