#! /usr/bin/python3

import os
import glob
import locale
import re
import shutil

translate_dict = {}

pattern = r'^(?P<key>.+)=(?P<value>.*)\n$'
pat = re.compile(pattern)

dictionary_file = 'release/Japanese/global.ini'
workfile = 'work/global.ini'
source_file = 'v3.23.1a/source/english/global.ini'

print('Current workspace : ' + os.getcwd())
# print(glob.glob('global.ini', recursive=True))

# workpos = '/home/runner/work'
# print('Work pos : ' + workpos)
# work_files = os.listdir(workpos)
# print(work_files)

# Remove old work file
if os.path.isfile(workfile):
    os.remove(workfile)
    print("## Work file is cleaned : " + workfile)
else:
    print("!! Work file does not exists : " + workfile)

# Check downloaded translations
if os.path.isfile(dictionary_file):
    print("### Dictionary file is received : " + dictionary_file)
    filesize = os.path.getsize(dictionary_file)
    print("### Filesize : " + str(filesize))

else:
    print("!!! Dictionary file does not exists : " + dictionary_file)


def readdict(dictfile, dictinary):
    with open(dictfile, encoding='utf-8') as fp:
        for line in fp:
            if result := pat.fullmatch(line):
                value = result.group('value').replace('\\;', ';')
                dictinary[result.group('key')] = value
            else:
                print("Invalid text : " + line)

readdict(dictionary_file, translate_dict)

keyword_matched = 0
no_target = 0
no_match_pattern = 0
with open(source_file, encoding='utf_8_sig') as fp:
    with open(workfile, 'w', encoding='utf_8_sig', newline='\r\n') as g:
        for line in fp:
            if result := pat.fullmatch(line):
                target = result.group('key')
                if target in translate_dict:
                    g.write(target + "=" + translate_dict[target] + "\n")
                    keyword_matched = keyword_matched + 1
                else:
                    g.write(line)
                    no_target = no_target + 1
            else:
                g.write(line)
                no_match_pattern = no_match_pattern + 1

print("! Matched keywords : " + str(keyword_matched))
print("! No target : " + str(no_target))
print("! Pattern failed : " + str(no_match_pattern))

if os.path.isfile(workfile):
    print("Work file is created : " + workfile)
    filesize = os.path.getsize(workfile)
    print("Filesize : " + str(filesize))

    work_files = os.listdir("./work")
    print(work_files)

    shutil.make_archive('global.ini', format='zip', root_dir='work')
else:
    print("Failed to create file.")
