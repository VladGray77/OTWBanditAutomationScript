#!/bin/bash

# Function to connect to the Bandit server and retrieve the password
get_bandit_password() {
    level=$1
    password=$2
    command=$3

    # Connect to the remote server using sshpass
    sshpass -p "$password" ssh bandit$level@bandit.labs.overthewire.org -p 2220 "$command" | tr -d ' \t\n\r\f'
}

# Function to append to the BANDIT_PASSWORDS.txt file
# append_to_password_file_first create new document every time
append_to_password_file_first() {
    level=$1
    password=$2

    echo "Level $level password: $password" > ~/Desktop/BanditScript/PASSWORDS.txt
}

# append_to_password_file will just add a new line for password to the file

append_to_password_file() {
    level=$1
    password=$2

    echo "Level $level password: $password" >> ~/Desktop/BanditScript/PASSWORDS.txt
}

# Main script

# Level 0
level=0
password="bandit0"

# Get the password for Level 0
password_for_level=$(get_bandit_password $level $password "cat readme")

# Append to the password file
append_to_password_file_first $level "$password_for_level"

# Level 1
level=1
# Extract password for Level 1 from BANDIT_PASSWORDS.txt
password_for_level_1=$(grep "Level 0 password:" PASSWORDS.txt | cut -d ' ' -f 4)

password=$password_for_level_1

# Get the password for Level 1
password_for_level=$(get_bandit_password $level $password "cat ./-")

# Append to the password file
append_to_password_file $level "$password_for_level"

# Level 2
level=2
# Extract password for Level 2 from BANDIT_PASSWORDS.txt
password_for_level_2=$(grep "Level 1 password:" PASSWORDS.txt | cut -d ' ' -f 4)

password=$password_for_level_2

# Get the password for Level 2
password_for_level=$(get_bandit_password $level $password "cat spaces\ in\ this\ filename")

# Append to the password file
append_to_password_file $level "$password_for_level"

# Level 3
level=3

# Extract password for Level 3 from BANDIT_PASSWORDS.txt
password_for_level_3=$(grep "Level 2 password:" PASSWORDS.txt | cut -d ' ' -f 4)

password=$password_for_level_3

# Get the password for Level 3
password_for_level=$(get_bandit_password $level $password "cd inhere && cat .hidden")

# Append to the password file
append_to_password_file $level "$password_for_level"

# Level 4
level=4

# Extract password for Level 4 from BANDIT_PASSWORDS.txt
password_for_level_4=$(grep "Level 3 password:" PASSWORDS.txt | cut -d ' ' -f 4)

password=$password_for_level_4

# Get the password for Level 4
password_for_level=$(get_bandit_password $level $password "cd inhere && cat ./-file07")

# Append to the password file
append_to_password_file $level "$password_for_level"

# Level 5
level=5

# Extract password for Level 5 from BANDIT_PASSWORDS.txt
password_for_level_5=$(grep "Level 4 password:" PASSWORDS.txt | cut -d ' ' -f 4)

password=$password_for_level_5

# Get the password for Level 5
password_for_level=$(get_bandit_password $level $password "cd inhere && cat ./maybehere07/.file2")

# Append to the password file
append_to_password_file $level "$password_for_level"

# Level 6
level=6

# Extract password for Level  from BANDIT_PASSWORDS.txt
password_for_level_6=$(grep "Level 5 password:" PASSWORDS.txt | cut -d ' ' -f 4)

password=$password_for_level_6

# Get the password for Level 6
password_for_level=$(get_bandit_password $level $password "cat /var/lib/dpkg/info/bandit7.password")

# Append to the password file
append_to_password_file $level "$password_for_level"

# Level 7
level=7

# Extract password for Level  from BANDIT_PASSWORDS.txt
password_for_level_7=$(grep "Level 6 password:" PASSWORDS.txt | cut -d ' ' -f 4)

password=$password_for_level_7

# Get the password for Level 7
password_for_level=$(get_bandit_password $level $password "cat data.txt | grep millionth data.txt | awk '{print $2}' | sed 's/millionth//'")

# Append to the password file
append_to_password_file $level "$password_for_level"

# Level 8
level=8

# Extract password for Level  from BANDIT_PASSWORDS.txt
password_for_level_8=$(grep "Level 7 password:" PASSWORDS.txt | cut -d ' ' -f 4)

password=$password_for_level_8

# Get the password for Level 8
password_for_level=$(get_bandit_password $level $password "cat data.txt | sort | uniq -u")

# Append to the password file
append_to_password_file $level "$password_for_level"

# Level 9
level=9

# Extract password for Level  from BANDIT_PASSWORDS.txt
password_for_level_9=$(grep "Level 8 password:" PASSWORDS.txt | cut -d ' ' -f 4)

password=$password_for_level_9

# Get the password for Level 9
password_for_level=$(get_bandit_password $level $password "cat data.txt | strings -e s | grep == | awk '{print $NF}' | tail -n 1 | sed 's/==========//'")

# Append to the password file
append_to_password_file $level "$password_for_level"

# Level 10
level=10

# Extract password for Level  from BANDIT_PASSWORDS.txt
password_for_level_10=$(grep "Level 9 password:" PASSWORDS.txt | cut -d ' ' -f 4)

password=$password_for_level_10

# Get the password for Level 10
password_for_level=$(get_bandit_password $level $password "cat data.txt | base64 -d | sed 's/The password is //'")

# Append to the password file
append_to_password_file $level "$password_for_level"

# Level 11
level=11

# Extract password for Level  from BANDIT_PASSWORDS.txt
password_for_level_11=$(grep "Level 10 password:" PASSWORDS.txt | cut -d ' ' -f 4)

password=$password_for_level_11

# Get the password for Level 11
password_for_level=$(get_bandit_password $level $password "cat data.txt | tr 'A-Za-z' 'N-ZA-Mn-za-m' | sed 's/The password is //'")

# Append to the password file
append_to_password_file $level "$password_for_level"

# Level 12
level=12

# Extract password for Level  from BANDIT_PASSWORDS.txt
password_for_level_12=$(grep "Level 11 password:" PASSWORDS.txt | cut -d ' ' -f 4)

password=$password_for_level_12

# Get the password for Level 12
password_for_level=$(get_bandit_password $level $password "mkdir -p /tmp/vladdy6 && cp /home/bandit12/data.txt /tmp/vladdy6/ && cd /tmp/vladdy6 && xxd -r data.txt > vladdy && mv vladdy vladdy.gz && gunzip vladdy.gz && bunzip2 vladdy && mv vladdy.out vladdy.gz && gunzip vladdy.gz && tar -xf vladdy && tar -xf data5.bin && bunzip2 data6.bin && tar -xf data6.bin.out && mv data8.bin data8.gz && gunzip data8.gz && cat data8 | grep "The password is " | cut -d ' ' -f 4")

# Append to the password file
append_to_password_file $level "$password_for_level"

