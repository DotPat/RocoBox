package com.QQ.angel.loaders
{
   import com.QQ.angel.managers.DateManager;
   import flash.events.ErrorEvent;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IOErrorEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.URLLoader;
   import flash.net.URLLoaderDataFormat;
   import flash.net.URLRequest;
   
   public class DownLoadWoker extends EventDispatcher
   {
       
      
      private var _completeCallback:Function;
      
      public function DownLoadWoker()
      {
         super();
      }
      
      private function terminate() : void
      {
         if(_completeCallback != null)
         {
            _completeCallback();
            _completeCallback = null;
         }
      }
      
      public function start(param1:String, param2:Function) : void
      {
         _completeCallback = param2;
         var _loc3_:Boolean = DateManager.getInstance().checkTime();
         trace(_loc3_ + "时间上可否");
         if(!_loc3_)
         {
            terminate();
            return;
         }
         var _loc4_:URLLoader;
         (_loc4_ = new URLLoader()).dataFormat = URLLoaderDataFormat.BINARY;
         _loc4_.addEventListener(Event.COMPLETE,onLoadComplete);
         _loc4_.addEventListener(IOErrorEvent.IO_ERROR,onLoadError);
         _loc4_.addEventListener(IOErrorEvent.NETWORK_ERROR,onLoadError);
         _loc4_.addEventListener(SecurityErrorEvent.SECURITY_ERROR,onLoadError);
         _loc4_.load(new URLRequest(param1));
      }
      
      protected function onLoadError(param1:ErrorEvent) : void
      {
         terminate();
      }
      
      protected function onLoadComplete(param1:Event) : void
      {
         param1.target.removeEventListener(Event.COMPLETE,onLoadComplete);
         param1.target.removeEventListener(IOErrorEvent.IO_ERROR,onLoadError);
         param1.target.removeEventListener(IOErrorEvent.NETWORK_ERROR,onLoadError);
         param1.target.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,onLoadError);
         terminate();
      }
   }
}
