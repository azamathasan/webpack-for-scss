#!/bin/sh
echo "webpack configuration for only scss"

# install webpack and plugins
echo "***********************install webpack and plugins****************"
npm init -y
npm install webpack --save-dev
npm install webpack-cli --save-dev
npm i css-loader sass-loader node-sass mini-css-extract-plugin --save-dev
echo "***********************END install webpack and plugins****************"


# package.json
echo "***********************package.json**************************"
#touch package.json
sed -i '/\"main\":/c\' package.json
sed -i '/description/a \\ \"private\": true,' package.json
#sed -i '/\"test\":/ s/$/ , \n \"private\": true,/' package.json
#sed -i '/\"test\":/ s/$/ \\ \"build\": \"webpack\",/' package.json

sed -i '/\"test\":/ s/$/ , \n \"build\": \"webpack\",/' package.json
sed -i '/\"build\":/a \\ \"start\": \"webpack --watch\"' package.json
echo "***********************END package.json**************************"



# create folders and files (scss and css)
echo "***********************create folders and files (scss and css)******************"
mkdir scss
touch ./scss/style.scss
mkdir css
echo "***********************END create folders and files (scss and css)******************"



# webpack.config.js
echo "************************webpack.config.js**************************"
echo "touch webpack.config.js"
touch webpack.config.js

echo "write to webpack.config.js"
#echo "$a const path = require('path');" >> webpack.config.js
#echo "const miniCss = require('mini-css-extract-plugin');" >> webpack.config.js

#sed -i "module.exports = {" webpack.config.js

echo "const path = require('path');" >> webpack.config.js
echo "const miniCss = require('mini-css-extract-plugin');" >> webpack.config.js

echo "module.exports = {" >> webpack.config.js
echo "    mode: 'production'," >> webpack.config.js
echo "    // entry: './src/index.js'," >> webpack.config.js
echo "    entry: './scss/style.scss',  // entry file; it can be index.js with scss-import" >> webpack.config.js
echo "    output: {" >> webpack.config.js
echo "       filename: 'bundle_for_webpack.js', //output file; must have for webpack" >> webpack.config.js
echo "    //    filename: 'style.css'," >> webpack.config.js
echo "       path: path.resolve(__dirname, './scss/')  // path for output-file" >> webpack.config.js
echo "    }," >> webpack.config.js
echo "    module: {" >> webpack.config.js
echo "       rules: [{" >> webpack.config.js
echo "          test:/\.(s*)css$/," >> webpack.config.js
echo "          use: [" >> webpack.config.js
echo "             miniCss.loader," >> webpack.config.js
echo "             'css-loader',    //plugins for css and sass/scss" >> webpack.config.js
echo "             'sass-loader'," >> webpack.config.js
echo "          ]" >> webpack.config.js
echo "       }]" >> webpack.config.js
echo "    }," >> webpack.config.js
echo "    plugins: [" >> webpack.config.js
echo "       new miniCss({" >> webpack.config.js
echo "          filename: '../css/style.css',  // output css-file" >> webpack.config.js
echo "       })," >> webpack.config.js
echo "    ]" >> webpack.config.js
echo " };" >> webpack.config.js
echo "************************END webpack.config.js**************************"




# build
echo "************************npm run build***********************"
npm run build
echo "************************END npm run build***********************"
# npm run start 
