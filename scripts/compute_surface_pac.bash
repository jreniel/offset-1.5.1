#!/bin/bash

## Load Python 2.7.13
#module use /usrx/local/dev/modulefiles
#module load python/2.7.13

export pyPath="/usrx/local/dev/python/2.7.13/bin"
export platform=""

export myModules=${platform}"/gpfs/hps3/nos/noscrub/nwprod/csdlpy-1.5.1"
export pythonCode=${platform}"/gpfs/hps3/nos/noscrub/nwprod/offset-1.5.1/offset/interpolate.py"

export logFile=${platform}"/gpfs/hps3/nos/noscrub/polar/offset/interp.pac.log"

export NDAYS=${1:-2} # 2 days averaging by default. Change it to 1 to 7 if need be. 
export inputFile=${platform}"/gpfs/hps3/nos/noscrub/polar/offset/latest_coops.csv"
export excludeList=${platform}"/gpfs/hps3/nos/noscrub/polar/offset/exclude_stations.csv"
export pltCfgFile=${platform}"/gpfs/hps3/nos/noscrub/nwprod/offset-1.5.1/scripts/config.plot.offset.pac.ini"
export outputFile=${platform}"/gpfs/hps3/nos/noscrub/polar/offset/pac/estofs.pac.offset.63"
export tmpDir=${platform}"/gpfs/hps3/nos/noscrub/tmp/offset/pac"

export ftpLogin="svinogradov@emcrzdm"
export ftpPath="/home/www/polar/estofs/offset/"

cd ${tmpDir}
PYTHONPATH=${myModules} ${pyPath}/python -W ignore ${pythonCode} -d ${NDAYS} -i ${inputFile} -e ${excludeList} -o ${outputFile} -c ${pltCfgFile} -t ${tmpDir} -u ${ftpLogin} -f ${ftpPath} > ${logFile}

