rubyPomodoro
============

A Command line Pomodoro Timer, with a logging/journaling option. 

Requires Ruby 1.9.3

##Install

>git clone git@github.com:lindseymysse/rubyPomodoro.git

>bundle install

>cd rubyPomodoro

>./pomodoro.rb "My first Pomodoro" --log

Run with 
>./pomodoro.rb [LENGTH OF POMODORO(optional--defaults to 25)][NAME OF INITIAL TASK (optional)][OPTION]

##Options

>--log
This creates a directory in your home directory called .pomodoro, and creates a unique CSV file for each day, and fills it with the start/end task and notes about 
