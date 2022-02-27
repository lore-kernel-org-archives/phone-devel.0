Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7619CC433F5
	for <phone-devel@archiver.kernel.org>; Sun, 27 Feb 2022 03:29:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229846AbiB0D3k (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sat, 26 Feb 2022 22:29:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229798AbiB0D3k (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sat, 26 Feb 2022 22:29:40 -0500
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com [IPv6:2607:f8b0:4864:20::f33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1616D21F5CC
        for <phone-devel@vger.kernel.org>; Sat, 26 Feb 2022 19:29:04 -0800 (PST)
Received: by mail-qv1-xf33.google.com with SMTP id c14so5035379qvk.10
        for <phone-devel@vger.kernel.org>; Sat, 26 Feb 2022 19:29:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7uVsTdS9A3VvM3V9jvyobaIfl/vvSxzX/obLWEqItyo=;
        b=Gus3oS9RSn7V1sr7kHl81y1aya0zl1pkxCw11w+XDvu9TPjWigg3K7tlfZovWKB4ae
         LoFSKEOnw1/CPf1ue5bg4+ZnXYbF9Y+zkicAyImn/QMeG0xf8RkYkMwE7td7V+XucgUg
         0gDiET8OWcLiR/uTHn2wUh3WcY8POKYYZw/O/qikdZt/B8Oxa+/h0kWL0zlh0jNugHBG
         Rv5B++uhoDoF5bNd2dF70oz4vn2VMV+FnUr/zAIOwkrn52j00Kfgxx5zPdTqm8q/d8vi
         I5UERrNvI3oCAHu2jLszQfE2Ir4z01/zstiDc3a//KS3VlYN7Eft03BJzMvOQq3z/VZH
         WOlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7uVsTdS9A3VvM3V9jvyobaIfl/vvSxzX/obLWEqItyo=;
        b=gRP5QML7REO3nVCe0U67xmwhDr4p+8XxzW/AR6UKIcfTzj/0JGm0gqgSFAoo3GaoU4
         r/mSqV1VU2iEr9+FiJ6eJsAll2YAurNUrRE+ImJT8wXbkfcEcgd7xPbCSKwXOm7O6Nsc
         ciHXKNo6oNgvlttnxIcROtu3meUpIlNhiFRmeP4sXPvBcBOK8N1m4nwdkiMrQO616ZPw
         4meMUJ4QMEy95ct4zNDhii0SXIlCaMJ38wo1R+SBs9lxlbr+VwtNNurd3Pr422HFrDpn
         yF806uSxEKOu8iOnOhA1mxDSumxjPbW1pc8SC5H1ezHWcAVIFVbcKNLFlt+TLFA9q9GU
         UgAQ==
X-Gm-Message-State: AOAM533qS3eB1p9kTu3RFj2jSvlHPmihQe6gn79ozIqxp0+iOF25LaqP
        vQs5KWifKCGz2MYHMnqBub1J5gccvJGhNImVBM58nw==
X-Google-Smtp-Source: ABdhPJy7XFThPExoHd3VFYJIkPak1UpwZE6oPWxM0M9mvJOEkCCe6XwmadvukE4ueQzyWqWGH926oT69VQqrOB0s4xU=
X-Received: by 2002:a0c:d807:0:b0:42c:1ff7:7242 with SMTP id
 h7-20020a0cd807000000b0042c1ff77242mr10578010qvj.119.1645932543232; Sat, 26
 Feb 2022 19:29:03 -0800 (PST)
MIME-Version: 1.0
References: <20220226200911.230030-1-marijn.suijten@somainline.org> <20220226200911.230030-2-marijn.suijten@somainline.org>
In-Reply-To: <20220226200911.230030-2-marijn.suijten@somainline.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sun, 27 Feb 2022 06:28:52 +0300
Message-ID: <CAA8EJppH2AKe7DK7mPhtz2CCW19WdJ0-NJihmFPDswRwTtKcfw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] clk: qcom: Fix sorting of SDX_GCC_65 in Makefile
 and Kconfig
To:     Marijn Suijten <marijn.suijten@somainline.org>
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Pavel Dubrova <pashadubrova@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Vamsi Krishna Lanka <quic_vamslank@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Sun, 27 Feb 2022 at 02:38, Marijn Suijten
<marijn.suijten@somainline.org> wrote:
>
> In order to keep at least the list of `CONFIG_SM_` drivers sorted
> alphabetically, SDX_GCC_65 should have been moved one line up.  This in
> turn makes it easier and cleaner to add the followup SM_DISPCC_6125
> driver in the right place, right before SM_DISPCC_8250.
>
> Fixes: d79afa201328 ("clk: qcom: Add SDX65 GCC support")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/clk/qcom/Kconfig  | 14 +++++++-------
>  drivers/clk/qcom/Makefile |  2 +-
>  2 files changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index f5b54bfc992f..161b257da9ca 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -574,13 +574,6 @@ config SDX_GCC_55
>           Say Y if you want to use peripheral devices such as UART,
>           SPI, I2C, USB, SD/UFS, PCIe etc.
>
> -config SM_CAMCC_8250
> -       tristate "SM8250 Camera Clock Controller"
> -       select SM_GCC_8250
> -       help
> -         Support for the camera clock controller on SM8250 devices.
> -         Say Y if you want to support camera devices and camera functionality.
> -
>  config SDX_GCC_65
>         tristate "SDX65 Global Clock Controller"
>         select QCOM_GDSC
> @@ -589,6 +582,13 @@ config SDX_GCC_65
>           Say Y if you want to use peripheral devices such as UART,
>           SPI, I2C, USB, SD/UFS, PCIe etc.
>
> +config SM_CAMCC_8250
> +       tristate "SM8250 Camera Clock Controller"
> +       select SM_GCC_8250
> +       help
> +         Support for the camera clock controller on SM8250 devices.
> +         Say Y if you want to support camera devices and camera functionality.
> +
>  config SM_DISPCC_8250
>         tristate "SM8150 and SM8250 Display Clock Controller"
>         depends on SM_GCC_8150 || SM_GCC_8250
> diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
> index d96d6793fc7d..3e4eb843b8d2 100644
> --- a/drivers/clk/qcom/Makefile
> +++ b/drivers/clk/qcom/Makefile
> @@ -84,8 +84,8 @@ obj-$(CONFIG_SDM_GPUCC_845) += gpucc-sdm845.o
>  obj-$(CONFIG_SDM_LPASSCC_845) += lpasscc-sdm845.o
>  obj-$(CONFIG_SDM_VIDEOCC_845) += videocc-sdm845.o
>  obj-$(CONFIG_SDX_GCC_55) += gcc-sdx55.o
> -obj-$(CONFIG_SM_CAMCC_8250) += camcc-sm8250.o
>  obj-$(CONFIG_SDX_GCC_65) += gcc-sdx65.o
> +obj-$(CONFIG_SM_CAMCC_8250) += camcc-sm8250.o
>  obj-$(CONFIG_SM_DISPCC_8250) += dispcc-sm8250.o
>  obj-$(CONFIG_SM_GCC_6115) += gcc-sm6115.o
>  obj-$(CONFIG_SM_GCC_6125) += gcc-sm6125.o
> --
> 2.35.1
>


-- 
With best wishes
Dmitry
