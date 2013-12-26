rubyPomodoro
============

A Command line Pomodoro Timer, with a logging/journaling option. 

Haven't done any Rake tasks or gemspec stuff yet. 

##Install

>git clone git@github.com:lindseymysse/rubyPomodoro.git

>gem install ruby-progressbar

>cd rubyPomodoro

>./pomodoro.rb "My first Pomodoro" --log

Run with 
>./pomodoro.rb [LENGTH OF POMODORO(optional--defaults to 25)][NAME OF INITIAL TASK (optional)][OPTION]

##Options

>--log
This creates a directory in your home directory called .pomodoro, and creates a unique CSV file for each day, and fills it with the start/end task and notes about 
