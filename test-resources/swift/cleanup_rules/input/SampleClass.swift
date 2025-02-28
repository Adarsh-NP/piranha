// Copyright (c) 2023 Uber Technologies, Inc.
// 
// <p>Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file
// except in compliance with the License. You may obtain a copy of the License at
// <p>http://www.apache.org/licenses/LICENSE-2.0
// 
// <p>Unless required by applicable law or agreed to in writing, software distributed under the
// License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
// express or implied. See the License for the specific language governing permissions and
// limitations under the License.

class SampleClass {
    func sampleFunction() {
        isEnabled = TestEnum.stale_flag_one.isEnabled && v1
        isEnabled = f2() && TestEnum.stale_flag_one.isEnabled 
        isEnabled = v2 && TestEnum.stale_flag_one.isEnabled 
        isEnabled = v2 && (TestEnum.stale_flag_one.isEnabled && true)
        isEnabled = (TestEnum.stale_flag_one.isEnabled && true) && v2
    }

    func checkOrTrue() {
        //simple
        isEnabled = TestEnum.stale_flag_one.isEnabled || v1
        isEnabled = v2 || TestEnum.stale_flag_one.isEnabled 
        isEnabled = f2 || TestEnum.stale_flag_one.isEnabled 

        //nested
        isEnabled = v1 || (TestEnum.stale_flag_one.isEnabled || v2)
        isEnabled = (TestEnum.stale_flag_one.isEnabled || v2) || v1

        //nested and-or
        isEnabled = v1 && (TestEnum.stale_flag_one.isEnabled || v2)
        isEnabled = (TestEnum.stale_flag_one.isEnabled || v2) && v1
    }
    
    func checkOrFalse() {
        isEnabled = placeholder_false || f1()
        isEnabled = placeholder_false || v1
        isEnabled = f2() || placeholder_false 
        isEnabled = v2 || placeholder_false 
    }

    func checkAndFalse() {
        isEnabled = placeholder_false && f1()
        isEnabled = placeholder_false && v1
        isEnabled = f2() && placeholder_false 
        isEnabled = v2 && placeholder_false 
    }
    
    func checkNotCondition() {
        isEnabled = v2 && (TestEnum.stale_flag_one.isEnabled && !false)
        isEnabled = (TestEnum.stale_flag_one.isEnabled && !false) && v2
        isEnabled = v2 || (placeholder_false || !true)
    } 

    func checkIfTrueCleanup() {
        f1()
        if TestEnum.stale_flag_one.isEnabled {
            f2()
        }

        if isEnabled {
            f2()
        } else if TestEnum.stale_flag_one.isEnabled {
            f3()
        } 

        if isEnabled {
            f2()
        } else if TestEnum.stale_flag_one.isEnabled {
            f3()
        } else {
            f4()
        } 

        if isEnabled {
            f2()
        } else if isDisabled {
            f3()
        } else if TestEnum.stale_flag_one.isEnabled {
            f4()
        } else {
            f5()
        }

        if isEnabled {
            f2()
        }  else if TestEnum.stale_flag_one.isEnabled {
            f4()
        } else if isDisabled {
            f3()
        } else {
            f5()
        }
    }
    
    func checkIfFalse() {
        //test comments to be cleaned
        if !TestEnum.stale_flag_one.isEnabled && abc {
            f1()
        }

        if !TestEnum.stale_flag_one.isEnabled && abc {
            f1()
        } else {
            f2()
        }

        if !TestEnum.stale_flag_one.isEnabled && abc {
            f1()
            //test comments to be cleaned
        } else if v1 {
            f2()
        } else {
            f3()
        }

        if v1 {
            f1()
        } else if !TestEnum.stale_flag_one.isEnabled && abc {
            f2()
        } else {
            f3()
        }

        if v1 {
            f1()
        } else if !TestEnum.stale_flag_one.isEnabled && abc {
            f2()
        } else if v2 {
            f3()
        } else {
            f4()
        }

        if v1 {
            f1()
        } else if !TestEnum.stale_flag_one.isEnabled && abc {
            f2()
        }
    }

    func checkIfLetFalse() {
        if let v1 = v1, !TestEnum.stale_flag_one.isEnabled && abc {
            f1()
        }

        if let v1 = v1, !TestEnum.stale_flag_one.isEnabled && abc {
            f1()
        } else {
            f2()
        }

        if let v1 = v1, !TestEnum.stale_flag_one.isEnabled && abc {
            f1()
        } else if v1 {
            f2()
        } else {
            f3()
        }

        if v1 {
            f1()
        } else if let v1 = v1, !TestEnum.stale_flag_one.isEnabled && abc {
            f2()
        } else {
            f3()
        }

        if v1 {
            f1()
        } else if let v1 = v1, !TestEnum.stale_flag_one.isEnabled && abc {
            f2()
        } else if v2 {
            f3()
        } else {
            f4()
        }

        if v1 {
            f1()
        } else if let v1 = v1, !TestEnum.stale_flag_one.isEnabled && abc {
            f2()
        }
    }
    
    func checkGaurdTrue() {
        guard TestEnum.stale_flag_one.isEnabled || f1() else {
            return
        }
        f1()
    }
    
    func checkGaurdTrueWithAnd() {
        guard TestEnum.stale_flag_one.isEnabled && true else {
            return
        }
        f1()
    }
    func checkGuardFalse() {
        guard placeholder_false || false else {
            return
        }
    }

    func checkGuardFalseWithAnd() {
        guard placeholder_false && true else {
            return
        }
    }
}
