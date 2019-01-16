package com.huat.bs.bean;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class UserExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public UserExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andUIdIsNull() {
            addCriterion("u_id is null");
            return (Criteria) this;
        }

        public Criteria andUIdIsNotNull() {
            addCriterion("u_id is not null");
            return (Criteria) this;
        }

        public Criteria andUIdEqualTo(String value) {
            addCriterion("u_id =", value, "uId");
            return (Criteria) this;
        }

        public Criteria andUIdNotEqualTo(String value) {
            addCriterion("u_id <>", value, "uId");
            return (Criteria) this;
        }

        public Criteria andUIdGreaterThan(String value) {
            addCriterion("u_id >", value, "uId");
            return (Criteria) this;
        }

        public Criteria andUIdGreaterThanOrEqualTo(String value) {
            addCriterion("u_id >=", value, "uId");
            return (Criteria) this;
        }

        public Criteria andUIdLessThan(String value) {
            addCriterion("u_id <", value, "uId");
            return (Criteria) this;
        }

        public Criteria andUIdLessThanOrEqualTo(String value) {
            addCriterion("u_id <=", value, "uId");
            return (Criteria) this;
        }

        public Criteria andUIdLike(String value) {
            addCriterion("u_id like", value, "uId");
            return (Criteria) this;
        }

        public Criteria andUIdNotLike(String value) {
            addCriterion("u_id not like", value, "uId");
            return (Criteria) this;
        }

        public Criteria andUIdIn(List<String> values) {
            addCriterion("u_id in", values, "uId");
            return (Criteria) this;
        }

        public Criteria andUIdNotIn(List<String> values) {
            addCriterion("u_id not in", values, "uId");
            return (Criteria) this;
        }

        public Criteria andUIdBetween(String value1, String value2) {
            addCriterion("u_id between", value1, value2, "uId");
            return (Criteria) this;
        }

        public Criteria andUIdNotBetween(String value1, String value2) {
            addCriterion("u_id not between", value1, value2, "uId");
            return (Criteria) this;
        }

        public Criteria andULoginidIsNull() {
            addCriterion("u_loginID is null");
            return (Criteria) this;
        }

        public Criteria andULoginidIsNotNull() {
            addCriterion("u_loginID is not null");
            return (Criteria) this;
        }

        public Criteria andULoginidEqualTo(String value) {
            addCriterion("u_loginID =", value, "uLoginid");
            return (Criteria) this;
        }

        public Criteria andULoginidNotEqualTo(String value) {
            addCriterion("u_loginID <>", value, "uLoginid");
            return (Criteria) this;
        }

        public Criteria andULoginidGreaterThan(String value) {
            addCriterion("u_loginID >", value, "uLoginid");
            return (Criteria) this;
        }

        public Criteria andULoginidGreaterThanOrEqualTo(String value) {
            addCriterion("u_loginID >=", value, "uLoginid");
            return (Criteria) this;
        }

        public Criteria andULoginidLessThan(String value) {
            addCriterion("u_loginID <", value, "uLoginid");
            return (Criteria) this;
        }

        public Criteria andULoginidLessThanOrEqualTo(String value) {
            addCriterion("u_loginID <=", value, "uLoginid");
            return (Criteria) this;
        }

        public Criteria andULoginidLike(String value) {
            addCriterion("u_loginID like", value, "uLoginid");
            return (Criteria) this;
        }

        public Criteria andULoginidNotLike(String value) {
            addCriterion("u_loginID not like", value, "uLoginid");
            return (Criteria) this;
        }

        public Criteria andULoginidIn(List<String> values) {
            addCriterion("u_loginID in", values, "uLoginid");
            return (Criteria) this;
        }

        public Criteria andULoginidNotIn(List<String> values) {
            addCriterion("u_loginID not in", values, "uLoginid");
            return (Criteria) this;
        }

        public Criteria andULoginidBetween(String value1, String value2) {
            addCriterion("u_loginID between", value1, value2, "uLoginid");
            return (Criteria) this;
        }

        public Criteria andULoginidNotBetween(String value1, String value2) {
            addCriterion("u_loginID not between", value1, value2, "uLoginid");
            return (Criteria) this;
        }

        public Criteria andUNicknameIsNull() {
            addCriterion("u_nickName is null");
            return (Criteria) this;
        }

        public Criteria andUNicknameIsNotNull() {
            addCriterion("u_nickName is not null");
            return (Criteria) this;
        }

        public Criteria andUNicknameEqualTo(String value) {
            addCriterion("u_nickName =", value, "uNickname");
            return (Criteria) this;
        }

        public Criteria andUNicknameNotEqualTo(String value) {
            addCriterion("u_nickName <>", value, "uNickname");
            return (Criteria) this;
        }

        public Criteria andUNicknameGreaterThan(String value) {
            addCriterion("u_nickName >", value, "uNickname");
            return (Criteria) this;
        }

        public Criteria andUNicknameGreaterThanOrEqualTo(String value) {
            addCriterion("u_nickName >=", value, "uNickname");
            return (Criteria) this;
        }

        public Criteria andUNicknameLessThan(String value) {
            addCriterion("u_nickName <", value, "uNickname");
            return (Criteria) this;
        }

        public Criteria andUNicknameLessThanOrEqualTo(String value) {
            addCriterion("u_nickName <=", value, "uNickname");
            return (Criteria) this;
        }

        public Criteria andUNicknameLike(String value) {
            addCriterion("u_nickName like", value, "uNickname");
            return (Criteria) this;
        }

        public Criteria andUNicknameNotLike(String value) {
            addCriterion("u_nickName not like", value, "uNickname");
            return (Criteria) this;
        }

        public Criteria andUNicknameIn(List<String> values) {
            addCriterion("u_nickName in", values, "uNickname");
            return (Criteria) this;
        }

        public Criteria andUNicknameNotIn(List<String> values) {
            addCriterion("u_nickName not in", values, "uNickname");
            return (Criteria) this;
        }

        public Criteria andUNicknameBetween(String value1, String value2) {
            addCriterion("u_nickName between", value1, value2, "uNickname");
            return (Criteria) this;
        }

        public Criteria andUNicknameNotBetween(String value1, String value2) {
            addCriterion("u_nickName not between", value1, value2, "uNickname");
            return (Criteria) this;
        }

        public Criteria andUPasswordIsNull() {
            addCriterion("u_password is null");
            return (Criteria) this;
        }

        public Criteria andUPasswordIsNotNull() {
            addCriterion("u_password is not null");
            return (Criteria) this;
        }

        public Criteria andUPasswordEqualTo(String value) {
            addCriterion("u_password =", value, "uPassword");
            return (Criteria) this;
        }

        public Criteria andUPasswordNotEqualTo(String value) {
            addCriterion("u_password <>", value, "uPassword");
            return (Criteria) this;
        }

        public Criteria andUPasswordGreaterThan(String value) {
            addCriterion("u_password >", value, "uPassword");
            return (Criteria) this;
        }

        public Criteria andUPasswordGreaterThanOrEqualTo(String value) {
            addCriterion("u_password >=", value, "uPassword");
            return (Criteria) this;
        }

        public Criteria andUPasswordLessThan(String value) {
            addCriterion("u_password <", value, "uPassword");
            return (Criteria) this;
        }

        public Criteria andUPasswordLessThanOrEqualTo(String value) {
            addCriterion("u_password <=", value, "uPassword");
            return (Criteria) this;
        }

        public Criteria andUPasswordLike(String value) {
            addCriterion("u_password like", value, "uPassword");
            return (Criteria) this;
        }

        public Criteria andUPasswordNotLike(String value) {
            addCriterion("u_password not like", value, "uPassword");
            return (Criteria) this;
        }

        public Criteria andUPasswordIn(List<String> values) {
            addCriterion("u_password in", values, "uPassword");
            return (Criteria) this;
        }

        public Criteria andUPasswordNotIn(List<String> values) {
            addCriterion("u_password not in", values, "uPassword");
            return (Criteria) this;
        }

        public Criteria andUPasswordBetween(String value1, String value2) {
            addCriterion("u_password between", value1, value2, "uPassword");
            return (Criteria) this;
        }

        public Criteria andUPasswordNotBetween(String value1, String value2) {
            addCriterion("u_password not between", value1, value2, "uPassword");
            return (Criteria) this;
        }

        public Criteria andUEmailIsNull() {
            addCriterion("u_email is null");
            return (Criteria) this;
        }

        public Criteria andUEmailIsNotNull() {
            addCriterion("u_email is not null");
            return (Criteria) this;
        }

        public Criteria andUEmailEqualTo(String value) {
            addCriterion("u_email =", value, "uEmail");
            return (Criteria) this;
        }

        public Criteria andUEmailNotEqualTo(String value) {
            addCriterion("u_email <>", value, "uEmail");
            return (Criteria) this;
        }

        public Criteria andUEmailGreaterThan(String value) {
            addCriterion("u_email >", value, "uEmail");
            return (Criteria) this;
        }

        public Criteria andUEmailGreaterThanOrEqualTo(String value) {
            addCriterion("u_email >=", value, "uEmail");
            return (Criteria) this;
        }

        public Criteria andUEmailLessThan(String value) {
            addCriterion("u_email <", value, "uEmail");
            return (Criteria) this;
        }

        public Criteria andUEmailLessThanOrEqualTo(String value) {
            addCriterion("u_email <=", value, "uEmail");
            return (Criteria) this;
        }

        public Criteria andUEmailLike(String value) {
            addCriterion("u_email like", value, "uEmail");
            return (Criteria) this;
        }

        public Criteria andUEmailNotLike(String value) {
            addCriterion("u_email not like", value, "uEmail");
            return (Criteria) this;
        }

        public Criteria andUEmailIn(List<String> values) {
            addCriterion("u_email in", values, "uEmail");
            return (Criteria) this;
        }

        public Criteria andUEmailNotIn(List<String> values) {
            addCriterion("u_email not in", values, "uEmail");
            return (Criteria) this;
        }

        public Criteria andUEmailBetween(String value1, String value2) {
            addCriterion("u_email between", value1, value2, "uEmail");
            return (Criteria) this;
        }

        public Criteria andUEmailNotBetween(String value1, String value2) {
            addCriterion("u_email not between", value1, value2, "uEmail");
            return (Criteria) this;
        }

        public Criteria andUSexIsNull() {
            addCriterion("u_sex is null");
            return (Criteria) this;
        }

        public Criteria andUSexIsNotNull() {
            addCriterion("u_sex is not null");
            return (Criteria) this;
        }

        public Criteria andUSexEqualTo(String value) {
            addCriterion("u_sex =", value, "uSex");
            return (Criteria) this;
        }

        public Criteria andUSexNotEqualTo(String value) {
            addCriterion("u_sex <>", value, "uSex");
            return (Criteria) this;
        }

        public Criteria andUSexGreaterThan(String value) {
            addCriterion("u_sex >", value, "uSex");
            return (Criteria) this;
        }

        public Criteria andUSexGreaterThanOrEqualTo(String value) {
            addCriterion("u_sex >=", value, "uSex");
            return (Criteria) this;
        }

        public Criteria andUSexLessThan(String value) {
            addCriterion("u_sex <", value, "uSex");
            return (Criteria) this;
        }

        public Criteria andUSexLessThanOrEqualTo(String value) {
            addCriterion("u_sex <=", value, "uSex");
            return (Criteria) this;
        }

        public Criteria andUSexLike(String value) {
            addCriterion("u_sex like", value, "uSex");
            return (Criteria) this;
        }

        public Criteria andUSexNotLike(String value) {
            addCriterion("u_sex not like", value, "uSex");
            return (Criteria) this;
        }

        public Criteria andUSexIn(List<String> values) {
            addCriterion("u_sex in", values, "uSex");
            return (Criteria) this;
        }

        public Criteria andUSexNotIn(List<String> values) {
            addCriterion("u_sex not in", values, "uSex");
            return (Criteria) this;
        }

        public Criteria andUSexBetween(String value1, String value2) {
            addCriterion("u_sex between", value1, value2, "uSex");
            return (Criteria) this;
        }

        public Criteria andUSexNotBetween(String value1, String value2) {
            addCriterion("u_sex not between", value1, value2, "uSex");
            return (Criteria) this;
        }

        public Criteria andUActivaecodeIsNull() {
            addCriterion("u_activaecode is null");
            return (Criteria) this;
        }

        public Criteria andUActivaecodeIsNotNull() {
            addCriterion("u_activaecode is not null");
            return (Criteria) this;
        }

        public Criteria andUActivaecodeEqualTo(String value) {
            addCriterion("u_activaecode =", value, "uActivaecode");
            return (Criteria) this;
        }

        public Criteria andUActivaecodeNotEqualTo(String value) {
            addCriterion("u_activaecode <>", value, "uActivaecode");
            return (Criteria) this;
        }

        public Criteria andUActivaecodeGreaterThan(String value) {
            addCriterion("u_activaecode >", value, "uActivaecode");
            return (Criteria) this;
        }

        public Criteria andUActivaecodeGreaterThanOrEqualTo(String value) {
            addCriterion("u_activaecode >=", value, "uActivaecode");
            return (Criteria) this;
        }

        public Criteria andUActivaecodeLessThan(String value) {
            addCriterion("u_activaecode <", value, "uActivaecode");
            return (Criteria) this;
        }

        public Criteria andUActivaecodeLessThanOrEqualTo(String value) {
            addCriterion("u_activaecode <=", value, "uActivaecode");
            return (Criteria) this;
        }

        public Criteria andUActivaecodeLike(String value) {
            addCriterion("u_activaecode like", value, "uActivaecode");
            return (Criteria) this;
        }

        public Criteria andUActivaecodeNotLike(String value) {
            addCriterion("u_activaecode not like", value, "uActivaecode");
            return (Criteria) this;
        }

        public Criteria andUActivaecodeIn(List<String> values) {
            addCriterion("u_activaecode in", values, "uActivaecode");
            return (Criteria) this;
        }

        public Criteria andUActivaecodeNotIn(List<String> values) {
            addCriterion("u_activaecode not in", values, "uActivaecode");
            return (Criteria) this;
        }

        public Criteria andUActivaecodeBetween(String value1, String value2) {
            addCriterion("u_activaecode between", value1, value2, "uActivaecode");
            return (Criteria) this;
        }

        public Criteria andUActivaecodeNotBetween(String value1, String value2) {
            addCriterion("u_activaecode not between", value1, value2, "uActivaecode");
            return (Criteria) this;
        }

        public Criteria andUStateIsNull() {
            addCriterion("u_state is null");
            return (Criteria) this;
        }

        public Criteria andUStateIsNotNull() {
            addCriterion("u_state is not null");
            return (Criteria) this;
        }

        public Criteria andUStateEqualTo(Integer value) {
            addCriterion("u_state =", value, "uState");
            return (Criteria) this;
        }

        public Criteria andUStateNotEqualTo(Integer value) {
            addCriterion("u_state <>", value, "uState");
            return (Criteria) this;
        }

        public Criteria andUStateGreaterThan(Integer value) {
            addCriterion("u_state >", value, "uState");
            return (Criteria) this;
        }

        public Criteria andUStateGreaterThanOrEqualTo(Integer value) {
            addCriterion("u_state >=", value, "uState");
            return (Criteria) this;
        }

        public Criteria andUStateLessThan(Integer value) {
            addCriterion("u_state <", value, "uState");
            return (Criteria) this;
        }

        public Criteria andUStateLessThanOrEqualTo(Integer value) {
            addCriterion("u_state <=", value, "uState");
            return (Criteria) this;
        }

        public Criteria andUStateIn(List<Integer> values) {
            addCriterion("u_state in", values, "uState");
            return (Criteria) this;
        }

        public Criteria andUStateNotIn(List<Integer> values) {
            addCriterion("u_state not in", values, "uState");
            return (Criteria) this;
        }

        public Criteria andUStateBetween(Integer value1, Integer value2) {
            addCriterion("u_state between", value1, value2, "uState");
            return (Criteria) this;
        }

        public Criteria andUStateNotBetween(Integer value1, Integer value2) {
            addCriterion("u_state not between", value1, value2, "uState");
            return (Criteria) this;
        }

        public Criteria andURegisttimeIsNull() {
            addCriterion("u_registtime is null");
            return (Criteria) this;
        }

        public Criteria andURegisttimeIsNotNull() {
            addCriterion("u_registtime is not null");
            return (Criteria) this;
        }

        public Criteria andURegisttimeEqualTo(Date value) {
            addCriterion("u_registtime =", value, "uRegisttime");
            return (Criteria) this;
        }

        public Criteria andURegisttimeNotEqualTo(Date value) {
            addCriterion("u_registtime <>", value, "uRegisttime");
            return (Criteria) this;
        }

        public Criteria andURegisttimeGreaterThan(Date value) {
            addCriterion("u_registtime >", value, "uRegisttime");
            return (Criteria) this;
        }

        public Criteria andURegisttimeGreaterThanOrEqualTo(Date value) {
            addCriterion("u_registtime >=", value, "uRegisttime");
            return (Criteria) this;
        }

        public Criteria andURegisttimeLessThan(Date value) {
            addCriterion("u_registtime <", value, "uRegisttime");
            return (Criteria) this;
        }

        public Criteria andURegisttimeLessThanOrEqualTo(Date value) {
            addCriterion("u_registtime <=", value, "uRegisttime");
            return (Criteria) this;
        }

        public Criteria andURegisttimeIn(List<Date> values) {
            addCriterion("u_registtime in", values, "uRegisttime");
            return (Criteria) this;
        }

        public Criteria andURegisttimeNotIn(List<Date> values) {
            addCriterion("u_registtime not in", values, "uRegisttime");
            return (Criteria) this;
        }

        public Criteria andURegisttimeBetween(Date value1, Date value2) {
            addCriterion("u_registtime between", value1, value2, "uRegisttime");
            return (Criteria) this;
        }

        public Criteria andURegisttimeNotBetween(Date value1, Date value2) {
            addCriterion("u_registtime not between", value1, value2, "uRegisttime");
            return (Criteria) this;
        }

        public Criteria andULogintimeIsNull() {
            addCriterion("u_logintime is null");
            return (Criteria) this;
        }

        public Criteria andULogintimeIsNotNull() {
            addCriterion("u_logintime is not null");
            return (Criteria) this;
        }

        public Criteria andULogintimeEqualTo(Date value) {
            addCriterion("u_logintime =", value, "uLogintime");
            return (Criteria) this;
        }

        public Criteria andULogintimeNotEqualTo(Date value) {
            addCriterion("u_logintime <>", value, "uLogintime");
            return (Criteria) this;
        }

        public Criteria andULogintimeGreaterThan(Date value) {
            addCriterion("u_logintime >", value, "uLogintime");
            return (Criteria) this;
        }

        public Criteria andULogintimeGreaterThanOrEqualTo(Date value) {
            addCriterion("u_logintime >=", value, "uLogintime");
            return (Criteria) this;
        }

        public Criteria andULogintimeLessThan(Date value) {
            addCriterion("u_logintime <", value, "uLogintime");
            return (Criteria) this;
        }

        public Criteria andULogintimeLessThanOrEqualTo(Date value) {
            addCriterion("u_logintime <=", value, "uLogintime");
            return (Criteria) this;
        }

        public Criteria andULogintimeIn(List<Date> values) {
            addCriterion("u_logintime in", values, "uLogintime");
            return (Criteria) this;
        }

        public Criteria andULogintimeNotIn(List<Date> values) {
            addCriterion("u_logintime not in", values, "uLogintime");
            return (Criteria) this;
        }

        public Criteria andULogintimeBetween(Date value1, Date value2) {
            addCriterion("u_logintime between", value1, value2, "uLogintime");
            return (Criteria) this;
        }

        public Criteria andULogintimeNotBetween(Date value1, Date value2) {
            addCriterion("u_logintime not between", value1, value2, "uLogintime");
            return (Criteria) this;
        }

        public Criteria andUPhoneIsNull() {
            addCriterion("u_phone is null");
            return (Criteria) this;
        }

        public Criteria andUPhoneIsNotNull() {
            addCriterion("u_phone is not null");
            return (Criteria) this;
        }

        public Criteria andUPhoneEqualTo(String value) {
            addCriterion("u_phone =", value, "uPhone");
            return (Criteria) this;
        }

        public Criteria andUPhoneNotEqualTo(String value) {
            addCriterion("u_phone <>", value, "uPhone");
            return (Criteria) this;
        }

        public Criteria andUPhoneGreaterThan(String value) {
            addCriterion("u_phone >", value, "uPhone");
            return (Criteria) this;
        }

        public Criteria andUPhoneGreaterThanOrEqualTo(String value) {
            addCriterion("u_phone >=", value, "uPhone");
            return (Criteria) this;
        }

        public Criteria andUPhoneLessThan(String value) {
            addCriterion("u_phone <", value, "uPhone");
            return (Criteria) this;
        }

        public Criteria andUPhoneLessThanOrEqualTo(String value) {
            addCriterion("u_phone <=", value, "uPhone");
            return (Criteria) this;
        }

        public Criteria andUPhoneLike(String value) {
            addCriterion("u_phone like", value, "uPhone");
            return (Criteria) this;
        }

        public Criteria andUPhoneNotLike(String value) {
            addCriterion("u_phone not like", value, "uPhone");
            return (Criteria) this;
        }

        public Criteria andUPhoneIn(List<String> values) {
            addCriterion("u_phone in", values, "uPhone");
            return (Criteria) this;
        }

        public Criteria andUPhoneNotIn(List<String> values) {
            addCriterion("u_phone not in", values, "uPhone");
            return (Criteria) this;
        }

        public Criteria andUPhoneBetween(String value1, String value2) {
            addCriterion("u_phone between", value1, value2, "uPhone");
            return (Criteria) this;
        }

        public Criteria andUPhoneNotBetween(String value1, String value2) {
            addCriterion("u_phone not between", value1, value2, "uPhone");
            return (Criteria) this;
        }

        public Criteria andUScoreIsNull() {
            addCriterion("u_score is null");
            return (Criteria) this;
        }

        public Criteria andUScoreIsNotNull() {
            addCriterion("u_score is not null");
            return (Criteria) this;
        }

        public Criteria andUScoreEqualTo(Integer value) {
            addCriterion("u_score =", value, "uScore");
            return (Criteria) this;
        }

        public Criteria andUScoreNotEqualTo(Integer value) {
            addCriterion("u_score <>", value, "uScore");
            return (Criteria) this;
        }

        public Criteria andUScoreGreaterThan(Integer value) {
            addCriterion("u_score >", value, "uScore");
            return (Criteria) this;
        }

        public Criteria andUScoreGreaterThanOrEqualTo(Integer value) {
            addCriterion("u_score >=", value, "uScore");
            return (Criteria) this;
        }

        public Criteria andUScoreLessThan(Integer value) {
            addCriterion("u_score <", value, "uScore");
            return (Criteria) this;
        }

        public Criteria andUScoreLessThanOrEqualTo(Integer value) {
            addCriterion("u_score <=", value, "uScore");
            return (Criteria) this;
        }

        public Criteria andUScoreIn(List<Integer> values) {
            addCriterion("u_score in", values, "uScore");
            return (Criteria) this;
        }

        public Criteria andUScoreNotIn(List<Integer> values) {
            addCriterion("u_score not in", values, "uScore");
            return (Criteria) this;
        }

        public Criteria andUScoreBetween(Integer value1, Integer value2) {
            addCriterion("u_score between", value1, value2, "uScore");
            return (Criteria) this;
        }

        public Criteria andUScoreNotBetween(Integer value1, Integer value2) {
            addCriterion("u_score not between", value1, value2, "uScore");
            return (Criteria) this;
        }

        public Criteria andUBalanceIsNull() {
            addCriterion("u_balance is null");
            return (Criteria) this;
        }

        public Criteria andUBalanceIsNotNull() {
            addCriterion("u_balance is not null");
            return (Criteria) this;
        }

        public Criteria andUBalanceEqualTo(Double value) {
            addCriterion("u_balance =", value, "uBalance");
            return (Criteria) this;
        }

        public Criteria andUBalanceNotEqualTo(Double value) {
            addCriterion("u_balance <>", value, "uBalance");
            return (Criteria) this;
        }

        public Criteria andUBalanceGreaterThan(Double value) {
            addCriterion("u_balance >", value, "uBalance");
            return (Criteria) this;
        }

        public Criteria andUBalanceGreaterThanOrEqualTo(Double value) {
            addCriterion("u_balance >=", value, "uBalance");
            return (Criteria) this;
        }

        public Criteria andUBalanceLessThan(Double value) {
            addCriterion("u_balance <", value, "uBalance");
            return (Criteria) this;
        }

        public Criteria andUBalanceLessThanOrEqualTo(Double value) {
            addCriterion("u_balance <=", value, "uBalance");
            return (Criteria) this;
        }

        public Criteria andUBalanceIn(List<Double> values) {
            addCriterion("u_balance in", values, "uBalance");
            return (Criteria) this;
        }

        public Criteria andUBalanceNotIn(List<Double> values) {
            addCriterion("u_balance not in", values, "uBalance");
            return (Criteria) this;
        }

        public Criteria andUBalanceBetween(Double value1, Double value2) {
            addCriterion("u_balance between", value1, value2, "uBalance");
            return (Criteria) this;
        }

        public Criteria andUBalanceNotBetween(Double value1, Double value2) {
            addCriterion("u_balance not between", value1, value2, "uBalance");
            return (Criteria) this;
        }

        public Criteria andUSafequestIsNull() {
            addCriterion("u_safequest is null");
            return (Criteria) this;
        }

        public Criteria andUSafequestIsNotNull() {
            addCriterion("u_safequest is not null");
            return (Criteria) this;
        }

        public Criteria andUSafequestEqualTo(String value) {
            addCriterion("u_safequest =", value, "uSafequest");
            return (Criteria) this;
        }

        public Criteria andUSafequestNotEqualTo(String value) {
            addCriterion("u_safequest <>", value, "uSafequest");
            return (Criteria) this;
        }

        public Criteria andUSafequestGreaterThan(String value) {
            addCriterion("u_safequest >", value, "uSafequest");
            return (Criteria) this;
        }

        public Criteria andUSafequestGreaterThanOrEqualTo(String value) {
            addCriterion("u_safequest >=", value, "uSafequest");
            return (Criteria) this;
        }

        public Criteria andUSafequestLessThan(String value) {
            addCriterion("u_safequest <", value, "uSafequest");
            return (Criteria) this;
        }

        public Criteria andUSafequestLessThanOrEqualTo(String value) {
            addCriterion("u_safequest <=", value, "uSafequest");
            return (Criteria) this;
        }

        public Criteria andUSafequestLike(String value) {
            addCriterion("u_safequest like", value, "uSafequest");
            return (Criteria) this;
        }

        public Criteria andUSafequestNotLike(String value) {
            addCriterion("u_safequest not like", value, "uSafequest");
            return (Criteria) this;
        }

        public Criteria andUSafequestIn(List<String> values) {
            addCriterion("u_safequest in", values, "uSafequest");
            return (Criteria) this;
        }

        public Criteria andUSafequestNotIn(List<String> values) {
            addCriterion("u_safequest not in", values, "uSafequest");
            return (Criteria) this;
        }

        public Criteria andUSafequestBetween(String value1, String value2) {
            addCriterion("u_safequest between", value1, value2, "uSafequest");
            return (Criteria) this;
        }

        public Criteria andUSafequestNotBetween(String value1, String value2) {
            addCriterion("u_safequest not between", value1, value2, "uSafequest");
            return (Criteria) this;
        }

        public Criteria andUSafeanswerIsNull() {
            addCriterion("u_safeanswer is null");
            return (Criteria) this;
        }

        public Criteria andUSafeanswerIsNotNull() {
            addCriterion("u_safeanswer is not null");
            return (Criteria) this;
        }

        public Criteria andUSafeanswerEqualTo(String value) {
            addCriterion("u_safeanswer =", value, "uSafeanswer");
            return (Criteria) this;
        }

        public Criteria andUSafeanswerNotEqualTo(String value) {
            addCriterion("u_safeanswer <>", value, "uSafeanswer");
            return (Criteria) this;
        }

        public Criteria andUSafeanswerGreaterThan(String value) {
            addCriterion("u_safeanswer >", value, "uSafeanswer");
            return (Criteria) this;
        }

        public Criteria andUSafeanswerGreaterThanOrEqualTo(String value) {
            addCriterion("u_safeanswer >=", value, "uSafeanswer");
            return (Criteria) this;
        }

        public Criteria andUSafeanswerLessThan(String value) {
            addCriterion("u_safeanswer <", value, "uSafeanswer");
            return (Criteria) this;
        }

        public Criteria andUSafeanswerLessThanOrEqualTo(String value) {
            addCriterion("u_safeanswer <=", value, "uSafeanswer");
            return (Criteria) this;
        }

        public Criteria andUSafeanswerLike(String value) {
            addCriterion("u_safeanswer like", value, "uSafeanswer");
            return (Criteria) this;
        }

        public Criteria andUSafeanswerNotLike(String value) {
            addCriterion("u_safeanswer not like", value, "uSafeanswer");
            return (Criteria) this;
        }

        public Criteria andUSafeanswerIn(List<String> values) {
            addCriterion("u_safeanswer in", values, "uSafeanswer");
            return (Criteria) this;
        }

        public Criteria andUSafeanswerNotIn(List<String> values) {
            addCriterion("u_safeanswer not in", values, "uSafeanswer");
            return (Criteria) this;
        }

        public Criteria andUSafeanswerBetween(String value1, String value2) {
            addCriterion("u_safeanswer between", value1, value2, "uSafeanswer");
            return (Criteria) this;
        }

        public Criteria andUSafeanswerNotBetween(String value1, String value2) {
            addCriterion("u_safeanswer not between", value1, value2, "uSafeanswer");
            return (Criteria) this;
        }

        public Criteria andUAddressIsNull() {
            addCriterion("u_address is null");
            return (Criteria) this;
        }

        public Criteria andUAddressIsNotNull() {
            addCriterion("u_address is not null");
            return (Criteria) this;
        }

        public Criteria andUAddressEqualTo(String value) {
            addCriterion("u_address =", value, "uAddress");
            return (Criteria) this;
        }

        public Criteria andUAddressNotEqualTo(String value) {
            addCriterion("u_address <>", value, "uAddress");
            return (Criteria) this;
        }

        public Criteria andUAddressGreaterThan(String value) {
            addCriterion("u_address >", value, "uAddress");
            return (Criteria) this;
        }

        public Criteria andUAddressGreaterThanOrEqualTo(String value) {
            addCriterion("u_address >=", value, "uAddress");
            return (Criteria) this;
        }

        public Criteria andUAddressLessThan(String value) {
            addCriterion("u_address <", value, "uAddress");
            return (Criteria) this;
        }

        public Criteria andUAddressLessThanOrEqualTo(String value) {
            addCriterion("u_address <=", value, "uAddress");
            return (Criteria) this;
        }

        public Criteria andUAddressLike(String value) {
            addCriterion("u_address like", value, "uAddress");
            return (Criteria) this;
        }

        public Criteria andUAddressNotLike(String value) {
            addCriterion("u_address not like", value, "uAddress");
            return (Criteria) this;
        }

        public Criteria andUAddressIn(List<String> values) {
            addCriterion("u_address in", values, "uAddress");
            return (Criteria) this;
        }

        public Criteria andUAddressNotIn(List<String> values) {
            addCriterion("u_address not in", values, "uAddress");
            return (Criteria) this;
        }

        public Criteria andUAddressBetween(String value1, String value2) {
            addCriterion("u_address between", value1, value2, "uAddress");
            return (Criteria) this;
        }

        public Criteria andUAddressNotBetween(String value1, String value2) {
            addCriterion("u_address not between", value1, value2, "uAddress");
            return (Criteria) this;
        }

        public Criteria andFirstordertimeIsNull() {
            addCriterion("firstorderTime is null");
            return (Criteria) this;
        }

        public Criteria andFirstordertimeIsNotNull() {
            addCriterion("firstorderTime is not null");
            return (Criteria) this;
        }

        public Criteria andFirstordertimeEqualTo(Date value) {
            addCriterion("firstorderTime =", value, "firstordertime");
            return (Criteria) this;
        }

        public Criteria andFirstordertimeNotEqualTo(Date value) {
            addCriterion("firstorderTime <>", value, "firstordertime");
            return (Criteria) this;
        }

        public Criteria andFirstordertimeGreaterThan(Date value) {
            addCriterion("firstorderTime >", value, "firstordertime");
            return (Criteria) this;
        }

        public Criteria andFirstordertimeGreaterThanOrEqualTo(Date value) {
            addCriterion("firstorderTime >=", value, "firstordertime");
            return (Criteria) this;
        }

        public Criteria andFirstordertimeLessThan(Date value) {
            addCriterion("firstorderTime <", value, "firstordertime");
            return (Criteria) this;
        }

        public Criteria andFirstordertimeLessThanOrEqualTo(Date value) {
            addCriterion("firstorderTime <=", value, "firstordertime");
            return (Criteria) this;
        }

        public Criteria andFirstordertimeIn(List<Date> values) {
            addCriterion("firstorderTime in", values, "firstordertime");
            return (Criteria) this;
        }

        public Criteria andFirstordertimeNotIn(List<Date> values) {
            addCriterion("firstorderTime not in", values, "firstordertime");
            return (Criteria) this;
        }

        public Criteria andFirstordertimeBetween(Date value1, Date value2) {
            addCriterion("firstorderTime between", value1, value2, "firstordertime");
            return (Criteria) this;
        }

        public Criteria andFirstordertimeNotBetween(Date value1, Date value2) {
            addCriterion("firstorderTime not between", value1, value2, "firstordertime");
            return (Criteria) this;
        }

        public Criteria andBuycountIsNull() {
            addCriterion("buyCount is null");
            return (Criteria) this;
        }

        public Criteria andBuycountIsNotNull() {
            addCriterion("buyCount is not null");
            return (Criteria) this;
        }

        public Criteria andBuycountEqualTo(Integer value) {
            addCriterion("buyCount =", value, "buycount");
            return (Criteria) this;
        }

        public Criteria andBuycountNotEqualTo(Integer value) {
            addCriterion("buyCount <>", value, "buycount");
            return (Criteria) this;
        }

        public Criteria andBuycountGreaterThan(Integer value) {
            addCriterion("buyCount >", value, "buycount");
            return (Criteria) this;
        }

        public Criteria andBuycountGreaterThanOrEqualTo(Integer value) {
            addCriterion("buyCount >=", value, "buycount");
            return (Criteria) this;
        }

        public Criteria andBuycountLessThan(Integer value) {
            addCriterion("buyCount <", value, "buycount");
            return (Criteria) this;
        }

        public Criteria andBuycountLessThanOrEqualTo(Integer value) {
            addCriterion("buyCount <=", value, "buycount");
            return (Criteria) this;
        }

        public Criteria andBuycountIn(List<Integer> values) {
            addCriterion("buyCount in", values, "buycount");
            return (Criteria) this;
        }

        public Criteria andBuycountNotIn(List<Integer> values) {
            addCriterion("buyCount not in", values, "buycount");
            return (Criteria) this;
        }

        public Criteria andBuycountBetween(Integer value1, Integer value2) {
            addCriterion("buyCount between", value1, value2, "buycount");
            return (Criteria) this;
        }

        public Criteria andBuycountNotBetween(Integer value1, Integer value2) {
            addCriterion("buyCount not between", value1, value2, "buycount");
            return (Criteria) this;
        }

        public Criteria andImageIsNull() {
            addCriterion("image is null");
            return (Criteria) this;
        }

        public Criteria andImageIsNotNull() {
            addCriterion("image is not null");
            return (Criteria) this;
        }

        public Criteria andImageEqualTo(String value) {
            addCriterion("image =", value, "image");
            return (Criteria) this;
        }

        public Criteria andImageNotEqualTo(String value) {
            addCriterion("image <>", value, "image");
            return (Criteria) this;
        }

        public Criteria andImageGreaterThan(String value) {
            addCriterion("image >", value, "image");
            return (Criteria) this;
        }

        public Criteria andImageGreaterThanOrEqualTo(String value) {
            addCriterion("image >=", value, "image");
            return (Criteria) this;
        }

        public Criteria andImageLessThan(String value) {
            addCriterion("image <", value, "image");
            return (Criteria) this;
        }

        public Criteria andImageLessThanOrEqualTo(String value) {
            addCriterion("image <=", value, "image");
            return (Criteria) this;
        }

        public Criteria andImageLike(String value) {
            addCriterion("image like", value, "image");
            return (Criteria) this;
        }

        public Criteria andImageNotLike(String value) {
            addCriterion("image not like", value, "image");
            return (Criteria) this;
        }

        public Criteria andImageIn(List<String> values) {
            addCriterion("image in", values, "image");
            return (Criteria) this;
        }

        public Criteria andImageNotIn(List<String> values) {
            addCriterion("image not in", values, "image");
            return (Criteria) this;
        }

        public Criteria andImageBetween(String value1, String value2) {
            addCriterion("image between", value1, value2, "image");
            return (Criteria) this;
        }

        public Criteria andImageNotBetween(String value1, String value2) {
            addCriterion("image not between", value1, value2, "image");
            return (Criteria) this;
        }

        public Criteria andIntroduceIsNull() {
            addCriterion("introduce is null");
            return (Criteria) this;
        }

        public Criteria andIntroduceIsNotNull() {
            addCriterion("introduce is not null");
            return (Criteria) this;
        }

        public Criteria andIntroduceEqualTo(String value) {
            addCriterion("introduce =", value, "introduce");
            return (Criteria) this;
        }

        public Criteria andIntroduceNotEqualTo(String value) {
            addCriterion("introduce <>", value, "introduce");
            return (Criteria) this;
        }

        public Criteria andIntroduceGreaterThan(String value) {
            addCriterion("introduce >", value, "introduce");
            return (Criteria) this;
        }

        public Criteria andIntroduceGreaterThanOrEqualTo(String value) {
            addCriterion("introduce >=", value, "introduce");
            return (Criteria) this;
        }

        public Criteria andIntroduceLessThan(String value) {
            addCriterion("introduce <", value, "introduce");
            return (Criteria) this;
        }

        public Criteria andIntroduceLessThanOrEqualTo(String value) {
            addCriterion("introduce <=", value, "introduce");
            return (Criteria) this;
        }

        public Criteria andIntroduceLike(String value) {
            addCriterion("introduce like", value, "introduce");
            return (Criteria) this;
        }

        public Criteria andIntroduceNotLike(String value) {
            addCriterion("introduce not like", value, "introduce");
            return (Criteria) this;
        }

        public Criteria andIntroduceIn(List<String> values) {
            addCriterion("introduce in", values, "introduce");
            return (Criteria) this;
        }

        public Criteria andIntroduceNotIn(List<String> values) {
            addCriterion("introduce not in", values, "introduce");
            return (Criteria) this;
        }

        public Criteria andIntroduceBetween(String value1, String value2) {
            addCriterion("introduce between", value1, value2, "introduce");
            return (Criteria) this;
        }

        public Criteria andIntroduceNotBetween(String value1, String value2) {
            addCriterion("introduce not between", value1, value2, "introduce");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}