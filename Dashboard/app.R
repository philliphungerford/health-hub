#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

# Import libraries
library(shiny)           # for dashboard
library(shinydashboard)  # for tabs

# Define UI for application that draws a histogram
ui <- dashboardPage(
  
  # 1. HEADER CONFIG
  dashboardHeader(
    title = "Health Hub",
    titleWidth = 300,
    tags$li(class="dropdown", tags$a(icon('cal'), paste0("Date: ", as.character(Sys.Date())), target="_blank")),
    tags$li(class="dropdown", tags$a(href="https://docs.google.com/spreadsheets/d/16CrTO5EGmfoSDyPS51fpJJsDp-qrbBG2_CWaEzRKeUs/edit?usp=sharing", icon('folder'), "GSheet", target="_blank")),
    #tags$li(class="dropdown", tags$a(href="https://www.google.com/", icon('globe'), "API", target="_blank")),
    tags$li(class="dropdown", tags$a(href="https://github.com/philliphungerford/health-hub", icon('github'), "Source Code", target="_blank"))
  ),
  
  # 2 SIDEBAR CONFIG
  dashboardSidebar(sidebarMenu(
    
    menuItem(
      "Dashboard",
      tabName = "Dashboard"),
    
    menuItem(
      "Lifts", 
      tabName = "Lifts"),
    
    menuItem(
      "Plate Calculator", 
      tabName = "PlateCalculator"),
    
    menuItem(
      "Data",
      tabName = "Data",
      badgeLabel = "Try!",
      badgeColor = "green"
    )
  )),  
  
  # 3. BODY CONFIG
  # 3 BODY CONFIG
  dashboardBody(tabItems(
    
    tabItem(tabName = "Dashboard",
            
            #h3("Dashboard"),
            
            fluidRow(
              # Dynamic valueBoxes
              valueBoxOutput(outputId = "box1",width = 3),
              valueBoxOutput(outputId = "box2",width = 3),
              valueBoxOutput(outputId = "box3",width = 3),
              valueBoxOutput(outputId = "box4",width = 3)
              
            ),
            
            fluidRow(
              # Dynamic valueBoxes
              valueBoxOutput(outputId = "box5",width = 3),
              valueBoxOutput(outputId = "box6",width = 3),
              valueBoxOutput(outputId = "box7",width = 3),
              valueBoxOutput(outputId = "box8",width = 3)
              
            ),
            
            fluidRow(
              
              box(
                title = "Deadlift", background = "maroon", solidHeader = TRUE,
                plotOutput("plot1", height = 250)
              ),
              
              box(
                title = "Squat", background = "maroon", solidHeader = TRUE,
                plotOutput("plot2", height = 250)
              ),
              
              box(
                title = "Bench", background = "maroon", solidHeader = TRUE,
                plotOutput("plot3", height = 250)
              ),
              
              box(
                title = "Press", background = "maroon", solidHeader = TRUE,
                plotOutput("plot4", height = 250)
              )
            ),
            
    ),
    
    tabItem(tabName = "Lifts",
            h1("Lifts"),
            p("Page 2"),
            fluidRow(
              
              box(
                title = "Histogram", background = "maroon", solidHeader = TRUE,
                plotOutput("plot5", height = 250)
              ),
              
              box(
                title = "Inputs", background = "black",
                "Box content here", br(), "More box content",
                sliderInput("slider", "Slider input:", 1, 100, 50),
                textInput("text", "Text input:")
              )
            )
            
    ),
    
    tabItem(tabName = "PlateCalculator",
            h1("Plate Calculator"),
            p("Page 2")
            
    ),
    
    tabItem(tabName = "Data",
            
            h1("Data"),
            p("Page 3"),
            
            h2("STEP 1: Enter your API Token and encryption key"),
            
            passwordInput("APIToken", "APIToken"),
            
            textInput("key", "Key", "ABCDEFGHIJKLMNOPQRSTUVWXYZABCDEF"),
            
            h2("STEP 2: Encipher / Decipher"),
            
            textInput("plaintext", "Plaintext", "SECRETMESSAGE"),
            
            p("Enciphered Text:"),
            
            actionButton("ButtonEncipher", "Encipher!", class = "btn-success"),          
            
            p(),
            
            textInput("ciphertext", "Ciphertext", ""),
            
            p("Deciphered Text:"),
            
            actionButton("ButtonDecipher", "Decipher!", class = "btn-success")
    )
  ),
  #colours
  
  tags$head(tags$style(HTML('
              
        /* logo */
        .skin-blue .main-header .logo {
                              background-color: #54267E;
                              }

        /* logo when hovered */
        .skin-blue .main-header .logo:hover {
                              background-color: #54267E;
                              }

        /* navbar (rest of the header) */
        .skin-blue .main-header .navbar {
                              background-color: #54267E;
                              }        

        /* main sidebar */
        .skin-blue .main-sidebar {
                              background-color: #54267E;
                              }

        /* active selected tab in the sidebarmenu */
        .skin-blue .main-sidebar .sidebar .sidebar-menu .active a{
                              background-color: #54267E;
                              }

        /* other links in the sidebarmenu */
        .skin-blue .main-sidebar .sidebar .sidebar-menu a{
                              background-color: #54267E;
                              color: #ffffff;
                              }

        /* other links in the sidebarmenu when hovered */
         .skin-blue .main-sidebar .sidebar .sidebar-menu a:hover{
                              background-color: #765197;
                              }
        /* toggle button when hovered  */                    
         .skin-blue .main-header .navbar .sidebar-toggle:hover{
                              background-color: #765197;
                              }
        /* body */
         .content-wrapper, .right-side {
                              background-color: #FFFFFF;
                              }
                              ')))
  )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  
  # PAGE 1
  
  # BOXES
  
  output$box1 <- renderValueBox({
    valueBox(
      paste0(max(10,20), "KG"), "DEADLIFT 1RM", icon = icon("arrow-up"),
      color = "purple"
    )
  })
  
  output$box2 <- renderValueBox({
    valueBox(
      paste0(max(10,20), "KG"), "SQUAT 1RM", icon = icon("arrow-up"),
      color = "purple"
    )
  })
  
  output$box3 <- renderValueBox({
    valueBox(
      paste0(max(10,20), "KG"), "BENCH 1RM", icon = icon("arrow-up"),
      color = "purple"
    )
  })
  
  output$box4 <- renderValueBox({
    valueBox(
      paste0(max(10,20), "KG"), "PRESS 1RM", icon = icon("arrow-up"),
      color = "purple"
    )
  })
  
  output$box5 <- renderValueBox({
    valueBox(
      paste0(max(10,20), "KG"), "DEADLIFT LIFTED", icon = icon("dumbbell"),
      color = "purple"
    )
  })
  
  output$box6 <- renderValueBox({
    valueBox(
      paste0(max(10,20), "KG"), "SQUAT LIFTED", icon = icon("dumbbell"),
      color = "purple"
    )
  })
  
  output$box7 <- renderValueBox({
    valueBox(
      paste0(max(10,20), "KG"), "BENCH LIFTED", icon = icon("dumbbell"),
      color = "purple"
    )
  })
  
  output$box8 <- renderValueBox({
    valueBox(
      paste0(max(10,20), "KG"), "PRESS LIFTED", icon = icon("dumbbell"),
      color = "purple"
    )
  })
  
  output$plot1 <- renderPlot({
    # Plot the bar chart. 
    plot(c(7,12,28,3,41),type = "o")
  })
  output$plot2 <- renderPlot({
    # generate bins based on input$bins from ui.R
    x    <- faithful[, 2]
    bins <- seq(min(x), max(x), length.out = 50 + 1)
    
    # draw the histogram with the specified number of bins
    hist(x, breaks = bins, col = 'darkgray', border = 'white')
  })
  output$plot3 <- renderPlot({
    # generate bins based on input$bins from ui.R
    x    <- faithful[, 2]
    bins <- seq(min(x), max(x), length.out = 50 + 1)
    
    # draw the histogram with the specified number of bins
    hist(x, breaks = bins, col = 'darkgray', border = 'white')
  })
  output$plot4 <- renderPlot({
    # generate bins based on input$bins from ui.R
    x    <- faithful[, 2]
    bins <- seq(min(x), max(x), length.out = 50 + 1)
    
    # draw the histogram with the specified number of bins
    hist(x, breaks = bins, col = 'darkgray', border = 'white')
  })
  
  ## PAGE 2
  output$plot5 <- renderPlot({
    # generate bins based on input$bins from ui.R
    x    <- faithful[, 2]
    bins <- seq(min(x), max(x), length.out = input$slider + 1)
    
    # draw the histogram with the specified number of bins
    hist(x, breaks = bins, col = 'darkgray', border = 'white')
  })
}

# Run the application 
shinyApp(ui = ui, server = server)