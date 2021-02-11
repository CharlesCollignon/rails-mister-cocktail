class DosesController < ApplicationController
  def new
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:cocktail_id])
  end
  
  def create
    @dose = Dose.new(dose_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail
    if @dose.save
      flash[:success] = "Dose successfully created"
      redirect_to cocktail_path(@cocktail)
    else
      flash[:error] = "Something went wrong"
      render :new
    end
  end

  def destroy
    @dose = Dose.find(dose_params)
    if @dose.destroy
      flash[:success] = 'Dose was successfully deleted.'
      redirect_to cocktail_path(@cocktail)
    else
      flash[:error] = 'Something went wrong'
      redirect_to cocktail_path(@cocktail)
    end
  end
  
  private

  def dose_params
    params.require(:dose).permit(:description)
  end
end
