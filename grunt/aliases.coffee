module.exports =

  default: [
    'clean:dist'
    'img'
    'js'
    'tests'
    'css'
  ]
  js: [
    'clean:tempjs'
    'coffeelint:theme'
    'coffee:theme'
    'concat:js'
    'uglify:js'
  ]
  tests: [
    'curl-dir:drupaljs'
    'coffeelint:tests'
    'coffee:specs'
    'jasmine:specs'
  ]
  img: [
    'imagemin:theme'
    'sprite:icons'
  ]
  css: [
    'sass:dist'
    'autoprefixer:theme'
    'csscss:theme'
    'csslint:theme'
    'cssmin:theme'
  ]
  develop: [
    'connect:tests'
    'watch'
  ]
