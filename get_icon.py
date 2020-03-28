# -*- coding: utf-8 -*-
#!/usr/bin/env python3

"""
Take an string as input and returns an icon.
"""
import sys
from pathlib import Path


def select_icon(path):
    """
    Choose the icon.
    """
    if '/Google Drive' in path:
        return '\ue731'
    if '/Descargas' in path:
        return '\uf74c'
    if '/github' in path:
        return '\ue709'
    if '/bitbucket' in path:
        return '\ue703'
    if path == str(Path.home()):
        return '\uf015'
    return '\uf07c'


if __name__ == '__main__':
    print(select_icon(sys.argv[1]))
