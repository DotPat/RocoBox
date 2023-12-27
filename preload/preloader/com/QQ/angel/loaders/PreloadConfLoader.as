package com.QQ.angel.loaders
{
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IOErrorEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.URLLoader;
   import flash.net.URLLoaderDataFormat;
   import flash.net.URLRequest;
   
   public class PreloadConfLoader extends EventDispatcher
   {
       
      
      private var _url:String = "";
      
      private var _xml:XML;
      
      public function PreloadConfLoader()
      {
         super();
      }
      
      protected function onLoadError(param1:Event) : void
      {
         errorHandler(param1.toString());
      }
      
      public function load(param1:String) : void
      {
         _url = param1;
         var _loc2_:URLLoader = new URLLoader();
         _loc2_.dataFormat = URLLoaderDataFormat.TEXT;
         _loc2_.addEventListener(Event.COMPLETE,onLoadComplete);
         _loc2_.addEventListener(IOErrorEvent.IO_ERROR,onLoadError);
         _loc2_.addEventListener(IOErrorEvent.NETWORK_ERROR,onLoadError);
         _loc2_.addEventListener(SecurityErrorEvent.SECURITY_ERROR,onLoadError);
         _loc2_.load(new URLRequest(_url));
      }
      
      private function errorHandler(param1:String) : void
      {
         trace(param1 + "confLoaderRoort");
      }
      
      public function get data() : XML
      {
         return _xml;
      }
      
      protected function onLoadComplete(param1:Event) : void
      {
         var event:Event = param1;
         event.target.removeEventListener(Event.COMPLETE,onLoadComplete);
         event.target.removeEventListener(IOErrorEvent.IO_ERROR,onLoadError);
         event.target.removeEventListener(IOErrorEvent.NETWORK_ERROR,onLoadError);
         event.target.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,onLoadError);
         try
         {
            _xml = XML((event.target as URLLoader).data);
         }
         catch(err:Error)
         {
            errorHandler(err.message);
            return;
         }
         dispatchEvent(event);
      }
   }
}
