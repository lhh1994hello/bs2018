package com.huat.bs.bean;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class AdminUserExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public AdminUserExample() {
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

        public Criteria andAidIsNull() {
            addCriterion("aid is null");
            return (Criteria) this;
        }

        public Criteria andAidIsNotNull() {
            addCriterion("aid is not null");
            return (Criteria) this;
        }

        public Criteria andAidEqualTo(String value) {
            addCriterion("aid =", value, "aid");
            return (Criteria) this;
        }

        public Criteria andAidNotEqualTo(String value) {
            addCriterion("aid <>", value, "aid");
            return (Criteria) this;
        }

        public Criteria andAidGreaterThan(String value) {
            addCriterion("aid >", value, "aid");
            return (Criteria) this;
        }

        public Criteria andAidGreaterThanOrEqualTo(String value) {
            addCriterion("aid >=", value, "aid");
            return (Criteria) this;
        }

        public Criteria andAidLessThan(String value) {
            addCriterion("aid <", value, "aid");
            return (Criteria) this;
        }

        public Criteria andAidLessThanOrEqualTo(String value) {
            addCriterion("aid <=", value, "aid");
            return (Criteria) this;
        }

        public Criteria andAidLike(String value) {
            addCriterion("aid like", value, "aid");
            return (Criteria) this;
        }

        public Criteria andAidNotLike(String value) {
            addCriterion("aid not like", value, "aid");
            return (Criteria) this;
        }

        public Criteria andAidIn(List<String> values) {
            addCriterion("aid in", values, "aid");
            return (Criteria) this;
        }

        public Criteria andAidNotIn(List<String> values) {
            addCriterion("aid not in", values, "aid");
            return (Criteria) this;
        }

        public Criteria andAidBetween(String value1, String value2) {
            addCriterion("aid between", value1, value2, "aid");
            return (Criteria) this;
        }

        public Criteria andAidNotBetween(String value1, String value2) {
            addCriterion("aid not between", value1, value2, "aid");
            return (Criteria) this;
        }

        public Criteria andLoginidIsNull() {
            addCriterion("loginId is null");
            return (Criteria) this;
        }

        public Criteria andLoginidIsNotNull() {
            addCriterion("loginId is not null");
            return (Criteria) this;
        }

        public Criteria andLoginidEqualTo(String value) {
            addCriterion("loginId =", value, "loginid");
            return (Criteria) this;
        }

        public Criteria andLoginidNotEqualTo(String value) {
            addCriterion("loginId <>", value, "loginid");
            return (Criteria) this;
        }

        public Criteria andLoginidGreaterThan(String value) {
            addCriterion("loginId >", value, "loginid");
            return (Criteria) this;
        }

        public Criteria andLoginidGreaterThanOrEqualTo(String value) {
            addCriterion("loginId >=", value, "loginid");
            return (Criteria) this;
        }

        public Criteria andLoginidLessThan(String value) {
            addCriterion("loginId <", value, "loginid");
            return (Criteria) this;
        }

        public Criteria andLoginidLessThanOrEqualTo(String value) {
            addCriterion("loginId <=", value, "loginid");
            return (Criteria) this;
        }

        public Criteria andLoginidLike(String value) {
            addCriterion("loginId like", value, "loginid");
            return (Criteria) this;
        }

        public Criteria andLoginidNotLike(String value) {
            addCriterion("loginId not like", value, "loginid");
            return (Criteria) this;
        }

        public Criteria andLoginidIn(List<String> values) {
            addCriterion("loginId in", values, "loginid");
            return (Criteria) this;
        }

        public Criteria andLoginidNotIn(List<String> values) {
            addCriterion("loginId not in", values, "loginid");
            return (Criteria) this;
        }

        public Criteria andLoginidBetween(String value1, String value2) {
            addCriterion("loginId between", value1, value2, "loginid");
            return (Criteria) this;
        }

        public Criteria andLoginidNotBetween(String value1, String value2) {
            addCriterion("loginId not between", value1, value2, "loginid");
            return (Criteria) this;
        }

        public Criteria andPasswordIsNull() {
            addCriterion("passWord is null");
            return (Criteria) this;
        }

        public Criteria andPasswordIsNotNull() {
            addCriterion("passWord is not null");
            return (Criteria) this;
        }

        public Criteria andPasswordEqualTo(String value) {
            addCriterion("passWord =", value, "password");
            return (Criteria) this;
        }

        public Criteria andPasswordNotEqualTo(String value) {
            addCriterion("passWord <>", value, "password");
            return (Criteria) this;
        }

        public Criteria andPasswordGreaterThan(String value) {
            addCriterion("passWord >", value, "password");
            return (Criteria) this;
        }

        public Criteria andPasswordGreaterThanOrEqualTo(String value) {
            addCriterion("passWord >=", value, "password");
            return (Criteria) this;
        }

        public Criteria andPasswordLessThan(String value) {
            addCriterion("passWord <", value, "password");
            return (Criteria) this;
        }

        public Criteria andPasswordLessThanOrEqualTo(String value) {
            addCriterion("passWord <=", value, "password");
            return (Criteria) this;
        }

        public Criteria andPasswordLike(String value) {
            addCriterion("passWord like", value, "password");
            return (Criteria) this;
        }

        public Criteria andPasswordNotLike(String value) {
            addCriterion("passWord not like", value, "password");
            return (Criteria) this;
        }

        public Criteria andPasswordIn(List<String> values) {
            addCriterion("passWord in", values, "password");
            return (Criteria) this;
        }

        public Criteria andPasswordNotIn(List<String> values) {
            addCriterion("passWord not in", values, "password");
            return (Criteria) this;
        }

        public Criteria andPasswordBetween(String value1, String value2) {
            addCriterion("passWord between", value1, value2, "password");
            return (Criteria) this;
        }

        public Criteria andPasswordNotBetween(String value1, String value2) {
            addCriterion("passWord not between", value1, value2, "password");
            return (Criteria) this;
        }

        public Criteria andEmailIsNull() {
            addCriterion("email is null");
            return (Criteria) this;
        }

        public Criteria andEmailIsNotNull() {
            addCriterion("email is not null");
            return (Criteria) this;
        }

        public Criteria andEmailEqualTo(String value) {
            addCriterion("email =", value, "email");
            return (Criteria) this;
        }

        public Criteria andEmailNotEqualTo(String value) {
            addCriterion("email <>", value, "email");
            return (Criteria) this;
        }

        public Criteria andEmailGreaterThan(String value) {
            addCriterion("email >", value, "email");
            return (Criteria) this;
        }

        public Criteria andEmailGreaterThanOrEqualTo(String value) {
            addCriterion("email >=", value, "email");
            return (Criteria) this;
        }

        public Criteria andEmailLessThan(String value) {
            addCriterion("email <", value, "email");
            return (Criteria) this;
        }

        public Criteria andEmailLessThanOrEqualTo(String value) {
            addCriterion("email <=", value, "email");
            return (Criteria) this;
        }

        public Criteria andEmailLike(String value) {
            addCriterion("email like", value, "email");
            return (Criteria) this;
        }

        public Criteria andEmailNotLike(String value) {
            addCriterion("email not like", value, "email");
            return (Criteria) this;
        }

        public Criteria andEmailIn(List<String> values) {
            addCriterion("email in", values, "email");
            return (Criteria) this;
        }

        public Criteria andEmailNotIn(List<String> values) {
            addCriterion("email not in", values, "email");
            return (Criteria) this;
        }

        public Criteria andEmailBetween(String value1, String value2) {
            addCriterion("email between", value1, value2, "email");
            return (Criteria) this;
        }

        public Criteria andEmailNotBetween(String value1, String value2) {
            addCriterion("email not between", value1, value2, "email");
            return (Criteria) this;
        }

        public Criteria andUsernameIsNull() {
            addCriterion("username is null");
            return (Criteria) this;
        }

        public Criteria andUsernameIsNotNull() {
            addCriterion("username is not null");
            return (Criteria) this;
        }

        public Criteria andUsernameEqualTo(String value) {
            addCriterion("username =", value, "username");
            return (Criteria) this;
        }

        public Criteria andUsernameNotEqualTo(String value) {
            addCriterion("username <>", value, "username");
            return (Criteria) this;
        }

        public Criteria andUsernameGreaterThan(String value) {
            addCriterion("username >", value, "username");
            return (Criteria) this;
        }

        public Criteria andUsernameGreaterThanOrEqualTo(String value) {
            addCriterion("username >=", value, "username");
            return (Criteria) this;
        }

        public Criteria andUsernameLessThan(String value) {
            addCriterion("username <", value, "username");
            return (Criteria) this;
        }

        public Criteria andUsernameLessThanOrEqualTo(String value) {
            addCriterion("username <=", value, "username");
            return (Criteria) this;
        }

        public Criteria andUsernameLike(String value) {
            addCriterion("username like", value, "username");
            return (Criteria) this;
        }

        public Criteria andUsernameNotLike(String value) {
            addCriterion("username not like", value, "username");
            return (Criteria) this;
        }

        public Criteria andUsernameIn(List<String> values) {
            addCriterion("username in", values, "username");
            return (Criteria) this;
        }

        public Criteria andUsernameNotIn(List<String> values) {
            addCriterion("username not in", values, "username");
            return (Criteria) this;
        }

        public Criteria andUsernameBetween(String value1, String value2) {
            addCriterion("username between", value1, value2, "username");
            return (Criteria) this;
        }

        public Criteria andUsernameNotBetween(String value1, String value2) {
            addCriterion("username not between", value1, value2, "username");
            return (Criteria) this;
        }

        public Criteria andStatesIsNull() {
            addCriterion("states is null");
            return (Criteria) this;
        }

        public Criteria andStatesIsNotNull() {
            addCriterion("states is not null");
            return (Criteria) this;
        }

        public Criteria andStatesEqualTo(Integer value) {
            addCriterion("states =", value, "states");
            return (Criteria) this;
        }

        public Criteria andStatesNotEqualTo(Integer value) {
            addCriterion("states <>", value, "states");
            return (Criteria) this;
        }

        public Criteria andStatesGreaterThan(Integer value) {
            addCriterion("states >", value, "states");
            return (Criteria) this;
        }

        public Criteria andStatesGreaterThanOrEqualTo(Integer value) {
            addCriterion("states >=", value, "states");
            return (Criteria) this;
        }

        public Criteria andStatesLessThan(Integer value) {
            addCriterion("states <", value, "states");
            return (Criteria) this;
        }

        public Criteria andStatesLessThanOrEqualTo(Integer value) {
            addCriterion("states <=", value, "states");
            return (Criteria) this;
        }

        public Criteria andStatesIn(List<Integer> values) {
            addCriterion("states in", values, "states");
            return (Criteria) this;
        }

        public Criteria andStatesNotIn(List<Integer> values) {
            addCriterion("states not in", values, "states");
            return (Criteria) this;
        }

        public Criteria andStatesBetween(Integer value1, Integer value2) {
            addCriterion("states between", value1, value2, "states");
            return (Criteria) this;
        }

        public Criteria andStatesNotBetween(Integer value1, Integer value2) {
            addCriterion("states not between", value1, value2, "states");
            return (Criteria) this;
        }

        public Criteria andCeatetimeIsNull() {
            addCriterion("ceateTime is null");
            return (Criteria) this;
        }

        public Criteria andCeatetimeIsNotNull() {
            addCriterion("ceateTime is not null");
            return (Criteria) this;
        }

        public Criteria andCeatetimeEqualTo(Date value) {
            addCriterion("ceateTime =", value, "ceatetime");
            return (Criteria) this;
        }

        public Criteria andCeatetimeNotEqualTo(Date value) {
            addCriterion("ceateTime <>", value, "ceatetime");
            return (Criteria) this;
        }

        public Criteria andCeatetimeGreaterThan(Date value) {
            addCriterion("ceateTime >", value, "ceatetime");
            return (Criteria) this;
        }

        public Criteria andCeatetimeGreaterThanOrEqualTo(Date value) {
            addCriterion("ceateTime >=", value, "ceatetime");
            return (Criteria) this;
        }

        public Criteria andCeatetimeLessThan(Date value) {
            addCriterion("ceateTime <", value, "ceatetime");
            return (Criteria) this;
        }

        public Criteria andCeatetimeLessThanOrEqualTo(Date value) {
            addCriterion("ceateTime <=", value, "ceatetime");
            return (Criteria) this;
        }

        public Criteria andCeatetimeIn(List<Date> values) {
            addCriterion("ceateTime in", values, "ceatetime");
            return (Criteria) this;
        }

        public Criteria andCeatetimeNotIn(List<Date> values) {
            addCriterion("ceateTime not in", values, "ceatetime");
            return (Criteria) this;
        }

        public Criteria andCeatetimeBetween(Date value1, Date value2) {
            addCriterion("ceateTime between", value1, value2, "ceatetime");
            return (Criteria) this;
        }

        public Criteria andCeatetimeNotBetween(Date value1, Date value2) {
            addCriterion("ceateTime not between", value1, value2, "ceatetime");
            return (Criteria) this;
        }

        public Criteria andLastlogintimeIsNull() {
            addCriterion("lastLogintime is null");
            return (Criteria) this;
        }

        public Criteria andLastlogintimeIsNotNull() {
            addCriterion("lastLogintime is not null");
            return (Criteria) this;
        }

        public Criteria andLastlogintimeEqualTo(Date value) {
            addCriterion("lastLogintime =", value, "lastlogintime");
            return (Criteria) this;
        }

        public Criteria andLastlogintimeNotEqualTo(Date value) {
            addCriterion("lastLogintime <>", value, "lastlogintime");
            return (Criteria) this;
        }

        public Criteria andLastlogintimeGreaterThan(Date value) {
            addCriterion("lastLogintime >", value, "lastlogintime");
            return (Criteria) this;
        }

        public Criteria andLastlogintimeGreaterThanOrEqualTo(Date value) {
            addCriterion("lastLogintime >=", value, "lastlogintime");
            return (Criteria) this;
        }

        public Criteria andLastlogintimeLessThan(Date value) {
            addCriterion("lastLogintime <", value, "lastlogintime");
            return (Criteria) this;
        }

        public Criteria andLastlogintimeLessThanOrEqualTo(Date value) {
            addCriterion("lastLogintime <=", value, "lastlogintime");
            return (Criteria) this;
        }

        public Criteria andLastlogintimeIn(List<Date> values) {
            addCriterion("lastLogintime in", values, "lastlogintime");
            return (Criteria) this;
        }

        public Criteria andLastlogintimeNotIn(List<Date> values) {
            addCriterion("lastLogintime not in", values, "lastlogintime");
            return (Criteria) this;
        }

        public Criteria andLastlogintimeBetween(Date value1, Date value2) {
            addCriterion("lastLogintime between", value1, value2, "lastlogintime");
            return (Criteria) this;
        }

        public Criteria andLastlogintimeNotBetween(Date value1, Date value2) {
            addCriterion("lastLogintime not between", value1, value2, "lastlogintime");
            return (Criteria) this;
        }

        public Criteria andMobilesIsNull() {
            addCriterion("mobiles is null");
            return (Criteria) this;
        }

        public Criteria andMobilesIsNotNull() {
            addCriterion("mobiles is not null");
            return (Criteria) this;
        }

        public Criteria andMobilesEqualTo(String value) {
            addCriterion("mobiles =", value, "mobiles");
            return (Criteria) this;
        }

        public Criteria andMobilesNotEqualTo(String value) {
            addCriterion("mobiles <>", value, "mobiles");
            return (Criteria) this;
        }

        public Criteria andMobilesGreaterThan(String value) {
            addCriterion("mobiles >", value, "mobiles");
            return (Criteria) this;
        }

        public Criteria andMobilesGreaterThanOrEqualTo(String value) {
            addCriterion("mobiles >=", value, "mobiles");
            return (Criteria) this;
        }

        public Criteria andMobilesLessThan(String value) {
            addCriterion("mobiles <", value, "mobiles");
            return (Criteria) this;
        }

        public Criteria andMobilesLessThanOrEqualTo(String value) {
            addCriterion("mobiles <=", value, "mobiles");
            return (Criteria) this;
        }

        public Criteria andMobilesLike(String value) {
            addCriterion("mobiles like", value, "mobiles");
            return (Criteria) this;
        }

        public Criteria andMobilesNotLike(String value) {
            addCriterion("mobiles not like", value, "mobiles");
            return (Criteria) this;
        }

        public Criteria andMobilesIn(List<String> values) {
            addCriterion("mobiles in", values, "mobiles");
            return (Criteria) this;
        }

        public Criteria andMobilesNotIn(List<String> values) {
            addCriterion("mobiles not in", values, "mobiles");
            return (Criteria) this;
        }

        public Criteria andMobilesBetween(String value1, String value2) {
            addCriterion("mobiles between", value1, value2, "mobiles");
            return (Criteria) this;
        }

        public Criteria andMobilesNotBetween(String value1, String value2) {
            addCriterion("mobiles not between", value1, value2, "mobiles");
            return (Criteria) this;
        }

        public Criteria andAuthorityIsNull() {
            addCriterion("authority is null");
            return (Criteria) this;
        }

        public Criteria andAuthorityIsNotNull() {
            addCriterion("authority is not null");
            return (Criteria) this;
        }

        public Criteria andAuthorityEqualTo(String value) {
            addCriterion("authority =", value, "authority");
            return (Criteria) this;
        }

        public Criteria andAuthorityNotEqualTo(String value) {
            addCriterion("authority <>", value, "authority");
            return (Criteria) this;
        }

        public Criteria andAuthorityGreaterThan(String value) {
            addCriterion("authority >", value, "authority");
            return (Criteria) this;
        }

        public Criteria andAuthorityGreaterThanOrEqualTo(String value) {
            addCriterion("authority >=", value, "authority");
            return (Criteria) this;
        }

        public Criteria andAuthorityLessThan(String value) {
            addCriterion("authority <", value, "authority");
            return (Criteria) this;
        }

        public Criteria andAuthorityLessThanOrEqualTo(String value) {
            addCriterion("authority <=", value, "authority");
            return (Criteria) this;
        }

        public Criteria andAuthorityLike(String value) {
            addCriterion("authority like", value, "authority");
            return (Criteria) this;
        }

        public Criteria andAuthorityNotLike(String value) {
            addCriterion("authority not like", value, "authority");
            return (Criteria) this;
        }

        public Criteria andAuthorityIn(List<String> values) {
            addCriterion("authority in", values, "authority");
            return (Criteria) this;
        }

        public Criteria andAuthorityNotIn(List<String> values) {
            addCriterion("authority not in", values, "authority");
            return (Criteria) this;
        }

        public Criteria andAuthorityBetween(String value1, String value2) {
            addCriterion("authority between", value1, value2, "authority");
            return (Criteria) this;
        }

        public Criteria andAuthorityNotBetween(String value1, String value2) {
            addCriterion("authority not between", value1, value2, "authority");
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