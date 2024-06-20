#!/bin/bash
url=https://github.com/romkatv/gitstatus.git
installdir=./software/gitstatus

if ! git clone --depth=1 "${url}" "${installdir}" 2>/dev/null && [ -d "${installdir}" ] ; then
    echo "${installdir} already exists."
fi