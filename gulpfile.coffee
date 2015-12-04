gulp = require 'gulp'
babel = require 'gulp-babel'
babelify = require 'babelify'
browserify = require 'browserify'
source = require 'vinyl-source-stream'
glob = require 'glob'

gulp.task 'build', ->
  files = glob.sync './frontend/javascripts/**/*.{js,jsx,coffee}'
  browserify
    entries: files,
    debug: true
  .transform babelify.configure(presets: ['es2015', 'react'])
  .bundle()
  .pipe source 'bundle.js'
  .pipe gulp.dest 'app/assets/javascripts/components'

gulp.task 'watch', ->
  gulp.watch('./frontend/javascripts/**/*.{js,jsx,coffee}', ['build'])

gulp.task 'default', ['build']
