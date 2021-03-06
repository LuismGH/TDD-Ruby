require 'spec_helper'
require 'alimento'

RSpec.describe Alimento do
  before (:all) do
    # Alimentos
    @carne = Alimento::Alimento.new("Carne de Vaca", 21.1, 0, 3.1, 50, 164)
    @carne_cordero = Alimento::Alimento.new("Carne de Cordero",18,0,17,20,185.0)
    @camarones = Alimento::Alimento.new("Camarones",17.6,1.5,0.6,18.0,2.0)

    # Nodos
    @nodo1 = Alimento::List::Node.new(@carne, nil, nil)
    @nodo2 = Alimento::List::Node.new(@carne_cordero, nil, @nodo1)
    @nodo3 = Alimento::List::Node.new(@camarones, nil, @nodo2)
    @nodo1.next = @nodo2
    @nodo2.next = @nodo3

    # Listas
    @lista1 = Alimento::List.new

    @lista2 = Alimento::List.new
    @lista2.insert(@carne)
    @lista2.insert(@carne_cordero)
    @lista2.insert(@camarones)
    @lista2.insert(@carne)
    @lista2.insert(@carne_cordero)

    @lista_plato = Alimento::List.new
    @lista_plato.insert(@carne)
    @lista_plato.insert(@carne_cordero)
    @lista_plato.insert(@camarones)

    @lista_cantidades = Alimento::List.new
    @lista_cantidades.insert(100)
    @lista_cantidades.insert(2)
    @lista_cantidades.insert(10)

    @lista_plato1 = Alimento::List.new
    @lista_plato1.insert(@carne)
    @lista_plato1.insert(@carne_cordero)
    @lista_plato1.insert(@carne_cordero)
    @lista_plato1.insert(@carne_cordero)
    @lista_plato1.insert(@carne_cordero)

    @lista_cantidades1 = Alimento::List.new
    @lista_cantidades1.insert(1000000)
    @lista_cantidades1.insert(2000)
    @lista_cantidades1.insert(2000)
    @lista_cantidades1.insert(20)
    @lista_cantidades1.insert(400)

    @lista_plato2 = Alimento::List.new
    @lista_plato2.insert(@carne)
    @lista_plato2.insert(@camarones)
    @lista_plato2.insert(@camarones)

    @lista_cantidades2 = Alimento::List.new
    @lista_cantidades2.insert(10)
    @lista_cantidades2.insert(20)
    @lista_cantidades2.insert(5)

    # Platos
    @plato = Alimento::Plato.new("Plato Bestia", @lista_plato, @lista_cantidades)

    # Platos de Dieta
    @plato_dieta_bestial = Alimento::PlatoDieta.new("Dieta Bestial", @lista_plato, @lista_cantidades)
    @plato_pesado = Alimento::PlatoDieta.new("Dieta Pesada", @lista_plato1, @lista_cantidades1)
    @plato_ligero = Alimento::PlatoDieta.new("Dieta Ligera", @lista_plato2, @lista_cantidades2)

    # Lista de Platos
    @lista_plato = Alimento::List.new
    @lista_plato.insert(@plato_dieta_bestial)
    @lista_plato.insert(@plato_dieta_bestial)
    @lista_plato.insert(@plato_ligero)
    @lista_plato.insert(@plato_pesado)
    @lista_plato.insert(@plato_ligero)
    @lista_plato.insert(@plato_pesado)
  end
  
  describe Alimento::Alimento do
    context "Comprobando que existan los atributos" do 
      it "Se ha podido comprobar que existe el nombre" do
        expect(@carne.name).not_to be nil
        expect(@carne_cordero.name).not_to be nil
        expect(@camarones.name).not_to be nil
      end
	  it "Se ha podido comprobar que existe la emisión de Gases" do
        expect(@carne.emision).not_to be nil
        expect(@carne_cordero.emision).not_to be nil
        expect(@camarones.emision).not_to be nil
      end
      it "Se ha podido comprobar que existe la cantidad de terreno utilizado" do
        expect(@carne.terreno).not_to be nil
        expect(@carne_cordero.terreno).not_to be nil
        expect(@camarones.terreno).not_to be nil
      end
    end
  
    context "Comprobando los atributos" do
      it "Comprobando Nombre" do
        expect(@carne.name).to eq("Carne de Vaca")
        expect(@carne_cordero.name).to eq("Carne de Cordero")
        expect(@camarones.name).to eq("Camarones")
      end
      it "Comprobando Proteínas" do
        expect(@carne.p).to eq(21.1)
        expect(@carne_cordero.p).to eq(18)
        expect(@camarones.p).to eq(17.6)
      end
      it "Comprobando Glúcidos" do
        expect(@carne.g).to eq(0)
        expect(@carne_cordero.g).to eq(0.0)
        expect(@camarones.g).to eq(1.5)
      end
      it "Comprobando Lípidos" do
        expect(@carne.l).to eq(3.1)
        expect(@carne_cordero.l).to eq(17.0)
        expect(@camarones.l).to eq(0.6)
      end
      it "Comprobando Emisiones" do
        expect(@carne.emision).to eq(50)
        expect(@carne_cordero.emision).to eq(20)
        expect(@camarones.emision).to eq(18.0)
      end
      it "Comprobando Terreno" do
        expect(@carne.terreno).to eq(164)
        expect(@carne_cordero.terreno).to eq(185.000)
        expect(@camarones.terreno).to eq(2.00)
      end
      it "Comprobando Valor Energético" do
        expect(@carne.get_valor_energetico).to be_within(0.01).of(112.3)
        expect(@carne_cordero.get_valor_energetico).to be_within(0.01).of(225)
        expect(@camarones.get_valor_energetico).to be_within(0.01).of(81.8)
      end
    end

    context "Probando el Formateado del alimento" do
      it "Probando el to_s" do
        expect(@carne.to_s).to eq("Alimento::Alimento: Carne de Vaca,21.1,0,3.1,50,164")
        expect(@plato_dieta_bestial.instance_of? Alimento::PlatoDieta).to eq(true)
        expect(@carne_cordero.to_s).to eq("Alimento::Alimento: Carne de Cordero,18,0,17,20,185.0")
        expect(@camarones.to_s).to eq("Alimento::Alimento: Camarones,17.6,1.5,0.6,18.0,2.0")
      end
    end

    context "Probando Impacto Ambiental" do
      it "Probando Impacto Ambiental Hombre 20-39 años" do
        expect(Alimento::Alimento.impacto_hombre).to eq(true)
      end
      it "Probando Impacto Ambiental Mujer 20-39 años" do
        expect(Alimento::Alimento.impacto_mujer).to eq(true)
      end
    end
	
	  context "Probando los operadores de comparación" do
	    it "Probando operador <=>" do
	      expect(@carne <=> @carne_cordero).to eq(-1)
		  expect(@carne_cordero <=> @carne).to eq(1)
	    end
	    it "Probando operador <" do
	      expect(@carne < @carne_cordero).to eq(true)
		    expect(@carne_cordero < @carne).to eq(false)
	    end
	    it "Probando operador <=" do
	      expect(@carne <= @carne).to eq(true)
		    expect(@carne_cordero <= @carne).to eq(false)
	    end
	    it "Probando operador >" do
	      expect(@carne > @carne_cordero).to eq(false)
		    expect(@carne_cordero > @carne).to eq(true)
	    end
	    it "Probando operador >=" do
	      expect(@carne >= @carne_cordero).to eq(false)
		    expect(@carne >= @carne).to eq(true)
	    end
	    it "Probando operador ==" do
	      expect(@carne == @carne).to eq(true)
		    expect(@carne == @carne_cordero).to eq(false)
		    expect(@camarones == @carne_cordero).to eq(false)
	    end
	    it "Probando between" do
	      expect(@carne.between?(@camarones, @carne_cordero)).to eq(true)
		    expect(@carne.between?(@carne_cordero, @camarones)).to eq(false)
	    end
	    it "Probando clamp" do
	      expect(@carne.clamp(@camarones, @carne_cordero)).to eq(@carne)
		    expect(@camarones.clamp(@carne, @carne_cordero)).to eq(@carne)
	    end
	  end
  end
  
  describe Alimento::List do
    describe Alimento::List::Node do
      context "Probando nodos de listas doblemente enlazadas" do
        it "Comprobando que exista un dato" do
          expect(@nodo1.value).not_to be nil
          expect(@nodo2.value).not_to be nil
          expect(@nodo3.value).not_to be nil
        end
        it "Comprobando que exista un siguiente" do
          expect(@nodo1.next).not_to be nil
          expect(@nodo2.next).not_to be nil
        end
        it "Comprobando que exista un previo" do
          expect(@nodo2.prev).not_to be nil
          expect(@nodo3.prev).not_to be nil
        end
      end

      context "Comprobando los datos de los nodos" do
        it "Comprobando dato" do
          expect(@nodo1.value).to eq(@carne)
          expect(@nodo2.value).to eq(@carne_cordero)
          expect(@nodo3.value).to eq(@camarones)
        end
        it "Comprobando siguiente nodo" do
          expect(@nodo1.next).to eq(@nodo2)
          expect(@nodo2.next).to eq(@nodo3)
          expect(@nodo3.next).to be nil
        end
        it "Comprobando nodo previo" do
          expect(@nodo1.prev).to be nil
          expect(@nodo2.prev).to eq(@nodo1)
          expect(@nodo3.prev).to eq(@nodo2)
        end
      end
    end
	
    context "Probando las listas doblemente enlazadas" do
      it "Comprobando que exista la lista" do
        expect(@lista1).not_to be nil
      end
      it "Comprobando que exista una cabeza" do
        @lista1.insert(@carne)
        expect(@lista1.head).not_to eq(@carne)
      end
      it "Comprobando que exista una cola" do
        expect(@lista1.tail).not_to eq(@carne)
      end
      it "Probando insert" do
        @lista1.insert(@carne_cordero)
        expect(@lista1.search(@carne_cordero)).to eq(true)
      end
      it "Probando el extraer la cabeza" do
        expect(@lista1.remove_head).to eq(@carne)
      end
      it "Probando el extraer la cola" do
        @lista1.insert(@camarones)
        expect(@lista1.remove_tail).to eq(@camarones)
      end
    end

	  context "Probando el Módulo Enumerable en las listas" do
	    it "Probando collect" do
	      expect(@lista2.collect { @camarones }).to eq([@camarones, @camarones, @camarones, @camarones, @camarones])
	    end
	    it "Probando select" do
	      expect(@lista2.select { |x| x == @carne }).to eq([@carne, @carne])
	    end
	    it "Probando max" do
	      expect(@lista2.max).to eq(@carne_cordero)
	    end
	    it "Probando min" do
	      expect(@lista2.min).to eq(@camarones)
	    end
	    it "Probando sort" do
	      expect(@lista2.sort).to eq([@camarones,@carne,@carne,@carne_cordero,@carne_cordero])
	    end
	  end
  end

  describe Alimento::Plato do
    context "Probando Plato" do
      it "Obteniendo el nombre del Plato" do
        expect(@plato.nombre).to eq("Plato Bestia")
      end
      it "Comprobando que existe un conjunto de alimentos" do
        expect(@plato.alimentos).to_not be nil
      end
      it "Comprobando que existe un conjunto de cantidades de alimentos en gramos" do
        expect(@plato.cantidades).to_not be nil
      end
      it "Porcentaje de proteínas del conjunto de alimentos" do
        expect(@plato.porcentaje_proteinas).to eq(86.42)
      end
      it "Porcentaje de hidratos de carbono del conjunto de alimentos" do
        expect(@plato.porcentaje_hidratos).to eq(0.56)
      end
      it "Porcentaje de lípidos del conjunto de alimentos" do
        expect(@plato.porcentaje_lipidos).to eq(13.03)
      end
      it "Valor Calórico Total del conjunto de alimentos expresado en kilocalorías" do
        expect(@plato.valor_calorico).to eq(12498)
      end
      it "Se obtiene el plato formateado" do
        expect(@plato.to_s).to eq("Alimento::Plato: Plato Bestia, 86.42% proteínas, 0.56% hidratos, 13.03% lípidos, 12498.0kcal")
      end
    end
  end

  describe Alimento::PlatoDieta do
    context "Probando el Plato de la Dieta" do
      it "Comprobando valor total de la emisiones diarias de de gases" do
        expect(@plato_dieta_bestial.valor_emisiones).to eq(5220)
      end
      it "Comprobando estimación de los metros cuadrados de uso de terreno" do
        expect(@plato_dieta_bestial.valor_terreno).to eq(16790)
      end
      it "Comprobando que se obtiene la eficiencia energética formateada" do
        expect(@plato_dieta_bestial.to_s).to eq("12498.0kcal")
      end
      it "Comprobando la clase" do
        expect(@plato_dieta_bestial.instance_of? Alimento::PlatoDieta).to eq(true)
      end
      it "Comprobando si es un tipo de Plato" do
        expect(@plato_dieta_bestial.is_a? Alimento::Plato).to eq(true)
      end
    end

    context "Modificaciones para que las Intancias de PlatoDieta sean comparables" do
      it "Probando operador <=>" do
        expect(@plato_dieta_bestial <=> @plato_pesado).to eq(-1)
      end
      it "Probando operador <" do
        expect(@plato_dieta_bestial < @plato_pesado).to eq(true)
        expect(@plato_pesado < @plato_dieta_bestial).to eq(false)
      end
      it "Probando operador <=" do
        expect(@plato_dieta_bestial <= @plato_dieta_bestial).to eq(true)
        expect(@plato_dieta_bestial <= @plato_pesado).to eq(true)
      end
      it "Probando operador >" do
        expect(@plato_dieta_bestial > @plato_pesado).to eq(false)
        expect(@plato_pesado > @plato_dieta_bestial).to eq(true)
      end
      it "Probando operador >=" do
        expect(@plato_dieta_bestial >= @plato_pesado).to eq(false)
        expect(@plato_dieta_bestial >= @plato_dieta_bestial).to eq(true)
      end
      it "Probando operador ==" do
        expect(@plato_dieta_bestial == @plato_dieta_bestial).to eq(true)
        expect(@plato_dieta_bestial == @plato_ligero).to eq(false)
      end
      it "Probando between" do
        expect(@plato_dieta_bestial.between?(@plato_ligero, @plato_pesado)).to eq(true)
        expect(@plato_ligero.between?(@plato_dieta_bestial, @plato_pesado)).to eq(false)
      end
      it "Probando clamp" do
        expect(@plato_dieta_bestial.clamp(@plato_ligero, @plato_pesado)).to eq(@plato_dieta_bestial)
        expect(@plato_pesado.clamp(@plato_ligero, @plato_dieta_bestial)).to eq(@plato_dieta_bestial)
      end
    end

    context "Modificaciones para que las Intancias de PlatoDieta sean enumerables" do
      it "Probando collect" do
        expect(@lista_plato.collect { @plato_ligero }).to eq([@plato_ligero, @plato_ligero, @plato_ligero, @plato_ligero, @plato_ligero, @plato_ligero])
      end
      it "Probando select" do
        expect(@lista_plato.select { |x| x == @plato_dieta_bestial }).to eq([@plato_dieta_bestial, @plato_dieta_bestial])
      end
      it "Probando max" do
        expect(@lista_plato.max).to eq(@plato_pesado)
      end
      it "Probando min" do
        expect(@lista_plato.min).to eq(@plato_ligero)
      end
      it "Probando sort" do
        expect(@lista_plato.sort).to eq([@plato_ligero,@plato_ligero,@plato_dieta_bestial,@plato_dieta_bestial,@plato_pesado,@plato_pesado])
      end
    end
  end

  describe "Menú" do
    before :each do
      # MENU
      @menu_dietetico = [@plato_ligero, @plato_dieta_bestial, @plato_pesado]
      @precios = [20, 10, 5]
      @maxima_huella = @menu_dietetico.collect { |plato| plato.huella_nutricional }.max
      if @maxima_huella < 1.5
      	@incremento = 0.10
      elsif @maxima_huella > 2.5
      	@incremento = 0.50
      else
      	@incremento = 0.20
      end
      @precios_incrementados = @precios.collect { |precio| precio += precio * @incremento }
    end
    context "Probando los menús (arrays de platos)" do
      it "Calculando la huella nutricional máxima de un menú dietético" do
        expect(@maxima_huella).to eq(3.0)
      end
      it "Probando el porcentaje de incremento del menú" do
      	expect(@incremento).to eq(0.50)
      end
      it "Probando el incremento del menú" do
      	expect(@precios_incrementados).to eq([30, 15, 7.5])
      end
    end
  end

  describe Alimento::PlatoDSL do
    before :all do
      @plato_dsl = Alimento::PlatoDSL.new("Hamburguesa") do
        Nombre "Hamburguesa Especial de la casa"
        Alimento :descripcion => "Carne de Vaca",
                 :proteinas => 21.1,
                 :glucidos => 0,
                 :lipidos => 3.1,
                 :emisiones => 164,
                 :terreno => 50,
                 :gramos => 100
        Alimento :descripcion => "Huevos",
                 :proteinas => 13,
                 :glucidos => 1.1,
                 :lipidos => 11,
                 :emisiones => 5.7,
                 :terreno => 4.2,
                 :gramos => 20
        Alimento :alimento => @camarones = Alimento::Alimento.new("Camarones",17.6,1.5,0.6,18.0,2.0),
                 :gramos => 5
      end
    end

    context "Probando Plato con DSL" do
      it "Probando nombre" do
        expect(@plato_dsl.nombre).to eq("Hamburguesa Especial de la casa")
      end
      it "Probando Alimento" do
        expect(@plato_dsl.alimentos.head.value).to eq(Alimento::Alimento.new("Carne de Vaca",21.1,0,3.1,164,50))
      end
      it "Probando una instancia de Alimento" do
        expect(@plato_dsl.alimentos.tail.value).to eq(@camarones)
      end
      it "Probando cantidades" do
        expect(@plato_dsl.cantidades.head.value).to eq(100)
      end
    end 
  end

  describe Alimento::Menu do
    before :all do
      @menu = Alimento::Menu.new("Combinado nº 1") do
        Descripcion "Plato Carnívoro Descomunal"
        Componente :descripcion => "Plato Bestial",
                   :alimentos => @lista_plato,
                   :cantidades => @lista_cantidades,
                   :precio => 50.50
        Precio 50.50
      end
    end
    context "Probando Menú Dietético" do
      it "Probando nombre" do
        expect(@menu.nombre).to eq("Combinado nº 1")
      end
      it "Probando descripcion" do
        expect(@menu.descripcion).to eq("Plato Carnívoro Descomunal")
      end
      it "Probando Precio" do
        expect(@menu.precio).to eq(50.50)
      end
    end
  end
end
