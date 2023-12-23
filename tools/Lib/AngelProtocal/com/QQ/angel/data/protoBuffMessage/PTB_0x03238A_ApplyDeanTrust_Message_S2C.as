package com.QQ.angel.data.protoBuffMessage
{
   import com.tencent.protobuf.*;
   import flash.utils.IDataInput;
   import flash.utils.IExternalizable;
   
   public final class PTB_0x03238A_ApplyDeanTrust_Message_S2C extends Message implements IExternalizable
   {
       
      
      private var hasField$0:uint = 0;
      
      private var dean_item_num$field:uint;
      
      private var has_king_trust$field:uint;
      
      private var has_accpted_repair_book$field:uint;
      
      private var has_accpted_catch_spirit$field:uint;
      
      private var has_catch_spirit$field:uint;
      
      private var catch_spirit_id$field:uint;
      
      private var has_get_spirit$field:uint;
      
      private var king_item_num$field:uint;
      
      private var ret_code$field:ReturnCode_Message;
      
      private var has_dean_trust$field:uint;
      
      public var rewardArray:Array;
      
      public function PTB_0x03238A_ApplyDeanTrust_Message_S2C()
      {
         rewardArray = [];
         super();
      }
      
      public function get hasAccptedCatchSpirit() : uint
      {
         if(!hasHasAccptedCatchSpirit)
         {
            return 0;
         }
         return has_accpted_catch_spirit$field;
      }
      
      public function set hasAccptedCatchSpirit(param1:uint) : void
      {
         hasField$0 |= 8;
         has_accpted_catch_spirit$field = param1;
      }
      
      public function get hasKingTrust() : uint
      {
         if(!hasHasKingTrust)
         {
            return 0;
         }
         return has_king_trust$field;
      }
      
      public function get hasHasAccptedCatchSpirit() : Boolean
      {
         return (hasField$0 & 8) != 0;
      }
      
      public function removeRetCode() : void
      {
         ret_code$field = null;
      }
      
      public function removeHasAccptedRepairBook() : void
      {
         hasField$0 &= 4294967279;
         has_accpted_repair_book$field = new uint();
      }
      
      public function set catchSpiritId(param1:uint) : void
      {
         hasField$0 |= 2;
         catch_spirit_id$field = param1;
      }
      
      public function get hasDeanTrust() : uint
      {
         if(!hasHasDeanTrust)
         {
            return 0;
         }
         return has_dean_trust$field;
      }
      
      public function removeHasGetSpirit() : void
      {
         hasField$0 &= 4294967294;
         has_get_spirit$field = new uint();
      }
      
      public function get hasCatchSpirit() : uint
      {
         if(!hasHasCatchSpirit)
         {
            return 0;
         }
         return has_catch_spirit$field;
      }
      
      public function set hasKingTrust(param1:uint) : void
      {
         hasField$0 |= 32;
         has_king_trust$field = param1;
      }
      
      public function removeDeanItemNum() : void
      {
         hasField$0 &= 4294967167;
         dean_item_num$field = new uint();
      }
      
      public function get hasHasAccptedRepairBook() : Boolean
      {
         return (hasField$0 & 16) != 0;
      }
      
      public function removeCatchSpiritId() : void
      {
         hasField$0 &= 4294967293;
         catch_spirit_id$field = new uint();
      }
      
      public function set hasCatchSpirit(param1:uint) : void
      {
         hasField$0 |= 4;
         has_catch_spirit$field = param1;
      }
      
      public function get deanItemNum() : uint
      {
         if(!hasDeanItemNum)
         {
            return 0;
         }
         return dean_item_num$field;
      }
      
      public function get hasHasGetSpirit() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      final override public function writeToBuffer(param1:WritingBuffer) : void
      {
         if(hasRetCode)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_MESSAGE(param1,ret_code$field);
         }
         if(hasHasGetSpirit)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,has_get_spirit$field);
         }
         if(hasCatchSpiritId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,catch_spirit_id$field);
         }
         if(hasHasCatchSpirit)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,has_catch_spirit$field);
         }
         if(hasHasAccptedCatchSpirit)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,has_accpted_catch_spirit$field);
         }
         if(hasHasAccptedRepairBook)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_UINT32(param1,has_accpted_repair_book$field);
         }
         if(hasHasKingTrust)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,7);
            WriteUtils.write$TYPE_UINT32(param1,has_king_trust$field);
         }
         if(hasHasDeanTrust)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,8);
            WriteUtils.write$TYPE_UINT32(param1,has_dean_trust$field);
         }
         if(hasDeanItemNum)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,9);
            WriteUtils.write$TYPE_UINT32(param1,dean_item_num$field);
         }
         if(hasKingItemNum)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,10);
            WriteUtils.write$TYPE_UINT32(param1,king_item_num$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < rewardArray.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,11);
            WriteUtils.write$TYPE_MESSAGE(param1,rewardArray[_loc2_]);
            _loc2_++;
         }
      }
      
      public function removeHasKingTrust() : void
      {
         hasField$0 &= 4294967263;
         has_king_trust$field = new uint();
      }
      
      public function get retCode() : ReturnCode_Message
      {
         return ret_code$field;
      }
      
      public function set hasDeanTrust(param1:uint) : void
      {
         hasField$0 |= 64;
         has_dean_trust$field = param1;
      }
      
      public function get hasDeanItemNum() : Boolean
      {
         return (hasField$0 & 128) != 0;
      }
      
      public function removeHasDeanTrust() : void
      {
         hasField$0 &= 4294967231;
         has_dean_trust$field = new uint();
      }
      
      public function removeHasCatchSpirit() : void
      {
         hasField$0 &= 4294967291;
         has_catch_spirit$field = new uint();
      }
      
      public function removeKingItemNum() : void
      {
         hasField$0 &= 4294967039;
         king_item_num$field = new uint();
      }
      
      public function get hasRetCode() : Boolean
      {
         return ret_code$field != null;
      }
      
      public function set kingItemNum(param1:uint) : void
      {
         hasField$0 |= 256;
         king_item_num$field = param1;
      }
      
      public function set hasAccptedRepairBook(param1:uint) : void
      {
         hasField$0 |= 16;
         has_accpted_repair_book$field = param1;
      }
      
      public function get hasHasKingTrust() : Boolean
      {
         return (hasField$0 & 32) != 0;
      }
      
      public function get catchSpiritId() : uint
      {
         if(!hasCatchSpiritId)
         {
            return 0;
         }
         return catch_spirit_id$field;
      }
      
      public function get hasHasCatchSpirit() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
      
      public function get hasCatchSpiritId() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function get hasHasDeanTrust() : Boolean
      {
         return (hasField$0 & 64) != 0;
      }
      
      public function set deanItemNum(param1:uint) : void
      {
         hasField$0 |= 128;
         dean_item_num$field = param1;
      }
      
      public function set hasGetSpirit(param1:uint) : void
      {
         hasField$0 |= 1;
         has_get_spirit$field = param1;
      }
      
      public function set retCode(param1:ReturnCode_Message) : void
      {
         ret_code$field = param1;
      }
      
      public function removeHasAccptedCatchSpirit() : void
      {
         hasField$0 &= 4294967287;
         has_accpted_catch_spirit$field = new uint();
      }
      
      public function get hasAccptedRepairBook() : uint
      {
         if(!hasHasAccptedRepairBook)
         {
            return 0;
         }
         return has_accpted_repair_book$field;
      }
      
      public function get kingItemNum() : uint
      {
         if(!hasKingItemNum)
         {
            return 0;
         }
         return king_item_num$field;
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
      
      public function get hasGetSpirit() : uint
      {
         if(!hasHasGetSpirit)
         {
            return 0;
         }
         return has_get_spirit$field;
      }
      
      public function get hasKingItemNum() : Boolean
      {
         return (hasField$0 & 256) != 0;
      }
   }
}
