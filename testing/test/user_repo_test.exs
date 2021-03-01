defmodule UserRepoTest do
  use ExUnit.Case
  doctest UserRepo
  
  test "Create a UserRepoImpl pid is nil" do
    user_repo = %UserRepoImpl{pid: nil}
    assert_raise UndefinedFunctionError, fn -> UserRepo.fin_one(user_repo, 1) end
  end

  test "creating users" do
    db_handler =PostgresMock.create()
    user_repo = UserRepoImpl.start_link(db_handler)
    
    expected = %User{id: 1, name: "David"}
    new_user = UserRepo.create_one(user_repo, name: "David")
    assert expected == new_user

    expected = %User{id: 2, name: "Karol"}
    new_user = UserRepo.create_one(user_repo, name: "Karol")
    assert expected == new_user

    expected = %User{id: 3, name: "Anamaria"}
    new_user = UserRepo.create_one(user_repo, name: "Anamaria")
    assert expected == new_user

    expected = %User{id: 4, name: "Valeria"}
    new_user = UserRepo.create_one(user_repo, name: "Valeria")
    assert expected == new_user
  end

  test "finding users out de range" do
    db_handler = PostgresMock.create()
    user_repo = UserRepoImpl.start_link(db_handler)
    
    UserRepo.create_one(user_repo, name: "David")
    UserRepo.create_one(user_repo, name: "Karol")
    UserRepo.create_one(user_repo, name: "Anamaria")
    UserRepo.create_one(user_repo, name: "Valeria")

    assert UserRepo.find_one(user_repo, -1) == nil
    assert UserRepo.find_one(user_repo, 0) == nil
    assert UserRepo.find_one(user_repo, 5) == nil
    assert UserRepo.find_one(user_repo, 6) == nil
    assert UserRepo.find_one(user_repo, 7) == nil
  end

  test "Create a UserRepoImpl2 pid is nil" do
    user_repo = %UserRepoImpl2{db: nil}
    assert_raise UndefinedFunctionError, fn -> UserRepo.fin_one(user_repo, 1) end
  end

  test "creatiUse RepoImpl2 as struc" do
    db_handler =PostgresMock.create()
    user_repo = UserRepoImpl2.create(db_handler)
    
    assert  UserRepo.create_one(user_repo, name: "David") == %User{id: 1, name: "David"}
    assert UserRepo.create_one(user_repo, name: "Karol") == %User{id: 2, name: "Karol"}
    assert UserRepo.create_one(user_repo, name: "Anamaria") == %User{id: 3, name: "Anamaria"}
    assert UserRepo.create_one(user_repo, name: "Valeria") == %User{id: 4, name: "Valeria"}
    
    assert UserRepo.find_one(user_repo, 1) == %User{id: 1, name: "David"}
    assert UserRepo.find_one(user_repo, 2) ==  %User{id: 2, name: "Karol"}
    assert UserRepo.find_one(user_repo, 3) ==  %User{id: 3, name: "Anamaria"}
    assert UserRepo.find_one(user_repo, 4) ==  %User{id: 4, name: "Valeria"}
  end
end  

      