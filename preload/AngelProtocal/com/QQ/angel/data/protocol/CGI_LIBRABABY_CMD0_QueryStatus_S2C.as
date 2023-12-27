package com.QQ.angel.data.protocol
{
   import com.QQ.angel.data.protocolBase.I_S2C_CGI;
   import com.QQ.angel.data.protocolBase.ProtocolBase;
   import com.QQ.angel.net.protocol.P_ReturnCode;
   
   public class CGI_LIBRABABY_CMD0_QueryStatus_S2C extends ProtocolBase implements I_S2C_CGI
   {
      
      public static const CGI_NAME:String = "libra_baby?cmd=0";
       
      
      public var lightMinusDark:int;
      
      public var isScenceFlashFinished:Boolean;
      
      public var retCode:P_ReturnCode;
      
      public function CGI_LIBRABABY_CMD0_QueryStatus_S2C()
      {
         super();
      }
      
      public function decodeCGI(param1:XML) : Boolean
      {
         if(int(param1.result.@value) == 0)
         {
            retCode = new P_ReturnCode();
            retCode.code = int(param1.result.@value);
            if(param1.result.msg != undefined)
            {
               retCode.message = param1.result.msg.text();
            }
            isScenceFlashFinished = Boolean(param1.isScenceFlashFinished.text());
            lightMinusDark = int(param1.lightMinusDark.text());
            return true;
         }
         retCode = new P_ReturnCode();
         retCode.code = int(param1.result.@value);
         if(param1.result.msg != undefined)
         {
            retCode.message = param1.result.msg.text();
         }
         return false;
      }
      
      override public function getProtocolId() : Object
      {
         return CGI_NAME;
      }
   }
}
