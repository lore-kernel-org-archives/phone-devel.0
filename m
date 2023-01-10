Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5832CC54EBE
	for <phone-devel@archiver.kernel.org>; Tue, 10 Jan 2023 07:59:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238053AbjAJH7H (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 10 Jan 2023 02:59:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229835AbjAJH6g (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Tue, 10 Jan 2023 02:58:36 -0500
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 094C44731F
        for <phone-devel@vger.kernel.org>; Mon,  9 Jan 2023 23:57:28 -0800 (PST)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-4a2f8ad29d5so144298217b3.8
        for <phone-devel@vger.kernel.org>; Mon, 09 Jan 2023 23:57:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mHQteKRecbFpVoOlyu2U09f/KsEEnT2ReMw9RcZTI+o=;
        b=P2Smu5KoxWqxdChmwCGV9/u6dGY/6h4BWVicD8QFvcXFbIWkNax2gd4DNaABE9r1dT
         Ts2GU6WzW2xiGXcuytRU5weIP0d7XqWXg47/hfHy+CTxwBLOI01HrTSBkQyzHcnUD+wg
         8E3hxG+3hAjBoMjSnaiPbciQARbtNxkZs+svjTbL6ZWynqfpO9IwSq3RPTQizGG9N7YT
         CThDSPeUOfU8xxtDHrdiOlwGpvMs7goUzxmMgf2DSPnDaH/AwLGsdRml0soUISJDEP8z
         cEW9lE7YRE2ScchUVD1Ozy/PHlQxp4MgOxHsgtjHPeq8EdIqGvYmr6IzIdbpZTrgMJ/r
         axIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mHQteKRecbFpVoOlyu2U09f/KsEEnT2ReMw9RcZTI+o=;
        b=XvGvJXO47uBQTSTx7JcA7cbP+pGRnGBEwZcFrAbS3aa6+ndJintX81s3P3oxwHEH+z
         zRiPif5rMDXbXr7auciKbYX0eOmtCDHDoPerkgTInTY9iHf+qePOm37dPugSNGgUTwN1
         cut9Lo/5ftG4t6mxdga468gOcrxZ7+Q3b65nGj73KeNXSMBYsETOMCZryQ7c9p9JbDua
         yuulOfXwu9xYyMGZpRu5uO4CqWVAO2EyLAzuXvc0tMqaIgujRP++GyY+cUwR9pvKmshh
         T3T3LDBOk6eJf3oClx1/fb8g4sCo0jTxLdbX1C6BJE9t5ypJ7b3QiUWDTZF7MCn/xdOG
         NQdg==
X-Gm-Message-State: AFqh2krF4hspPRbXdF+3xct3hW6v9ezo2ihWNiTxNYz4MCws9a3vrEyg
        mU2KhxTNd967UG4Lbm+amPmatKSnaWAJj4GxYRAhpQ==
X-Google-Smtp-Source: AMrXdXvQTIFSoh83YGadyAeRFZnp6YQcUpVpM5k3bJFQ3g4Sda0QXqn6dIwcctKw2bFPF9yUL7fyRlJtmWSG0pkuoYc=
X-Received: by 2002:a05:690c:d96:b0:478:6ef2:da73 with SMTP id
 da22-20020a05690c0d9600b004786ef2da73mr477797ywb.488.1673337447290; Mon, 09
 Jan 2023 23:57:27 -0800 (PST)
MIME-Version: 1.0
References: <20230106114403.275865-1-matti.lehtimaki@gmail.com> <20230106114403.275865-2-matti.lehtimaki@gmail.com>
In-Reply-To: <20230106114403.275865-2-matti.lehtimaki@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 10 Jan 2023 08:57:15 +0100
Message-ID: <CACRpkdYq0uxCY5iffGXZfCeTHc3EZMXoydDSkQOdyrBwhVrtgA@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: pinctrl: msm8226: Add General Purpose clocks
To:     =?UTF-8?Q?Matti_Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Fri, Jan 6, 2023 at 12:44 PM Matti Lehtim=C3=A4ki
<matti.lehtimaki@gmail.com> wrote:

> Document the general purpose clock functions that are found on MSM8226.
>
> Signed-off-by: Matti Lehtim=C3=A4ki <matti.lehtimaki@gmail.com>

Patch applied!

Yours,
Linus Walleij
