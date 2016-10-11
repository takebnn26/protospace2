class TagsController < ApplicationController

  def index
    @tags = ActsAsTaggableOn::Tag.all.uniq
  end

  def show
    tag = ActsAsTaggableOn::Tag.where(name: params[:id])
    @prototypes = Prototype.tagged_with(tag.name)
    render template: "prototypes/index"
  end

end
