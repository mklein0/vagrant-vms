#!/bin/bash

# Get latest version of jdk in directory
JAVA_ASSET=$(ls -1 ${ASSETS_DIR}/jdk-* | sort -n | head -1)

case ${JAVA_ASSET} in
	*.tar.gz)
		TAR_COMPRESS=z
	;;
	*.tgz)
		TAR_COMPRESS=z
	;;
	*.tar.bz2)
		TAR_COMPRESS=j
	;;
	*.tbz2)
		TAR_COMPRESS=j
	;;
esac


if [ -z "${JAVA_ASSET}" ]; then

# JDK does not exist, do not install
echo "Could Not Find JDK" 1>&2

else

JAVA_DIR=/opt/java
JDK_VERSION=$(tar ${TAR_COMPRESS}tf ${JAVA_ASSET} | grep -e '^jdk[^/]*/$' | sed -e 's:/::')
JAVA_BIN_DIR=${JAVA_DIR}/current/bin/

mkdir -p ${JAVA_DIR}

pushd ${JAVA_DIR} 1>/dev/null
tar ${TAR_COMPRESS}xf ${JAVA_ASSET}
rm -f current
ln -s ${JDK_VERSION} current
popd 1>/dev/null


for i in java javac javaws keytool pack200 rmid unpack200 orbd servertool tnameserv
do
	update-alternatives --install "/usr/bin/${i}" "${i}" "${JAVA_BIN_DIR}${i}" 1
	update-alternatives --set ${i} ${JAVA_BIN_DIR}${i}
done


mkdir -p /etc/profile.d
cat > /etc/profile.d/java.sh << EOF
JAVA_HOME=\$(/usr/bin/java -showversion -verbose 2>&1 | perl -pe 'm: (.*)/jre/lib/rt.jar]:; print "\$1\n"; exit 0')
JRE_HOME=\${JAVA_HOME}
export JAVA_HOME
export JRE_HOME

EOF

fi
