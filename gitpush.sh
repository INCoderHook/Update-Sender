#!/bin/bash
cd ~/Update-Sender || exit
git add .
git commit -m "Auto update from Termux"
git push origin main
