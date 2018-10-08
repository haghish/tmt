age  = NA
edu  = NA
tmtA = NA
tmtB = NA
a = ""




function(input, output, session) {

  ## vals will contain all plot and table grobs
  vals <- reactiveValues(p1=NULL,p2=NULL,t1=NULL)

  observe({
    # We'll use these multiple times, so use short var names for
    # convenience.
    age <- input$age
    edu <- as.numeric(input$education)
    tmtA = input$tmtA
    tmtB = input$tmtB



    if (!is.na(tmtA)) {
      if (!is.na(age) & !is.na(edu)) {
        a = tombaugh.norm(age=age, education=edu, tmtA = tmtA)
        print(age)
        print(edu)
        print(a)

        output$plot <- renderPlot({
          plot_curve(v=a, norm="tombaugh", test="TMT-A")
        })

        output$InterpretA <- renderText({
          tmt_interpret(test="TMT-A", norm="tombaugh", score=a)
        })

      }
    }

    if (!is.na(tmtB)) {
      if (!is.na(age) & !is.na(edu)) {
        b = tombaugh.norm(age=age, education=edu, tmtB = tmtB)

        if (!is.na(tmtA)) {
          output$plot2 <- renderPlot({
            plot_curve(v=b, norm="tombaugh", test="TMT-B")
          })
          output$InterpretB <- renderText({
            tmt_interpret(test="TMT-B", norm="tombaugh", score=b)
          })
        } else {
          output$plot <- renderPlot({
            plot_curve(v=b, norm="tombaugh", test="TMT-B")
          })
          output$InterpretA <- renderText({
            tmt_interpret(test="TMT-B", norm="tombaugh", score=b)
          })
        }
      }
    }

    ## clicking on the export button will generate a pdf file
    ## containing all grobs
    output$export = downloadHandler(
      filename = function() {"tmt.pdf"},
      content = function(file) {
      #   pdf(file, onefile = TRUE)
      #   grid.arrange(vals$p1,vals$p2,vals$t1)
      #   dev.off()
      }
    )

  })





  # output$age <- renderPrint({
  #   print(output$age)
  # })
  #
  # output$summary2 <- renderPrint({
  #   summary(airquality)
  # })
  #
  # output$summary3 <- renderPrint({
  #   summary(CO2)
  # })
  #
  # output$summary4 <- renderPrint({
  #   summary(ChickWeight)
  # })



  # output$table <- DT::renderDataTable({
  #   DT::datatable(cars)
  # })
}
