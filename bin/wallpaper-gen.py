#!/usr/bin/python
from PIL import Image, ImageDraw, ImageColor, ImageFont
import random
import os, sys
import requests
import subprocess
import re

def wordoftheday():
    try:
        r = requests.get("https://merriam-webster.com")
        word = re.findall("<a href=\"/word-of-the-day\">([^A-Z]*)</a>", r.text)[0]
        definition = re.findall("<p class=\"wh-def-text\">(.*)</p>", r.text)[0]
    except Exception as e:
        print(e)
        return ("Error", str(e))
    return (word, definition)

def randomimage(path):
    return Image.open(path + random.choice(os.listdir(path)))

def box(image, rect, padding=10, linepadding=5, boxcolor="black", linecolor="gray"):
    draw = ImageDraw.Draw(image)
    draw.rectangle((rect[0]-padding, rect[1]-padding, rect[2]+padding-1, rect[3]+padding-1), boxcolor)
    draw.rectangle((rect[0]-padding+linepadding, rect[1]-padding+linepadding, rect[2]+padding-linepadding-1, rect[3]+padding-linepadding-1), outline=linecolor)

def textbox(image, title, text, position=(0.5, 0.50), textpadding=10, borderpadding=5, textcolor="white", backgroundcolor="black", framecolor="gray"):
    draw = ImageDraw.Draw(image)
    font = ImageFont.load_default()
    font = ImageFont.truetype("Hack-Italic", size=21)
    font2 = ImageFont.truetype("Hack-Regular", size=15)

    # get text size
    titlesize = draw.multiline_textsize(title, font)
    textsize = draw.multiline_textsize(text, font2)
    contentsize = (max(titlesize[0], textsize[0]), titlesize[1] + textsize[1] + textpadding)

    rect = [int(position[0] * image.width - contentsize[0]//2), int(position[1] * image.height - contentsize[1]//2), 0, 0]
    rect[2] = rect[0] + contentsize[0]
    rect[3] = rect[1] + contentsize[1]

    box(image, rect, textpadding, borderpadding, boxcolor=backgroundcolor, linecolor=framecolor)

    draw.text((rect[0], rect[1]), title, fill="white", font=font)
    draw.text((rect[0], rect[1]+titlesize[1]+textpadding), text, fill="white", font=font2)

def imagebox(image, src, pos, boxcolor="black", framecolor="white", margin=10, maxheight=None, maxwidth=None):
    if maxheight and maxwidth:
        if src.width > maxwidth or src.height > maxheight:
            src = src.resize((maxheight, maxwidth))
    rect = [int(pos[0] * image.width) - src.width//2, int(pos[1] * image.height) - src.height//2, 0, 0]
    rect[2] = rect[0] + src.width
    rect[3] = rect[1] + src.height

    box(image, rect)

    image.paste(src, (rect[0], rect[1]))

def modify(image, sourcepath):
    #wotd = wordoftheday()
    #textbox(image, wotd[0], wotd[1], position=(0.5, 0.75), textpadding=50)
    #imagebox(image, randomimage(sourcepath+"inspirobot/"), (0.19, 0.80), maxwidth=325, maxheight=325)
    #imagebox(image, randomimage(sourcepath+"inspirobot/"), (0.81, 0.80), maxwidth=325, maxheight=325)
    return image

def main():
    themepath = os.path.expanduser("~/.config/awesome/themes/hulks-dark/")
    sourcepath = os.path.expanduser("~/Pictures/")
    background = randomimage(sourcepath+"wallpapers/").resize((1920, 1080), Image.BILINEAR)
    wallpaper = modify(background, sourcepath)
    wallpaper.save(themepath+"wall.png")

if __name__ == "__main__":
    main()

