#!/bin/bash

# Get latest version of jdk in directory
SPARK_ASSET=$(ls -1 ${ASSETS_DIR}/spark-* | sort -n | head -1)

case ${SPARK_ASSET} in
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


if [ -z "${SPARK_ASSET}"]; then

# JDK does not exist, do not install
echo "Could Not Find Spark tarball" 1>&2

else

SPARK_DIR=/opt/spark
SPARK_VERSION=$(tar ${TAR_COMPRESS}tf ${SPARK_ASSET} | grep -e '^spark[^/]*/$' | sed -e 's:/::')
SPARK_BIN_DIR=${SPARK_DIR}/current/bin/

mkdir -p ${SPARK_DIR}

pushd ${SPARK_DIR} 1>/dev/null
tar ${TAR_COMPRESS}xf ${SPARK_ASSET}
rm -f current
ln -s ${SPARK_VERSION} current
popd 1>/dev/null


#for i in java javac javaws keytool pack200 rmid unpack200 orbd servertool tnameserv
#do
#	update-alternatives --install "/usr/bin/${i}" "${i}" "${SPARK_BIN_DIR}${i}" 1
#	update-alternatives --set ${i} ${SPARK_BIN_DIR}${i}
#done

fi
