#Summary
This is a line chart of average flight delay (minutes) against arrival hour averaged over all U.S. airlines and airports in January 2008 using data from http://stat-computing.org/dataexpo/2009/the-data.html. It shows that arrival delay depends on the arrival hour, and that the time variation is different for different delay reasons. An interactive legend enables selection of delay reasons. A second chart shows the variation in total airline arrivals over the day.

#Design
The primary aim of the chart is to show the dependence of arrival delay on arrival time. Since there are two continuous variables, a line chart was chosen. A line chart is more appropriate than a scatter plot, as the lines show that there is a connection between points, in this case due to a variation in time.

A third variable, delay cause, was encoded using different colours, as indicated by the legend. The legend was made interactive so that the chart reader could select a single delay reason and see the trend for this reason more clearly. The y-axis rescales so that the optimum scale is used if only a single reason is selected. This is important, as delay is rather small for some reasons. Delay due to 'Security,' for example, is very flat, and must be selected on its own to view it properly. The interactive legend also allows the chart reader to focus on one cause, or two causes for easy comparison. There is a title for the legend to show the viewer that this legend is interactive and how to use it. Discovering some of the information in the graph (e.g. the trends due to 'Weather' and 'Security') requires some work from the chart reader (i.e. clicking on the legend), but it is not too arduous. The fact that the delay trends for these reasons are not visible on the chart as initially displayed is, I think, not an issue, as it simply means that other reasons are relatively more important.

The chart shows that arrival delay is a function of arrival time, and several regions can be identified. Delay tends to be lowest at the start of the day, increases over the course of the day, and then dramatically increases at around midnight, before dropping back down. For some reasons, e.g. NAS, the delay is flat for most of the day. For security, it is highest in the early hours of the morning.

The x-axis starts at 5am and ends at 4am, to emphasise the increase in delay over the day.

I believe that this chart is explanatory in that is shows some non-obvious trends, and that the various components (delay reasons) have different trends. The overall arrival delay is explained by the arrival hour, and also as the sum of components of differing magnitudes each with its own trend. It communicates the story that arrival delay increases during the day, primarily due to 'Late Aircraft', and then increases sharply in the early hours of the morning. By displaying all of the delay causes together, and the total of these ('All Causes'), the reader can infer that the delay due to all causes is the sum of the components and see the correlation between 'All Causes' and 'Late Aircraft'. This is further explained in some text at the bottom of the page, which describes in detail all of the delay reasons listed in the legend. (I added this after feedback from reviewers.) It is interesting to speculate as to the reasons for the trends. e.g. why is security delay highest at the start of the day?

A second chart was added to the bottom of the page, a line chart showing the change in the number of flights against time of the day. A subtitle for this chart explains that the traffic volume correlates with late aircraft delay and overall delay during peak hours. Outside of peak hours (roughly 6am to 11pm) the correlation doesn't hold. The reasons for this are not necessarily to be found in the dataset. Correlation is usually shown by using a scatter chart of one variable against another, often with a line-of-best-fit. The line chart against time, however, has the advantage of showing the variation over the day, and it is clear that the correlation applies only during peak hours. Making the the x-axes of both the top and bottom chart are identical assists the chart reader in interpreting the data.

I've highlight two regions, increasing traffic/delay and decreasing traffic/increasing delay, using lines and labels. In the first region, there is a positive correlation between the number of arriving planes and the delay (late aircraft delay and delay due to all causes). In the second, other factors take over.

R was used to reshape the data for plotting with dimplejs. This reshaped data is in a file called 2008_delay_causes.csv. I've added a snippet of the original file (prior to reshaping), 2008_delay_causes_snippet.csv.

##Main versions:
These charts have undergone major revisions.
* index1.html - Scatter12.html - original scatterplot for first submission
* index2.html - Bubble1.html - modified the scatterplot to make a bubble chart, plotted delay against arrival time, presented to three reviewers
* index3.html - Line1.html - converted the bubble chart to a line chart, changed the legend to make the chart more 'explanatory' and interesting
* final_index.html - Line3.html - changed chart title and axes label, modified after feedback from one reviewer and Udacity, added traffic volume chart to the bottom of the page

#Feedback
##First reviewer - Sara - feedback on bubble chart
Q1. What do you notice in the visualisation?

*I noticed the relationship of the arrival time and the delay for US airports for 2008.*

Q2. What do you notice in the visualisation?

*I do not understand the 75th percentile. Why are the circles different in size?*

Q3. What do you notice in the visualisation?

*In a certain period of time, there is more chance of delay. If I am going to buy a ticket, I’ll chose a time for which there is less delay.*

Q4. If I want to avoid delays, I will choose the airline which has less chance of delays.

*I can see the arrival delay for different airlines and times.*

Q5. What do you notice in the visualisation?

*I don’t know what the circle size is.*

In response to this reviewer's answer to question 2, I added an explanation of the various delay reasons to the bottom of the chart.

##Second reviewer - Clare - feedback on bubble chart
Q1. What do you notice in the visualisation?

*The chart shows the arrival delay for US airlines.*

Q2. What questions do you have about the data?

*I can see the busiest times. I don’t know what the meaning of the legend is. The chart doesn’t explain where the aircraft are flying to.*

Q3. What relationships or trends do you notice?

*The blue one is consistent over time, and the red one is irregular.*

Q4. What do you think is the main takeaway from this visualisation?

*Some airlines are more on time and some aren’t.*

Q5. Is there something you don’t understand in the graphic?

*Once the arrival hour and delay were explained, the meaning became clear.*

##Third reviewer - Cheryl - feedback on bubble chart
Q1. What do you notice in the visualisation?

*As arrival hour increases, the arrival delay increases.*

Q2. What questions do you have about the data?

*What is AA, OO, WN?*

Q3. What relationships do you notice?

*The circle diameter increases in the morning and becomes constant. It then decreases after midnight, and the delay increases after midnight.*

Q4. What do you think is the main takeaway from this visualisation?

*Delay is related to arrival hour.*

## First reviewer again - Sara
## - additional feedback after producing a line chart with delay reason legend
Q1. What do you notice in the visualisation?

*Different reasons produce different delays.*

Q2. What questions do you have about the data?

*Why is late aircraft delay more than the other reasons?*

Q3. What relationships do you notice?

*The average delay is related to arrival time.*

Q4. What do you think is the main takeaway from this visualisation?

*More delay happens in the early morning.*

Q5. Is there something you don’t understand in the graphic?

*What is ‘All Causes’? What is NAS?*

The following changes were made after feedback from the three reviewers of the bubble chart:
* Changed colour scheme
* Legend labels (substituted 'United Airlines' for 'UA' &c.)
* Added bubble legend
* Limited number of carriers displayed
* Plotted average delay time rather than 75th percentile.

The following changes were made after feedback from one reviewer of the line chart, and
Charlotte from Udacity:
* Added explanation of delay reasons at the bottom of the chart.
* I made the chart wider so that the x-axis labels rotated, improving readability.
* Made the title the subtitle, and made a new main title that poses a question (and thus guides the reader as to the story being told)
* Changed the x-axis title to read 'Actual arrival time', which is what it should be. (It's not the scheduled arrival time)
* Added second chart to the bottom of the page, showing number of flights arriving against hour, adding a further level of explanation

##Resources
  * http://stat-computing.org/dataexpo/2009/the-data.html
  * http://www.transtats.bts.gov/OT_Delay/OT_DelayCause1.asp
  * http://www.transtats.bts.gov/Fields.asp?Table_ID=236
  * http://www.rita.dot.gov/bts/help/aviation/html/understanding.html#q4
  * http://dimplejs.org/examples_index.html
  * http://dimplejs.org/examples_viewer.html?id=bars_vertical_stacked_100pct
  * http://dimplejs.org/advanced_examples_viewer.html?id=advanced_interactive_legends
  * http://dimplejs.org/advanced_examples_viewer.html?id=advanced_storyboard_control
  * http://dimplejs.org/advanced_examples_viewer.html?id=advanced_bar_labels
  * http://dimplejs.org/examples_viewer.html?id=scatter_standard
  * http://www.w3schools.com/cssref/pr_font_font-size.asp
  * http://stackoverflow.com/questions/23810128/wrong-result-in-dimplejs-scatterplot
  * https://github.com/PMSI-AlignAlytics/dimple/wiki/dimple.chart#addSeries
  * https://github.com/PMSI-AlignAlytics/dimple/wiki/dimple.storyboard
  * https://github.com/PMSI-AlignAlytics/dimple/wiki/dimple.eventArgs
  * https://github.com/PMSI-AlignAlytics/dimple/wiki/dimple.chart
  * http://thecodingtutorials.blogspot.com.au/2012/08/using-multi-column-data-with-d3-part-1.html
  * https://github.com/mbostock/d3/wiki/Gallery
  * http://christopheviau.com/d3list/
  * http://mikemcdearmon.com/portfolio/techposts/charting-libraries-using-d3
  * http://annapawlicka.com/pretty-charts-with-dimple-js/
  * http://blog.visual.ly/creating-animations-and-transitions-with-d3-js/
  * http://jsfiddle.net/nf57j/27/
  * http://stackoverflow.com/questions/23530434/in-dimple-how-do-you-change-the-order-of-the-series-ina-legend
  * http://stackoverflow.com/questions/26145982/change-chart-type-in-dimple-js-to-automate-chart-production
  * http://www.w3schools.com/cssref/css_selectors.asp
  * https://github.com/PMSI-AlignAlytics/dimple/wiki/dimple.chart#addLegend
  * https://leanpub.com/D3-Tips-and-Tricks/read
  * https://leanpub.com/D3-Tips-and-Tricks
  * http://stackoverflow.com/questions/23291200/dimple-js-how-can-i-change-the-labels-of-a-chart-axis-without-changing-the-data
  * http://stackoverflow.com/questions/25774821/dimple-js-axis-labels
  * http://stackoverflow.com/questions/20477224/removing-svg-text-elements-with-d3-js
  * http://cdn.oreillystatic.com/en/assets/1/event/91/D3_js%20tutorial%20Presentation.pdf
  * http://stackoverflow.com/questions/19387898/how-to-assign-unique-id-to-svg-text-element-in-d3-javascript
  * http://stackoverflow.com/questions/11903709/adding-drop-down-menu-using-d3-js
  * http://codekea.com/B7jlBrEGwAOo/finding-the-user-selected-options-from-a-multiple-drop-down-menu-using-d3.html
  * http://stackoverflow.com/questions/16805684/javascript-disable-text-select
  * http://fiddle.jshell.net/7KJC7/2/
  * https://en.wikipedia.org/wiki/List_of_the_busiest_airports_in_the_United_States
