#! /usr/bin/env python3
"""
Links dotfiles where you want them when you want them.

If the file to be linked already exists (and is a real file, not a
symlink itself) you will be prompted to overwrite it.  Symlinks will be
re-linked without any complaints.
"""
import os
import argparse
import sys

HOME_DIR = os.path.expanduser("~")

ST3_PACKAGES_DIR = '/Library/Application Support/Sublime Text 3/Packages'
ATOM_PACKAGES_DIR = '/.atom'

DIR_MAP = (
    # ("sublime", HOME_DIR + ST3_PACKAGES_DIR),
    # ("atom", HOME_DIR + ATOM_PACKAGES_DIR),
)

WORKING_DIR = os.path.dirname(os.path.realpath(__file__))


def symlink_file(source, target):
    # TODO - need to figure out how to do the dotfiles --
    # perhaps prefix everything with _dot_gvimr and then replace the _dot_
    # with an actual dot!
    try:
        os.remove(target)
    except OSError:
        pass

    print("Linking:", target, "\nTo:", source)
    os.symlink(source, target)


def main(force_overwrite):

    for dotfiles_folder, install_path in DIR_MAP:
        src_fldr_path = os.path.join(WORKING_DIR, dotfiles_folder)

        for root, dirs, files in os.walk(src_fldr_path):
            files = [f for f in files if not f[0] == '.']

            for f in files:
                src = os.path.join(root, f)
                rel_path = src.replace(src_fldr_path, "").lstrip(os.path.sep)
                target = os.path.join(install_path, rel_path)
                target_dir = os.path.dirname(target)

                if target_dir != install_path:
                    if not os.path.exists(target_dir):
                        os.makedirs(target_dir)

                if (os.path.isfile(target) and not force_overwrite
                        and not os.path.islink(target)):
                    x = input("Target exits: %s\nOverwrite (ynq)?" % target)
                    if x == "y":
                        symlink_file(src, target)
                    elif x == "n":
                        print("Skipping: %s" % target)
                        continue
                    else:
                        sys.exit()
                else:
                    symlink_file(src, target)

if __name__ == '__main__':

    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('-f', '--force', dest='force_overwrite',
                        action='store_true',
                        help='Don\'t prompt overwrites of real files')
    parser.set_defaults(force_overwrite=False)
    args = parser.parse_args()

    main(args.force_overwrite)
