#!/bin/bash
P=$(date "+%Y-%m-%d")
scp -P [sshPort] [user@ip]:[AnalysisedFilePath] [WebFileFolderPath]
echo [sudo password] | sudo -S mv [DataFolderPath] /var/www/html/[]
