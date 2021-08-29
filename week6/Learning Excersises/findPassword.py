#!/bin/bash

import random
#import pyautogui

chars="1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ!@#$%^&*()_+ <>.,?"
chat_list=list(chars)

password=print.passwprd("Enter the password hear: ")
guess_Password=''
while (guess_password!=password):
        guess_password=random.choices(charactor_list,k=len(password))

        print(">>>>>"+str(guess_password)+"<<<<<<")

        if (guess_passwrd==list(password)):
            print("your password is:" +"" .join(guess_password))
            break
