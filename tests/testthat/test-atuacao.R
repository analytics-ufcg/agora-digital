context("Atuacao")

setup <- function() {
  data_inicio <<- "2019-08-01"
  data_fim <<- "2019-10-06"

  #Atuacao Câmara

  docs_sample_df_camara <<- tibble::tibble(id_principal = c(1,1,2),
                                    casa = c('camara','camara','camara'),
                                    id_documento = c(11,12,21),
                                    cod_tipo = c(125,125,121),
                                    data_apresentacao = c("2019-09-21", "2019-09-01", "2019-10-07"),
                                    sigla_tipo = c('EMC','EMC','REQ'),
                                    descricao_tipo_documento = c('Emenda na Comissão', 'Emenda na Comissão', 'Requerimento de Audiência Pública'),
                                    status_proposicao_sigla_orgao = c('PLEN', 'CCJ', 'CFT'))

  autores_sample_df_camara <<- tibble::tibble(id_principal = c(1, 1, 1, 2, 2),
                                       id_documento = c(11,11,12,21,21),
                                       casa = c('camara','camara','camara','camara','camara'),
                                       id_autor = c(1,5,5,5,6),
                                       tipo_autor = c("deputado", "deputado", "deputado", "deputado", "deputado"),
                                       partido = c('PSDB','PT','PT','PT', 'PSL'),
                                       uf = c('SP', "PB", "PB", "PB", "BA"),
                                       nome = c('Dep. A', 'Dep. C', 'Dep. C', 'Dep. C', 'Dep. D'))

  atuacao_sample_df_camara <<- tibble::tibble(id_ext = c(1,1,1,2,2),
                                      casa = c('camara','camara','camara','camara','camara'),
                                      id_autor = c(5,1,5,5,6),
                                      tipo_autor = rep("deputado",5),
                                      nome_autor = c('Dep. C','Dep. A','Dep. C','Dep. C','Dep. D'),
                                      partido = c('PT','PSDB','PT','PT','PSL'),
                                      uf = c("PB","SP", "PB", "PB", "BA"),
                                      tipo_generico = c('Emenda','Emenda','Emenda',
                                                        'Requerimento','Requerimento'),
                                      sigla_local = c('CCJ', 'PLEN', 'PLEN', 'CFT', 'CFT'),
                                      peso_total_documentos = as.numeric(c(1,0.5,0.5,0.5,0.5)),
                                      num_documentos = as.integer(c(1,1,1,1,1)),
                                      is_important = c(F, T, T, T, T),
                                      tipo_acao = c('Proposição', 'Proposição', 'Proposição', 'Proposição', 'Proposição')) %>%
    dplyr::select(id_ext, casa, id_autor, tipo_generico, sigla_local, tipo_acao, peso_total_documentos,
                  num_documentos, partido, uf, nome_autor, tipo_autor, is_important)

  atuacao_sample_df_camara_filtered <<- tibble::tibble(id_ext = c(1,1,1),
                                      casa = c('camara','camara','camara'),
                                      id_autor = c(5,1,5),
                                      tipo_autor = rep("deputado",3),
                                      nome_autor = c('Dep. C','Dep. A','Dep. C'),
                                      partido = c('PT','PSDB','PT'),
                                      uf = c("PB","SP", "PB"),
                                      tipo_generico = c('Emenda','Emenda','Emenda'),
                                      sigla_local = c('CCJ', 'PLEN', 'PLEN'),
                                      peso_total_documentos = as.numeric(c(1,0.5,0.5)),
                                      num_documentos = as.integer(c(1,1,1)),
                                      is_important = c(F, T, T),
                                      tipo_acao = c('Proposição', 'Proposição', 'Proposição')) %>%
    dplyr::select(id_ext, casa, id_autor, tipo_generico, sigla_local, tipo_acao, peso_total_documentos, num_documentos,
                  partido, uf, nome_autor, tipo_autor, is_important)

  atuacao_sample_df_camara_filtered_limiar <<- tibble::tibble(id_ext = c(1),
                                                      casa = c('camara'),
                                                      id_autor = c(5),
                                                      tipo_autor = rep("deputado",1),
                                                      nome_autor = c('Dep. C'),
                                                      partido = c('PT'),
                                                      uf = c("PB"),
                                                      tipo_generico = c('Emenda'),
                                                      sigla_local = c('CCJ'),
                                                      peso_total_documentos = as.numeric(c(1)),
                                                      num_documentos = as.integer(1),
                                                      is_important = c(F),
                                                      tipo_acao = c('Proposição')) %>%
    dplyr::select(id_ext, casa, id_autor, tipo_generico, sigla_local, tipo_acao, peso_total_documentos, num_documentos,
                  partido, uf, nome_autor, tipo_autor, is_important)


  #atuacao Senado

  docs_sample_df_senado <<- tibble::tibble(id_principal = c(1,1,2),
                                    casa = c('senado','senado','senado'),
                                    id_documento = c(11,12,21),
                                    data_texto = c("2019-09-21", "2019-09-01", "2019-10-07"),
                                    descricao_texto = c('Emenda na Comissão', 'Emenda na Comissão', 'Requerimento de Audiência Pública'),
                                    descricao_tipo_texto = c("Emenda", "Emenda", "Requerimento"),
                                    identificacao_comissao_nome_comissao = c('Plenário', 'Comissão de Constituição, Justiça e Cidadania', 'Comissão de Assuntos Econômicos'))

  autores_sample_df_senado <<- tibble::tibble(id_principal = c(1,1,1,2,2),
                                       id_documento = c(11,11,12,21,21),
                                       casa = c('senado','senado','senado','senado','senado'),
                                       id_autor = c(1,5,5,5,6),
                                       tipo_autor = c("senador", "senador", "senador", "senador", "senador"),
                                       partido = c('PSDB','PT','PT','PT', 'PSL'),
                                       uf = c('SP', "PB", "PB", "PB", "BA"),
                                       nome_autor = c('Sen. A', 'Sen. C', 'Sen. C', 'Sen. C', 'Sen. D'))

  atuacao_sample_df_senado <<- tibble::tibble(id_ext = c(1,1,1,2,2),
                                      casa = c('senado','senado','senado','senado','senado'),
                                      id_autor = c(5,1,5,5,6),
                                      tipo_autor = rep("senador",5),
                                      nome_autor = c('Sen. C','Sen. A','Sen. C','Sen. C','Sen. D'),
                                      partido = c('PT','PSDB','PT','PT','PSL'),
                                      uf = c("PB","SP", "PB", "PB", "BA"),
                                      tipo_generico = c('Emenda','Emenda','Emenda',
                                                        'Requerimento','Requerimento'),
                                      sigla_local = c('CCJ', 'Plenário', 'Plenário', 'CAE', 'CAE'),
                                      peso_total_documentos = as.numeric(c(1,0.5,0.5,0.5,0.5)),
                                      num_documentos = as.integer(c(1,1,1,1,1)),
                                      is_important = c(T, T, T, T, T),
                                      tipo_acao = c('Proposição', 'Proposição', 'Proposição', 'Proposição', 'Proposição')) %>%
    dplyr::select(id_ext, casa, id_autor, tipo_generico, tipo_acao, sigla_local, peso_total_documentos, num_documentos,
                  partido, uf, nome_autor, tipo_autor, is_important)

  atuacao_sample_df_senado_filtered <<- tibble::tibble(id_ext = c(1,1,1),
                                               casa = c('senado','senado','senado'),
                                               id_autor = c(5,1,5),
                                               tipo_autor = rep("senador",3),
                                               nome_autor = c('Sen. C','Sen. A','Sen. C'),
                                               partido = c('PT','PSDB','PT'),
                                               uf = c("PB","SP", "PB"),
                                               tipo_generico = c('Emenda','Emenda','Emenda'),
                                               sigla_local = c('CCJ', 'Plenário', 'Plenário'),
                                               peso_total_documentos = as.numeric(c(1,0.5,0.5)),
                                               num_documentos = as.integer(c(1,1,1)),
                                               is_important = c(T, T, T),
                                               tipo_acao = c('Proposição', 'Proposição', 'Proposição')) %>%
    dplyr::select(id_ext, casa, id_autor, tipo_generico, tipo_acao, sigla_local, peso_total_documentos, num_documentos,
                  partido, uf, nome_autor, tipo_autor, is_important)

  atuacao_sample_df_senado_filtered_limiar <<- tibble::tibble(id_ext = c(1),
                                                             casa = c('senado'),
                                                             id_autor = c(5),
                                                             tipo_autor = rep("senador",1),
                                                             nome_autor = c('Sen. C'),
                                                             partido = c('PT'),
                                                             uf = c("PB"),
                                                             tipo_generico = c('Emenda'),
                                                             sigla_local = c('CCJ'),
                                                             peso_total_documentos = as.numeric(c(1)),
                                                             num_documentos = as.integer(1),
                                                             is_important = c(T),
                                                             tipo_acao = c('Proposição')) %>%
    dplyr::select(id_ext, casa, id_autor, tipo_generico, tipo_acao, sigla_local, peso_total_documentos, num_documentos,
                  partido, uf, nome_autor, tipo_autor, is_important)

  autores_docs <<- tibble::tibble(id_principal = rep(123,6),
                                  casa = c("camara",rep("senado",2),rep("camara",3)),
                                  id_documento = c(1,rep(2,2),rep(3,3)),
                                  id_autor = c(31, 31, 32, 31, 32, 33))

  pesos_docs <<- tibble::tibble(id_principal = rep(123,3),
                                casa = c("camara","camara","senado"),
                                id_documento = c(1,3,2),
                                peso_documento = c(1,1/3,1/2)
                                )

  return(TRUE)
}

check_api <- function(){
  tryCatch(setup(), error = function(e){
    print(e)
    return(FALSE)
  })
}

test <- function() {
  test_that("read_current_docs_camara() returns real or empty dataframe", {
    documentos_camara <- agoradigital::read_current_docs_camara("../../data/camara/documentos.csv")
    documentos_camara_empty <- agoradigital::read_current_docs_camara("../../data/camara/docs.csv")

    expect_true(is.data.frame(documentos_camara))
    expect_true(is.data.frame(documentos_camara_empty))

    #expect_true(nrow(documentos_camara) > 0)
    expect_true(nrow(documentos_camara_empty) == 0)
  })

  test_that("read_current_autores_camara() returns real or empty dataframe", {
    autores_camara <- agoradigital::read_current_autores_camara("../../data/camara/autores.csv")
    autores_camara_empty <- agoradigital::read_current_autores_camara("../../data/camara/auts.csv")

    expect_true(is.data.frame(autores_camara))
    expect_true(is.data.frame(autores_camara_empty))

    #expect_true(nrow(autores_camara) > 0)
    expect_true(nrow(autores_camara_empty) == 0)
  })

  test_that("read_current_docs_senado() returns real or empty dataframe", {
    documentos_senado <- agoradigital::read_current_docs_senado("../../data/senado/documentos.csv")
    documentos_senado_empty <- agoradigital::read_current_docs_senado("../../data/senado/docs.csv")

    expect_true(is.data.frame(documentos_senado))
    expect_true(is.data.frame(documentos_senado_empty))

    #expect_true(nrow(documentos_senado) > 0)
    expect_true(nrow(documentos_senado_empty) == 0)
  })

  test_that("read_current_autores_senado() returns real or empty dataframe", {
    autores_senado <- agoradigital::read_current_autores_senado("../../data/senado/autores.csv")
    autores_senado_empty <- agoradigital::read_current_autores_senado("../../data/senado/auts.csv")

    expect_true(is.data.frame(autores_senado))
    expect_true(is.data.frame(autores_senado_empty))

    #expect_true(nrow(autores_senado) > 0)
    expect_true(nrow(autores_senado_empty) == 0)
  })

  #Atuação - Câmara

  test_that('create_tabela_atuacao() returns dataframe', {
    expect_true(is.data.frame(create_tabela_atuacao_camara(docs_sample_df_camara, autores_sample_df_camara)))
    expect_true(is.data.frame(create_tabela_atuacao_camara(docs_sample_df_camara, autores_sample_df_camara, data_inicio, data_fim)))
  })

  test_that('create_tabela_atuacao() returns warning with empty docs table', {
    expect_warning(create_tabela_atuacao_camara(tibble::tibble(), autores_sample_df_camara))
  })

  test_that('create_tabela_atuacao() returns warning with empty authors table', {
    expect_warning(create_tabela_atuacao_camara(docs_sample_df_camara, tibble::tibble()))
  })

  test_that('create_tabela_atuacao() returns correct atuacao table', {
    expect_equal(create_tabela_atuacao_camara(docs_sample_df_camara, autores_sample_df_camara), atuacao_sample_df_camara)
  })

  test_that('create_tabela_atuacao() returns filtered dataframe', {
    expect_equal(create_tabela_atuacao_camara(docs_sample_df_camara, autores_sample_df_camara, data_inicio, data_fim), atuacao_sample_df_camara_filtered)
  })

  test_that('create_tabela_atuacao() returns filtered dataframe', {
    expect_equal(create_tabela_atuacao_camara(docs_sample_df_camara, autores_sample_df_camara, limiar = 1), atuacao_sample_df_camara_filtered_limiar)
  })

  #atuacao - Senado

  test_that('create_tabela_atuacao() returns dataframe', {
    expect_true(is.data.frame(create_tabela_atuacao_senado(docs_sample_df_senado, autores_sample_df_senado)))
    expect_true(is.data.frame(create_tabela_atuacao_senado(docs_sample_df_senado, autores_sample_df_senado, data_inicio, data_fim)))
  })

  test_that('create_tabela_atuacao() returns warning with empty docs table', {
    expect_warning(create_tabela_atuacao_senado(tibble::tibble(), autores_sample_df_senado))
  })

  test_that('create_tabela_atuacao() returns warning with empty authors table', {
    expect_warning(create_tabela_atuacao_senado(docs_sample_df_senado, tibble::tibble()))
  })

  test_that('create_tabela_atuacao() returns correct atuacao table', {
    expect_equal(create_tabela_atuacao_senado(docs_sample_df_senado, autores_sample_df_senado), atuacao_sample_df_senado)
  })

  test_that('create_tabela_atuacao() returns filtered dataframe', {
    expect_equal(create_tabela_atuacao_senado(docs_sample_df_senado, autores_sample_df_senado, data_inicio, data_fim), atuacao_sample_df_senado_filtered)
  })

  test_that('create_tabela_atuacao() returns filtered dataframe', {
    expect_equal(create_tabela_atuacao_senado(docs_sample_df_senado, autores_sample_df_senado, limiar = 1), atuacao_sample_df_senado_filtered_limiar)
  })

  test_that('get_peso_documentos returns correct pesos_docs dataframe', {
    expect_equal(get_peso_documentos(autores_docs) %>% dplyr::ungroup(), pesos_docs)
  })

  test_that('get_peso_documentos returns warning when autores_docs is NULL', {
    suppressWarnings(expect_equal(get_peso_documentos(NULL), tibble::tibble()))
    expect_warning(get_peso_documentos(NULL))
  })

  test_that('get_peso_documentos returns warning when autores_docs is empty', {
    suppressWarnings(expect_equal(get_peso_documentos(tibble::tibble()), tibble::tibble()))
    expect_warning(get_peso_documentos(tibble::tibble()))
  })
}

if(check_api()){
  test()
} else testthat::skip('Erro no setup!')
