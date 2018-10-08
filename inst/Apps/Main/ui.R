# Required packages are loaded from the "global.R"

shinyUI(

  bootstrapPage(
    theme = "shiny.css",
    HTML('<div class="fixed"></div>'), #add the logo
    navbarPage("TMT",



      # ----------------------------------------------------
      # Analysis
      # ====================================================
      tabPanel("Analysis",
       div(id = "header",
           p("Enter the following information to analyze the"#,
             # a(href = "https://en.wikipedia.org/wiki/Trail_Making_Test",
             #   "Trail Making Test"
             #   )
           )
       ),

      sidebarLayout(
        sidebarPanel(width=4,
          selectInput("norm", "Norms:",
                     choices = c("Tombaugh (2004)" = "tombaugh")),
                     hr(),
          numericInput("age", "Age:", min=14, max=115,
                       value=NA, step=1),
          # selectInput("education", "Education:",
          #             choices = c("Choose one" = "",
          #                         "up to 12 years (high school)" = 12,
          #                         "above 12 years" = 13)),
          selectInput("education", "Education:",
                      choices = c("Choose one" = "",
                                  "no education" = 0,
                                  "primary school" = 6,
                        "middle school" = 9,
                        "high school" = 12,
                      "undergraduate" = 15,
                      "graduate school" = 16)),
          numericInput("tmtA", "TMT-A time:", min=5, max=150,
                       value=NA, step=1),
          numericInput("tmtB", "TMT-B time:", min=20, max=500,
                       value=NA, step=1),
          hr(),
          selectInput("inSelect", "Select input:",
                      c("label 1" = "option1",
                        "label 2" = "option2")),
          hr(),
          downloadButton('export', label = "Download PDF")

        ),
        mainPanel(
          plotOutput("plot"),
          p(textOutput("InterpretA")),
          plotOutput("plot2"),
          p(textOutput("InterpretB")),
          br(),
          br()
        )
      )
    ),



      # ----------------------------------------------------
      # Setting Tab
      # ====================================================
      # tabPanel("Setting",
      #   verbatimTextOutput("summary")
      # ),


      # ----------------------------------------------------
      # Norms Tab
      # ====================================================
      tabPanel("Norms",
               includeHTML("./www/norms.html")
      ),

      # ----------------------------------------------------
      # About Tab
      # ====================================================
      tabPanel("About",
               includeHTML("./www/about.html"))
      )



    # , img(src='UMG.png', align = "right")
    )
  )
