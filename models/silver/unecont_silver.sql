select id,
    regexp_replace(cnpj_empresa, '[.]|[\/]|[\\-]', '') as cnpj,
    empresa as razao_social,
    conferido as status_conferencia,
    to_date(data_cadastro) as data_cadastro,
    codigo_empresa as origem,
    usuario_cadastro,
    data_conferencia_contabilidade,
    case
        when conferido = 'Sim'
        and usuario_conferencia_contabilidade is null then 'Une.Admin'
        when usuario_conferencia_contabilidade ilike ('%[Célula de Entrada]%') then 'Célula de Entrada'
        else 'Outros'
    end as grupo_conferencia,
    case
        when conferido = 'Sim'
        and usuario_conferencia_contabilidade is null then 'Une.Admin'
        else usuario_conferencia_contabilidade
    end as usuario_conferencia,
    data_conferencia_contabilidade,
    data_competencia
from {{ source('dados_prod', 'unecont') }}  