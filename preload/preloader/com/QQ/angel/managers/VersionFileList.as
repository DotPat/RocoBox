package com.QQ.angel.managers
{
   public class VersionFileList
   {
       
      
      private var _fileItems:Array;
      
      public function VersionFileList()
      {
         super();
         _fileItems = [];
      }
      
      public function initWithXML(param1:XML) : Boolean
      {
         var listNode:XML = null;
         var itemNode:XML = null;
         var item:VersionFileItem = null;
         var xml:XML = param1;
         try
         {
            listNode = xml;
            for each(itemNode in listNode.children())
            {
               item = new VersionFileItem();
               if(item.initWithXML(itemNode))
               {
                  _fileItems.push(item);
               }
            }
            return true;
         }
         catch(e:Error)
         {
         }
         return false;
      }
      
      public function forEach(param1:Function, param2:Array = null) : *
      {
         var _loc3_:VersionFileItem = null;
         var _loc4_:* = undefined;
         for each(_loc3_ in _fileItems)
         {
            if(_loc4_ = _loc3_.forEach(param1,param2))
            {
               break;
            }
         }
         return _loc4_;
      }
      
      public function dispose() : void
      {
         _fileItems = [];
      }
   }
}
