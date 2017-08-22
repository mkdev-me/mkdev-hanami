module Web::Controllers::Folders
  class Index
    include Web::Action

    expose :folders

    def call(params)
      @folders = FolderRepository.new.all
    end
  end
end
