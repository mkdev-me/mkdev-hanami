module Web::Controllers::Folders
  class Show
    include Web::Action

    expose :folder
    expose :tickets

    def call(params)
      @folder = FolderRepository.new.find(params[:id])
      @tickets = TicketRepository.new.by_folder(@folder.id)
    end
  end
end
