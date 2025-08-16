#!/usr/bin/python
# -*- coding: utf8 -*-
import logging
import os

def setup_logger(logger_name, log_file, level=logging.INFO):

    os.makedirs(os.path.dirname(log_file), exist_ok=True)

    lz = logging.getLogger(logger_name)

    if not lz.hasHandlers():
        formatter = logging.Formatter('%(asctime)s : %(message)s')

        fileHandler = logging.FileHandler(log_file, mode='w')
        fileHandler.setFormatter(formatter)
        lz.addHandler(fileHandler)

        streamHandler = logging.StreamHandler()
        streamHandler.setFormatter(formatter)
        lz.addHandler(streamHandler)

        lz.setLevel(level)

    return lz
