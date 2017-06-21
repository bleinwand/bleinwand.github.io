



<li><a href="#VisualizingO-RingTheory" data-toggle="tab">Visualizing O-Ring Theory</a></li>
  





<div class="tab-pane fade" id="VisualizingO-RingTheory">
  <div class="column-left">
    When I first read about [O-ring theory](https://en.wikipedia.org/wiki/O-ring_theory_of_economic_development), I was impressed with the idea, but unfortunately, I wasn't able to find any good graphical displays of the output from different groups of workers. The following illustrates when workers of a certain skill level would benefit from banding together, when they should maintain the current group size, and when they should break into smaller groups <sup><a href="#footnote-1" id="note-1" rel="footnote" <sup> 1 </sup> </a> 
  
  
  ```{r, echo = FALSE, message=FALSE, warning=FALSE, fig.align='center'}
  library("RColorBrewer")
  library("gplots")
  
  oring = matrix(NA, nrow=100, ncol=200)
  rownames(oring) = seq(from=.99, to=0, by=-.01)
  colnames(oring) = seq(from=0, to=199, by=1) 
  for (i in 1:100){
  for (j in 1:200){
  oring[i,j] = as.numeric(colnames(oring)[j])*(as.numeric(rownames(oring)[i])^as.numeric(colnames(oring)[j]))
  }
  }
  
  labcol = as.numeric(colnames(oring))
  labcol[labcol[1:199]%%10!=0]=NA
  
  labrow = as.numeric(rownames(oring))
  labrow[(10*labrow[1:100])%%1!=0]=NA
  labrow[1]=.99
  
  #Whole map
  heatmap.2(oring, Rowv=NA, Colv=NA, col = brewer.pal(11,"RdYlGn"), tracecol=NA, labCol = labcol, labRow = labrow, density.info=c("none"), xlab = "Number of Workers", ylab = "Worker Efficiency", main="Heatmap of Output in O-ring Theory")
  
  ```
  As you can see, the highest skill workers are responsible for the largest deviations in output, so let's zoom in on those workers  
  
  ```{r, echo = FALSE, message=FALSE, warning=FALSE, fig.align='center'}
  #action at the top
  heatmap.2(oring[1:11,], Rowv=NA, Colv=NA, col = brewer.pal(11,"RdYlGn"),tracecol=NA, labCol = labcol, density.info=c("none"),  xlab = "Number of Workers", ylab = "Worker Efficiency", main = "Output of Highest Skill Workers" )
  
  #which.max(oring[100,])
  # at 99 people or 100 people, (the actual value according to wolfram alpha is about 99.4992) - the output gets to 36.6
  
  
  ```
  These workers seem to benefit from forming small groups, but they face diminishing - and then negative - returns to joining together after achieving a certain group size 
  
  Even those workers with 99% skill level top out at groups of about 100 workers, as shown below  
  
  ```{r, echo = FALSE, message=FALSE, warning=FALSE, fig.align='center'}
  plot(0:199, oring[1,], xlab = "Number of Workers", ylab = "Output", title(main = "Output of Workers with 99% efficiency"))
  ```
  For the sake of giving the reader greater color, here's a heatmap focusing on those workers with levels below 90%. Note that the color key has a different scale on this heatmap 
  
  ```{r, echo = FALSE, message=FALSE, warning=FALSE, fig.align='center'}
  #action at the low end
  heatmap.2(oring[11:100, 1:50], Rowv=NA, Colv=NA, col = brewer.pal(11,"RdYlGn"),tracecol=NA, labCol = labcol, labRow = labrow, density.info=c("none"),  xlab = "Number of Workers", ylab = "Worker Efficiency", main = "Focus on the bottom 90%")
  ```
  
  Two things immediately jump out:
  
  1) The lower skill workers should form smaller teams
  2) Teams composed of higher skill workers can produce output much more valuable than the output from lower skill workers 
  
  For a simple example, while the 99% workers can create output of ~37 value using a team of 100 people, the  89% workers shouldn't be in teams greater than 9 people, and their output's value tops out at ~3.
  <br />  
  
  This only displays one side of the theory, focusing on what workers can produce, while ignoring worker distributions, how firms should operate in this environment (though the heatmap does assume perfect skill matching), and the broader implications of this model. Whether or not these illustrations makes the O-ring theory more believable, seeing these results should give you a better intuition about the model's claims.
  
  <p>&nbsp;</p>
    
    </div>
    
    <div class="footnotes"><hr /><ol><li id="footnote-1" class="footnote" style="font-size:75%; padding-top:75px;"><p>This is a simplified version of the theory where Beta is assumed to always equal 1, and perfect skill matching is possible<a href="#note-1" class="footnote-return">&#8617;</a></p></li><!--/#footnote-1.footnote-->
    
    </div>
    
    </div>