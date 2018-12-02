const webpack = require('webpack');
const path = require('path');
const ExtractTextPlugin = require("extract-text-webpack-plugin");
const CleanWebpackPlugin = require('clean-webpack-plugin');

module.exports = {
    entry: {
        app: [
            path.resolve(__dirname, './app/assets/scss/style.scss'),
            path.resolve(__dirname, './app/assets/js/app.js')
        ],
        vendor: [
            'react',
            'react-dom'
        ]
    },
    output: {
        path: path.resolve(__dirname, './public'),
        filename: 'js/[name].js'
    },
    module: {
        rules: [
            {
                test: /\.jsx?$/,
                loader: 'babel-loader',
                exclude: /node_modules/,
                options: {
                    presets: ["env", "stage-0", "react"]
                }
            },
            {
                test: /\.scss$/,
                use: ExtractTextPlugin.extract({
                    fallback: "style-loader",
                    use: [
                        'css-loader',
                        'resolve-url-loader',
                        'sass-loader'
                    ]
                })
            },
            {
                test: /\.css$/,
                use: ExtractTextPlugin.extract({
                    fallback: "style-loader",
                    use: [
                        "css-loader"
                    ]
                })
            },
            {
                test: /\.(png|jpg|jpeg|gif|ico|svg)$/,
                use: [
                    {
                        loader: 'file-loader',
                        options: {
                            name: './assets/[name].[ext]',
                            publicPath: "/"
                        }
                    }
                ]
            },
        ]
    },
    plugins: [
        new CleanWebpackPlugin(['build'], {
            root: path.resolve(__dirname, './public')
        }),
        new webpack.optimize.CommonsChunkPlugin({
            name: 'vendor',
            filename: './js/vendor.js',
            minChunks: Infinity
        }),
        new ExtractTextPlugin({
            filename: './css/style.css',
            allChunks: true
        })
    ]
};