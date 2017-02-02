# client side api

## First: include cube loader

there are two way to init cube in browser

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

## API

### cube init options

options object properties:

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



### Global Object

`cube.js` will inject `Cube` Object into window in browser env.

* Cube.init(options)

init cube

* Cube.use(script_abs_path, function(mod){})
* Cube.use([script1, script2, script3...], function (mod1, mod2, mod3){});


