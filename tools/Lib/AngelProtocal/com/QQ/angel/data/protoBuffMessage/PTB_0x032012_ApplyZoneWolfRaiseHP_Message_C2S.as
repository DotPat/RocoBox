package com.QQ.angel.data.protoBuffMessage
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import flash.utils.IDataInput;
   import flash.utils.IExternalizable;
   
   public final class PTB_0x032012_ApplyZoneWolfRaiseHP_Message_C2S extends Message implements IExternalizable
   {
       
      
      private var hasField$0:uint = 0;
      
      private var npc_id$field:uint;
      
      public function PTB_0x032012_ApplyZoneWolfRaiseHP_Message_C2S()
      {
         super();
      }
      
      public function get hasNpcId() : Boolean
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
      
      public function set npcId(param1:uint) : void
      {
         hasField$0 |= 1;
         npc_id$field = param1;
      }
      
      final override public function writeToBuffer(param1:WritingBuffer) : void
      {
         if(hasNpcId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,npc_id$field);
         }
      }
      
      public function get npcId() : uint
      {
         if(!hasNpcId)
         {
            return 0;
         }
         return npc_id$field;
      }
      
      public function removeNpcId() : void
      {
         hasField$0 &= 4294967294;
         npc_id$field = new uint();
      }
   }
}
