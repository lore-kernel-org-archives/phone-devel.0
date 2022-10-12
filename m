Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D307C433FE
	for <phone-devel@archiver.kernel.org>; Wed, 12 Oct 2022 22:34:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230213AbiJLWeB (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 12 Oct 2022 18:34:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229932AbiJLWdz (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Wed, 12 Oct 2022 18:33:55 -0400
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CD5E118746
        for <phone-devel@vger.kernel.org>; Wed, 12 Oct 2022 15:33:51 -0700 (PDT)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-333a4a5d495so1923447b3.10
        for <phone-devel@vger.kernel.org>; Wed, 12 Oct 2022 15:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FwLUfxB8SXrw3NQDomUAd60ArMa52KC+Lg79Tj4TeiI=;
        b=s73IStGtmlEJucueszS7Vxm4EKvpKoXKq1IIpWNCmBF8DdU1OE4b3Z0dpdUMPfVSMo
         lybvPLkLHBt1lIhm893t9PY8KQJyoWUwNUkxBke6xsoFs6WRhAQO8zthnBbx3LATUC2M
         yxBCXh0nhYj64VTPSaCZ2cT+Z2Xxqtp1iF7YcU4u/hgXhLZUE5QL6A9yXO/De8zLOZrj
         7nsXS4c0r/LE6uw5QFl35BAYrS3a7ihwGY9spFAx3LXsw42qw315Q8qFf8T5B53TWFWU
         j74zPkaZu9JvCWHOWpgPrbohPSZrQR9r8l81918TH6xNdEuZ0TsqI6ekF6LJumBk8HGC
         2Bhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FwLUfxB8SXrw3NQDomUAd60ArMa52KC+Lg79Tj4TeiI=;
        b=WZ4ZePaj9sMe5rzP8A+OCjm5qS3w6CVmmB1x4b80c8LK+lzErbzQat26bLet22+Cn1
         7WKVahjohRbWyfuSr9RL1emCPWMII4OZ5mhMDH5I7smlRco/9synuNUqholAI14hRpvp
         dYkUxglWtH40VmZ05EBpPkK10hZqnIJ2tEO0ckbT87FYPwCi6aD63KbTkbGILUydYc/m
         tEZmETyDK8CYpCzpthr0ubF2e+gRbVj2TcpG1MmzkhtVY98BXOcnznI2kpIkUa/d5x7O
         TOmVUIOu1eC0BnKgAg7CO/ib0ArAxgIU39VEvY0Ks0gQ1RJ6Oflw75+te6tnwk+hqaKA
         hxkg==
X-Gm-Message-State: ACrzQf0a0q/5tGQ2cA6WO66KSvQtp6G7RZ6FThp6CaIilSHX2Q6DFExn
        Pqsd3E1avVLWvS4CVpu8/Pwf+3lV/RXiKNizuSPnPg==
X-Google-Smtp-Source: AMsMyM6Y0BgqVhw4oJ7krmkQ/dx4v7WLDCTnjrAR82SA5sw+4uSyqbCHFQJqpZW/bGq+yV9SodBTrZm24+EfX0EKpTc=
X-Received: by 2002:a81:a43:0:b0:35e:445:a024 with SMTP id 64-20020a810a43000000b0035e0445a024mr30116302ywk.378.1665614030216;
 Wed, 12 Oct 2022 15:33:50 -0700 (PDT)
MIME-Version: 1.0
References: <20221012215613.32054-1-luca@z3ntu.xyz>
In-Reply-To: <20221012215613.32054-1-luca@z3ntu.xyz>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 13 Oct 2022 01:33:38 +0300
Message-ID: <CAA8EJpr2GS9XAd12-9abd0FBn0DKDpos9np00=M49BptYVz63g@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: msm8996: remove bogus ufs_variant node
To:     Luca Weiss <luca@z3ntu.xyz>
Cc:     linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Thu, 13 Oct 2022 at 00:56, Luca Weiss <luca@z3ntu.xyz> wrote:
>
> This ufs_variant node seems to be a remnant from downstream devicetree.
>
> As it doesn't seem to be used by anything upstream, remove it from the
> dtsi.
>
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
>  arch/arm64/boot/dts/qcom/msm8996.dtsi | 4 ----
>  1 file changed, 4 deletions(-)


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
