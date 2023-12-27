package com.QQ.angel.managers
{
   import com.QQ.angel.data.VersionFileData;
   import flash.utils.Dictionary;
   
   public class VersionFileManager
   {
      
      private static var _instance:VersionFileManager;
       
      
      private var _baseLine:String;
      
      private var _fileList:VersionFileList;
      
      private var _fileDataDict:Dictionary;
      
      public function VersionFileManager(param1:SingleEnforce)
      {
         super();
         if(param1 == null)
         {
            throw new Error("it is a single instance!");
         }
         _fileList = new VersionFileList();
         _fileDataDict = new Dictionary();
      }
      
      public static function getInstance() : VersionFileManager
      {
         if(_instance == null)
         {
            _instance = new VersionFileManager(new SingleEnforce());
         }
         return _instance;
      }
      
      public static function getFileVesionDataByPath(param1:String) : VersionFileData
      {
         return getInstance().getFileVesionDataByPath(param1);
      }
      
      public static function initialize(param1:XML) : void
      {
         getInstance().initialize(param1);
      }
      
      public function initialize(param1:XML) : void
      {
         var _loc2_:RegExp = /[- :]/g;
         _baseLine = String(param1.@from).replace(_loc2_,"");
         _fileList.initWithXML(param1);
         _fileList.forEach(mapUrlToVersionData,[]);
         _fileList.dispose();
      }
      
      private function mapUrlToVersionData(param1:VersionFileItem) : void
      {
         var _loc2_:VersionFileData = new VersionFileData();
         _loc2_.version = param1.version;
         _loc2_.path = param1.path + "?fileVersion=" + _baseLine + "_" + param1.version;
         _fileDataDict[param1.path] = _loc2_;
      }
      
      public function getFileVesionDataByPath(param1:String) : VersionFileData
      {
         var _loc2_:VersionFileData = null;
         if(_fileDataDict[param1] == null)
         {
            _loc2_ = new VersionFileData();
            _loc2_.path = param1 + "?fileVersion=" + _baseLine;
            return _loc2_;
         }
         return _fileDataDict[param1];
      }
   }
}

class SingleEnforce
{
    
   
   public function SingleEnforce()
   {
      super();
   }
}
