#ref: https://github.com/inariksit/gf-embedded-grammars-tutorial/blob/master/ReflTransfer.ipynb

from gtts import gTTS

import pgf
import subprocess
import sys
# import speech_recognition as sr
# todo: fix mic
# r = sr.Recognizer()
# mic = sr.Microphone()

#import to play audio
import os
import playsound

gr = pgf.readPGF("Unix.pgf")

eng = gr.languages["UnixEng"]
cmd = gr.languages["UnixCmd"]

with open('test.sh', encoding='utf-8') as test:
  testInput = ' '.join(test.readlines()[2:])

i = cmd.parse(testInput)
prob,expr = next(i)
print(expr)

inEng = eng.linearize(expr)
print(inEng)

outputmp3 = "output.mp3"

inWords = gTTS(text=inEng, lang='en', slow=False)
inWords.save(outputmp3)
playsound.playsound(outputmp3)
os.remove(outputmp3)

# run the command
print(testInput)
subprocess.call(testInput.split())

# with mic as source:
#   r.adjust_for_ambient_noise(source)
#   print("say something")
#   audio = r.listen(source, timeout=3)

# try:
#     value = r.recognize_google(audio)
#     print(value)
#     result = eng.parse(value)
#     print(result)
# except:
#     print("Sorry no.")