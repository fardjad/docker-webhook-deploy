var http = require('http')
var path = require('path')
var fs = require('fs')
var spawn = require('child_process').spawn
var temp = require('temp')

if (!process.env.SSH_PRIVATE_KEY) {
  console.error("SSH_PRIVATE_KEY environment variable must be specified.")
  process.exit(-1)
}

if (!process.env.GIT_REPO_URL) {
  console.error("GIT_REPO_URL environment variable must be specified.")
  process.exit(-1)
}

if (!process.env.GIT_REPO_BRANCH) {
  console.error("GIT_REPO_BRANCH environmnt variable must be specified.")
  process.exit(-1)
}

temp.track()

var seq = 0
var jobs = 1
var running = false
setInterval(function () {
  if (jobs === 0 || running) return
  temp.mkdir('repo', function (err, dirpath) {
    jobs--
    var clone = spawn(
      path.join(__dirname, 'clone.sh'), 
      [dirpath],
      { stdio: 'inherit' }
    )
    running = true
    seq++
    console.log('Processing job: #' + seq)
    clone.once('close', function () {
      console.log('Cleaning up...')
      temp.cleanup(function () {
        running = false
        console.log('Finished job: #' + seq)
      })
    })
  })
}, 5000)

var server = http.createServer(function (req, res) {
  jobs++
  console.log('Received a webhook!')
  console.log('Current pending jobs: ' + jobs)
  res.statusCode = 200
  res.end()
})

server.listen(8000)
