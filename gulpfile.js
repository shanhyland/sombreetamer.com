'use strict';

var gulp = require('gulp');
var serve = require('gulp-serve');
var sass = require('gulp-sass');
var browserSync = require('browser-sync').create();
var browserify = require('gulp-browserify');
var rename = require('gulp-rename');
var plumber = require('gulp-plumber')

var config = {
  files: {
    coffee: [
      'src/coffee/**/*.coffee'
    ],

    sass: [
      'src/sass/**/*.scss'
    ],

    html: [
      'public/**/*.html'
    ]
  }
}

gulp.task('coffee', function() {
  gulp.src('src/coffee/app.coffee', { read: false })
    .pipe(plumber())
    .pipe(browserify({
      transform: ['coffeeify'],

      extensions: ['.coffee'],

      shim: {}
    }))
    .pipe(rename('app.js'))
    .pipe(gulp.dest('./public/js'))
});

gulp.task('sass', function () {
  gulp.src('src/sass/**/*.scss')
    .pipe(sass({
      includePaths: [
        'bower_components/bourbon/app/assets/stylesheets',
        'bower_components/neat/app/assets/stylesheets'
      ]
    })
    .on('error', sass.logError))
    .pipe(gulp.dest('./public/css'))
    .pipe(browserSync.stream());
});

gulp.task('serve', function () {
  browserSync.init({ server: "./public" });
});

gulp.task('build', ['coffee', 'sass']);

gulp.task('watch', ['build', 'serve'], function () {
  gulp.watch(config.files.sass, ['sass']);
  gulp.watch(config.files.coffee, ['coffee']);
  gulp.watch(config.files.html).on('change', browserSync.reload);
});
