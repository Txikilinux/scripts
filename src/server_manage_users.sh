 #!/bin/bash
 home_path="/skole/tjener/home0/"
 permissions="2770"

for i in $home_path*/
do
    if [[ "$i" != "$home_path""donibane/" ]]; then
        # echo "NOT DONIBANE."
        cp -vr xfce4/ $i.config/
        chmod $permissions -R $i.config/xfce4/
        # echo "debug: " $i 
        # echo "echo: $home_path""donibane/"
    fi
done

for i in $home_path*/
do
    if [[ "$i" != "$home_path""donibane/" ]]; then
        echo "i=" $i; NUSER=`echo $i | cut -d "/" -f 5`
        echo $NUSER; groups $NUSER; NGROUP=`groups $NUSER | cut -d : -f 2 | cut -d " " -f 2`
        echo chown $NUSER:$NGROUP -R $i
    fi
done
