#ref: https://github.com/inariksit/gf-embedded-grammars-tutorial/blob/master/ReflTransfer.ipynb

from gtts import gTTS

import pgf
import subprocess
import sys
import speech_recognition as sr
# todo: fix mic
r = sr.Recognizer()
mic = sr.Microphone()

#import to play audio
import os
import playsound

#pause might be necessary
import time

gr = pgf.readPGF("Unix.pgf")

eng = gr.languages["UnixEng"]
cmd = gr.languages["UnixCmd"]

chooseLang = 'en'

def kill():
  print('kill')
  try:
    sys.exit(0)
  except SystemExit:
    os._exit(0)

def readScript():

  scriptName = input("what is the filename of your shell script?")

  try:
    with open(scriptName, encoding='utf-8') as myShell:
      myInput = ' '.join(myShell.readlines()[2:])
      return myInput
  except:
    print("sorry, your script can't be opened. please try again")
    readScript()

def getTerminal():
  try:
    return input("type your commands:")
  except:
    print("sorry, I don't understand your commands. please try again")
    getTerminal()

def promptChoice():

  try:
    choice = int(input("Choose 1 for text to speech and 2 for speech to text"))
    if choice == 1:
          textToSpeech()
    elif choice == 2:
          speechToText()
    else:
          print("sorry, can you try again?")
          promptChoice()
  except KeyboardInterrupt:
    kill()

def loadOrType():

  try:
    choice = int(input("Choose 1 to load a shell script and 2 to enter input using the terminal"))
    if choice == 1:
          return readScript()
    elif choice == 2:
          return getTerminal()
          # readTerminal()
          # myInput = readScript.myInput
    else:
          print("sorry, your choice wasn't valid. can you try again?")
          loadOrType()
  except KeyboardInterrupt:
    kill()

def textToSpeech():

  userInput = loadOrType()

  i = cmd.parse(userInput)
  prob,expr = next(i)
  print(expr)

  inEng = eng.linearize(expr)
  print(inEng)

  outputmp3 = "output.mp3"

  inWords = gTTS(text=inEng, lang=chooseLang, slow=False)
  inWords.save(outputmp3)
  playsound.playsound(outputmp3)
  os.remove(outputmp3)

  # run the command
  print(userInput)
  subprocess.call(userInput.split())

def getAudio(source):
  r.adjust_for_ambient_noise(source)
  print("what do you want to do?")

  # promptmp3 = "prompt.mp3"
  # prompt = gTTS(text="what do you want to do?", lang=chooseLang, slow=False)
  # prompt.save(promptmp3)
  # playsound.playsound(promptmp3)
  # os.remove(promptmp3)

  audio = r.listen(source, timeout=3)
  value = r.recognize_google(audio)
  print(value)
  result = eng.parse(value)
  prob,expr = next(result)
  cmdOutput = cmd.linearize(expr)
  print(cmdOutput)
  subprocess.call(cmdOutput.split())


def speechToText():

  with mic as source:

    try:
      getAudio(source)
    except:
        print("audio not recognised, try again")
        getAudio(source)

promptChoice()