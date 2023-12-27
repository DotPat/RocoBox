package com.QQ.angel.data.protocol
{
   import com.QQ.angel.api.net.DEFINE;
   import com.QQ.angel.data.protocolBase.I_C2S_CGI;
   import com.QQ.angel.data.protocolBase.ProtocolBase;
   import com.QQ.angel.data.protocolBase.ProtocolUtil;
   
   public class CGI_NEWYEARCLEANING_CMD3_QueryNpcStatus_C2S extends ProtocolBase implements I_C2S_CGI
   {
      
      public static const CGI_NAME:String = "new_year_cleaning?cmd=3";
       
      
      public var uin:uint;
      
      public function CGI_NEWYEARCLEANING_CMD3_QueryNpcStatus_C2S()
      {
         super();
      }
      
      public function get unkown() : String
      {
         return ProtocolUtil.getUnkownKey();
      }
      
      public function encodeCGI() : String
      {
         return (CGI_NAME.indexOf("_fcgi") != -1 ? DEFINE.CGI_ROOT.replace("cgi-bin","fcgi-bin") : DEFINE.CGI_ROOT) + CGI_NAME + "&uin=" + uin + "&unkown=" + unkown;
      }
      
      override public function getProtocolId() : Object
      {
         return CGI_NAME;
      }
   }
}
