var HtmlWebpackPlugin = require('html-webpack-plugin');
const DotEnvRuntimePlugin = require('dotenv-runtime-plugin');
var path = require('path');

module.exports = {
  entry: './src/index.js',
  output: {
    path: path.resolve(__dirname, './build'),
    filename: 'index_bundle.js'
  },
  devServer: {
    contentBase: './build',
    hot: true,
    port: 8080
  },
  plugins: [
    new DotEnvRuntimePlugin({
      entry: './.env'
    }),
    new HtmlWebpackPlugin({
      template: 'index.html'
    })
  ]
};