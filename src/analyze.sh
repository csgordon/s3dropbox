#!/bin/bash
export PATH=$CHECKERFRAMEWORK/checker/bin:$PATH


# For some reason half the jars in the jar dir are unused.  Maybe some are used at runtime as
# transitive dependencies of the linked JARs.
JARS="/homes/gws/csgordon/research/experiments/S3dropbox/jars/aws-java-sdk-1.2.15.jar:/homes/gws/csgordon/research/experiments/S3dropbox/jars/commons-cli-1.2.jar:/homes/gws/csgordon/research/experiments/S3dropbox/jars/commons-io-1.4.jar:/homes/gws/csgordon/research/experiments/S3dropbox/jars/commons-lang-2.4.jar:/homes/gws/csgordon/research/experiments/S3dropbox/jars/forms-1.0.6.jar:/homes/gws/csgordon/research/experiments/S3dropbox/jars/joda-time-1.5.2.jar:/homes/gws/csgordon/research/experiments/S3dropbox/jars/slf4j-api-1.6.1.jar"
#JARS="/homes/gws/csgordon/research/experiments/S3dropbox/jars/aws-java-sdk-1.2.15.jar:/homes/gws/csgordon/research/experiments/S3dropbox/jars/commons-cli-1.2.jar:/homes/gws/csgordon/research/experiments/S3dropbox/jars/commons-codec-1.3.jar:/homes/gws/csgordon/research/experiments/S3dropbox/jars/commons-io-1.4.jar:/homes/gws/csgordon/research/experiments/S3dropbox/jars/commons-lang-2.4.jar:/homes/gws/csgordon/research/experiments/S3dropbox/jars/forms-1.0.6.jar:/homes/gws/csgordon/research/experiments/S3dropbox/jars/httpclient-4.1.1.jar:/homes/gws/csgordon/research/experiments/S3dropbox/jars/httpcore-4.1.jar:/homes/gws/csgordon/research/experiments/S3dropbox/jars/jcl-over-slf4j-1.6.1.jar:/homes/gws/csgordon/research/experiments/S3dropbox/jars/joda-time-1.5.2.jar:/homes/gws/csgordon/research/experiments/S3dropbox/jars/looks-2.0.1.jar:/homes/gws/csgordon/research/experiments/S3dropbox/jars/slf4j-api-1.6.1.jar:/homes/gws/csgordon/research/experiments/S3dropbox/jars/slf4j-simple-1.6.1.jar"
DEBUG= #"-AprintErrorStack -Afilenames -Ashowchecks" #-Alint=debugSpew"

COMMAND="javac -Xmaxerrs 999 -cp $JARS -processor org.checkerframework.checker.guieffect.GuiEffectChecker $DEBUG"

echo $COMMAND

find . -name '*.java' | xargs $COMMAND


#
