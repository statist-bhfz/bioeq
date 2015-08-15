


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
                                    tags$h2("Загрузка данных"),
                                    
                                    "Программа обрабатывает данные для оценки биоэквивалентности
                                    для стандартного дизайна с двумя препаратами, двумя периодами
                                    и двумя последовательностями (2х2х2). Исходная таблица данных
                                    должна содержать:",
                                    
                                    tags$br(),
                                    
                                    tags$div(
                                        "subj - рандомизационный номер добровольца;", 
                                        tags$br(),
                                        "seq - последовательность (1 - RT, 2 - TR);",
                                        tags$br(),
                                        " prd - период;;",
                                        tags$br(),
                                        "drug - препарат;",
                                        tags$br(),
                                        "time - время забора крови;",
                                        tags$br(),
                                        "conc - концентрация;"
                                    ),
                                    
                                    tags$hr(),
                                    
                                    "Скачать тестовый набор данных можно по",
                                    tags$a("этой ссылке", 
                                      href="https://github.com/statist-bhfz/bioeq/blob/master/testdata.txt",
                                      target="_blank"), ".",
                                    
                                    tags$hr(),
                                    
                                    "Концентрации ниже порога определения для первых
                                    точек забора крови должны быть обозначены как 0;
                                    для последних точек - как NA (пропущенные значения).
                                    "
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
                                                   "Референтный препарат"="ref",
                                                   "Оба препарата (лог.)"="both_log", 
                                                   "Тестовый препарат (лог.)"="test_log",
                                                   "Референтный препарат (лог.)"="ref_log")
                                    )
                                ),
                                mainPanel(
                                    plotOutput("plot")
                                )
                            )
                   ),
                   
                   tabPanel("Результаты",
                            tags$h4("Результаты дисперсионного анализа 
                                    для показателя Cmax"),
                            tableOutput("table1"),
                            tags$hr(),
                            
                            tags$h4("Результаты дисперсионного анализа 
                                    для показателя AUC(0-t)"),
                            tableOutput("table2"),
                            tags$hr(),
                            
                            tags$h4("90% доверительные интервалы для Соотношения T/R"),
                            tableOutput("table3")
                   ),
                   
                   navbarMenu("...",
                              tabPanel("Руководство",
                                       "Coming soon"
                              ),
                              tabPanel("О программе",
                                       "Для некоммерческого использования",
                                       tags$br(),
                                       tags$a("Source on GitHub", 
                                              href="https://github.com/statist-bhfz/bioeq",
                                              target="_blank"),
                                       tags$br(),
                                       "(с) Andrey Ogurtsov, 2015",
                                       tags$br(),
                                       "mailto: ogurtsov.a.b@gmail.com",
                                       tags$br(),
                                       tags$a("Биостатистика и язык R", 
                                         href="http://biostat-r.blogspot.com",
                                         target="_blank")
                              )
                   )
))

