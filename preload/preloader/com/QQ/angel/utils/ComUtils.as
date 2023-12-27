package com.QQ.angel.utils
{
   public class ComUtils
   {
       
      
      public function ComUtils()
      {
         super();
      }
      
      public static function convertArrayToXML(param1:Array) : XML
      {
         var _loc3_:uint = 0;
         var _loc2_:* = "<data><list>";
         var _loc4_:uint = param1.length;
         while(_loc3_ < _loc4_)
         {
            _loc2_ += "<file path=\"" + param1[_loc3_] + "\" />";
            _loc3_++;
         }
         _loc2_ += "</list></data>";
         return XML(_loc2_);
      }
   }
}
