from dask.distributed import Client
client = Client(scheduler_file='scheduler.json')
print(client)

import socket
host = client.run_on_scheduler(socket.gethostname)

def start_jlab(dask_scheduler):
    import subprocess
    proc = subprocess.Popen(['jupyter', 'lab', '--ip', host, '--no-browser','--port','9992'])
    dask_scheduler.jlab_proc = proc

client.run_on_scheduler(start_jlab)

print("ssh -N -L 9991:%s:9991 -L 9992:%s:9992 <username>@tigressdata.princeton.edu" % (host, host))
