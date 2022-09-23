![Logo of inspyr](https://github.com/TimoKats/medium_articles/blob/c8597069b4afc91e00d9c82961524a4303d3f6d0/img/inspyr-logo.png "a title")
---
### Abstract
What started as a personal project to learn Ruby with, became a useful brainstorming tool. In short, this application allows the user to create mindmaps **with** AI generated suggestions to help the brainstorming process. Currently, this app is very basic (doesn't use a lot of data, libraries, or any external engines) but it gets the job done. However, if anyone sees potential in this idea (or just wants to pick up a new project) **feel free to reach out or fork this repo**.  

### Installation/Getting started
First, your enviroment should have **Ruby** installed with the following libraries (called "gems" in Ruby): Sinatra, Puma (or thin), http, json and tokenizer.  
  
Next, you can download this repository and run `ruby main.rb` in your command line. This should output some info. Including a link to `http://localhost:4567/`. This is where you can use the inspyr app.

![Screenshot of inspyr](https://github.com/TimoKats/medium_articles/blob/759fad4a0edb164d56571c0fc8a21f765452f0e3/img/screenshot%20inspyr.png "a title")

### How it works
The app opens with aksing you an initial keyword. This is the center of your mindmap that you start brainstorming with. Next, you'll be linked to an empty mindmap starting with your keyword. Here, you can fill in the mindmap through either adding nodes *with manually set values* or *automatically generated values*. [This loom video shows a walkthrough of this process](https://www.loom.com/share/16437175567f413cb7c2807412d151e5).

### Contact
I'm always open to converse/collaborate with other developers. If you want to contact me, feel free to send me an [email](mailto:tpakats@gmail.com).
