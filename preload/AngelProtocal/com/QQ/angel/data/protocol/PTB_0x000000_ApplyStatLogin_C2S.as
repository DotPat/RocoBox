package com.QQ.angel.data.protocol
{
   import com.QQ.angel.data.protoBuffMessage.PTB_0x000000_ApplyStatLogin_Message_C2S;
   import com.QQ.angel.data.protocolBase.I_C2S_ProtoBuf;
   import com.QQ.angel.data.protocolBase.ProtocolBase;
   import com.tencent.protobuf.Message;
   
   public class PTB_0x000000_ApplyStatLogin_C2S extends ProtocolBase implements I_C2S_ProtoBuf
   {
      
      public static const PROTOCOL_ID:int = 0;
       
      
      public var key:String;
      
      public function PTB_0x000000_ApplyStatLogin_C2S()
      {
         super();
      }
      
      override public function getProtocolId() : Object
      {
         return PROTOCOL_ID;
      }
      
      public function writeProtoBuf() : Message
      {
         var _loc1_:PTB_0x000000_ApplyStatLogin_Message_C2S = new PTB_0x000000_ApplyStatLogin_Message_C2S();
         _loc1_.key = key;
         return _loc1_;
      }
   }
}
