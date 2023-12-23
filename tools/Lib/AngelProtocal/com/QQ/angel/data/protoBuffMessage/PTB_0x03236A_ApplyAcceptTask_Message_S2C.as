package com.QQ.angel.data.protoBuffMessage
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import flash.utils.IDataInput;
   import flash.utils.IExternalizable;
   
   public final class PTB_0x03236A_ApplyAcceptTask_Message_S2C extends Message implements IExternalizable
   {
       
      
      private var hasField$0:uint = 0;
      
      private var ret_code$field:ReturnCode_Message;
      
      private var question_id$field:uint;
      
      private var user_status$field:uint;
      
      public function PTB_0x03236A_ApplyAcceptTask_Message_S2C()
      {
         super();
      }
      
      public function removeQuestionId() : void
      {
         hasField$0 &= 4294967293;
         question_id$field = new uint();
      }
      
      public function removeUserStatus() : void
      {
         hasField$0 &= 4294967294;
         user_status$field = new uint();
      }
      
      public function set questionId(param1:uint) : void
      {
         hasField$0 |= 2;
         question_id$field = param1;
      }
      
      public function removeRetCode() : void
      {
         ret_code$field = null;
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
      
      public function get hasUserStatus() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function get hasQuestionId() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set retCode(param1:ReturnCode_Message) : void
      {
         ret_code$field = param1;
      }
      
      public function get userStatus() : uint
      {
         if(!hasUserStatus)
         {
            return 0;
         }
         return user_status$field;
      }
      
      public function get questionId() : uint
      {
         if(!hasQuestionId)
         {
            return 0;
         }
         return question_id$field;
      }
      
      final override public function writeToBuffer(param1:WritingBuffer) : void
      {
         if(hasRetCode)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_MESSAGE(param1,ret_code$field);
         }
         if(hasUserStatus)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,user_status$field);
         }
         if(hasQuestionId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,question_id$field);
         }
      }
      
      public function get retCode() : ReturnCode_Message
      {
         return ret_code$field;
      }
      
      public function get hasRetCode() : Boolean
      {
         return ret_code$field != null;
      }
      
      public function set userStatus(param1:uint) : void
      {
         hasField$0 |= 1;
         user_status$field = param1;
      }
   }
}
