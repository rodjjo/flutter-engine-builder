import os
import time


if __name__ == '__main__':
    while not os.path.exists('/src/completed.txt'):
        time.sleep(1.0)
