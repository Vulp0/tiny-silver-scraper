# scrapes silver ounce price data from onzadeplata.xyz and prints it to the console
pattern='[^\s](\w|\s|.|$)*'

# command explanation
# 1- get the whole website
# 2- get all text inside table elements
# 3- get rid of all whitespace characters
# 4- remove duplicated data (2nd table, idk how it got there)
# 5- remove duplicated data (1st table) and save to txt file

curl -s https://onzadeplata.xyz \
    | xidel - -se '//table' \
    | grep -Poi $pattern \
    | awk -- 'NR < 56 || NR > 91' \
    | awk -- 'NR < 10 || NR > 15' > data.txt