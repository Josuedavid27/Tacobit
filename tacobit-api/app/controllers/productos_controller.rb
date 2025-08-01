# app/controllers/productos_controller.rb
class ProductosController < ApplicationController
  def index
    productos = Producto.all
    render json: productos
  end

  def show
    producto = Producto.find(params[:id])
    render json: producto
  end

  def create
    producto = Producto.new(producto_params)
    if producto.save
      render json: producto, status: :created
    else
      render json: { errors: producto.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    producto = Producto.find(params[:id])
    if producto.update(producto_params)
      render json: producto
    else
      render json: { errors: producto.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    producto = Producto.find(params[:id])
    producto.destroy
    head :no_content
  end

  private

  def producto_params
    params.require(:producto).permit(:nombre, :descripcion, :precio, :stock)
  end
end
