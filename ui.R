library(plotly)
shinyUI(fluidPage(
  
  
  sidebarLayout( position = "right",
    sidebarPanel( "",
      fileInput("datainput", label = "Input your data:"),
      selectInput("filetype", label = "Select file type:", choices  = c("Comma","Tabs"), selected = "Tabs"),
      selectInput("datatype", label = "Select data type:", choices  = c("Raw","Processed"), selected = "Raw"),
      checkboxInput("checkboxes",label = "Contains Header", value = T),
      
      actionButton("upload" ,"Upload File",class = "btn btn-primary"),
      uiOutput("data"),
      uiOutput("data2"),
      uiOutput("param"),
      uiOutput("kmeansbutton")
      ),
  mainPanel(
    fluidRow(
      db <- actionButton("donorbutton" ,"Donors",class = "btn btn-primary"),
      sb <- actionButton("stimulusbutton" ,"Stimuli",class = "btn btn-primary"),
      tb <- actionButton("timebutton" ,"Time Points",class = "btn btn-primary"),
      textOutput("error")
      
      
    ),
   
    tabsetPanel( 
      tabPanel("PCA",plotlyOutput("plot1")),
      tabPanel("Scree Plot",plotlyOutput("plot2")),
      tabPanel("K-Means",plotlyOutput("plotk"))
    )
  
  )
  )
))