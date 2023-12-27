package com.QQ.angel.data.protocol
{
   import com.QQ.angel.data.protoBuffMessage.PTB_0x03204F_DreamWinnerQuery_Message_S2C;
   import com.QQ.angel.data.protocolBase.I_S2C_ProtoBuf;
   import com.QQ.angel.data.protocolBase.ProtocolBase;
   import com.QQ.angel.net.protocol.P_ReturnCode;
   import com.tencent.protobuf.Message;
   
   public class PTB_0x03204F_DreamWinnerQuery_S2C extends ProtocolBase implements I_S2C_ProtoBuf
   {
      
      public static const PROTOCOL_ID:int = 204879;
       
      
      public var dailyPresent:uint;
      
      public var cardCount:uint;
      
      public var diceCount:uint;
      
      public var retCode:P_ReturnCode;
      
      public var diceStep:uint;
      
      public var invited:uint;
      
      public var gameCount:uint;
      
      public var gameState:uint;
      
      public function PTB_0x03204F_DreamWinnerQuery_S2C()
      {
         super();
      }
      
      public function readProtoBuf(param1:Message) : Boolean
      {
         var _loc2_:PTB_0x03204F_DreamWinnerQuery_Message_S2C = PTB_0x03204F_DreamWinnerQuery_Message_S2C(param1);
         retCode = new P_ReturnCode();
         retCode.code = _loc2_.retCode.code;
         retCode.message = _loc2_.retCode.message;
         if(retCode.code < 0)
         {
            return false;
         }
         gameCount = _loc2_.gameCount;
         dailyPresent = _loc2_.dailyPresent;
         invited = _loc2_.invited;
         cardCount = _loc2_.cardCount;
         gameState = _loc2_.gameState;
         diceCount = _loc2_.diceCount;
         diceStep = _loc2_.diceStep;
         return true;
      }
      
      override public function getProtocolId() : Object
      {
         return PROTOCOL_ID;
      }
      
      public function getS2CMessage() : Message
      {
         return new PTB_0x03204F_DreamWinnerQuery_Message_S2C();
      }
   }
}
