from dask.distributed import Client
import sys

if sys.argv[1] == 'tiger1':
    hostname = 'tiger'
    port = 7772
    b_port = 7771
elif sys.argv[1] == 'tigressdata.princeton.edu':
    hostname = 'tigress'
    port = 9992
    b_port = 9991
else:
        raise RuntimeError('hostname not recognized')


client = Client(scheduler_file='scheduler.json')
print(client)

import socket
host = client.run_on_scheduler(socket.gethostname)

def start_jlab(dask_scheduler):
    import subprocess
    proc = subprocess.Popen(['jupyter', 'lab', '--ip', host, '--no-browser','--port',str(port)])
    dask_scheduler.jlab_proc = proc

client.run_on_scheduler(start_jlab)

print("ssh -N -L %s:%s:%s -L %s:%s:%s %s" % (b_port, host, b_port, port, host, port, hostname))
