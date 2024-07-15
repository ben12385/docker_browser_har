#!/usr/bin/python3

import pyautogui
import time
import os

# Start chromium
os.system("/usr/bin/chromium --start-maximized")
time.sleep(2)

print("Ctl Alt B")
with pyautogui.hold('shiftleft'), pyautogui.hold("ctrlleft"):
    pyautogui.press("b")
time.sleep(2)

print("Ctl Alt I")
with pyautogui.hold('shiftleft'), pyautogui.hold("ctrlleft"):
    pyautogui.press("i")
time.sleep(2)



print("Show Network")
print("Ctl Alt P")
with pyautogui.hold('shiftleft'), pyautogui.hold("ctrlleft"):
    pyautogui.press("p")
time.sleep(2)
pyautogui.write("show network", interval=0.1)
pyautogui.press("enter")
time.sleep(2)

with pyautogui.hold('shiftleft'), pyautogui.hold("ctrlleft"):
    pyautogui.press("p")
time.sleep(2)
pyautogui.write("preserve log on page", interval=0.1)
pyautogui.press("enter")
time.sleep(2)


pyautogui.press("f6")
time.sleep(2)

url = "https://google.com"
if("url" in os.environ):
    url = os.environ['url']

pyautogui.write(url, interval=0.1)
pyautogui.press("enter")
time.sleep(5)


button7location = pyautogui.locateOnScreen('/opt/startup_scripts/harDlButton.png', grayscale=True)
print(button7location)
pyautogui.moveTo(button7location[0], button7location[1]) 
pyautogui.click() 
time.sleep(2)
pyautogui.press('enter')

time.sleep(2)
os.system("cp /home/user/*.har /tmp/data")


# Take screenshot
print("Ctl Alt I")
with pyautogui.hold('shiftleft'), pyautogui.hold("ctrlleft"):
    pyautogui.press("i")
time.sleep(2)

os.system("scrot -z -f /tmp/data/ss.png")
time.sleep(2)



