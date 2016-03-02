# custom your own processor

## write a simple processor

```js
function MyProcessor(cube) {
    this.cube = cube;
}
MyProcessor.type = 'script';
MyProcessor.ext = '.js';

MyProcessor.prototype.process = function (data, callback) {
    var err = null;
    /**
     data can be {
        queryPath:
        realPath:
        code: {String}
        source: {String}
        compress: {Boolean}
        wrap: {Boolean}
     }
     **/
    callback(err, data);
}
```

## three basic type

### script

### style

### template

