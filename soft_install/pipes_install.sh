#!/bit/bash

installdir='./software/pipes'
url='https://github.com/pipeseroni/pipes.sh.git'
namedalias='pipes'

if ! git clone "${url}" "${installdir}" 2>/dev/null && [ -d "${installdir}" ] ; then
    echo "${installdir} already exists."
fi

if grep -Fq "alias ${namedalias}" .bash_aliases_software
then
    echo "Alias '${namedalias}' already registered."
    # code if found, no need to add to path
else
    # code if not found
    echo "alias $namedalias='$installdir/pipes.sh'" >> ".bash_aliases_software";
fi

