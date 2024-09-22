class UsersController < ApplicationController
    before_action :authenticate_user, {only: [:edit, :update, :logout]}
    before_action :forbid_login_user, {only: [:new, :create, :login_form, :login]}
    before_action :ensure_correct_user, {only: [:show]}

    def ensure_correct_user
        if @current_user.id != params[:id].to_i
            flash[:notice]="権限がありません"
            redirect_to("/map")
        end
    end

    def show
        @user=User.find_by(id: params[:id])
    end
    
    def new
        @user=User.new
    end
    
    def create
        @user=User.new(name: params[:name], image_name: "userimg.jpg", password: params[:password])
        if @user.save
            session[:user_id]=@user.id
            flash[:notice]="登録成功！"
            redirect_to("/mypage")
        else
            render("users/new")
        end
    end

    def edit
        @user=User.find_by(id: params[:id])
    end

    def update
        @user=User.find_by(id: params[:id])
        @user.name=params[:name]
        if params[:image]
            @user.image_name="#{@user.id}.jpg"
            image=params[:image]
            File.binwrite("public/user_images/#{@user.image_name}", image.read)
        end
        if @user.save
            flash[:notice] = "編集成功！"
            redirect_to("/mypage")
        else
            render("users/edit")
        end
    end

    def login_form
        
    end

    def login
        @user=User.find_by(name: params[:name])
        if @user && @user.authenticate(params[:password])
            session[:user_id]=@user.id
            flash[:notice]="ログインしたよ"
            redirect_to("/mypage")
        else
            @error_message="ユーザー名またはパスワードがまちがっています"
            render("users/login_form")
    end

    def logout
        session[:user_id]=nil
        flash[:notice]="ログアウトしました"
        redirect_to("/login")
    end
end

end