Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA7AAC433FE
	for <phone-devel@archiver.kernel.org>; Tue,  7 Sep 2021 13:46:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BE6B8610D0
	for <phone-devel@archiver.kernel.org>; Tue,  7 Sep 2021 13:46:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344870AbhIGNsF (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 7 Sep 2021 09:48:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234990AbhIGNsE (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Tue, 7 Sep 2021 09:48:04 -0400
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C903C061757
        for <phone-devel@vger.kernel.org>; Tue,  7 Sep 2021 06:46:58 -0700 (PDT)
Received: by mail-ot1-x32c.google.com with SMTP id q11-20020a9d4b0b000000b0051acbdb2869so12841056otf.2
        for <phone-devel@vger.kernel.org>; Tue, 07 Sep 2021 06:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=TGrDwOa3lQJKnj52Foveo24I3v9X7ezZKxCdSoKyzMI=;
        b=Oof7E/msGkg9jKBxfsxoq3j861ag/LYr9pcbxR0Y02SC649ijTrosMom2dFlF3upZh
         jcz4UCy1m1tCx1QuHK2t1G6O1vxyVq1/chNR+ZZJsL2gJxBvnzM0+WHb2CNbMHRKFqW/
         oWTF38o3RdNVYwpfzM2Ko/CQzqHXCsKdrANPVjVEOhYQFBFpMb58nocWPLVm8rO7ysRL
         unoxmK5tsVD7Z2fBGFEwWm5FDKJ9WiYk+CUNGXKu12m4FfRcfQHulXuNv1U/DAaqq8FJ
         HoDWnJ/yBzR3YgtuVN042wokp97r3K/8vgen5ee5n6VbWMd7Yr8hOTxnloQfm21eE2da
         tN+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=TGrDwOa3lQJKnj52Foveo24I3v9X7ezZKxCdSoKyzMI=;
        b=AsW5PJQj4JdTozShrjSsQ+U53q8u3R76v5fWKIRAvV96bTZ4+jjxZH+qEU5L6rlwzQ
         kTc2YxIZkpZkIgxIZGnPFO9E5jGCy0ckWDkaUTeki9/Qu6I1hcuUcKKxZDqEQPacgm97
         qVrOYrMB6vV6qc2Q2oliH/M5az2lFl20fakoaYiwZqfKSWq5wbRVqnnmWOSsN6XWU2f0
         z4d3s74tEAA4xZdfLuiA2/KC2njwRzqtC7q/npUPpn6qAaC4Jcy8NXRBq+oZxAxf5zbZ
         cjNTeOxBi+D2zR4Nd3b/j5eOPSZnVM4XpulA8KDMah4anfaFz5ZUA/eaXyOxglGTNyls
         lGHg==
X-Gm-Message-State: AOAM530Oweg0p5kTzjiztUwtc3mxd8GMCw1441GTAvh/HwgS6wjOSXKg
        URNCAmc1bdM8uGWFpxDx7BhRDg==
X-Google-Smtp-Source: ABdhPJw5N1+GXS15e/qJDD1egWQgkLsILIiHFb94mbwfsFYnXn+pYTtBfbxiMazO8cgtoU2Fry3IiQ==
X-Received: by 2002:a9d:5f8e:: with SMTP id g14mr14907728oti.37.1631022417453;
        Tue, 07 Sep 2021 06:46:57 -0700 (PDT)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id j17sm2413677ots.10.2021.09.07.06.46.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Sep 2021 06:46:57 -0700 (PDT)
Date:   Tue, 7 Sep 2021 06:47:57 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Cc:     agross@kernel.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, konrad.dybcio@somainline.org,
        marijn.suijten@somainline.org, martin.botka@somainline.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        paul.bouchara@somainline.org
Subject: Re: [PATCH 7/7] arm64: dts: qcom: msm8998-xperia: Add audio clock
 and its pin
Message-ID: <YTdtjRonJBtJUk9N@ripper>
References: <20210903180924.1006044-1-angelogioacchino.delregno@somainline.org>
 <20210903180924.1006044-7-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210903180924.1006044-7-angelogioacchino.delregno@somainline.org>
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Fri 03 Sep 11:09 PDT 2021, AngeloGioacchino Del Regno wrote:

> All smartphones of this platform are equipped with a WCD9335 audio
> codec, getting its MCLK from PM8998 gpio13: add this clock to DT.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  .../dts/qcom/msm8998-sony-xperia-yoshino.dtsi | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi b/arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi
> index 5fbe5abf4133..7aeebd3b2e9e 100644
> --- a/arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi
> @@ -20,6 +20,19 @@ / {
>  	qcom,msm-id = <0x124 0x20000>, <0x124 0x20001>; /* 8998v2, v2.1 */
>  	qcom,board-id = <8 0>;
>  
> +	clocks {
> +		compatible = "simple-bus";
> +
> +		div1_mclk: divclk1 {
> +			compatible = "gpio-gate-clock";
> +			pinctrl-0 = <&audio_mclk_pin>;
> +			pinctrl-names = "default";
> +			clocks = <&rpmcc RPM_SMD_DIV_CLK1>;

What controls the clock rate of divclk1?

Regards,
Bjorn

> +			#clock-cells = <0>;
> +			enable-gpios = <&pm8998_gpio 13 GPIO_ACTIVE_HIGH>;
> +		};
> +	};
> +
>  	board_vbat: vbat-regulator {
>  		compatible = "regulator-fixed";
>  		regulator-name = "VBAT";
> @@ -313,6 +326,12 @@ cam_snapshot_pin_a: cam-snapshot-btn-active {
>  		input-enable;
>  		qcom,drive-strength = <PMIC_GPIO_STRENGTH_NO>;
>  	};
> +
> +	audio_mclk_pin: audio-mclk-pin-active {
> +		pins = "gpio13";
> +		function = "func2";
> +		power-source = <0>;
> +	};
>  };
>  
>  &pmi8998_gpio {
> -- 
> 2.32.0
> 
