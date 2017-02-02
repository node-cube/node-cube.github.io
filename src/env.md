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

```sh
cube start $your_code_path
```

a http server based on `$your_code_path` is running, you can visit the code in browser `http://localhost:9999`, 

the server run on port:9999 by default, yet you can custom it by `-p` option

for more help info, just `cube -h`

### Integration with Your WebApp

#### if you are using node.js, it is easily integrate with your app

* server side init. cube provide a middleware, 

  ```
  var express = require('express');
  var Cube = require('node-cube');

  var middleware = Cube.middleware({
      root: 'your_static_resource_dir', //
      debug: false,
      middleware: true,
      version: '123',      // static file cache control
      resBase: '/static/'  // the http path prefix
  });
  express.use('/static', middleware);
  express.listen(8080);
  ```
  
* client side init. cube provide a loader, you can simple inited

```html

<script src="/static/cube_loader.js"></script>
```

or can init cube in script tag:


for more detail info, [click here](features.md)
