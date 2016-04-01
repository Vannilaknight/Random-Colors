#!/bin/bash

DIR="$( cd "$( dirname "$0" )" && pwd )"

if [ ! -d $DIR/deployment ]
then
    sudo mkdir -p $DIR/deployment && sudo chown ubuntu $DIR/deployment
else
    sudo rm -rf $DIR/deployment
    sudo mkdir -p $DIR/deployment && sudo chown ubuntu $DIR/deployment
fi