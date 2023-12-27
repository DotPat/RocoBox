package com.QQ.angel.managers
{
   public class VersionFileItem
   {
       
      
      public var path:String;
      
      public var version:String;
      
      public function VersionFileItem()
      {
         super();
      }
      
      public function initWithXML(param1:XML) : Boolean
      {
         var node:XML = null;
         var itemNode:XML = param1;
         try
         {
            node = itemNode;
            path = node.@path;
            version = node.@version;
            return true;
         }
         catch(error:Error)
         {
         }
         return false;
      }
      
      public function forEach(param1:Function, param2:Array = null) : *
      {
         if(param2)
         {
            param2 = param2.concat(this);
         }
         else
         {
            param2 = [this];
         }
         return param1.apply(null,param2);
      }
      
      public function dispose() : void
      {
      }
   }
}
