class CommentsController < ApplicationController
  def create
    # [HW] Find the photo this comment belongs to via the nested route param :photo_id
    @photo = Photo.find(params[:photo_id])
    # Build the comment first so Pundit can check it before saving. MJR
    @comment = @photo.comments.build(text: params[:comment][:text], user: current_user)
    # Check if the current user is allowed to post a comment. MJR
    authorize @comment
    @comment.save
    # [HW] respond_to lets Rails pick the right response format:
    # [HW]   turbo_stream → renders create.turbo_stream.erb (no page reload)
    # [HW]   html         → falls back to a full redirect for browsers without Turbo
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to in_canada_path, status: :see_other }
    end
  end

  def destroy
    # Use Comment.find so Pundit can handle access control. MJR
    @comment = Comment.find(params[:id])
    # Check if the current user is allowed to delete this comment. MJR
    authorize @comment
    # [HW] Capture the photo before destroying the comment — needed by the turbo stream view
    @photo = @comment.photo
    @comment.destroy
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to in_canada_path, status: :see_other }
    end
  end
end
