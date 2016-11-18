Vagrant Helper Scripts & VM Configuration
=========================================


Install Oracle Java:
--------------------
  1. Goto http://www.oracle.com/technetwork/java/javase/downloads/index.html
  2. Click the link to goto the Java Development Kit (JDK) download page.
  3. Accept the license for the version of the JDK you wish to download.
  4. Download the linux-x64 tarball version of the JDK.
  5. Place the downloaded tarball in the guest/config/java\_vm/assets/ directory.
  6. Now then the java\_vm is provisioned, the provisioning scripts should identify the JDK tarball and install it.

Install Spark:
--------------
  1. Goto http://spark.apache.org/downloads.html
  2. Select the appropriate version of Spark you wish to install.
  3. Download the tarball.
  4. Place the downloaded tarball in the guest/config/java\_vm/assets/ directory.
  5. Now then the java\_vm is provisioned, the provisioning scripts should identify the Spark tarball and install it.

Install Mesos:
--------------
  1. Goto http://mesos.apache.org/downloads/
  2. Select the appropriate version of Mesos you wish to install.
  3. Download the tarball.
  4. Place the downloaded tarball in the guest/config/java\_vm/assets/ directory.
  5. Now then the java\_vm is provisioned, the provisioning scripts should identify the Mesos tarball and install it.
