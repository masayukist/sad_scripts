#!/usr/bin/env python

import argparse
from datetime import datetime, timedelta

parser = argparse.ArgumentParser(description="time converter")
parser.add_argument('lastlogontimestamp', metavar="TIMESTAMP", nargs=1)

args = parser.parse_args()

def ldap2datetime(ts):
    return datetime(1601, 1, 1) + timedelta(seconds=float(ts)/10000000)

print(ldap2datetime(args.lastlogontimestamp[0]).isoformat())
