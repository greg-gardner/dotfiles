#!/usr/bin/env python3
import sys
import os
import getopt

def main(argv):
  
  EXE = "superfind.py"
  HELP = EXE + ' [-d DIR] [-x | --exact] [-p | --preview] [-c|--case] QUERY'
  QUERY = ''
  ROOT_DIR = '/'
  EXACT = False
  CASE_SENSITIVE = False
  PREVIEW = False

  # Get the command line arguments
  try:
    opts, args = getopt.getopt(argv, "hxpcd:", ["help", "exact", "preview","case"])
  except getopt.GetoptError:
    print (HELP)
    sys.exit(2)
  for opt, arg in opts:
    if opt in ("-h", "--help"):
      print (HELP)
      sys.exit()
    elif opt in ("-d"):
      ROOT_DIR = arg
    elif opt in ("-x", "--exact"):
      EXACT = True
    elif opt in ('-c', '--case'):
      CASE_SENSITIVE = True
    elif opt in ('-p', "--preview"):
      PREVIEW = True
  
  if len(args) > 0:
    QUERY = args[-1]
  else:
    print(HELP)
    sys.exit(3)

  # Enable/disable wildcard search.
  W = '*'
  if (EXACT):
    W = ''

  # Enable/disable case sensitivity.
  name = ' -iname '
  if (CASE_SENSITIVE):
    name = ' -name '

  # Build find command. 
  FIND_CMD =  "find "+ ROOT_DIR + name +W+QUERY+W+" 2> /dev/null"

  # Preview command.
  if (PREVIEW):
      print(FIND_CMD)
      sys.exit(0)

  # Run find.
  os.system(FIND_CMD)

if __name__ == "__main__":
   main(sys.argv[1:])
