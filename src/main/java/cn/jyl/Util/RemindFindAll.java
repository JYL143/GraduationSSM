package cn.jyl.Util;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

public class RemindFindAll {


    public static void find(HttpSession session, List<Map<String, Object>> reminds){

        if (reminds.size()==1){  //如果提醒表只有一种提醒
            Integer remind1= (Integer) reminds.get(0).get("remind");
            if (remind1==0){//查询到的提醒第一个是0的话
                Long   number0= (Long ) reminds.get(0).get("number");
                session.setAttribute("number0",number0);
                session.setAttribute("number1",0);
            }else{//查询到的提醒第一个是1的话
                Long  number1= (Long ) reminds.get(0).get("number");
                session.setAttribute("number1",number1);
                session.setAttribute("number0",0);
            }
        }else if (reminds.size()==2){//如果提醒表有2种提醒，和上面差不多
            Integer remind1= (Integer) reminds.get(0).get("remind"); //如果第一个是提醒0
            if (remind1==0){
                Long    number0= (Long ) reminds.get(0).get("number");
                Long    number1= (Long ) reminds.get(1).get("number");
                session.setAttribute("number0",number0);
                session.setAttribute("number1",number1);


            }else{ //如果第一个是提醒1
                Long   number1= (Long ) reminds.get(0).get("number");
                Long   number0= (Long ) reminds.get(1).get("number");
                session.setAttribute("number0",number0);
                session.setAttribute("number1",number1);

            }
        }else { //没有任何消息记录
            session.setAttribute("number0",0);
            session.setAttribute("number1",0);
        }
    }
}
