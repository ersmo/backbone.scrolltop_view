
module.exports = (grunt) ->

  grunt.initConfig

    pkg: grunt.file.readJSON 'package.json'

    concat:
      script:
        src: [
          'lib/<%= pkg.name %>.js'
        ]
        dest: 'dist/<%= pkg.name %>.js'
      style:
        options:
          separator: ''
        src: 'lib/style.css'
        dest: 'dist/style.css'

    uglify:
      dist:
        src: '<%= concat.script.dest %>'
        dest: 'dist/<%= pkg.name %>.min.js'

    coffee:
      compile:
        files:
          'lib/<%= pkg.name %>.js': 'src/<%= pkg.name %>.coffee'

    watch:
      script:
        files: 'src/*.coffee'
        tasks: ['coffee', 'concat:script']
      style:
        files: 'src/*.styl'
        tasks: ['stylus', 'concat:style']

    clean: [
      'lib'
      'dist'
    ]

    stylus:
      compile:
        files:
          'lib/style.css': 'src/style.styl'

    cssmin:
      style:
        files:
          'dist/style.min.css': 'dist/style.css'

  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-contrib-concat'
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-contrib-stylus'
  grunt.loadNpmTasks 'grunt-contrib-cssmin'

  grunt.registerTask 'build', [
    'clean'
    'coffee'
    'stylus'
    'concat'
    'uglify'
    'cssmin'
  ]

  grunt.registerTask 'default', [
    'watch'
  ]
