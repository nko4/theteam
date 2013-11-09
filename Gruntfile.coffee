module.exports = (grunt) ->
  grunt.loadNpmTasks 'grunt-node-webkit-builder'

  grunt.initConfig
    nodewebkit:
      options:
        build_dir: './build'
        mac: true
        win: true
        linux32: false
        linux64: false
        keep_nw: true
      src: ['./public/**/*']
