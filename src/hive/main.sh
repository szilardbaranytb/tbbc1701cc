#!/bin/bash

# main - runs whole process

./ingest_files.sh

hive -f schema_setup.hql