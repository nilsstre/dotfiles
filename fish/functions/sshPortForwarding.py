import os
import sys
import subprocess

SERVER_ADDRESS = os.environ['HOME_SERVER_ADDRESS']
SERVER_PORT = os.environ['HOME_SERVER_PORT']
SERVER_USER = os.environ['HOME_SERVER_USER']
SERVER_KEY = os.environ['HOME_SERVER_KEY']
HOME = os.environ['HOME']

services = dict({'sonarr': 6089, 'radarr': 6079, 'jackett': 6099, 'deluge': 8112, 'tautulli': 8181, 'vnc': 5901})

arguemnts = sys.argv[1:]

if __name__ == "__main__":
    command = 'ssh -i ' + HOME + '/.ssh/' + SERVER_KEY + ' -p ' + SERVER_PORT + ' ' + SERVER_USER + '@' + SERVER_ADDRESS

    for service in arguemnts:
        command += ' -L ' + str(services[service]) + ':localhost:' + str(services[service])

    process = subprocess.Popen(command.split(), 
                                stdin=subprocess.PIPE,
                                stdout=subprocess.PIPE,
                                stderr=subprocess.PIPE,
                                universal_newlines=True,
                                bufsize=0)
    
    os.system('clear')

    for service in arguemnts:
        print('Opened service: ' + str(service) + ', on port: ' + str(services[service]))

    print(process.stdout.readline())

    closeConnection = False

    while(not closeConnection):
        if str(input()) == 'close':
            process.stdin.close()
            closeConnection = True
            print('Closing the connection')
