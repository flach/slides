## Measurement in machine learning

- Features are measurements
  - so they have scales, units, admissible statistics etc. 
- Experiments are measurements
  - e.g., confusion matrix obtained through cross-validation
  - what we really want to assess empirically is almost never directly observable!


### Measurement theory is not fully developed

- Stevens' levels of measurement
- Dimensional analysis in physics

Each of these have very significant blind spots, particularly when it comes to counts, probabilities etc. 


### Setting the stage

Do the following expressions make sense? 
- [$f(x) = x-\ln(x)$](https://www.wolframalpha.com/input?i=x+-+ln+x)  <!-- .element: class="fragment" -->
- [$g(x) = x-\sin(x)$](https://www.wolframalpha.com/input?i=x+-+sin+x)  <!-- .element: class="fragment" -->
- [$h(p) = p-\ln(p)$ where $p$ is a probability](https://www.wolframalpha.com/input?i=x+-+ln+x%2C+x+%5Cin+%5B0%2C1%5D)  <!-- .element: class="fragment" -->

----

## Stevens' Levels of measurement

![Stevens (1946)](img/Stevens1946.gif)  <!-- .element height="20%" width="20%" -->
![Stevens' levels](img/StevensTable.png)  <!-- .element height="65%" width="65%" -->

Early proposal from a psychologist [(Stevens, 1946)](https://www.jstor.org/stable/1671815), still influential although somewhat rigid and limited.


### Stevens' typology

Scale type | Description | Statistics
---|---|---
Nominal | no order, no unit | mode
Ordinal | order, no unit | median, quantile, range
Interval | can choose unit and zero | arithmetic mean, variance
Ratio | fixed zero, can choose unit | geometric mean, coefficient of variation

Each scale type inherits statistics from levels above.


### Levels of measurement: discussion

1. Many statisticians challenge the rigid connection between scale types and admissible statistics.
  - E.g., Spearman's rank correlation statistic would not be admissible for ordinal data.
2. Many common scales do not fit well:
  - scales bounded from both sides;
  - scales with a fixed unit;
  - integer measurements.

Such scales abound in machine learning!  <!-- .element: class="fragment" -->


### Alternative typologies

[Mosteller and Tukey (1977)](https://books.google.co.uk/books?id=n4dYAAAAMAAJ):
*Names*,
*Grades* (e.g., beginner, intermediate, advanced),
*Ranks* (1, 2, ...),
*Counted fractions* (e.g., percentages),
*Counts* (non-negative integers),
*Amounts* (non-negative real numbers),
*Balances* (unbounded, positive or negative values).

[Chrisman (1998)](https://doi.org/10.1559/152304098782383043):
*Nominal*,
*Graded membership* (e.g., fuzzy sets),
*Ordinal*,
*Interval*,
*Log-interval*,
*Extensive ratio*,
*Cyclical ratio* (e.g., angles or time of day)
*Derived ratio*,
*Counts*,
*Absolute* (e.g., probabilities).

----

## How physicists do measurement

- Physical quantities are assumed to have a unique associated **dimension** [(Fourier, 1822)](https://books.google.co.uk/books?id=No8IAAAAMAAJ&pg=PA128#v=onepage&q&f=false).
- In order to be compared and added or subtracted, quantities need to be *commensurable* (have the same dimension).
- Incommensurable quantities may be multiplied and divided, giving new derived dimensions.
  - E.g. pressure has dimension $M L^{-1} T^{-2}$
  - SI units Pascal = Newton/m$^2$ = kg/(m*s$^2$).


### Buckingham's $\Pi$-theorem

> A physically meaningful equation involving $n$ dimensioned variables can be rewritten in terms of $p=n-k$ dimensionless parameters $\pi_1, \pi_2, \ldots, \pi_p$ where $k$ is the number of physical dimensions involved. 

- Laws of physics don't depend on specific units
- Can be used to debug and sometimes derive the physics equation from the dimensions
- [Pendulum example (Wikipedia)](https://en.wikipedia.org/wiki/Buckingham_%cf%80_theorem#The_simple_pendulum)


### Dimensional coherence

> Construct a square whose circumference equals its area. 

Most people would solve $4x = x^2 \rightarrow x=4$. <!-- .element: class="fragment" -->

However, $4$ is now a dimensioned quantity -- four of what? <!-- .element: class="fragment" -->

A dimensionally correct analysis would introduce a unit of length $u$: <!-- .element: class="fragment" -->

$$4(x/u)=(x/u)^2 \rightarrow x=4u$$<!-- .element: class="fragment" -->


### Dimensionless quantities

- Angle is a ratio of lengths, hence dimensionless; but it has units (radians, degrees).
	- Sometimes units also cancel, e.g. ABV has unit ml ethanol per 100 ml liquid (percentage).<!-- .element: class="fragment" -->
- Trigonometric functions are ratios of lengths as well, but $\tan \theta > \theta$ doesn't seem to make much sense. <!-- .element: class="fragment" -->
	- Perhaps there are different kinds of length?<!-- .element: class="fragment" -->
- Transcendental functions ($\exp$, $\log$, $\sin$ etc.) require dimensionless and unitless arguments.<!-- .element: class="fragment" -->
  - $\log(10 kg) = \log(10) + \log(kg)$ ???<!-- .element: class="fragment" -->


### From dimensions to signatures

Rather than having dimensions and units cancel, why not carry them around as function or type signatures? 

```tan :: xlength -> ylength -> real```

```tan xl yl = yl/xl```

<br>

```angle :: arclength -> radius -> real```

```angle al r = al/r```

ML quantities can have more than one signature, as we will see later. 

----

## How to build on this in machine learning and AI?

- Both perspectives (levels of measurement and dimensional analysis) have interesting features but appear overly focused on establishing a 'true' scale type or dimension for a measurement.
  - Machine learning needs something more *flexible*.
  - In particular, a better treatment of "dimensionless" quantities which are everywhere you look!
    - relative frequencies, probabilities, evaluation metrics...


### The computer science perspective

- *Abstract data types* can be adapted to the situation:
  - they provide relevant *meta-data*; 
  - they link to useful *operations*.
- In particular, **higher-order functional languages** such as Haskell allow reasoning with and about types.
  - This provides a formal language and logic for measurement meta-data.
- The challenge is to develop a generally agreed ["Systeme international"](https://en.wikipedia.org/wiki/International_System_of_Units) of ML measurements.


### Example: Shannon entropy

[![xpecBits Haskell code](img/xpecBits.png)  <!-- .element height="80%" width="80%" -->](https://replit.com/@flach/ThoughtfulWarlikeRuntimelibrary)


### Example: Scoring rules

[![Scoring rules](img/genEntropy.png)  <!-- .element height="70%" width="70%" -->](https://replit.com/@flach/KeyBewitchedRoute)


### Signatures depend on context

The key point is that measures like Shannon entropy can have different signatures depending on the context: 
- average message length in information theory;  <!-- .element: class="fragment" -->
- expected score when forecasting the true distribution (generalised entropy) using the logarithmic scoring rule.  <!-- .element: class="fragment" -->

Under the squared loss scoring rule the generalised entropy is Bernoulli variance, which therefore has the same signature as Shannon entropy in the context of proper scoring rules.   <!-- .element: class="fragment" -->

----

## ML measurement in practice

If I split a data set in two or more parts, is a classifier's *accuracy* on the entire data set equal to the average* of the accuracies on the separate parts? 

Yes -- provided the parts are of equal size (e.g., cross-validation).  <!-- .element: class="fragment" -->

What about per-class recall ( = true positive rate)?  <!-- .element: class="fragment" -->

Yes -- provided the parts have the same class distribution (e.g., stratified CV). <!-- .element: class="fragment" -->

*To be precise: the arithmetic mean. 


### The arithmetic mean is not always appropriate

Is a classifier's *precision* on the entire data set equal to the average of the precisions on the parts? 

**IT IS NOT!**  <!-- .element: class="fragment" -->

Unless the classifier's predictions are equally distributed over the classes on each part, which is neither likely nor under the experimenter's control.  <!-- .element: class="fragment" -->

The same applies a fortiori to F-score, which aggregates recall and precision.  <!-- .element: class="fragment" -->


### Precision-Recall-Gain curves

![from ROC via PR to PRG](img/PRG.png)

[Flach, P. and Kull, M., 2015. Precision-recall-gain curves: PR analysis done right. NIPS 2015.](http://people.cs.bris.ac.uk/~flach/PRGcurves)


### Change of scale to the rescue

![PR curve](img/fig2-left.png) <!-- .element height="35%" width="35%" -->
![PRG curve](img/fig2-right.png) <!-- .element height="35%" width="35%" -->

 - area under PRG curve $\propto$ *expected $F_1$ score*;
 - convex hull can be used to determine the *optimal operating point* for given precision-recall trade-off.

----

## Outlook

Ultimately, empirical ML needs to make *causal* statements:

> Algorithm A outperformed algorithm B **because** the classes were highly imbalanced.

- I.e., with re-balanced classes (counterfactual intervention) the difference in performance would disappear.    <!-- .element: class="fragment" -->
  - NB. In empirical ML we can actually carry out interventions, which makes causal inference a whole lot easier!   <!-- .element: class="fragment" -->


## Concluding remarks

Proper treatment of performance evaluation in machine learning and AI requires a sophisticated **measurement framework** with the following components:
- *Coherent types and meta-data* for the observable performance indicators;
- *Latent-variable models* for the unobservable performance indicators of interest;
- *Causal models* to allow for counterfactual reasoning.


### Acknowledgements

Part of this work was funded through a project with the Alan Turing Institute; papers, code and videos can be accessed [here](https://www.turing.ac.uk/research/research-projects/measurement-theory-data-science-and-ai#recent-updates).

Many thanks to Hao Song, the Research Associate on the project; and collaborators Yu Chen, Tom Diethe, Jose Hernandez-Orallo, Conor Houghton, Meelis Kull, Paul-Gauthier Noe, Miquel Perello-Nieto, Ricardo Prudencio, Raul Santos-Rodriguez, Telmo Silva Filho, Kacper Sokol,  and many others.  <!-- .element: class="fragment" -->
