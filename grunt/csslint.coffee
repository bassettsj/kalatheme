module.exports =
  theme:
    src: 'dist/css/kalatheme.css'
    options:
      force: true
      formatters: [
        { id: 'text', dest:'temp/report/csslint.txt'}
      ]
