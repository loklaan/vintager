# Vintager [![Build Status](https://travis-ci.org/loklaan/vintager.svg)](https://travis-ci.org/loklaan/vintager)

[![Greenkeeper badge](https://badges.greenkeeper.io/loklaan/vintager.svg)](https://greenkeeper.io/)

Filter images through preconfigured GraphicsMagick settings. This is really a wrapper for the `gm` package with some proposed image conversion chains to make cool *#hipstercred* images.

## Install

You're **required** to download and install GraphicsMagick.

ie. Ubuntu and Fedora:
```shell
$ sudo apt-get install GraphicsMagick
$ sudo yum install GraphicsMagick
```

Install project dependencies:
```shell
$ npm install
```

## Usage

Configured filters:
* `mythical`
* `wurst`
* `fathom`
* `granadela`

Example:
```javascript
var fs = require('fs'),
    vintager = require('vintager-stream')

var imageUrl = 'http://some.url/path.jpg',
    imageReadstream = fs.createReadStream('./localImage.jpg'),
    urlWriteStream = fs.createWriteStream('.localVintage-1.jpg'),
    imageWriteStream = fs.createWriteStream('.localVintage-2.jpg')

vintager.stream('mythical', imageUrl).pipe(urlWriteStream)
vintager.stream('mythical', imageReadstream).pipe(imageWriteStream)
```