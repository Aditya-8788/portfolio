// Firebase predeploy hook: overwrite Flutter's (empty) service worker with
// web/sw_cleanup.js so visitors still holding the old cached app get the
// latest deploy.
const fs = require('fs');
const path = require('path');

const root = path.resolve(__dirname, '..');
fs.copyFileSync(
  path.join(root, 'web', 'sw_cleanup.js'),
  path.join(root, 'build', 'web', 'flutter_service_worker.js'),
);
console.log('Installed service-worker cleanup into build/web.');
