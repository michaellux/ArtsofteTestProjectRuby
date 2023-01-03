class ProgrammingLanguageController < ApplicationController
  def add
    @programming_language = ProgrammingLanguage.new
  end

  def create
    @programming_language = ProgrammingLanguage.create(programming_language_params)

    if @programming_language.save
      redirect_to root_path
    end
  end

  def programming_language_params
    params.require(:programming_language).permit(
      :name
    )
  end
end