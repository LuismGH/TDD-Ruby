require 'spec_helper'
require 'alimento'

RSpec.describe Alimento do
  before (:all) do
    @carne = Alimento.new("Carne de Vaca", 21.1, 0.0, 3.1, 50, 164.0)
  end
  
  context "Comprobando que existan los atributos" do 
    it "Se ha podido comprobar que existe el nombre" do
      expect(@carne.name).not_to be nil
    end
    it "Se ha podido comprobar que existe la emisión de Gases" do
      expect(@carne.emision).not_to be nil
    end
    it "Se ha podido comprobar que existe la cantidad de terreno utilizado" do
      expect(@carne.terreno).not_to be nil
    end
  end
  
  context "Probando los getters" do
    it "Probando get Nombre" do
      expect(@carne.get_name).to eq("Carne de Vaca")
    end
    it "Probando get Emisiones" do
      expect(@carne.get_emisiones).to eq(50)
    end
    it "Probando get Terreno" do
      expect(@carne.get_terreno).to eq(164.0)
    end
    it "Probando el to_s" do
      expect(@carne.to_s).to eq("Nombre: Carne de Vaca")
    end
    it "Probando get Valor Energético" do
      expect(@carne.get_valor_energetico).to eq(112.3)
    end
  end

  context "Probando Impacto Ambiental" do
    it "Probando Impacto Ambiental Hombre 20-39 años" do
      expect(@carne.impacto_hombre).to eq()
    end
    it "Probando Impacto Ambiental Mujer 20-39 años" do
      expect(@carne.impacto_mujer).to eq()
    end
  end
end
