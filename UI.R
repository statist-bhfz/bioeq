


shinyUI(navbarPage("Биоэквивалентность v0.3",
                   
                   tabPanel("Загрузка данных",
                            sidebarLayout(
                                sidebarPanel(
                                    fileInput('file1', 'Выберите .txt файл',
                                              accept=c('text/csv', 
                                                       'text/comma-separated-values,text/plain', 
                                                       '.csv', '.txt')),
                                    helpText("Значения в файле должны быть 
                                             разделены символом табуляции,
                                             десятичный разделитель - запятая.")
                                ),
                                mainPanel(
                                    h2("Загрузка данных"),
                                    "Тут какой-то текст"
                                )
                            )
                   ),

                   tabPanel("Исходные данные",
                            dataTableOutput("table.all")
                   ),                   
                                      
                   tabPanel("Сводные графики",
                            sidebarLayout(
                                sidebarPanel(
                                    radioButtons("plotType", 
                                                 "Выберите тип графика",
                                                 c("Оба препарата"="both", 
                                                   "Тестовый препарат"="test",
                                                   "Референтный препарат"="ref")
                                    )
                                ),
                                mainPanel(
                                    plotOutput("plot")
                                )
                            )
                   ),
                   
                   tabPanel("Результаты ДА",
                            tableOutput("table1"),
                            tableOutput("table2"),
                            tableOutput("table3")
                   ),
                   
                   navbarMenu("...",
                              tabPanel("Table"
                              )
                   )
))

