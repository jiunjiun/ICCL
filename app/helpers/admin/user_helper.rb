module Admin::UserHelper
    def roleName(role)
        t("user.roles.#{role}")
    end

    def classesName(classes)
        t("study.#{classes}")
    end
end
