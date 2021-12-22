# whyfund-saver
Whyfund-saver is a Browser Automation tool that allows to download the sets of challenges from http://whyfund.net/

# Story
Check out the [Medium](https://medium.com/@grzegorz.smajdor/automating-web-browser-f95adcb89de4) for details.

Also [watch](https://youtu.be/bBqR6cMRbq4) tool in action.


# Motivation
Browsing every test and checking their answers would take a LOT of time. Automation of this process took much shorter time!

The full story is k

# Technology
Be able to communicate and send commands to a browser using Watir and simplicity of Ruby was a perfect match

# How to run
* clone repository
* run `bundle install` inside of the folder

* run `ruby src/main.rb` to see it in action.
  - It will open browser (chrome by default) 
  - Will go to the page_url defined [here](https://github.com/gs/whyfund-saver/blob/main/src/main.rb#L46) it might work for your subdomain of sets on the `http://whyfund.net (but I did not check it).
  - Will read all the links from the page inside of the table
  - Will open page one by one and:
        - Hide the Ads (from bottom of the page)
        - Click on 'Check answers'
        - Download the html file and put it into `output` folder
        - and repeat 

