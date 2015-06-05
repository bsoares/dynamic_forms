Category.create(name: "Reformas e Reparos", slug: "reformas-e-reparos")
  .tap do |category|
  category.sub_categories.create(name: "Pintor", slug: "pintor")
    .tap do |sub_category|
    sub_category.forms.create(name: "Solicite um Orçamento")
      .tap do |form|
      form.fields.create(
        order: 1,
        field_type: Field.field_types[:select_field],
        name: "O que será pintado?").tap do |field|
        field.options.create(name: "Móveis")
        field.options.create(name: "Imóveis")
      end
      form.fields.create(
        order: 2,
        field_type: Field.field_types[:checkbox_field],
        name: "Para quando você precisa deste serviço?").tap do |field|
        field.options.create(name: "Hoje ou nos próximos dias")
        field.options.create(name: "Nos próximos 30 dias")
        field.options.create(name: "Nos próximos 3 meses")
      end
      form.fields.create(
        order: 3,
        field_type: Field.field_types[:text_field],
        name: "Qual é o seu nome?")
      form.fields.create(
        order: 4,
        field_type: Field.field_types[:textarea_field],
        name: "Informações Adicionais")
    end
  end
  category.sub_categories.create(name: "Pedreiro", slug: "pedreiro")
    .tap do |sub_category|
    sub_category.forms.create(name: "Solicite um Orçamento")
      .tap do |form|
      form.fields.create(
        order: 2,
        field_type: Field.field_types[:checkbox_field],
        name: "Para quando você precisa deste serviço?").tap do |field|
        field.options.create(name: "Hoje ou nos próximos dias")
        field.options.create(name: "Nos próximos 30 dias")
        field.options.create(name: "Nos próximos 3 meses")
      end
      form.fields.create(
        order: 1,
        field_type: Field.field_types[:select_field],
        name: "O que será pintado?").tap do |field|
        field.options.create(name: "Móveis")
        field.options.create(name: "Imóveis")
      end
      form.fields.create(
        order: 3,
        field_type: Field.field_types[:text_field],
        name: "Qual é o seu nome?")
      form.fields.create(
        order: 4,
        field_type: Field.field_types[:textarea_field],
        name: "Informações Adicionais")
    end
  end
end

Category.create(name: "Aulas", slug: "aulas").tap do |category|
  category.sub_categories.create(name: "Música", slug: "musica")
  category.sub_categories.create(name: "Idiomas", slug: "idiomas")
end
