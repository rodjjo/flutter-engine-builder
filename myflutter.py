#!/bin/env python3
import os
import subprocess 
import sys


BASEDIR = os.path.abspath(os.path.dirname(__file__))
ENGINE_SRC_PATH = os.path.join(BASEDIR, 'output', 'src')

if __name__ == '__main__':
    if len(sys.argv) > 1:
        subprocess.check_call([
                'flutter', 
                '--local-engine-src-path', ENGINE_SRC_PATH,
                '--local-engine=host_debug_unopt',
            ] + sys.argv[1:]
        )

