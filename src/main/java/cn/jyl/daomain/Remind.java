package cn.jyl.daomain;

import lombok.Data;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Data
public class Remind implements Serializable {

    private Integer remindid; //主键id
    private Integer userid;   //用户id
    private Integer orderid;  //订单id
    private Integer remind;   //提醒消息   0 提醒受理 1提醒发货
    private Date   remindtime;//提醒时间

    private Orders orders;    // 多对1（订单1）
    private List<User> users; // 多对多

    private SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  //将实体类的data类型转成datatime
    private String remindtimeStr;    //data转datatime保存的字符串


    public void setRemindtime(Date remindtime) {
        this.remindtime = remindtime;
        String time = sdf.format(remindtime);
        setRemindtimeStr(time);
    }


}
