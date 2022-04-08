Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A9C8C433EF
	for <phone-devel@archiver.kernel.org>; Fri,  8 Apr 2022 11:25:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233709AbiDHL1q (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 8 Apr 2022 07:27:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234870AbiDHL1e (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Fri, 8 Apr 2022 07:27:34 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FBBBA27ED
        for <phone-devel@vger.kernel.org>; Fri,  8 Apr 2022 04:25:29 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id dr20so16604808ejc.6
        for <phone-devel@vger.kernel.org>; Fri, 08 Apr 2022 04:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=mime-version:content-transfer-encoding:date:message-id:cc:subject
         :from:to:references:in-reply-to;
        bh=fq/K4JNV15oSFxy2NseTqwYWn1DV3eYrSDISuIsrfjY=;
        b=gS3p0Nm6TFQkDgli679VWBZD/2P9mr04tsUkL37/VstyIDdKRmc8C5aKwlpIyQGm6B
         bnv88XZrC4g5oK9cjGlkBdZIdAbfi7yrwv8buadDnFeEfPk/dGG+rS7PAr1AcAHx07nX
         WR0g/K6SpetZYe2wQsetONgUrSorQ3OmC3eCJesipeoRBW6OjrMRb3873ycB3VolfVRg
         9U9FL2DACMpecMb2ULtRNEz4yYMOD71Utato5rdq+NJzF50u+xJ5k0MAlFZCFLGdLVGK
         gJwr91VI6b0CsrDQM8ldeEraQz1amXaU9bd7a9PyesSZAw1bprEA8TemdIUGWXS5RHX8
         XfWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:content-transfer-encoding:date
         :message-id:cc:subject:from:to:references:in-reply-to;
        bh=fq/K4JNV15oSFxy2NseTqwYWn1DV3eYrSDISuIsrfjY=;
        b=Omxh55JMaJ6TEYI9xpAhcIhUXjxirlNqscHItNHWXkQakeDVdiJTiFOHXPfNwmz6iE
         QGEvZsT9dawnnV7vpf6BtgClRgPr0fRLY7XnoPXNQwa/IpOEGMXaS9x8bwm1XkB7/Kt1
         lPecASlWVhfCYZyBVqZ3xCzqrjYSeWvRAYYePMzEVCfqUEC8q7m/wZFrG8fdkRPd5m/w
         rABPwGZbtD01HblbmaReJ9GRyzNFc9bjtXmy0f50uimgYg6Rrjj521TKXpLKDxhAuFHq
         MTNj/PhHd+R4ssJ6Cci3RKdqlkObe22MUkFh1LQbU4DoETnL8yLUanOsMX+Mv7Pzeren
         O0Ng==
X-Gm-Message-State: AOAM530EnZNFvbLhAaaT7tWaeujMaw6b/jY1Ujp2c2BRhxXMYwiR5ntx
        EaaaZiZlK3xKjCjT/9CB0lTx7Q==
X-Google-Smtp-Source: ABdhPJyeiuA6W53n6q0nTKiH0iz4FzlTJpMeID7G1rR7HGiuE6Z5+rJk9xaGb2yFLvehiheSF8RWjA==
X-Received: by 2002:a17:906:32cf:b0:6d5:83bc:e962 with SMTP id k15-20020a17090632cf00b006d583bce962mr18531651ejk.108.1649417128191;
        Fri, 08 Apr 2022 04:25:28 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id j12-20020a50e0cc000000b0041cd813ac01sm6365666edl.28.2022.04.08.04.25.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Apr 2022 04:25:27 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Fri, 08 Apr 2022 13:25:26 +0200
Message-Id: <CJ4TKNHK955X.2YYNAV248UMK8@otso>
Cc:     "Konrad Dybcio" <konrad.dybcio@somainline.org>,
        "Rob Herring" <robh+dt@kernel.org>,
        <~postmarketos/upstreaming@lists.sr.ht>,
        <linux-arm-msm@vger.kernel.org>,
        "Bjorn Andersson" <bjorn.andersson@linaro.org>,
        "Amit Kucheria" <amitk@kernel.org>, <linux-kernel@vger.kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        "Zhang Rui" <rui.zhang@intel.com>, <devicetree@vger.kernel.org>,
        "Thara Gopinath" <thara.gopinath@linaro.org>,
        "Daniel Lezcano" <daniel.lezcano@linaro.org>,
        <linux-pm@vger.kernel.org>, <phone-devel@vger.kernel.org>,
        "Andy Gross" <agross@kernel.org>
Subject: Re: [PATCH 05/10] dt-bindings: thermal: tsens: Add SM6350
 compatible
From:   "Luca Weiss" <luca.weiss@fairphone.com>
To:     "Rob Herring" <robh@kernel.org>
References: <20211213082614.22651-1-luca.weiss@fairphone.com>
 <20211213082614.22651-6-luca.weiss@fairphone.com>
 <YbpLqwFJI/nfvxd9@robh.at.kernel.org>
In-Reply-To: <YbpLqwFJI/nfvxd9@robh.at.kernel.org>
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Hi all,

On Wed Dec 15, 2021 at 9:10 PM CET, Rob Herring wrote:
> On Mon, 13 Dec 2021 09:26:06 +0100, Luca Weiss wrote:
> > Add devicetree compatible for tsens on SM6350 SoC.
> >=20
> > Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> > Acked-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> > ---
> >  Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> >=20
>
> Acked-by: Rob Herring <robh@kernel.org>

It looks like this patch hasn't been applied yet. Could the responsible
maintainer please pick it up?

Regards
Luca
