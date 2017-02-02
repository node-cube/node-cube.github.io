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
  <script type="text/javascript" src="/${resbase}/cube_loader.js"></script>
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