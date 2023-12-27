package com.QQ.angel.loaders
{
   import com.QQ.angel.zip.ZipEntry;
   import com.QQ.angel.zip.ZipFile;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.URLRequest;
   import flash.net.URLStream;
   import flash.utils.ByteArray;
   import flash.utils.Endian;
   
   public class VerConfLoader
   {
       
      
      protected var _hasTryTime:int;
      
      protected var _xml:XML;
      
      protected var _stream:URLStream;
      
      protected var _tryTime:int;
      
      protected var _name:String;
      
      protected var _errorCallback:Function;
      
      protected var _successCallback:Function;
      
      protected var _byteArray:ByteArray;
      
      protected var _url:String;
      
      public function VerConfLoader(param1:String = "", param2:String = "", param3:Function = null, param4:Function = null, param5:int = 1)
      {
         super();
         _stream = new URLStream();
         init(param1,param2,param3,param4,param5);
      }
      
      private function removeEventListeners() : void
      {
         if(_stream)
         {
            _stream.removeEventListener(Event.COMPLETE,onLoadComplete);
            _stream.removeEventListener(IOErrorEvent.IO_ERROR,onLoadError);
            _stream.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,onLoadError);
         }
      }
      
      private function onLoadComplete(param1:Event) : void
      {
         _byteArray = new ByteArray();
         _stream.readBytes(_byteArray,0,_stream.bytesAvailable);
         if(decode() == true)
         {
            onSuccess();
         }
         else
         {
            onFail();
         }
      }
      
      private function addEventListeners() : void
      {
         if(_stream)
         {
            _stream.addEventListener(Event.COMPLETE,onLoadComplete);
            _stream.addEventListener(IOErrorEvent.IO_ERROR,onLoadError);
            _stream.addEventListener(SecurityErrorEvent.SECURITY_ERROR,onLoadError);
         }
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function dispose() : void
      {
         reset();
         close();
         _stream = null;
      }
      
      public function reset() : void
      {
         _successCallback = null;
         _errorCallback = null;
         removeEventListeners();
         _byteArray = null;
      }
      
      public function init(param1:String, param2:String, param3:Function, param4:Function, param5:int) : void
      {
         _url = param1;
         _name = param2;
         _successCallback = param3;
         _errorCallback = param4;
         _tryTime = param5;
         _hasTryTime = 0;
      }
      
      protected function onFail() : void
      {
         if(_hasTryTime >= _tryTime)
         {
            if(_errorCallback != null)
            {
               _errorCallback.length == 1 && _errorCallback(this);
               _errorCallback.length == 0 && _errorCallback();
            }
         }
         else
         {
            load();
         }
      }
      
      private function onLoadError(param1:Event) : void
      {
         onFail();
      }
      
      public function load() : void
      {
         ++_hasTryTime;
         removeEventListeners();
         addEventListeners();
         _stream.load(new URLRequest(_url));
      }
      
      protected function onSuccess() : void
      {
         if(_successCallback != null)
         {
            _successCallback.length == 1 && _successCallback(this);
            _successCallback.length == 0 && _successCallback();
         }
      }
      
      public function get url() : String
      {
         return _url;
      }
      
      public function get data() : XML
      {
         return _xml;
      }
      
      private function decode() : Boolean
      {
         var zip:ZipFile = null;
         var entry:ZipEntry = null;
         var bytes:ByteArray = null;
         var value:String = null;
         if(Boolean(_byteArray) && _byteArray.length > 0)
         {
            _byteArray.endian = Endian.LITTLE_ENDIAN;
            _byteArray.position = 0;
            try
            {
               zip = new ZipFile(_byteArray);
               entry = zip.getEntry("ver.xml");
               bytes = zip.getInput(entry);
               value = bytes.readUTFBytes(bytes.length);
               _xml = XML(value);
               return true;
            }
            catch(e:Error)
            {
               return false;
            }
         }
         else
         {
            return false;
         }
      }
      
      public function close() : void
      {
         try
         {
            if(_stream)
            {
               _stream.close();
            }
         }
         catch(error:Error)
         {
         }
      }
   }
}
