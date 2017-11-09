FROM buildpack-deps:xenial-scm

#lsb_release_sc=xenial in ubuntu 16.04
RUN set -x \
      && sed -i 's/\/\/.*ubuntu.com/\/\/mirrors.aliyun.com/g' /etc/apt/sources.list \
      && lsb_release_sc=$(grep CODENAME /etc/lsb-release | awk 'BEGIN{FS="="}{print $2}') \
      && wget https://repo.percona.com/apt/percona-release_0.1-4.$(echo $lsb_release_sc)_all.deb \
      && dpkg -i percona-release_0.1-4.$(echo $lsb_release_sc)_all.deb \
      && rm -rf percona-release_0.1-4.$(echo $lsb_release_sc)_all.deb \
      && apt-get update \
      && apt-get install -y percona-toolkit

