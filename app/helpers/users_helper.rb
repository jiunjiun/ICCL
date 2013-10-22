module UsersHelper
    def classesName(classes)
        case classes
        when 'master'
            t('study.master')
        when 'university'
            t('study.university')
        end
    end
end
