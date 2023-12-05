package com.QQ.angel.data.protoBuffMessage
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import flash.utils.IDataInput;
   import flash.utils.IExternalizable;
   
   public final class PTB_0x032013_QueryZoneWolfScore_Message_S2C extends Message implements IExternalizable
   {
       
      
      private var ret_code$field:ReturnCode_Message;
      
      private var hasField$0:uint = 0;
      
      private var score$field:uint;
      
      public function PTB_0x032013_QueryZoneWolfScore_Message_S2C()
      {
         super();
      }
      
      public function set score(param1:uint) : void
      {
         hasField$0 |= 1;
         score$field = param1;
      }
      
      public function removeRetCode() : void
      {
         ret_code$field = null;
      }
      
      public function get retCode() : ReturnCode_Message
      {
         return ret_code$field;
      }
      
      public function get score() : uint
      {
         if(!hasScore)
         {
            return 0;
         }
         return score$field;
      }
      
      public function get hasRetCode() : Boolean
      {
         return ret_code$field != null;
      }
      
      public function removeScore() : void
      {
         hasField$0 &= 4294967294;
         score$field = new uint();
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
         if(hasRetCode)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_MESSAGE(param1,ret_code$field);
         }
         if(hasScore)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,score$field);
         }
      }
      
      public function set retCode(param1:ReturnCode_Message) : void
      {
         ret_code$field = param1;
      }
      
      public function get hasScore() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
   }
}
