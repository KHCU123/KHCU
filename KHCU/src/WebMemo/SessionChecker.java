package WebMemo;
import javax.servlet.http.*;

public class SessionChecker{

 public void setSession(HttpSession session){
  if(session.getAttribute("listener") == null) {
   session.setAttribute("listener", new CustomBindingListener());
  }  
 }
}

class CustomBindingListener implements HttpSessionBindingListener {
 
 public void valueBound(HttpSessionBindingEvent event) {

  System.out.println("BOUND as " + event.getName() + " to " + event.getSession().getId());

  //DB user table�� �ش�user�� sessionID�� �����Ѵ�. => login
 }

 public void valueUnbound(HttpSessionBindingEvent event) {

  System.out.println("UNBOUND as " + event.getName() + " to " + event.getSession().getId());
  
  //DB user table�� �ش�user�� sessionID�� �����Ѵ�. => logout
 }
}
