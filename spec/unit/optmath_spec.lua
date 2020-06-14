describe("Math module", function()
    local Math

    setup(function()
        require("commonrequire")
        Math = require("optmath")
    end)

    describe("tmin", function()
            it("should return nil on empty table", function()
                assert.is_nil(Math.tmin({}))
            end)
            it("should get minimum element in table", function()
                assert.are.same(5, Math.tmin({9,7,10,11,5,7}))
            end)
            it("should get minimum element in table using custom function", function()
                assert.are.same(5,
                                Math.tmin({"9","7","10","11","5","7"}, function(a,b)
                                    return tonumber(a) > tonumber(b)
                                end))
            end)
    end)
    describe("tmax", function()
            it("should return nil on empty table", function()
                assert.is_nil(Math.tmin({}))
            end)
            it("should get maximum element in table", function()
                assert.are.same(4, Math.tmax({9,7,10,11,5,7}))
            end)
            it("should get maximum element in table using custom function", function()
                assert.are.same(4,
                                Math.tmax({"9","7","10","11","5","7"}, function(a,b)
                                    return tonumber(a) < tonumber(b)
                                end))
            end)
    end)
    it("should round away from zero", function()
        assert.are.same(2, Math.roundAwayFromZero(1.5))
        assert.are.same(2, Math.roundAwayFromZero(1.4))
        assert.are.same(-2, Math.roundAwayFromZero(-1.4))
        assert.are.same(1, Math.roundAwayFromZero(0.2))
        assert.are.same(-1, Math.roundAwayFromZero(-0.2))
    end)
    it("should round", function()
        assert.are.same(2, Math.round(1.5))
        assert.are.same(1, Math.round(1.4))
        assert.are.same(-1, Math.round(-1.4))
        assert.are.same(0, Math.round(0.2))
        assert.are.same(0, Math.round(-0.2))
    end)
    it("should determine odd or even", function()
        assert.are.same("odd", Math.oddEven(1))
        assert.are.same("even", Math.oddEven(2))
        assert.are.same("odd", Math.oddEven(3))
        assert.are.same("even", Math.oddEven(4))
        assert.are.same("even", Math.oddEven(-4))
        assert.are.same("odd", Math.oddEven(-3))
        assert.are.same("even", Math.oddEven(0))
    end)

end)
