Wei Cao(wc2467)
Shijie Hu(sh3251)

First version:

For this assignment, the main code has two parts. One is Java part used to get Twitter streaming with keyword filters and then save the entries into database. The other part is JSP with Javascript which reads data from the database and display them on the Google map.

For the beanstalk, JSP will be automaticlly displayed and Java part will be assigned to a EC2 to run cronjob every hour to update the database. The database I used is AWS RDS mysql.

In the JSP, the locations will be shown as markers on the google map and you can click each button at top to see changes. The markers have been changed to Twitter bird logo

To executing the code, you need to import the project folder into the eclipse as a dynamic web application and get the database address. For the java updating part, you also need database address and twitter application keys and access key.



Beanstalk url: http://wc2467twittermap.elasticbeanstalk.com
Screencast youtube url: https://www.youtube.com/watch?v=CroceiLmG7I&feature=youtu.be
Github url:https://github.com/andyweicao/Twitter-map


Here are the links to another one we did for the assignment and you can read the readme to learn that:
https://github.com/Shijie-Hu/TwitMapWeb1
http://twitmapshijiehu-env.elasticbeanstalk.com/
https://www.youtube.com/watch?v=CroceiLmG7I&feature=youtu.be