package com.QQ.angel.data.protoBuffMessage
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import flash.utils.IDataInput;
   import flash.utils.IExternalizable;
   
   public final class PTB_0x3218A_OnChallengeUnsproutGameStart_Message_S2C extends Message implements IExternalizable
   {
       
      
      private var scene_id$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var jump_out_duration$field:uint;
      
      private var total_time$field:uint;
      
      public function PTB_0x3218A_OnChallengeUnsproutGameStart_Message_S2C()
      {
         super();
      }
      
      public function get sceneId() : uint
      {
         if(!hasSceneId)
         {
            return 0;
         }
         return scene_id$field;
      }
      
      public function get hasSceneId() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set sceneId(param1:uint) : void
      {
         hasField$0 |= 1;
         scene_id$field = param1;
      }
      
      public function removeJumpOutDuration() : void
      {
         hasField$0 &= 4294967291;
         jump_out_duration$field = new uint();
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
      
      public function removeTotalTime() : void
      {
         hasField$0 &= 4294967293;
         total_time$field = new uint();
      }
      
      final override public function writeToBuffer(param1:WritingBuffer) : void
      {
         if(hasSceneId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,scene_id$field);
         }
         if(hasTotalTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,total_time$field);
         }
         if(hasJumpOutDuration)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,jump_out_duration$field);
         }
      }
      
      public function set totalTime(param1:uint) : void
      {
         hasField$0 |= 2;
         total_time$field = param1;
      }
      
      public function removeSceneId() : void
      {
         hasField$0 &= 4294967294;
         scene_id$field = new uint();
      }
      
      public function set jumpOutDuration(param1:uint) : void
      {
         hasField$0 |= 4;
         jump_out_duration$field = param1;
      }
      
      public function get totalTime() : uint
      {
         if(!hasTotalTime)
         {
            return 0;
         }
         return total_time$field;
      }
      
      public function get jumpOutDuration() : uint
      {
         if(!hasJumpOutDuration)
         {
            return 0;
         }
         return jump_out_duration$field;
      }
      
      public function get hasTotalTime() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function get hasJumpOutDuration() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
   }
}
