#!/bin/bash
export PATH=$CHECKERFRAMEWORK/checker/bin:$PATH


# For some reason half the jars in the jar dir are unused.  Maybe some are used at runtime as
# transitive dependencies of the linked JARs.
JARS="jars/aws-java-sdk-1.2.15.jar:jars/commons-cli-1.2.jar:jars/commons-io-1.4.jar:jars/commons-lang-2.4.jar:jars/forms-1.0.6.jar:jars/joda-time-1.5.2.jar:jars/slf4j-api-1.6.1.jar"
DEBUG= #"-AprintErrorStack -Afilenames -Ashowchecks" #-Alint=debugSpew"

COMMAND="javac -Xmaxerrs 999 -cp $JARS -processor org.checkerframework.checker.guieffect.GuiEffectChecker $DEBUG"

echo $COMMAND

$COMMAND `find . -name '*.java'` 


#
