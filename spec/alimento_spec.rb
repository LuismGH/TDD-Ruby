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
    @lista1 = Alimento::List.new(@carne)
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
        expect(@lista1.head).not_to be nil
      end
      it "Comprobando que exista una cola" do
        expect(@lista1.tail).not_to be nil
      end
    end
	
	  context "Probando el Módulo Enumerable en las listas" do
	    it "Probando each" do
	      expect(@lista1.each { |x| puts x }).to eq(@carne.to_s)
	    end
	    it "Probando collect" do
	      expect(@lista1.collect { @camarones }).to eq([@camarones])
	    end
	    it "Probando select" do
	      @lista1.insert(@carne_cordero)
		    @lista1.insert(@carne)
	      expect(@lista1.select { |x| x == @carne }).to eq([@carne])
	    end
	    it "Probando max" do
	      expect(@lista1.max).to eq(@carne_cordero)
	    end
	    it "Probando min" do
	      expect(@lista1.min).to eq(@camarones)
	    end
	    it "Probando sort" do
	      expect(@lista1.sort).to eq([@camarones,@carne,@carne_cordero])
	    end
	  end
  end
end