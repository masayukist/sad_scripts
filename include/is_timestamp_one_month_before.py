#!/usr/bin/env python3

import argparse
import datetime
import sys

parser = argparse.ArgumentParser(description="time converter")
parser.add_argument('timestamp', metavar="TIMESTAMP", nargs=1)

args = parser.parse_args()

dt = datetime.datetime.strptime(args.timestamp[0], '%Y-%m-%dT%H:%M:%S')
now = datetime.datetime.now()
da1m = now + datetime.timedelta(days=31)  # 30 days before
da1m_b1d = da1m - datetime.timedelta(days=1) # 29 days before


if ( dt < now ):
	print("PAST")
	sys.exit(0)
if ( da1m < dt ):
	print("FAR_FUTURE")
	sys.exit(0)
if ( da1m_b1d < dt and dt < da1m):
	print("ONE_MONTH_BEFORE")
	sys.exit(0)
print("NEAR_FUTURE")
