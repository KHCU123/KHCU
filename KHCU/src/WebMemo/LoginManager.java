package WebMemo;

  import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
  import javax.servlet.http.HttpSessionBindingListener;
  import javax.servlet.http.HttpSessionBindingEvent;
  import java.util.Hashtable;
import java.util.List;
import java.util.Enumeration;
import java.util.HashMap;

  public class LoginManager implements HttpSessionBindingListener
  {  
      private static LoginManager loginManager = null;
      private static Hashtable loginUsers = new Hashtable();
      private LoginManager()
     {
                    super();
     }
      public static synchronized LoginManager getInstance()
      {
          if(loginManager == null)
          {
              loginManager = new LoginManager();
          }
          return loginManager;
      }
      //���̵� �´��� üũ
      public boolean isValid(String userID, String userPW)
      {    	  
          return true;   //�ڼ��� ������ �̱���
      }
      //�ش� ���ǿ� �̹� �α��� ���ִ��� üũ
      public boolean isLogin(String sessionID)
      {
          boolean isLogin = false;
          Enumeration e = loginUsers.keys();
          String key = "";
          while(e.hasMoreElements())
          {
              key = (String)e.nextElement();
              if(sessionID.equals(key))
              {
                  isLogin = true;
              }
          }
          return isLogin;
      }
      //�ߺ� �α��� ���� ���� ���̵� ��������� üũ
      public boolean isUsing(String userID)
      {
          boolean isUsing = false;
          Enumeration e = loginUsers.keys();
          String key = "";
          while(e.hasMoreElements())
          {
              key = (String)e.nextElement();
              if(userID.equals(loginUsers.get(key)))
              {
                  isUsing = true;
              }
          }
          return isUsing;
      }
      //���� ����
      public void setSession(HttpSession session, String userID)
      {
          loginUsers.put(session.getId(), userID);
          session.setAttribute("login", this.getInstance());
      }
      //���� ������ ��
      public void valueBound(HttpSessionBindingEvent event)
      {
      }
      //���� ���涧
      public void valueUnbound(HttpSessionBindingEvent event)
      {
         loginUsers.remove(event.getSession().getId());
      }
      //���� ID�� �α�� ID ����
      public String getUserID(String sessionID)
     {
          return (String)loginUsers.get(sessionID);
      }
      //���� �����ڼ�
      public int getUserCount()
      {
    	  
    	 getUserList(); 
          return loginUsers.size();
      }
      
      public void getUserList()
      {

          Enumeration e = loginUsers.keys();
          String key = "";
          String list="";

          while(e.hasMoreElements())
          {
           key = (String)e.nextElement();
           list = list + loginUsers.get(key) + ",";

          }          
          System.out.println("----------------------------");  
          System.out.println(list);  
          System.out.println("============================");  
      }
  };
