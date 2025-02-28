/**
 * Copyright (c) 2023 Uber Technologies, Inc.
 *
 * <p>Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file
 * except in compliance with the License. You may obtain a copy of the License at
 *
 * <p>http://www.apache.org/licenses/LICENSE-2.0
 *
 * <p>Unless required by applicable law or agreed to in writing, software distributed under the
 * License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 * express or implied. See the License for the specific language governing permissions and
 * limitations under the License.
 */
package com.uber.piranha;

import dagger.Provides;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;
import javax.inject.Inject;

class XPFlagCleanerPositiveCases {

  enum TestExperimentName {
    SOME_FLAG,
    // Some stale enum
  }

  enum AnotherTestExperimentName {
    // Some stale enum
    SOME_OTHER_FLAG
  }

  public enum Something implements ExperimentName {
    /** Show menu */
    SHOW_MENU,

    /** Foobar */

    /** barfoo. */
    BAR_FOO,
  }

  enum TestEmptyEnum {}

  @Retention(RetentionPolicy.RUNTIME)
  public @interface Autorollout {
    boolean staged() default false;
  }

  @Retention(RetentionPolicy.RUNTIME)
  @Target({ElementType.METHOD})
  @interface ToggleTesting {
    TestExperimentName[] treated();
  }

  private XPTest experimentation;

  private boolean tBool = false;

  public void conditional_contains_stale_flag() {

    System.out.println("Hello World");
  }

  public void conditional_with_else_contains_stale_flag() {

    System.out.println("Hello World");
  }

  public void complex_conditional_contains_stale_flag(boolean tBool) {

    System.out.println("Hello World");
  }

  public void other_api_stale_flag() {

    System.out.println("Hello World");
  }

  public void assignments_containing_stale_flag() {

    tBool = true;

    tBool = true;

    tBool = true;

    tBool = true;

    tBool = (tBool || true);
  }

  public boolean return_contains_stale_flag() {

    return true;
  }

  public void condexp_contains_stale_flag() {

    tBool = true;
  }

  public void misc_xp_apis_containing_stale_flag() {

    if ((tBool || true)) {}
  }

  public int return_within_if_basic() {

    return 20;
  }

  public int return_within_if_additional(int x) {
    if (x == 0) {

      System.out.println();
      return 0;
    }

    if (x == 1) {

      return 1;
    }

    if (x == 2) {
      int y = 3;
      y++;
      return y;
    }

    if (x == 3) {
      int z = 4;

      z++;
      return z;
    }

    return 100;
  }

  @ToggleTesting(treated = TestExperimentName.STALE_FLAG)
  public void annotation_test() {}

  @Inject XPTest injectedExperimentsShouldBeDeleted;

  private int testRemovingInjectField() {

    return 1;
  }

  @Inject XPTest injectedExperimentsMultipleUses;

  private void randomSet(XPTest x) {
    injectedExperimentsMultipleUses = x;
  }

  private int testNotRemovingInjectField() {

    return 1;
  }

  @Provides
  public int unusedParamTestWithDeletion(XPTest x) {

    return 1;
  }

  @Provides
  public int unusedParamTestWithoutDeletion(XPTest x) {

    if (x != null) {
      // just another use to prevent deletion of this parameter.
    }

    return 1;
  }

  private void testMultipleCalls(int x) {
    if (x > 0) {

      // comment0
      return;
    }

    // do something here
    return;
  }

  public int or_compounded_with_not(int x, boolean extra_toggle) {

    return 0;
  }

  public int remove_else_if(boolean extra_toggle) {

    if (extra_toggle) {
      return 0;
    } else {
      return 2;
    }
  }

  class XPTest {
    public boolean isToggleEnabled(TestExperimentName x) {
      return true;
    }

    public boolean putToggleEnabled(TestExperimentName x) {
      return true;
    }

    public boolean includeEvent(TestExperimentName x) {
      return true;
    }

    public boolean isToggleDisabled(TestExperimentName x) {
      return true;
    }

    public boolean putToggleDisabled(TestExperimentName x) {
      return true;
    }

    public boolean isFlagTreated(TestExperimentName x) {
      return true;
    }

    public boolean isToggleInGroup(TestExperimentName x) {
      return true;
    }
  }
}
