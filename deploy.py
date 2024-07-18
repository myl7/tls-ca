#!/usr/bin/env python3
import argparse
import subprocess

parser = argparse.ArgumentParser(prog='deploy')
parser.add_argument('-p', '--port', type=int, default=22)
parser.add_argument('ssh_uri')
args = parser.parse_args()

ssh_cmd = ['ssh', '-p', str(args.port), args.ssh_uri]
infra_ssh_boot_cmd = ['../infra/boot/ssh.py', '-p', str(args.port)]

subprocess.check_call(infra_ssh_boot_cmd + ['-s', 'ca.pem',
                      f'{args.ssh_uri}:/usr/local/share/ca-certificates/mylnet.crt'])
subprocess.check_call(ssh_cmd + ['sudo', 'update-ca-certificates'])
