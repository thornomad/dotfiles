#!/usr/local/bin/python3
import argparse
import csv
import os
import glob
import sys
import shutil
import subprocess

from datetime import timedelta
from collections import OrderedDict

try:
    from pymediainfo import MediaInfo
except ImportError:
    print('You need some dependencies first:')
    print('pip3 install six lxml beautifulsoup4')
    sys.exit()

VIDEO_FILE_TYPES = ('*.mp4', '*.mkv', '*.mov')


def get_video_info(file_list, output_filename="output.csv"):
    """Get video info for a file(s)"""
    total_duration = timedelta()
    items = []

    for filename in file_list:
        media_info = MediaInfo.parse(filename)
        media_dict = OrderedDict()
        src_dir, src_file = os.path.split(filename)
        media_dict['filename'] = src_file

        for t in media_info.tracks:
            if t.track_type == 'General':
                media_dict['format'] = t.format
            elif t.track_type == 'Video':
                media_dict['duration'] = timedelta(milliseconds=t.duration)
                media_dict['dimensions'] = "%sx%s" % (t.width, t.height)
                media_dict['video_bitrate'] = t.other_bit_rate[0]
                media_dict['video_framerate'] = t.frame_rate
                total_duration += timedelta(milliseconds=t.duration)

        items.append(media_dict)

    csv_list = []
    if len(items) > 0:
        csv_list.append([key for key, _ in items[0].items()])
        for item in items:
            csv_list.append([v for k, v in item.items()])

        totals = ['TOTALS:', len(items), total_duration]
        csv_list.append(totals)

    with open(os.path.join(src_dir, output_filename), 'w', newline='') as f:
        writer = csv.writer(f)
        writer.writerows(csv_list)


def find_video_files(dirname):
    files_found = []
    for files in VIDEO_FILE_TYPES:
        path = os.path.join(os.path.abspath(dirname), files)
        files_found.extend(glob.glob(path))
    return files_found


def remove_audio(filename, in_situ):
    src_dir, src_file = os.path.split(filename)
    src_file_name, src_file_ext = os.path.splitext(src_file)

    if in_situ:
        orig_file = os.path.join(src_dir,
                                 src_file_name + '-tmp' + src_file_ext)
        new_file = filename
        shutil.move(filename, orig_file)
    else:
        orig_file = filename
        new_file = os.path.join(src_dir,
                                src_file_name + '-no-audio' + src_file_ext)

    cmd = ['ffmpeg',
           '-i', orig_file,
           '-vcodec', 'copy',
           '-an',
           new_file]

    p = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
    out, err = p.communicate()

    if in_situ:
        os.remove(orig_file)

    if err:
        print('There was an error:', err)


def remove_audio_from_dir(dirname, in_situ):

    if len(file_list) == 0:
        print('No files found!')
        sys.exit()

    for filename in file_list:
        remove_audio(filename, in_situ)


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument("--remove-audio",
                        help="Remove audio from file(s)",
                        action="store_true")
    parser.add_argument("--in-situ",
                        help="Overwrite the file",
                        action="store_true")
    parser.add_argument("--info",
                        help="Gets info for a file(s)",
                        action="store_true")
    parser.add_argument("input_val", type=str,
                        help="Provide a filename or directory")
    args = parser.parse_args()

    if os.path.isfile(args.input_val):
        file_list = [args.input_val]
    elif os.path.isdir(args.input_val):
        file_list = find_video_files(args.input_val)
    else:
        print('Needs a file or a directory as a trailing option.')
        sys.exit()

    if args.remove_audio:
        remove_audio_from_dir(args.input_val, args.in_situ)
    elif args.info:
        get_video_info(file_list)
    else:
        print('Right now, you can just ')
