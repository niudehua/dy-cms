package com.fh.controller.wxpay;

import com.egzosn.pay.common.api.PayService;
import com.egzosn.pay.common.bean.MethodType;
import com.egzosn.pay.common.bean.PayOrder;
import com.egzosn.pay.wx.api.WxPayConfigStorage;
import com.egzosn.pay.wx.api.WxPayService;
import com.egzosn.pay.wx.bean.WxTransactionType;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.PostConstruct;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.Map;
import java.util.UUID;

/**
 * 类名称：PayController
 * ***********************
 * <p>
 * 类描述：微信支付
 *
 * @author deng on 2021/3/13 15:39
 */
@RestController
@RequestMapping("/pay")
public class PayController {

    private PayService service = null;

    @PostConstruct
    public void init() {
        WxPayConfigStorage wxPayConfigStorage = new WxPayConfigStorage();
        wxPayConfigStorage.setMchId(WxPayConstants.MCH_ID);
        wxPayConfigStorage.setAppid(WxPayConstants.APP_ID);
        wxPayConfigStorage.setKeyPublic(WxPayConstants.KEY_PUBLIC);
        wxPayConfigStorage.setSecretKey(WxPayConstants.KEY_PRIVATE);
        wxPayConfigStorage.setNotifyUrl("异步回调地址");
        wxPayConfigStorage.setReturnUrl("同步回调地址");
        wxPayConfigStorage.setSignType("MD5");
        wxPayConfigStorage.setPayType("");
        wxPayConfigStorage.setInputCharset("utf-8");
        //https证书设置，退款必须 方式二
/*
    HttpConfigStorage httpConfigStorage = new HttpConfigStorage();
    httpConfigStorage.setKeystore(WxPayController.class.getResourceAsStream("/证书文件"));
    httpConfigStorage.setStorePassword("证书密码");
    //设置ssl证书对应的存储方式输入流，这里默认为文件地址
    httpConfigStorage.setCertStoreType(CertStoreType.INPUT_STREAM);
    service = new WxPayService(wxPayConfigStorage, httpConfigStorage);
*/
        service = new WxPayService(wxPayConfigStorage);


    }

    /**
     * 跳到支付页面
     * 针对实时支付,即时付款
     *
     * @return
     */
    @RequestMapping(value = "toPay.html", produces = "text/html;charset=UTF-8")
    public String toPay() {

        PayOrder order = new PayOrder("订单title", "摘要", new BigDecimal(0.01), UUID.randomUUID().toString().replace("-", ""));
        //网页支付
        order.setTransactionType(WxTransactionType.MWEB);
        //获取支付订单信息
        Map orderInfo = service.orderInfo(order);
        //组装成html表单信息
        return service.buildRequest(orderInfo, MethodType.POST);
    }


    /**
     * 获取二维码图像
     * 二维码支付
     *
     * @return
     */
    @RequestMapping(value = "toQrPay.jpg", produces = "image/jpeg;charset=UTF-8")
    public byte[] toWxQrPay() throws IOException {
        PayOrder order = new PayOrder("订单title", "摘要", new BigDecimal(0.01), UUID.randomUUID().toString().replace("-", ""));
        //扫码付
        order.setTransactionType(WxTransactionType.NATIVE);
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        ImageIO.write(service.genQrPay(order), "JPEG", baos);
        return baos.toByteArray();
    }

    /**
     * 公众号支付
     *
     * @param openid 微信公众号对应微信付款用户的唯一标识
     * @return 返回jsapi所需参数
     */
    @RequestMapping(value = "jsapi")
    public Map jsapi(String openid) {


        PayOrder order = new PayOrder("订单title", "摘要", new BigDecimal(0.01), UUID.randomUUID().toString().replace("-", ""));
        //公众号支付
        order.setTransactionType(WxTransactionType.JSAPI);
        //微信公众号对应微信付款用户的唯一标识
        order.setOpenid(openid);

        Map orderInfo = service.orderInfo(order);
        orderInfo.put("code", 0);

        return orderInfo;
    }


    /**
     * 支付回调地址
     *
     * @param request
     * @return
     */
    @RequestMapping(value = "payBack.json")
    public String payBack(HttpServletRequest request) throws IOException {

        //获取支付方返回的对应参数
        Map<String, Object> params = service.getParameter2Map(request.getParameterMap(), request.getInputStream());
        if (null == params) {
            return service.getPayOutMessage("fail", "失败").toMessage();
        }

        //校验
        if (service.verify(params)) {
            //这里处理业务逻辑
            return service.getPayOutMessage("success", "成功").toMessage();
        }

        return service.getPayOutMessage("fail", "失败").toMessage();
    }
}
