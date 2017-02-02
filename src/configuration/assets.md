# cube_config.js

静态资源目录下，需要有一个cube.json，用来掌管cube的配置.

类似这么个配置：
```json
{
    /**
     * default true, always cache file
     */
    "cache": true
    /**
     * resource base path, usually is the http prefix path
     */
    "resBase": "",
    /**
     * process list
     */
    "processors": {
        ".js": [],
        ".jsx": [],
        ".less": []
    },
    /**
     * module optmize, when module already have mini-file,  alias to the mini-file. this map can speed up page-loading in dev mode
     */
    "moduleMap": {
			"react": "./dist/react.mini.js"
    },
    "build": {
        /**
         * ignore file
         */
        ignore: [],
        /**
        * file no need to tranfer, just copy them to the dest-dir
        */
        skip: [],
        mangleFileName:

    }
}
```
