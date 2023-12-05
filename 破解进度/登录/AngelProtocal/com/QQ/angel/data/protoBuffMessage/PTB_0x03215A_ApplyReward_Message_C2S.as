package com.QQ.angel.data.protoBuffMessage
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import flash.utils.IDataInput;
   import flash.utils.IExternalizable;
   
   public final class PTB_0x03215A_ApplyReward_Message_C2S extends Message implements IExternalizable
   {
       
      
      private var hasField$0:uint = 0;
      
      private var reward_index$field:uint;
      
      public function PTB_0x03215A_ApplyReward_Message_C2S()
      {
         super();
      }
      
      public function get rewardIndex() : uint
      {
         if(!hasRewardIndex)
         {
            return 0;
         }
         return reward_index$field;
      }
      
      public function set rewardIndex(param1:uint) : void
      {
         hasField$0 |= 1;
         reward_index$field = param1;
      }
      
      public function get hasRewardIndex() : Boolean
      {
         return (hasField$0 & 1) != 0;
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
      
      final override public function writeToBuffer(param1:WritingBuffer) : void
      {
         if(hasRewardIndex)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,reward_index$field);
         }
      }
      
      public function removeRewardIndex() : void
      {
         hasField$0 &= 4294967294;
         reward_index$field = new uint();
      }
   }
}
