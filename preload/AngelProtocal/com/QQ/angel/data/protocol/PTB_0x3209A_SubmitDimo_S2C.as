package com.QQ.angel.data.protocol
{
   import com.QQ.angel.data.protoBuffMessage.PTB_0x3209A_SubmitDimo_Message_S2C;
   import com.QQ.angel.data.protocolBase.I_S2C_ProtoBuf;
   import com.QQ.angel.data.protocolBase.ProtocolBase;
   import com.QQ.angel.data.struct.ItemInfoChanged32;
   import com.QQ.angel.net.protocol.P_ReturnCode;
   import com.tencent.protobuf.Message;
   
   public class PTB_0x3209A_SubmitDimo_S2C extends ProtocolBase implements I_S2C_ProtoBuf
   {
      
      public static const PROTOCOL_ID:int = 204954;
       
      
      public var rewards:Array;
      
      public var retCode:P_ReturnCode;
      
      public function PTB_0x3209A_SubmitDimo_S2C()
      {
         super();
      }
      
      public function getS2CMessage() : Message
      {
         return new PTB_0x3209A_SubmitDimo_Message_S2C();
      }
      
      public function readProtoBuf(param1:Message) : Boolean
      {
         var _loc2_:PTB_0x3209A_SubmitDimo_Message_S2C = PTB_0x3209A_SubmitDimo_Message_S2C(param1);
         retCode = new P_ReturnCode();
         retCode.code = _loc2_.retCode.code;
         retCode.message = _loc2_.retCode.message;
         if(retCode.code < 0)
         {
            return false;
         }
         if(!rewards)
         {
            rewards = new Array(0);
         }
         rewards.length = 0;
         var _loc3_:Array = _loc2_.rewards as Array;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_.length)
         {
            rewards[_loc4_] = new ItemInfoChanged32();
            rewards[_loc4_].readProtoBuf(_loc3_[_loc4_] as Message);
            _loc4_++;
         }
         return true;
      }
      
      override public function getProtocolId() : Object
      {
         return PROTOCOL_ID;
      }
   }
}
