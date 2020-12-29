import os
import sys
import subprocess
import urllib.request

SERVER_ADDRESS = os.environ['HOME_SERVER_ADDRESS']

SERVER_SERVICES = dict({'sonarr': 6089, 'radarr': 6079, 'jackett': 6099, 'deluge': 8112, 'tautulli': 8181, 'vnc': 5901, 'ombi': 3579})

CLOSE_COMMAND = 'close'

services = sys.argv[1:] if len(sys.argv[1:]) > 0 else SERVER_SERVICES.keys()

if __name__ == "__main__": 
    current_ip = urllib.request.urlopen('https://ident.me').read().decode('utf8')

    command = 'ssh Ubuntu-Server-Local' if current_ip == SERVER_ADDRESS else 'ssh Ubuntu-Server-Remote'
    
    for service in services:
        command += ' -L ' + str(SERVER_SERVICES[service]) + ':localhost:' + str(SERVER_SERVICES[service])

    process = subprocess.Popen(command.split(), 
                                stdin=subprocess.PIPE,
                                stdout=subprocess.PIPE,
                                stderr=subprocess.PIPE,
                                universal_newlines=True,
                                bufsize=0)
    
    os.system('clear')

    print(process.stdout.readline())

    for service in services:
        print('Opened service: ' + str(service) + ', on port: ' + str(SERVER_SERVICES[service]))

    print()

    print('Close connection to the server by typing: close')

    print()

    while(not str(input()) == CLOSE_COMMAND):
        pass
    
    process.stdin.close()
    closeConnection = True
    print('Closing the connection')
