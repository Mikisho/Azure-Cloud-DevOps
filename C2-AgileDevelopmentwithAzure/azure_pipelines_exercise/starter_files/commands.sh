#!/usr/bin/env bash

#Setup Virtualenv
python3 -m venv ~/.Azure-Cloud-DevOps
source ~/.Azure-Cloud-DevOps/bin/activate

#RUN make install
make install

#Create App service using cloudh shell
az webapp up -n <your-appservice name>