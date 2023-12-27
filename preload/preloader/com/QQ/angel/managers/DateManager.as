package com.QQ.angel.managers
{
   public class DateManager
   {
      
      private static var _instance:DateManager;
       
      
      private var _timeDurations:Array;
      
      public function DateManager()
      {
         super();
      }
      
      public static function getInstance() : DateManager
      {
         if(_instance == null)
         {
            _instance = new DateManager();
         }
         return _instance;
      }
      
      public function initialize(param1:XML) : void
      {
         var curDate:Date = null;
         var durationStr:String = null;
         var preloadListXML:XML = param1;
         curDate = new Date();
         durationStr = String(preloadListXML.time.(@day.indexOf(curDate.day) != -1).@duration);
         _timeDurations = durationStr.split("|");
      }
      
      public function checkTime() : Boolean
      {
         var _loc1_:uint = 0;
         var _loc2_:uint = 0;
         var _loc3_:Array = null;
         var _loc4_:Date = new Date();
         var _loc5_:uint = 0;
         while(_loc5_ < _timeDurations.length)
         {
            _loc3_ = _timeDurations[_loc5_].split("-");
            _loc1_ = uint(_loc3_[0].split(":")[0]);
            _loc2_ = uint(_loc3_[1].split(":")[0]);
            if(_loc2_ < _loc1_)
            {
               if(_loc4_.hours >= _loc1_ && _loc4_.hours < 24 || _loc4_.hours >= 0 && _loc4_.hours < _loc2_)
               {
                  return true;
               }
            }
            else if(_loc4_.hours >= _loc1_ && _loc4_.hours < _loc2_)
            {
               return true;
            }
            _loc5_++;
         }
         return false;
      }
   }
}
