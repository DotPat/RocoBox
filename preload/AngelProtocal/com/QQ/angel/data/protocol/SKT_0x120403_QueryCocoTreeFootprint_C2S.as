package com.QQ.angel.data.protocol
{
   import com.QQ.angel.data.protocolBase.I_C2S_Socket;
   import com.QQ.angel.data.protocolBase.ProtocolBase;
   import flash.utils.IDataOutput;
   
   public class SKT_0x120403_QueryCocoTreeFootprint_C2S extends ProtocolBase implements I_C2S_Socket
   {
      
      public static const PROTOCOL_ID:int = 1180675;
       
      
      public function SKT_0x120403_QueryCocoTreeFootprint_C2S()
      {
         super();
      }
      
      public function writeData(param1:IDataOutput) : Boolean
      {
         return true;
      }
      
      override public function getProtocolId() : Object
      {
         return PROTOCOL_ID;
      }
   }
}
