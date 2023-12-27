package com.QQ.angel.data.protocol
{
   import com.QQ.angel.api.net.DEFINE;
   import com.QQ.angel.data.protocolBase.I_C2S_CGI;
   import com.QQ.angel.data.protocolBase.ProtocolBase;
   
   public class CGI_INVITEFRIENDAPRIL_CMD1_ApplyGift_C2S extends ProtocolBase implements I_C2S_CGI
   {
      
      public static const CGI_NAME:String = "invite_friend_april?cmd=1";
       
      
      public var type:uint;
      
      public function CGI_INVITEFRIENDAPRIL_CMD1_ApplyGift_C2S()
      {
         super();
      }
      
      public function encodeCGI() : String
      {
         return (CGI_NAME.indexOf("_fcgi") != -1 ? DEFINE.CGI_ROOT.replace("cgi-bin","fcgi-bin") : DEFINE.CGI_ROOT) + CGI_NAME + "&type=" + type;
      }
      
      override public function getProtocolId() : Object
      {
         return CGI_NAME;
      }
   }
}
