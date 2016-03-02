## Installation

install module using `npm`, or speed up in china by visiting http://cnpm.taobao.org

```
npm install node-cube
```

### Using as CLI Tool

install `node-cube` in global path:
```
npm install -g node-cube
```

then you have the cmd `cube`, this cmd can do following things:

#### Start a Dev Service

simply you can start a service like this:
```
cube start your_code_dir
```
a http server based on `your_code_dir` is running, you can visit the code in browser `http://localhost:9999`

### Integration with Your WebApp

* server side, cube provide a middleware, this middleware
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
express.use('/static', )
```

* client side, cube provide a loader
```html
<script src="https://raw.githubusercontent.com/node-cube/cube/master/runtime/cube.min.js"></script>
<script>
Cube.init({
    charset: 'utf-8',
    /**
     * http path, can be abspath like `/static`
     *     or an http path like `http://cdn.taobao.com/static`
     **/
    base: '/',
    /**
     * debug flag, when published, you should turn off this flag
     **/
    debug: true,
    /**
     * static resource cache controll, you should update the value when publish
     **/
    version: 12345,
    /**
     * loading script module timeout setting, unit ms
     **/
    timeout: 15000
  });
  Cube.use('/main.js', function (App) {
    console.log(App.run(appConfig));
  });
</script>
```
or can init cube in script tag:
```html
<script
    src="https://raw.githubusercontent.com/node-cube/cube/master/runtime/cube.min.js"
    data-base="/"
    data-debug="true"
    data-version="123"
    data-timeout="20000"
    data-main="/index.js"
></script>
```

for more detail info, [click here](features.md)
