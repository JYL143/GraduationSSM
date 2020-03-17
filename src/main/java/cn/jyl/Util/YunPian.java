package cn.jyl.Util;

import com.yunpian.sdk.YunpianClient;
import com.yunpian.sdk.model.Result;
import com.yunpian.sdk.model.SmsSingleSend;

import java.util.Map;
import java.util.Random;

/**
 * 云片网接口发送手机短信验证码
 * 改造生成验证码并返回
 */
public class YunPian {

    public static Integer send(String phone) {
        Random random = new Random();
        Integer yzm = random.nextInt(900000) + 100000; // 生成6位随机的验证码

        //初始化clnt,使用单例方式
        YunpianClient clnt = new YunpianClient("16000efcc961dee88737d6f94bb7c3d9").init();

        //发送短信API
        Map<String, String> param = clnt.newParam(2);
        param.put(YunpianClient.MOBILE, phone);
        param.put(YunpianClient.TEXT, "【江云炼】您的验证码是"+yzm+"。如非本人操作，请忽略本短信");

        Result<SmsSingleSend> r = clnt.sms().single_send(param);
        //获取返回结果，返回码:r.getCode(),返回码描述:r.getMsg(),API结果:r.getData(),其他说明:r.getDetail(),调用异常:r.getThrowable()
        //账户:clnt.user().* 签名:clnt.sign().* 模版:clnt.tpl().* 短信:clnt.sms().* 语音:clnt.voice().* 流量:clnt.flow().* 隐私通话:clnt.call().*

        //释放clnt
        clnt.close();
        System.out.println("返回结果："+r+"验证码："+yzm);
        return yzm;
    }
}
