Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1362C11F64
	for <phone-devel@archiver.kernel.org>; Thu,  1 Jul 2021 14:03:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CBEC761423
	for <phone-devel@archiver.kernel.org>; Thu,  1 Jul 2021 14:03:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233288AbhGAOGK (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 1 Jul 2021 10:06:10 -0400
Received: from mail-io1-f50.google.com ([209.85.166.50]:37740 "EHLO
        mail-io1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233300AbhGAOGJ (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Thu, 1 Jul 2021 10:06:09 -0400
Received: by mail-io1-f50.google.com with SMTP id b15so7641916iow.4;
        Thu, 01 Jul 2021 07:03:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=RIHU3Dvz8UVhaI+52yb7oaZyHsIEgAYHrT+AJwUGDLs=;
        b=eCFaA2qQQrrx5FudTkEO3deBFhn7Fao2Oz1x29Kkcq5GHIi7py+iRb4J5GynbQQneS
         UcgVLjmes5g34MElw4c4Cg8sd/Imb1MfhiC7kMD9c7zvuxJLG1Y16TEQbBg3xxFcalJU
         aSNC7z8dCfrCOE2Hfq6cpUj1hWqFlS2KlYey/APJ/l/nQOFeoQ4SDmfaZgjjFxwUMU3J
         lN4qIWCVechjun1syHYPFCCgzPV8EZFr3ZDCHYmdX8jn1q1z69eeJLNzIJLJWdyQNZFE
         zOgD6nHuioWQcxgbYwBmaJ16qVu2FniRIqN1AW7DEPwgVIyiqDn7zhpJkxNXlc294SPa
         C2sg==
X-Gm-Message-State: AOAM5322AZry67LBsbvx9GCZCyRWf3vWl9FnYcZwWhWncKuKBtrRsKKl
        Iertt0KacBDXCuSLvX6V6w==
X-Google-Smtp-Source: ABdhPJwQKT+kR+WAjiGnVYsmWaj61qH7vLyuBErKzSWqz2Eyox/gsoOirr+2wRLgFZVQLStOn2NurQ==
X-Received: by 2002:a5d:9ad6:: with SMTP id x22mr6096646ion.182.1625148217955;
        Thu, 01 Jul 2021 07:03:37 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id r13sm38814ilg.37.2021.07.01.07.03.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jul 2021 07:03:36 -0700 (PDT)
Received: (nullmailer pid 2278714 invoked by uid 1000);
        Thu, 01 Jul 2021 14:02:43 -0000
From:   Rob Herring <robh@kernel.org>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Cc:     konrad.dybcio@somainline.org, broonie@kernel.org,
        lgirdwood@gmail.com, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, jami.kettunen@somainline.org,
        agross@kernel.org, jeffrey.l.hugo@gmail.com,
        martin.botka@somainline.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        bjorn.andersson@linaro.org, paul.bouchara@somainline.org,
        marijn.suijten@somainline.org, devicetree@vger.kernel.org
In-Reply-To: <20210701105441.319572-7-angelogioacchino.delregno@somainline.org>
References: <20210701105441.319572-1-angelogioacchino.delregno@somainline.org> <20210701105441.319572-7-angelogioacchino.delregno@somainline.org>
Subject: Re: [PATCH v6 6/6] dt-bindings: soc: qcom: cpr3: Add bindings for CPR3 driver
Date:   Thu, 01 Jul 2021 08:02:43 -0600
Message-Id: <1625148163.611445.2278713.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Thu, 01 Jul 2021 12:54:41 +0200, AngeloGioacchino Del Regno wrote:
> Add the bindings for the CPR3 driver to the documentation.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  .../bindings/soc/qcom/qcom,cpr3.yaml          | 241 ++++++++++++++++++
>  1 file changed, 241 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,cpr3.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/soc/qcom/qcom,cpr3.example.dt.yaml:0:0: /example-0/cpu-silver-opp-table: failed to match any schema with compatible: ['operating-points-v2']
Documentation/devicetree/bindings/soc/qcom/qcom,cpr3.example.dt.yaml:0:0: /example-0/cpu-gold-opp-table: failed to match any schema with compatible: ['operating-points-v2']
Documentation/devicetree/bindings/soc/qcom/qcom,cpr3.example.dt.yaml:0:0: /example-0/cpr-hardened-opp-table: failed to match any schema with compatible: ['operating-points-v2-qcom-level']
\ndoc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1499495

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

