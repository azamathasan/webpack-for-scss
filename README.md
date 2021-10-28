# webpack-for-scss

Unix shell script for setting up scss with webpack.
For working:
- create clear folder for you project
- download webpack_for_scss.sh
- run `./webpack_for_scss.sh`

There are next folders and files:
- **package.json** - important information about the project
- **webpack.config.js** - configuration file for webpack
- **js** - folder that contains entry and output js-files:
  - **entry.js** - entry file for webpack-bundle, you can import your js-files to this file
  - **scss.js** - output for scss; this file exist because we have two entry-files - **style.scss** and **entry.js**; you don't have to use scss.js
  - **bundle.js** - webpack bundle-file; you can include this file to your project (for example, in **html**-file)
- **scss-filder** - folder for scss; there is the entry file **style.scss** and you can write your scss-code to this file
- **css** - folder for css; there is the output file **style.css** and you can include this file to your project (for example, in **html**-file)
