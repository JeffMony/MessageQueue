#encoding:utf8
#!/usr/bin/python

import sys
import os

print(sys.version)
print(sys.version_info)

COMMOND_OPTIONS = 'cpplint.py '
COMMOND_OPTIONS += '--root=./src/main/cpp '
COMMOND_OPTIONS += '--linelength=120 '
COMMOND_OPTIONS += '--filter=-runtime/printf,-runtime/references,-readability/casting,-build/include,-runtime/int,-legal/copyright,+build/header_guard '
COMMOND_OPTIONS += '--extensions=h,c,cc,cpp,txt '

class CppLint:
    if __name__ == '__init__':
        pass

    def lint_file(self):
        cwd = os.getcwd()
        current_dir = os.walk(cwd + '/src/main/cpp')
        for path, dir_list, file_list in current_dir:
            for file_name in file_list:
                if 'breakpad' in path:
                    continue
                if 'CMakeLists.txt' in file_list:
                    continue
                if 'sonic.h' in file_list:
                    continue
                current_file = os.path.join(path, file_name)
                # ,-build/header_guard
                command = COMMOND_OPTIONS + current_file
                result = os.system(command)
                print(result)
                if result != 0:
                    print('exit')
                    sys.exit(2)

if __name__ == '__main__':
    lint = CppLint()
    lint.lint_file()