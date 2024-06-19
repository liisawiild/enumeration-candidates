# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program

  def find(id)
    @candidates.each do |candidate|
      if candidate[:id] == id
        return candidate
      end
    end
  end
  
  def experienced?(candidate)
    if candidate[:years_of_experience] >= 2
      return true
    else
      return false
    end
  end
  
  def active_github_member?(candidate)
    if candidate[:github_points] >= 100
      return true
    else
      return false
    end
  end

  def languages_required?(candidate)
    if candidate[:languages].include?("Ruby") && candidate[:languages].include?("Python")
      return true
    else
      return false
    end
  end

  def application_recent?(candidate)
    if (Date.today - candidate[:date_applied]).to_i <= 15
      return true
    else
      return false
    end
  end

  def old_enough?(candidate)
    if candidate[:age] > 17
      return true
    else
      return false
    end
  end

  def qualified_candidates(candidates)
    passing_candidates = []
    candidates.each do |candidate|
      if experienced?(candidate) && active_github_member?(candidate) && languages_required?(candidate) && application_recent?(candidate) && old_enough?(candidate)
        passing_candidates << candidate
      end
    end
    pp passing_candidates
  end

  def ordered_by_qualifications(candidates)
    pp candidates.sort_by { |candidate| [candidate[:years_of_experience], candidate[:github_points]]}.reverse
  end




