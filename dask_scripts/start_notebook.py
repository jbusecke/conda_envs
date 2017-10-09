from dask.distributed import Client
import sys

if sys.argv[1] == 'tiger1':
    hostname = 'tiger'
    port = 7772
elif sys.argv[1] == 'tigressdata.princeton.edu':
    hostname = 'tigress'
    port = 9992
elif 'an' in sys.argv[1]:
    hostname = 'gfdl_analysis'
    port = 8882
else:
    hostname = 'not recognized'
    port = 6662
    raise RuntimeError('hostname not recognized')


print(hostname)
print('running on port:'+str(port)+'\n')
client = Client(scheduler_file='scheduler.json')
print(client)



import socket
host = client.run_on_scheduler(socket.gethostname)


def start_jlab(dask_scheduler):
    import subprocess
    proc = subprocess.Popen(['jupyter', 'lab', '--ip', host, '--no-browser','--port',str(port)])
    dask_scheduler.jlab_proc = proc


client.run_on_scheduler(start_jlab)

print("%s" % host)
