Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 102DDC433E0
	for <phone-devel@archiver.kernel.org>; Tue,  9 Feb 2021 22:07:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BE9BC64E6C
	for <phone-devel@archiver.kernel.org>; Tue,  9 Feb 2021 22:07:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233600AbhBIWG5 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 9 Feb 2021 17:06:57 -0500
Received: from mail-yb1-f176.google.com ([209.85.219.176]:36323 "EHLO
        mail-yb1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233422AbhBIWEi (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Tue, 9 Feb 2021 17:04:38 -0500
Received: by mail-yb1-f176.google.com with SMTP id v5so10975681ybi.3
        for <phone-devel@vger.kernel.org>; Tue, 09 Feb 2021 14:03:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=lCKSYN1S/BMKGDmQxUAKaGzQhreo9bxAbsTabQriVq0=;
        b=CfQhqm09KjFdN0SYU1y9fgQljDQ90fL15ANzuokMrXrrkn68XTKFZFinlqqRMjJylA
         2USs/SMhkgjyamWig5tq3hx32MPVkkCSNPWfdy1AOs0Y1Qu8lJyTMXkfxNdlyKVy7Xc7
         2/XBjm7+Gxzl3iq1BdE5YdVQNse64F14BnnVUK3ZFtsLP1Y3j4xDBMBvOSBEhKuK5a0p
         t4u/84TzQVWz+Aza+88jYVQkEzL6JPRV0lY9Fdr7gAQRYR4aYV/BnotHNKoBJfs4ouwK
         97Q++sOoDWS/DF0S3SoNSpIQCqoHPl8zZuuZ4+xsDVjqViouxzADe4nWOlpfAdIgFkib
         ThxQ==
X-Gm-Message-State: AOAM530Giyw3oENiB1yV4HR1tbgWfSE1GeB4dzWr641t3o8nkThNRBEL
        ohn1ETCv+Xba3UFYs9hsHe2paRW6cw==
X-Google-Smtp-Source: ABdhPJx6BPlprKBUC+xb/5qwJuVzUFsGtm4/bQfhNhu+3WhtLx7/Y0mh++ghwg3JoeR3YOsrjneqAg==
X-Received: by 2002:a9d:ec7:: with SMTP id 65mr17119409otj.311.1612898517920;
        Tue, 09 Feb 2021 11:21:57 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id l110sm4513430otc.25.2021.02.09.11.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Feb 2021 11:21:56 -0800 (PST)
Received: (nullmailer pid 4191780 invoked by uid 1000);
        Tue, 09 Feb 2021 19:21:55 -0000
Date:   Tue, 9 Feb 2021 13:21:55 -0600
From:   Rob Herring <robh@kernel.org>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        Zhang Rui <rui.zhang@intel.com>,
        Amit Kucheria <amitk@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] thermal: qcom: tsens-v0_1: Add support for MDM9607
Message-ID: <20210209192155.GA4191751@robh.at.kernel.org>
References: <20210127182506.52311-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210127182506.52311-1-konrad.dybcio@somainline.org>
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Wed, 27 Jan 2021 19:25:05 +0100, Konrad Dybcio wrote:
> MDM9607 TSENS IP is very similar to the one of MSM8916, with
> minor adjustments to various tuning values.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---
> Changes since v1:
> - Move the defines so as not to cut into the middle of 8974 regs
> 
>  .../bindings/thermal/qcom-tsens.yaml          |   2 +
>  drivers/thermal/qcom/tsens-v0_1.c             | 100 +++++++++++++++++-
>  drivers/thermal/qcom/tsens.c                  |   3 +
>  drivers/thermal/qcom/tsens.h                  |   2 +-
>  4 files changed, 105 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
