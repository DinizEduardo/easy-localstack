#!/bin/bash

winpty docker-compose stop
winpty docker-compose down
winpty docker-compose up -d