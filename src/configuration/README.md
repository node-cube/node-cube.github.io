# 配置cube

cube在服务器端，前端都需要配置来运行

## 服务器端配置

服务器端的配置，会在服务起来的时候，被cube middleware加载
也会在 cube 命令行启动的时候 `cube start` 被加载
还会在 cube 编译的时候 `cube build` 被加载

静态资源目录下的package.json里，增加一个配置段:
```json
{
    "cube": {
        /**
         * 用来提速用，一些模块发布的时候，已经打包压缩好的代码，可以通过map来加速
         */
        "moduleMap": {
          "react": "dist/react.js",
          "modulemap": "lib/index.js"
        },
        /**
         * 配置 processor, 不同的文件后缀，配置不同的processor,
         */
        "processors": {
          ".vert": "cube-text", // 单个processor
          ".frag": "cube-text",
          ".less": "cube-less",
          ".jsx": ["cube-react", ""], // 多个processor串联
          ".coffee": "cube-coffee",
          ".ejs": "cube-ejs",
          ".jade": "cube-jade",
          ".styl": "cube-stylus"
        },
        /**
         * 和 .cubeignore 功能类似， 配置该文件
         */
        "build": {
          "skip":[],  // 需要跳过的文件列表, 复制文件但不转化
          "ignore": [], // 需要忽略的文件，build的时候直接丢弃掉
          "exportModules": [
            "/css/test_css.css.js" // 需要保持独立导出的模块，保持不被合并掉
          ]
        }
    }
}
```

### 服务器端API

如果是编程来集成cube到现有的服务中（通常是一个middleware的形式集成），参考以下用法：
```
  var express = require('express');
  var Cube = require('node-cube');

  var middleware = Cube.init({
      root: 'your_static_resource_dir', //
      debug: false,
      middleware: true,
      version: '123',      // static file cache control
      resBase: '/static/'  // the http path prefix
  });
  express.use('/static', middleware);
  express.listen(8080);
```

#### Cube.init(options)

options 包含以下参数：

	* root {String} 静态文件夹根目录
	* middleware {Boolean} 作为middleware使用，返回一个middleware
	* processors {Object} processor配置，绑定文件后缀到对应的processor， 其结构参考 package.json文件中的配置
	* resBase {String} 指定静态资源http访问时的前缀
	* debug {Boolean} 是否开启debug模式
 

## 客户端配置

html页面上，有两种方法配置:

1. from html tag

  ```html
  <script
      data-base="/assets"
      data-main="/main.js"
      src="/${resbase}/cube_loader.js"
      type="text/javascript"/><script>

  ```
  > in this example, cube inited with configs wirtting in the `script`'s attribute (in html5, we can access this attrbute which start with `data-` by api `node.dataset`)
  the hole config properties see belew.

2. using client-side api

  ```html
  <script type="text/javascript" src="/${resbase}/cube.js"></script>
  <script type="text/javascript">
  (function () {
      Cube.init({
          base: '/assets'
      });
      Cube.use('/main.js', function (Main) {
          Main.run({
              // TODO global config here
          });
      })
  })();
  </script>
  ```
  
### 客户端API

在加载了 cube.js 之后， 会注入window.Cube这个全局变量，全局变量`Cube`上的几个接口文档如下

#### Cube.init(options)

* @options object properties:

	*  base {String}

 	the assets base path(http path), without the ending `/`,
 like: `/assets`

	* remoteBase {Object}

 	the remote assets base, this config is an object, like:

   ```js
   {
     // remoteName: 'remotePath',
     datav: 'http://datav.component.aliyun.com'
   }
 	```
 	 cube support remote online script base, with remoteName as namespace, like `datav:/npm/dcharts/line.js`

	* timeout {Number}

	script loading timeout, unit ms, default is 15000ms

	* version {String}

	the static resource version, like`main.js?v=123`, used to update cdn cache

	* charset

	set the loading script charset, default is `utf-8`, can be
`gb2312`, `gbk`, etc. this property is working on the html `script` tag

#### Cube.use(path, callback)

  * path {String} 模块路径， 注意这里必须是模块的绝对路径（相对于assets root）
	* callback(module) {Function} 模块加载成功之后，调用这个callback，并将加载的module作为其第一参数传入

