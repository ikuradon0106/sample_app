class ListsController < ApplicationController
  def new
    # viewに渡すためのインスタンス変数に空のmodelオブジェクトを生成する
    @list = List.new
  end

  # 以下を追加した
  def create
    # 1 .&2. データを受け取り新規登録するためのインスタンス作成
    list = List.new(list_params)
    # 3. データをデータベースに保存するためのsaveメソッド実行
    list.save
    # redirect_to '/top'を削除して、以下コードに変更
    # 4. 詳細画面へリダイレクト
    redirect_to list_path(list.id)
  end

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def edit
  end

  private
  # ストロングパラメータ
  def list_params
    params.require(:list).permit(:title, :body)
  end
end
