#!/bin/bash

rsync -avz -e "ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null" \
    --progress \
    artifacts/* \
    root@www.theanubianwar.com:/srv/files.theanubianwar.com/public/htdocs/vms
