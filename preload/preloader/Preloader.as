package
{
   import com.QQ.angel.data.ResData;
   import com.QQ.angel.loaders.DownLoadWoker;
   import com.QQ.angel.loaders.PreloadConfLoader;
   import com.QQ.angel.loaders.VerConfLoader;
   import com.QQ.angel.managers.DateManager;
   import com.QQ.angel.managers.VersionFileManager;
   import com.QQ.angel.utils.ComUtils;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.external.ExternalInterface;
   import flash.net.LocalConnection;
   import flash.system.Security;
   import flash.utils.clearTimeout;
   import flash.utils.setTimeout;
   
   public class Preloader extends Sprite
   {
       
      
      private var _xmlVersionConfig:XML;
      
      private var _curPreloadList:Array;
      
      private var preloadList:Array;
      
      private var _defaultResData:ResData;
      
      private var _verCfgLoader:VerConfLoader;
      
      private var _xmlPreloadConfig:XML;
      
      private var _lc:LocalConnection;
      
      private var _dynamicResConfig:XML;
      
      private var _openFlag:Boolean;
      
      private var _pipeNum:uint = 3;
      
      private var _timeoutID:int;
      
      private var _baseurl:String = "//res.17roco.qq.com/";
      
      public function Preloader()
      {
         super();
         preloadList = [];
         _curPreloadList = [];
         Security.allowDomain("*");
         Security.allowInsecureDomain("*");
         _timeoutID = setTimeout(setupCallback,500);
         start();
      }
      
      public function loadNext(param1:Boolean = false) : void
      {
         var _loc2_:ResData = null;
         var _loc3_:uint = 0;
         if(_curPreloadList.length > 0)
         {
            _loc2_ = _curPreloadList[_loc3_];
            _curPreloadList.splice(_loc3_,1);
            new DownLoadWoker().start(_loc2_.absolutePath,loadNext);
         }
      }
      
      protected function onVersionXMLLoaded() : void
      {
         _xmlVersionConfig = XML(_verCfgLoader.data);
         checkAllLoaded();
      }
      
      private function startDownload() : void
      {
         var _loc1_:uint = 0;
         if(_curPreloadList.length > 0)
         {
            while(_loc1_ < _pipeNum)
            {
               loadNext();
               _loc1_++;
            }
         }
      }
      
      private function converXMLToResData(param1:XML) : ResData
      {
         var _loc2_:ResData = new ResData();
         _loc2_.absolutePath = _baseurl + VersionFileManager.getFileVesionDataByPath(param1.@path).path;
         return _loc2_;
      }
      
      protected function onBaseXMLLoaded(param1:Event) : void
      {
         _xmlPreloadConfig = XML((param1.target as PreloadConfLoader).data);
         checkAllLoaded();
      }
      
      protected function onLoadErrror() : void
      {
      }
      
      private function loadCfg() : void
      {
         var _loc1_:PreloadConfLoader = null;
         _loc1_ = new PreloadConfLoader();
         _loc1_.addEventListener(Event.COMPLETE,onBaseXMLLoaded);
         _loc1_.load(_baseurl + "preloadlist.xml?fileVersion=" + Math.random());
         _verCfgLoader = new VerConfLoader(_baseurl + "ver.config?fileVersion=" + Math.random(),"",onVersionXMLLoaded,onLoadErrror,2);
         _verCfgLoader.load();
      }
      
      public function loadExternalFiles(param1:*) : void
      {
         var _loc2_:XML = null;
         if(param1 is Array)
         {
            _dynamicResConfig = ComUtils.convertArrayToXML(param1);
         }
         else
         {
            if(!(param1 is XML))
            {
               return;
            }
            _dynamicResConfig = param1;
         }
         if(_xmlVersionConfig)
         {
            _curPreloadList = [];
            for each(_loc2_ in _dynamicResConfig..file)
            {
               _curPreloadList.push(converXMLToResData(_loc2_));
            }
            startDownload();
         }
      }
      
      private function checkAllLoaded() : void
      {
         var _loc1_:XML = null;
         if(Boolean(_xmlPreloadConfig) && Boolean(_xmlVersionConfig))
         {
            VersionFileManager.initialize(_xmlVersionConfig);
            for each(_loc1_ in _xmlPreloadConfig..file)
            {
               _defaultResData = converXMLToResData(_loc1_);
               preloadList.push(_defaultResData);
            }
            _curPreloadList = preloadList;
            _pipeNum = uint(_xmlPreloadConfig.config.@pipeNum);
            _openFlag = Boolean(uint(_xmlPreloadConfig.config.@open));
            if(_openFlag)
            {
               DateManager.getInstance().initialize(_xmlPreloadConfig);
               startDownload();
            }
         }
      }
      
      private function setupCallback() : void
      {
         clearTimeout(_timeoutID);
         if(ExternalInterface.available)
         {
            try
            {
               ExternalInterface.addCallback("loadFiles",loadExternalFiles);
            }
            catch(error:Error)
            {
               throw new Error(error.message);
            }
         }
      }
      
      public function start() : void
      {
         loadCfg();
      }
   }
}
