How to build:
Prereq:
aws cli
go

Env:
export GOPATH=/usr/local/go
export PATH=$GOPATH/bin:$PATH
export S3_URL=s3://digitalemil/geode
export S3_BUCKET=digitalemil
export S3_DIR_PATH=geode

in dcos-commons/frameworks/geode
execute build.sh aws
 
