#!/bin/bash
#SBATCH --nodes=2

#SBATCH --cpus-per-task=4
#SBATCH --mem=4G

#SBATCH --time=01:00:00
#SBATCH --job-name=jupyter-notebook
#SBATCH --output=jupyter_out.log

# info za ssh povezavo
XDG_RUNTIME_DIR=""
node=$(hostname -s)
user=$(whoami)
token=$(hostname)
cluster="nsc-login1.ijs.si"
port=8888 #jupyter notebook port
port1=8787 #dask dashboard port

port_local=8890 #jupyter notebook port na lokalnem računalniku
port_local1=8891 #dask dashboard port na lokalnem računalniku
find=0
printed=0
#Navodila za vzpostavitev ssh povezave na vozlišče
#Izpis v log datoteko



# Potrebni moduli
module load OpenMPI/4.1.4-GCC-11.3.0

# Zagon Jupyter zvezka

singularity exec --bind vsebniki/zvezki/:/opt/notebooks/ vsebniki/zadnijVsebnik.sif jupyter notebook  --notebook-dir=/opt/notebooks --ip='*' --port=8888 --no-browser --allow-root  |
while [ "$find" -eq 0 ];do
    while IFS= read -r line;do
        if [[ "$line" == *"token="* ]]; then
            arrIN=(${line//=/ })
          #  echo "Token:"${arrIN[4]}   
            token=${arrIN[4]}
            find=1
           
        fi
        if [[ "$find" -eq 1 ]];then
       
        echo -e "
                    Žeton (token):
                    ${token}

                    Za naslednja ukaza je potrebno na osebnem računalniku odpreti dve istanci gnu terminala

                    Ukaz za povezova na vozlišče preko ssh, jupyter zvezek:
                    ssh -N -L localhost:${port_local}:${node}:${port} ${user}@${cluster}

                    Ukaz za povezova na vozlišče preko ssh, Dask dashboard:
                    ssh -N -L localhost:${port_local1}:${node}:${port1} ${user}@${cluster}

                    -----------------------------------------------------------------------------------------------

                    V brskalniku se nahaja jupyter zvezek na naslednjem naslovu;
                    localhost:${port_local}

                    V brskalniku se nahaja Dask dashboard na naslednjem naslovu;
                    localhost:${port_local1}
                    " #| cat - jupyter_out.log > temp.log && mv temp.log jupyter_out.log
         break;
        fi
    done < jupyter_out.log
done 

 
