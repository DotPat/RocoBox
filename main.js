var app = require('electron').app; // 控制应用生命周期的模块。
var BrowserWindow = require('electron').BrowserWindow; // 创建原生浏览器窗口的模块
var Menu = require('electron').Menu; // 创建原生浏览器窗口的模块
const path = require('path')


var mainWindow = null;

var WIN_WIDTH = 960;
var WIN_HEIGHT = 560;

var wwwroot = 'https://web2.17roco.qq.com/fcgi-bin/login2?platfrom_src=2'

let pluginName="pepflashplayer32_20_0_0_286.dll";


let plugins = path.join(__dirname, "plugins/" + pluginName);


// if (__dirname.includes(".asar")) {
//     plugins = path.join(process.resourcesPath + '/' + pluginName)
// }

app.commandLine.appendSwitch('ppapi-flash-path', plugins)


app.on('window-all-closed', function () {
    if (process.platform != 'darwin') {
        app.quit();
    }
});



app.on('browser-window-created', function (event, newWindow) {
    if (newWindow.id > 1) {
        newWindow.resizable = true;
        console.log("newWindow id" + newWindow.id);
        newWindow.center();
    }
    console.log("browser-window-created" + newWindow);
})
app.on('ready', function () {
    mainWindow = new BrowserWindow({
        useContentSize: true,
        width: 1080,
        height: 860,
        center: true,
        webPreferences: {
            plugins: true,
			nativeWindowOpen:true
        },
        resizable: false
    });

    Menu.setApplicationMenu(null);
    mainWindow.loadURL(wwwroot);
    mainWindow.openDevTools();
    mainWindow.on('closed', function () {
        mainWindow = null;
    });


    mainWindow.webContents.on('zoom-changed', (e, zoomDirection) => {
        console.log('zoom-changed:' + zoomDirection)
        console.log('zoom-changed:' + zoomDirection)
        if (zoomDirection === 'in') {
            level = level >= 0.6 ? level : level += 0.05
        } else {
            level = level <= -0.4 ? level : level -= 0.05
        }
        console.log("level:" + level)
        let width = Math.floor(WIN_WIDTH * (1 + level));
        let height = Math.floor(WIN_HEIGHT * (1 + level))
        console.log(width, height)
        mainWindow.resizable = true;
        mainWindow.setSize(width, height)
        mainWindow.resizable = false;
        mainWindow.center();
    })
});