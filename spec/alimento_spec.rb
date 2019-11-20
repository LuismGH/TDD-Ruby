require 'spec_helper'
require 'alimento'

RSpec.describe Alimento do
  before (:all) do
    @carne = Alimento::Alimento.new("Carne de Vaca", 21.1, 0, 3.1, 50, 164)
    @carne_cordero = Alimento::Alimento.new("Carne de Cordero",18,0,17,20,185.0)
    @camarones = Alimento::Alimento.new("Camarones",17.6,1.5,0.6,18.0,2.0)
    @nodo1 = Node.new(@carne, @nodo2, nil)
    @nodo2 = Node.new(@carne_cordero, @nodo3, @nodo1)
    @nodo3 = Node.new(@camarones, nil, @nodo2)
  end

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

  context "Probando los getters" do
    it "Probando get Nombre" do
      expect(@carne.get_name).to eq("Carne de Vaca")
      expect(@carne_cordero.get_name).to eq("Carne de Cordero")
      expect(@camarones.get_name).to eq("Camarones")
    end
    it "Probando get Proteínas" do
      expect(@carne.get_proteinas).to eq(21.1)
      expect(@carne_cordero.get_proteinas).to eq(18)
      expect(@camarones.get_proteinas).to eq(17.6)
    end
    it "Probando get Glúcidos" do
      expect(@carne.get_glucidos).to eq(0)
      expect(@carne_cordero.get_glucidos).to eq(0.0)
      expect(@camarones.get_glucidos).to eq(1.5)
    end
    it "Probando get Lípidos" do
      expect(@carne.get_lipidos).to eq(3.1)
      expect(@carne_cordero.get_lipidos).to eq(17.0)
      expect(@camarones.get_lipidos).to eq(0.6)
    end
    it "Probando get Emisiones" do
      expect(@carne.get_emisiones).to eq(50)
      expect(@carne_cordero.get_emisiones).to eq(20)
      expect(@camarones.get_emisiones).to eq(18.0)
    end
    it "Probando get Terreno" do
      expect(@carne.get_terreno).to eq(164)
      expect(@carne_cordero.get_terreno).to eq(185.000)
      expect(@camarones.get_terreno).to eq(2.00)
    end
    it "Probando get Valor Energético" do
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

  context "Probando nodos de listas doblemente enlazadas" do
    it "Comprobando que exista un dato" do
      expect(@nodo1.name).not_to be nil
      expect(@nodo2.name).not_to be nil
      expect(@nodo3.name).not_to be nil
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
end
