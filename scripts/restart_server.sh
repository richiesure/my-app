#!/bin/bash
# Restart the Node.js app
pm2 stop all || true
pm2 start src/index.js --name my-app
