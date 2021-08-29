#! /usr/bin/python3

#Assumtions that is made when creating this script
# 1. Password contains only 8 or less charactors
# 2. Password is made of lowercase letters, uppercase letters and numbers. 
# 3. We dont do any checks for the username, so we assume that this is something we alrady know. 

#<<<Resources for creating this script:>>>#
# https://stackoverflow.com/questions/11367553/brute-force-script-in-python-3-2 - Which libries to import, and where they are. 
# Ethical Hacking using Python | Password Cracker Using Python | Edureka - Youtube - https://www.youtube.com/watch?v=CV_mMAYzTxw&ab_channel=edureka%21


#Libriries Imported: 
import hashlib                    
#from itertools import product    #FIX ME ?? (Not sure why this is not working)
import itertools               

# User's Password hash - The password that is matched.
# User password is "d55" - selected this since it is small and less combniations before it can get to the haspassword 
userPassword = "0f220083030ec815573667f6bae88cf86715f04b6708224776501d72b17ad44d" #hash for - d55 

#Charactors that is in the password
chars = "0123456789" + "abcdefghijklmopqrstuvwxyz" + "ABCDEDFGIJKLMNOPQRSTUVWXYZ"

spacer = ""

for passwordLength in range(8):

#Repate and generate lenght +1 
#Resource: Code taken from https://newbedev.com/python-generate-all-possible-strings-of-length-n
#Using wordTuple - function from the products library.

    for wordTuple in itertools.product(chars,repeat=passwordLength + 1):
        word = spacer.join(wordTuple)

        #Code was taken as an example from John D. Cook - https://www.johndcook.com/blog/2019/07/01/notes-on-computing-hash-functions/
        #hashilb - library supports several hashing algorithms. 
        crackedPasswordHash = hashlib.sha256(word.encode('utf-8')).hexdigest()
        print("Checking the Password Hash %s: %s" % (word,crackedPasswordHash)) 

        if(crackedPasswordHash == userPassword):  #Password hash on file matches the craked password.
            print("\n<<Password Cracked>>")
            print(f"Password on file is: {word}\n")
            exit(0)
            #break   # Need to exit the if statment if not it will continure the loop. Tried break, and that is not working :FIX ME??
            #else              #FIX ME??
            #   print("Password not found")
            #  exit(1)

print("Password was not found, Please try again. \n")   #If no password was found. 
exit(2)