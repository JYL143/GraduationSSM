package cn.jyl.config;


import java.io.FileWriter;
import java.io.IOException;

public class AlipayConfig {

    //↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

    // 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
    public static String app_id = "2016101600700965";

    // 商户私钥，您的PKCS8格式RSA2私钥
    public static String merchant_private_key = "MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQC+7pMlXqs8Ctk7vyrWSy5qFxHeh7ffxoHftUM/iD4DzLuasnqBnt5pnu7aluolO0ha4VW2DibMCImMSWPB3gEcXkxS0hBjtGGk9sCUEwyXxF1tqR7R/bXCRqBrsINuItIbTzn8Ic6/4t8otJ9z4QZIA9zUBXStkIC1+9ngrpF1a9NNy0o8BeC1zXn2e8KAC8HXo2794kxsgrM9+P1hxNRATy9u+EDzAHzKHRXn5CNLvYepIn9zN20gAunEjzBEo2G+/mBsio+1p9wYTaN39EAcvPITA0AFTcZWrLgssZr6DcUnkl0vAJPE2hmlcEQJ8hYlxaZpNhnvHmzfC/vlvO4tAgMBAAECggEBAJpdFhgbbsNvXewBBWgVhmP9XNQV0+IWgn/T85eU1daKmo5ah9LuF5E7Do8pfgo14KyhC4PR8yn4KQSDfSSLEUjXMEuxS9DgUCVn3ZCZyg+VkZeMKL/LqDx2j1IhdlD/0/CCYDXpO1dF2/fz+Apevo5QmSPNeWSttHHtOVx+pllQOGh1aPJguVbTaWcWwSjchF2bUSXVaMV6lS2ELYQr1BF2HHkLVFtI9CaA7y7ZjQey8T9iKV5iCsLbUvxXNrRtcthbA9WIW95QwEnVMQA5gVzNyiqDTuh9/gBVbGxhgbtnHXV54fP1jQjCVSKkAlF8LRPYNNlw04NF3rFYeAdPG8ECgYEA+ftIhF9sa7sATNkJpc/r6tplsQlx4mIji54bhO28naEiHjVNTSjzXUplfrdq3VohnwRTAA1tAuRZMjyID3/p51VSE+zrczPRdGNu0AfwrdOpD59UqarRsI/rmVghKUSA5pdKSpVujC/E0gXFpR9+xd0NNSh98X21Wt6CbPi3QxECgYEAw4dZf/H+wvVWky3hxx0Ch83jfV7mVwTrhJo61J0OHwcj/nL3Vlci0wSalpiazgc3Q0v0zGe4qIbcYt6fc8a9ERN+RcK8WZlUlAm+eYF7f1qbF0sL2ohSeStpuABS8BujD7eM/2A6IkyjEmxulYQcYaw4XTkO3sGn6OJvmzB+gV0CgYAGE4aSuSMQh04dkBT8883fOonIQNuEzi/g/+nZVFIGXtlOdKs5Wep4dQt8hgbR9JPmoptF4A2rSVOltfT0s35DAj7pfxPGDBdmRdh2tAq0nvV4DL5pFV7ddNIcOxkrQKAFet3ybClwvOSC2mMQfXB+bL4aca6GBTE4UTpIXc9OkQKBgDf+etL5KkwKllBvw0iSNjdN7ufoVW52Kjw/LrnUgEbCdLxZkBtZuM9Vci/OZAa8akcLaX9f9LHObS6jMmalc1+AhZjUu7us/VunrrR9MDC4cdGp3Cso/vVUSWI4NYgtYfUOS4KWvA82gzyzcLfAraALAdkwjeGc88jtj6iRqqjBAoGAM8MZwHz8VQnbni+hPRqWm0kFs+BMVZahEH0N/n6dn97CsGxr8zwTLdsu5uJRi0NI3tIwEFE1GcNuw4NgrOzWjo/EFyHGL9QGcrKili7Ali6gXBAo5voexY0+bgjQn2bPKVxMc/jqSMRr5CB9x8wv5LN79VHKJzqTu9keVt7S6TI=";

    // 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAtszgUMFJJYQ2CD/YDB5kZJ/WWQTmqj1AlFdRNbMpeFdLeAtb/9UfERfHcw3u2m5RI9yVusyvlfivi45+l+ilz6Gp7fL4QGfkL+eb7mX8nU7qV6PlrMn7S/Fb6TqwFPNrnQY6tf/8O3XMEG3ib30cuIKaXxjOKzaqz8qnTq8SYBHGVtxdK2PMhCPKAuvK2tnbvi9DpfEgdJotNmV478tqx+K32psHjEgN4bYNM9uIGNDI+7ya4bIrduhZ6SmbOSEhGT3iqQK3C6IZq0UifL6sU/k7dK1FGZlEXtjO3b1tzpT8VuiF0EH+GMBn+6nrVCOFrHPDW0RtTpgPlz7I9btiyQIDAQAB";

    // 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
    public static String notify_url = "http://localhost:8081/cart/error";

    // 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
    public static String return_url = "http://localhost:8081/cart/success";

    // 签名方式
    public static String sign_type = "RSA2";

    // 字符编码格式
    public static String charset = "utf-8";

    // 支付宝网关
    public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";

    // 支付宝网关
    public static String log_path = "C:\\";


//↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

    /**
     * 写日志，方便测试（看网站需求，也可以改成把记录存入数据库）
     * @param sWord 要写入日志里的文本内容
     */
    public static void logResult(String sWord) {
        FileWriter writer = null;
        try {
            writer = new FileWriter(log_path + "alipay_log_" + System.currentTimeMillis()+".txt");
            writer.write(sWord);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
