#!/bin/bash

# Introduction
echo "This is a Single source / destination threading application
with a ratio of 100:1 source/destination ports per thread.
Ensure you have the server running on the destination host"

# Read the destination IP address.
echo "What is the IP of the destination?"
read dst

# Number of threads
echo "This script will initiate 100 streams per thread, how many threads
should be initiated?"
read sockets

#throughput
echo "how many bits / sec? (enter [0] for unlimited"
read speed

# How long
echo "how long would you like to run each thread (in seconds)?"
read t_time

dst_port=5201
counter=1
while [ $counter -le $sockets ]; do
	echo Building Thread $counter
	iperf3 -c $dst -p $dst_port -P 100 -i 0 -t $t_time -b $speed &
	let counter=counter+1
	let dst_port=dst_port+1
done
