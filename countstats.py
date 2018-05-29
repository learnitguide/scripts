from __future__ import print_function
import subprocess

filename="dockerimage.log"
stats_file="counts.log"

total_lines = "wc -l dockerimage.log | cut -f1 -d ' '"
cmd1 = subprocess.Popen(total_lines,shell=True,stdout=subprocess.PIPE,stderr=subprocess.STDOUT)
output = cmd1.communicate()[0]
print ("Total Number of Lines: ",output)
