//Steps to run burpsuite in ARM64/M1 when bspwm doesnt run it due to the following error

> Error: LinkageError occurred while loading main class burp.StartBurp
	java.lang.UnsupportedClassVersionError: burp/StartBurp has been compiled by a more recent version of the Java Runtime (class file version 65.0), this version of the Java Runtime only recognizes class file versions up to 61.0


Step 1
Downlod ARM64 Java above v.17

```
https://www.oracle.com/java/technologies/javase/jdk21-archive-downloads.html
```
ARM64 v.21
```
https://download.oracle.com/java/21/archive/jdk-21.0.3_linux-aarch64_bin.tar.gz
```

Step 2
> cd /home/user/Downloads

>wget https://download.oracle.com/java/21/archive/jdk-21.0.3_linux-aarch64_bin.tar.gz

Unzip the package:
>tar xvf jdk-21.0.3_linux-aarch64_bin.tar.gz

Move it to the JVM folder:
>sudo mv jdk-21.0.3/ /usr/lib/jvm/jdk-21

Step 3
Add JDK 21 to the alternatives system. We'll use the update-alternatives command with the --install option

Check first the java versions
sudo update-alternatives --config java

Then add the alternative of jdk-21
it should look like this before adding jdk-21

 sudo update-alternatives --config java
There are 3 choices for the alternative java (providing /usr/bin/java).

  Selection    Path                                         Priority   Status
------------------------------------------------------------
* 0            /usr/lib/jvm/java-17-openjdk-arm64/bin/java           auto mode
  1            /usr/lib/jvm/java-11-openjdk-arm64/bin/java   1111      manual mode
  2            /usr/lib/jvm/java-17-openjdk-arm64/bin/java   1711      manual mode

In order to add the jdk this is the command:

> sudo update-alternatives --install /usr/bin/java java /usr/lib/jvm/jdk-21/bin/java 2100

again check list: >  sudo update-alternatives --config java
and now should look like this:

There are 3 choices for the alternative java (providing /usr/bin/java).

  Selection    Path                                         Priority   Status
------------------------------------------------------------
* 0            /usr/lib/jvm/jdk-21/bin/java                  2100      auto mode
  1            /usr/lib/jvm/java-11-openjdk-arm64/bin/java   1111      manual mode
  2            /usr/lib/jvm/java-17-openjdk-arm64/bin/java   1711      manual mode
  3            /usr/lib/jvm/jdk-21/bin/java                  2100      manual mode

Press <enter> to keep the current choice[*], or type selection number: 

We are good to go!
