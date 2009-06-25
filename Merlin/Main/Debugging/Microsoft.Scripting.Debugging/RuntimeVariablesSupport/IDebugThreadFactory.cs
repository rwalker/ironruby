﻿/* ****************************************************************************
 *
 * Copyright (c) Microsoft Corporation. 
 *
 * This source code is subject to terms and conditions of the Microsoft Public License. A 
 * copy of the license can be found in the License.html file at the root of this distribution. If 
 * you cannot locate the  Microsoft Public License, please send an email to 
 * dlr@microsoft.com. By using this source code in any fashion, you are agreeing to be bound 
 * by the terms of the Microsoft Public License.
 *
 * You must not remove this notice, or any other, from this software.
 *
 *
 * ***************************************************************************/

using System.Collections.Generic;
using Microsoft.Scripting.Debugging.CompilerServices;
using MSAst = System.Linq.Expressions;

namespace Microsoft.Scripting.Debugging {
    /// <summary>
    /// IDebugThreadFactory is used to abstract how frames and local variables are maintained at run/debug time.
    /// </summary>
    internal interface IDebugThreadFactory {
        DebugThread CreateDebugThread(DebugContext debugContext);

        MSAst.Expression CreatePushFrameExpression(
            MSAst.ParameterExpression functionInfo,
            MSAst.ParameterExpression debugMarker,
            IList<MSAst.ParameterExpression> locals,
            IList<VariableInfo> varInfos,
            MSAst.Expression runtimeThread);
    }
}
