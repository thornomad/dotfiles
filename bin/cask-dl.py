#!/usr/local/bin/python3

import argparse
import os
import re
import sys
import glob
import tempfile

CASK_REPO = "https://github.com/caskroom/homebrew-cask.git"

DOWNLOAD = (
    'firefox',
    'google-chrome',
    'imagealpha',
    'imageoptim',
    'iterm2',
    'the-unarchiver',
    'cleanarchiver',
    'utorrent',
    'android-file-transfer',
    'backblaze-downloader',
    'makemkv',
    'plex-media-server',
    'firefox',
    'cyberduck',
    'tower',
    'kaleidoscope',
    'the-unarchiver',
    'kaleidoscope',
    'heroku-toolbelt',
    'geekbench',
    'sublime-text3',
    'aegisub',
)

try:
    from git import Repo
except ImportError:
    print("""Error!\nRequires gitpython: pip install gitpython""")
    sys.exit()


def get_url(file_name):
    try:
        data = {}

        # open file and creata a dictionary of values
        with open(file_name) as search:
            for line in search:
                line = line.rstrip().strip()
                line_split = line.split(" ")
                try:
                    data[line_split[0]] = line_split[1]
                except IndexError:
                    pass

        prog = re.compile("#{([^}]+)}")
        result = prog.match(data['url'])
        result = re.findall("#{([^}]+)}", data['url'])

        url = data['url'][1:-1]
        ver = data['version'][1:-1]
        url = url.replace('#{version}', ver)
        if result:
            for version in result:
                if version == 'version':
                    data['url'].replace('#{%s}' % version, data['version'])
            print(len(result))
            print(result[0])
            print('this one has stuff: %s' % data['url'])

        print(url, ver)
    except FileNotFoundError:
        print("Unable to find Cask for: %s" % file_name)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("-d", "--use-dir",
                        help="Use the specified Casks directory",
                        action="store", dest="casks_dir")
    for filename in glob.glob(os.path.join("/var/folders/8f/3h51gmtd4z5_6dlsygb4d2940000gn/T/tmpqaz9rq00/Casks", '*.rb')):
        get_url(filename)
    # print(tmp_dir)

if __name__ == '__main__':
    main()
