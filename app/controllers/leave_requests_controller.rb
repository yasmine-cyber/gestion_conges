class LeaveRequestsController < ApplicationController
    before_action :authenticate_user! # Assure que l'utilisateur est connecté
    before_action :set_leave_request, only: [:show, :update, :destroy, :approve, :reject]
  
    # GET /leave_requests
    def index
      if current_user.admin?
        @leave_requests = LeaveRequest.all # L'admin voit toutes les demandes
      else
        @leave_requests = current_user.leave_requests # L'employee ne voit que ses demandes
      end
      render json: @leave_requests
    end
  
    # GET /leave_requests/:id
    def show
      if current_user.admin? || @leave_request.employee == current_user
        render json: @leave_request
      else
        render json: { error: 'Not authorized to view this leave request' }, status: :forbidden
      end
    end
  
    # POST /leave_requests
    def create
      if current_user.employee?
        @leave_request = current_user.leave_requests.new(leave_request_params)
  
        if @leave_request.save
          render json: @leave_request, status: :created
        else
          render json: @leave_request.errors, status: :unprocessable_entity
        end
      else
        render json: { error: 'Only employees can create leave requests' }, status: :forbidden
      end
    end
  
    # PUT/PATCH /leave_requests/:id
    def update
      if current_user.employee? && @leave_request.employee == current_user
        if @leave_request.update(leave_request_params)
          render json: @leave_request
        else
          render json: @leave_request.errors, status: :unprocessable_entity
        end
      else
        render json: { error: 'Not authorized to update this leave request' }, status: :forbidden
      end
    end
  
    # DELETE /leave_requests/:id
    def destroy
      if current_user.employee? && @leave_request.employee == current_user
        @leave_request.destroy
        head :no_content
      else
        render json: { error: 'Not authorized to delete this leave request' }, status: :forbidden
      end
    end
  
    # POST /leave_requests/:id/approve
    def approve
      if current_user.admin?
        @leave_request.update(status: 'approved')
        LeaveHistory.create(leave_request: @leave_request, admin: current_user, action: 'approved', commentaire: params[:commentaire])
        render json: @leave_request
      else
        render json: { error: 'Only admins can approve leave requests' }, status: :forbidden
      end
    end
  
    # POST /leave_requests/:id/reject
    def reject
      if current_user.admin?
        @leave_request.update(status: 'rejected')
        LeaveHistory.create(leave_request: @leave_request, admin: current_user, action: 'rejected', commentaire: params[:commentaire])
        render json: @leave_request
      else
        render json: { error: 'Only admins can reject leave requests' }, status: :forbidden
      end
    end
  
    private
  
    # Trouve la demande de congé par son ID
    def set_leave_request
      @leave_request = LeaveRequest.find(params[:id])
    end
  
    # Permet uniquement les paramètres autorisés
    def leave_request_params
      params.require(:leave_request).permit(:start_date, :end_date, :cause, :status)
    end
  end
