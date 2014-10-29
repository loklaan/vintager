gulp = require "gulp"
gutil = require "gulp-util"
coffee = require "gulp-coffee"
coffeelint = require "gulp-coffeelint"
mocha = require "gulp-mocha"
logger = require "gulp-logger"

gulp.task "lint", ->
  gulp.src [
          "./gulfile.coffee"
          "./src/*.coffee"
          "./tests/*.coffee"
        ]
      .pipe coffeelint()
      .pipe coffeelint.reporter()

gulp.task "build", ["lint"], ->
  # build errors
  coffeeStream = coffee()
  coffeeStream.on 'error', gutil.log

  gulp.src [
          "./src/*.coffee"
        ]
      .pipe coffeeStream
      .pipe gulp.dest "./lib"

gulp.task "test", ["lint", "build"], ->
  gulp.src "./tests/*.test.coffee", read: false
      .pipe mocha reporter: "spec"

gulp.task "test-brk", ["lint", "build"], ->
  gulp.src "./tests/*.test.coffee", read: false
    .pipe mocha reporter: "spec"

gulp.task "default", ["lint"]