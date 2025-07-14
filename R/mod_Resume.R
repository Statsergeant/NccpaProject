#' Resume UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_Resume_ui <- function(id) {
  ns <- NS(id)

    nav_panel(
      title = 'resume',
      icon = icon('file-contract'),
      html
    )


}

#' Resume Server Functions
#'
#' @noRd
mod_Resume_server <- function(id){
  moduleServer(id, function(input, output, session){
    ns <- session$ns

  })
}

## To be copied in the UI
# mod_Resume_ui("Resume_1")

## To be copied in the server
# mod_Resume_server("Resume_1")


html <- HTML(
  '

<h1>Geo (Geonhyeok) Jeong</h1>

<p style="text-align: center;">
  <strong>Durham, NC 27703</strong> | <a href="mailto:statsergeant@gmail.com">statsergeant@gmail.com</a> |
  <strong>980-210-8515</strong> | <strong>Green Card</strong> |
  <a href="https://statsergeant.quarto.pub/statsergeant/" target="_blank">https://statsergeant.quarto.pub/statsergeant/</a>
</p><hr style = "margin: 0.5rem 0; margin-right: 20rem;">

<hr style="margin-bottom: 1.5rem;">

<h2>EDUCATION</h2>

<hr style = "margin: 0.5rem 0; margin-right: 20rem;">

<div class="space">
  <p><strong>University of North Carolina at Chapel Hill</strong></p>
  <p><strong>May 2024</strong></p>
</div>

<p>Master of Science in Statistics and Operational Research</p>
<br>


<div class="space">
  <p><strong>Pusan National University, Pusan, South Korea</strong></p>
  <p><strong>February 2021</strong></p>
</div>
<p>Bachelor of Science in Statistics / Second seat</p>
<br>

<div class="space">
  <p><strong>Kyonggi University, Suwon, South Korea</strong></p>
  <p><strong>June 2015</strong></p>
</div>
<p>Bachelor of Business in Business</p>
<br>

<h2>WORK EXPERIENCE</h2>
<hr style = "margin: 0.5rem 0; margin-right: 20rem;">

<div class="space">
  <p><strong>Data Scientist, Raleigh, NC</strong></p>
  <p><strong>October 2024 – Present</strong></p>
</div>
<p><em>NC Department of Adult Correction</em></p>

<ul>
  <li>Developed and maintained interactive dashboards using R Shiny, Power BI, and web technologies (HTML, CSS, JavaScript) to improve data accessibility and user experience.</li>
  <li>Led training sessions on R programming, Git, and AI systems for employees while collaborating with SAS on machine learning model development to enhance departmental data-driven initiatives.</li>
  <li>Presented data insights and visualizations to stakeholders, driving improvements in prisoner welfare and reentry outcomes through actionable recommendations and advanced analytics.</li>
</ul>

<div class="space">
  <p><strong>Data Analyst, Carrboro, NC</strong></p>
  <p><strong>April 2024 – Present</strong></p>
</div>
<p><em>Town of Carrboro</em></p>
<ul>
  <li>Developed data visualizations and dashboards for crime data using R Shiny and Tableau.</li>
  <li>Conducted statistical analyses to identify the significance of racial disparity within the dataset.</li>
  <li>Created an automated Reveal.js presentation using R.</li>
</ul>

<div class="space">
  <p><strong>Teaching Assistant, Chapel Hill, NC</strong></p>
  <p><strong>January 2024 – May 2024</strong></p>
</div>
<p><em>UNC at Chapel Hill</em></p>
<ul>
  <li>Led engaging and informative recitation sessions to reinforce course materials covered in STOR 235.</li>
  <li>Organized and conducted regular office hours to create a supportive environment where students could seek personalized assistance.</li>
  <li>Utilized Python programming skills to enhance the learning experience by creating visualizations of homework assignments and exam content.</li>
</ul>

<div class="space">
  <p><strong>RWE Statistical Data Scientist Intern, Durham, NC</strong></p>
  <p><strong>May 2023 – August 2023</strong></p>
</div>
<p><em>Merck Inc.</em></p>
<ul>
  <li>Executed advanced and innovative analytics using SAS, R, SQL, and AWS Redshift.</li>
  <li>Developed CCI (Charlson Comorbidity Index) and ECI (Elixhauser Comorbidity Index) macros with ICD codes.</li>
  <li>Conducted data management, cleaning, and analysis for EHR data, healthcare data, pharmacoepidemiology, modeling, and outcomes research activities (RWE: Real World Evidence).</li>
</ul>

<div class="space">
  <p><strong>Statistical / SAS Programmer Intern, Durham, NC</strong></p>
  <p><strong>January 2023 – April 2023</strong></p>
</div>
<p><em>Labcorp</em></p>
<ul>
  <li>Developed SAS programs for the creation of Table and Listing.</li>
  <li>Acquired knowledge of general SDTM and ADAM.</li>
  <li>Provided support for programming, validation, and documentation of statistical programs used in creating datasets and statistical displays based on specifications provided.</li>
</ul>

<div class="space">
  <p><strong>Statistical / SAS Programmer Intern, Durham, NC</strong></p>
  <p><strong>August 2022 – November 2022</strong></p>
</div>
<p><em>Pharpoint Research, Inc.</em></p>
<ul>
  <li>Developed SAS programs for the creation of Table and Listing.</li>
  <li>Acquired knowledge of general SDTM and ADAM.</li>
  <li>Displayed a positive attitude at all times, promoting and contributing to good team spirit in a professional environment.</li>
</ul>

<div class="space">
  <p><strong>Master Sergeant, Gimhae, South Korea</strong></p>
  <p><strong>March 2010 – May 2017</strong></p>
</div>
<p><em>Republic of Korea Air Force (AWE&amp;C: Airborne Early Warning and Control crew member)</em></p>
<ul>
  <li>Inspected North Korean flights and missile activity as an Air Defense Inspector.</li>
  <li>Oversaw subordinates and motivated them to do their job efficiently.</li>
  <li>Developed skills for urgent war situations.</li>
</ul>

<h2>TECHNICAL SKILLS</h2>
<hr style = "margin: 0.5rem 0; margin-right: 20rem;">

<ul>
  <li><strong>Programming</strong>: SAS, R, R Shiny, SQL, Python, AWS, Tableau, GitHub, GIS, MS Office (Excel, Word, PowerPoint)</li>
  <li><strong>Knowledge</strong>: Big Data Science, Theoretical Statistics, Regression Analysis, Bayesian Statistics, Time Series Analysis, Data Modeling, Statistical Consulting, Data Mining, Clinical Trials, CDISC, Medical Terminology</li>
  <li><strong>Certification</strong>: Base / Advanced SAS Programming</li>
  <li><strong>Seminar</strong>: Analysis of Oncology Studies for Programmers and Statisticians by Kevin Lee at 2023 PharmaSUG</li>
</ul>

<h2>RESEARCH EXPERIENCE</h2>
<hr style = "margin: 0.5rem 0; margin-right: 20rem;">


<div class="space">
  <p><strong>‘Calculating the Comorbidity Index Function’ presentation, SESUG 2024</strong></p>
  <p><strong>November 2024</strong></p>
</div>
<p><em>Presenter: Geonhyeok Jeong, Ting Shi</em></p>
<ul>
  <li>Used SAS / R to develop new macro / function to complement existing macro/function (comorbidity).</li>
  <li>Contributed to making a better and flexible macro / function and identifying flaws in existing macro.</li>
  <li>Utilized logistic regression to make own comorbidity index.</li>
</ul>

<div class="space">
  <p><strong>Statistical Consulting, UNC Chapel Hill</strong></p>
  <p><strong>Aug 2023 – May 2024</strong></p>
</div>
<p><em>Client: Grace Mclaughlin, Advisor: Steven Marron</em></p>
<ul>
  <li>Conducted statistical analysis to quantify burstiness of nuclei division through SiZer Analysis.</li>
  <li>Utilized R for data cleaning, manipulation, and visualization of a dataset and created a report with R Markdown.</li>
  <li>Applied SiZer method to find out peaks and trends of nuclei division and supported the result with Kolmogorov-Smirnov test.</li>
</ul>

<div class="space">
  <p><strong>Statistical Consulting, UNC Chapel Hill</strong></p>
  <p><strong>Aug 2023 – Dec 2023</strong></p>
</div>
<p><em>Client: Anna Bauer, Advisor: Steven Marron</em></p>
<ul>
  <li>Conducted statistical analysis to identify significant variables for the development of a predictive model for suicide.</li>
  <li>Utilized R for data cleaning, manipulation, and visualization of a dataset containing approximately 1,000,000 observations and 20 variables.</li>
  <li>Applied various statistical tests, including Chi-square hypothesis testing, multinomial confidence intervals, empirical cumulative distribution, Kolmogorov-Smirnov test, and Ripley K function, to discern crucial variables.</li>
</ul>
<div class="space">
  <p><strong>Biostatistics Internship Presentation, Merck</strong></p>
  <p><strong>May 2023 - Aug 2023</strong></p>
</div>
<p><em>Mentor: Ting Shi</em></p>
<ul>
  <li>Presented study on "Comorbidity Macro/Function development".</li>
    <li>Used SAS / R to develop new macro / function to complement existing Macro/Function (comorbidity).</li>
    <li>Contributed to making a better and flexible macro / function and identifying flaws in existing macro.</li>
    </ul>

    <div class="space">
    <p><strong>Undergraduate Research, Pusan National University</strong></p>
    <p><strong>March 2020 - June 2020</strong></p>
    </div>
    <p><em>Mentor: Graduate Student JunHoh Choi</em></p>
    <ul>
    <li>Presented study on "Debt Prediction and Model Comparison Using Machine Learning".</li>
  <li>Used R to understand the predictions for each model.</li>
  <li>Improved theoretical understanding by studying mathematical statistics and regression analysis.</li>
</ul>



      '


)

