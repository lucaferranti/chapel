/*
 * Copyright 2021-2024 Hewlett Packard Enterprise Development LP
 * Other additional copyright holders may be indicated within.
 *
 * The entirety of this work is licensed under the Apache License,
 * Version 2.0 (the "License"); you may not use this file except
 * in compliance with the License.
 *
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#ifndef GENERATED_TYPE
#define GENERATED_TYPE(ROOT, NAME, TAG, FLAGS)
#endif

#ifndef GENERATED_TYPE_BEGIN
#define GENERATED_TYPE_BEGIN(ROOT, NAME, TAG, FLAGS)
#endif

#ifndef GENERATED_TYPE_END
#define GENERATED_TYPE_END(ROOT, NAME, TAG, FLAGS)
#endif

#define TYPE_NODE(NAME) GENERATED_TYPE(ChapelType, NAME, chpl::types::typetags::NAME, Py_TPFLAGS_DEFAULT)
#define BUILTIN_TYPE_NODE(NAME, CHPL_NAME) GENERATED_TYPE(ChapelType, NAME, chpl::types::typetags::NAME, Py_TPFLAGS_DEFAULT)
#define TYPE_BEGIN_SUBCLASSES(NAME) GENERATED_TYPE(ChapelType, NAME, chpl::types::typetags::START_##NAME, Py_TPFLAGS_BASETYPE) GENERATED_TYPE_BEGIN(ChapelType, NAME, chpl::types::typetags::START_##NAME, Py_TPFLAGS_BASETYPE)
#define TYPE_END_SUBCLASSES(NAME) GENERATED_TYPE_END(ChapelType, NAME, chpl::types::typetags::END_##NAME, Py_TPFLAGS_BASETYPE)
#include "chpl/types/type-classes-list.h"
#undef TYPE_NODE
#undef BUILTIN_TYPE_NODE
#undef TYPE_BEGIN_SUBCLASSES
#undef TYPE_END_SUBCLASSES

#define AST_NODE(NAME) GENERATED_TYPE(AstNode, NAME, chpl::uast::asttags::NAME, Py_TPFLAGS_DEFAULT)
#define AST_LEAF(NAME) GENERATED_TYPE(AstNode, NAME, chpl::uast::asttags::NAME, Py_TPFLAGS_DEFAULT)
#define AST_BEGIN_SUBCLASSES(NAME) GENERATED_TYPE(AstNode, NAME, chpl::uast::asttags::START_##NAME, Py_TPFLAGS_BASETYPE) GENERATED_TYPE_BEGIN(AstNode, NAME, chpl::uast::asttags::START_##NAME, Py_TPFLAGS_BASETYPE)
#define AST_END_SUBCLASSES(NAME) GENERATED_TYPE_END(AstNode, NAME, chpl::uast::asttags::END_##NAME, Py_TPFLAGS_BASETYPE)
#include "chpl/uast/uast-classes-list.h"
#undef AST_NODE
#undef AST_LEAF
#undef AST_BEGIN_SUBCLASSES
#undef AST_END_SUBCLASSES

#define PARAM_NODE(NAME, TYPE) GENERATED_TYPE(Param, NAME, chpl::types::paramtags::NAME, Py_TPFLAGS_DEFAULT)
#include "chpl/types/param-classes-list.h"
#undef PARAM_NODE

#undef GENERATED_TYPE
#undef GENERATED_TYPE_BEGIN
#undef GENERATED_TYPE_END
