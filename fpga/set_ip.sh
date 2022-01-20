#!/bin/bash

while true; do
  ip link show $DEMO_ENV_NIC
  var_check=$?
  if [[ $var_check -eq 0 ]]
  then
      echo "Connection is up!"
      ifconfig $DEMO_ENV_NIC:1 $DEMO_ENV_IP/$DEMO_ENV_MASK
      break
  else
      echo "Connection is down!"
      sleep 1
  fi
done
