package com.QQ.angel.data.protoBuffMessage
{
   import com.tencent.protobuf.*;
   import flash.utils.IDataInput;
   import flash.utils.IExternalizable;
   
   public final class PTB_0x03236C_ApplyReward_Message_S2C extends Message implements IExternalizable
   {
       
      
      private var hasField$0:uint = 0;
      
      private var send_mail_flag$field:uint;
      
      private var max_play_count$field:uint;
      
      private var has_play_count$field:uint;
      
      private var ret_code$field:ReturnCode_Message;
      
      public var rewardArray:Array;
      
      public function PTB_0x03236C_ApplyReward_Message_S2C()
      {
         rewardArray = [];
         super();
      }
      
      public function get hasPlayCount() : uint
      {
         if(!hasHasPlayCount)
         {
            return 0;
         }
         return has_play_count$field;
      }
      
      public function set hasPlayCount(param1:uint) : void
      {
         hasField$0 |= 1;
         has_play_count$field = param1;
      }
      
      public function removeRetCode() : void
      {
         ret_code$field = null;
      }
      
      public function removeSendMailFlag() : void
      {
         hasField$0 &= 4294967291;
         send_mail_flag$field = new uint();
      }
      
      final override public function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         /*
          * 反编译出错
          * 代码可能被加密
          * 提示:您可以尝试在"设置"中启用"自动反混淆"
          * 错误类型: NullPointerException (Cannot invoke "com.jpexs.decompiler.flash.SWF.getAbcIndex()" because the return value of "com.jpexs.decompiler.flash.abc.ABC.getSwf()" is null)
          */
         throw new flash.errors.IllegalOperationError("由于错误未反编译");
      }
      
      public function set sendMailFlag(param1:uint) : void
      {
         hasField$0 |= 4;
         send_mail_flag$field = param1;
      }
      
      final override public function writeToBuffer(param1:WritingBuffer) : void
      {
         if(hasRetCode)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_MESSAGE(param1,ret_code$field);
         }
         if(hasHasPlayCount)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,has_play_count$field);
         }
         if(hasMaxPlayCount)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,max_play_count$field);
         }
         if(hasSendMailFlag)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,send_mail_flag$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < rewardArray.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,5);
            WriteUtils.write$TYPE_MESSAGE(param1,rewardArray[_loc2_]);
            _loc2_++;
         }
      }
      
      public function removeMaxPlayCount() : void
      {
         hasField$0 &= 4294967293;
         max_play_count$field = new uint();
      }
      
      public function set retCode(param1:ReturnCode_Message) : void
      {
         ret_code$field = param1;
      }
      
      public function removeHasPlayCount() : void
      {
         hasField$0 &= 4294967294;
         has_play_count$field = new uint();
      }
      
      public function get sendMailFlag() : uint
      {
         if(!hasSendMailFlag)
         {
            return 0;
         }
         return send_mail_flag$field;
      }
      
      public function get hasSendMailFlag() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
      
      public function get retCode() : ReturnCode_Message
      {
         return ret_code$field;
      }
      
      public function get hasMaxPlayCount() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function get hasRetCode() : Boolean
      {
         return ret_code$field != null;
      }
      
      public function set maxPlayCount(param1:uint) : void
      {
         hasField$0 |= 2;
         max_play_count$field = param1;
      }
      
      public function get maxPlayCount() : uint
      {
         if(!hasMaxPlayCount)
         {
            return 0;
         }
         return max_play_count$field;
      }
      
      public function get hasHasPlayCount() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
   }
}
